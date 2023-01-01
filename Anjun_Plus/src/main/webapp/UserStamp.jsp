<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserDTO"%>
<%@page import="Model.AttendenceDAO"%>
<%@page import="Model.AttendenceDTO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">





body {
	padding:1.5em;
	background: #f5f5f5
}
h1 {
	text-align: center;
}
table {
	margin: auto;
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0,0,0,.25);
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}
th {
	text-align: center;
}
td {
	text-align: right;
	vertical-align: text-top; 
	width: 100px;
	height: 100px;
}
thead {
	font-weight: bold;
	color: #fff;
	background: #73685d;
}
  
td, th {
	padding: 1em .5em;
}
  
td {
	border-bottom: 1px solid rgba(0,0,0,.1);
	background: #fff;
}
a {
	color: #73685d;
}
#sat {
	color: blue;
}
#sun {
	color: red;
}
.good {
	float: left;
}
  
/*  @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  } */
  
</style>
</head>
<body>
<%
	// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
	LocalDate now = LocalDate.now();
	int year = now.getYear();
	int month = now.getMonthValue();
	int day = 1;
	
	
	// Calendar 객체 생성 (오늘의 대한 정보)
	Calendar cal = Calendar.getInstance();
	// 희망 연도, 월, 일 셋팅
	// 월의 범위는 0~11 이기 때문에 실제월 -1
	// 일은 달력이 1일부터 시작하기 때문에 1일로 셋팅
	// 요일 구하기(월의 첫날)
		cal.set(year, month-1, day);
	
	// 달의 마지막 날짜를 구함 
	int lastOfDate = cal.getActualMaximum(Calendar.DATE);
	// 주를  구함 1일요일 ,2월요일
	int week = cal.get(Calendar.DAY_OF_WEEK);
	// 세션받아온다
	request.getSession();
	// 임시로 세션입력해둠(나중에삭제)
	UserDTO smhrd = new UserDTO("smhrd", "1234", "smhrd", "smhrd", "smhrd@smhrd,com", "123456-7890123", "C"); 
	session.setAttribute("info", smhrd);
	
	// 진짜세션값(안지워도됨)
	UserDTO info = (UserDTO)session.getAttribute("info");
	
	// 도장찍을날짜 리스트로 저장
	ArrayList<Integer> stampList = new ArrayList<>(); 
	
	// 이번달 1일부터 월말일까지 체크
	for(int i=1; i<=lastOfDate; i++){
	AttendenceDTO dto = new AttendenceDTO();
	AttendenceDAO dao = new AttendenceDAO();
		
	// 세션에서 id 받기
	String user_id = info.getId();
	// 이번달 날짜 날짜 문자열로 변환후 변수에 넣기
	String stday = "";
	if(i<10){
		stday = "0"+i;
	}else{
		stday = ""+i;
	}
	
	String at_time = (year+"-"+month+"-"+stday);
	
	// dto객체에 id, 현재시각 정보 저장
	dto.setUser_id(user_id);
	dto.setAt_time(at_time);
	
/* 	System.out.println(dto.getUser_id());
	System.out.println(dto.getAt_time()); */
	
	// 날짜 비교해서 출석일은 1, 결석일은 -1로 출력
	int stampAllCheck = dao.stampAllCheck(dto);
	stampList.add(stampAllCheck);
	}
	
/* 	System.out.print(stampList); */
	
%>

	<h1><%=month%>월 출석체크</h1>
	<table>
    <thead>
    <tr>
        <th id="sun">일</th>
        <th>월</th>
        <th>화</th>
        <th>수</th>
        <th>목</th>
        <th>금</th>
        <th id="sat">토</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    
<%
	// 첫째주 시작일만큼 빈칸 생성
	int cnt=0;
	for(int i=1; i<week; i++){
%>		<td></td>
<%		cnt++;
	}
%>

<%
	// 첫째주 달력 생성 및 도장 확인
	day = 1;
	int nextweek = 7;
	if (cnt>1){
		nextweek-=cnt;
	}
	cnt=0;
	for(int i=day; i<=nextweek; i++){%>
		<td>
		<%if(stampList.get(i-1)==1){%>
			<div  class="good"><img src="img/good80.jpg"></div>
		<%} %><%=i%></td><%
		day++;
		cnt++;
	}
		%></tr><tr><%
	nextweek-=cnt;
	
	// 둘째주부터 달력 생성 및 도장 확인
	for(int i=day; i<=lastOfDate; i++){
		if(nextweek%7==0){
			%></tr><tr><%
		}%>
				<td>
		<%if(stampList.get(i-1)==1){%>
			<div class="good"><img src="img/good80.jpg"></div>
		<%} %><%=i%></td><%
		nextweek++; 
	}
		%>
	</tr>
    </tbody>
</table>
</body>
</html>