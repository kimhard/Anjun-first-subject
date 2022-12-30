<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%
// 변수 path 생성(업로드 파일 저장 경로)
String path = request.getRealPath("uploadedFiles");

// 파일 저장 경로에 해당 폴더가 없으면 자동으로 폴더를 생성하는 기능
// 폴더명은 영문 권장함(한글은 오류가 생길 수 있음)
File Folder = new File(path);

if (!Folder.exists()) {
	try {
		Folder.mkdir(); // path 경로 폴더 생성
		System.out.println("폴더가 생성되었습니다.");
	} catch (Exception e) {
		e.getStackTrace();
	}
} else {
	System.out.println("이미 폴더가 생성되어 있습니다.");
}

// 업로드 파일 최대 용량
int size = 1024 * 1024 * 20; // 20MB

String str, filename, original_filename, type;

try {
	MultipartRequest multiRequest = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	// multiRequest의 3번째 size는 20MB 사이즈까지 파일 업로드가능 , 5번째는 중복 파일 이름이 들어올 경우 파일명 뒤에 숫자가 붙게끔 해줌.
	Enumeration files = multiRequest.getFileNames();

	str = (String) files.nextElement(); // 파라미터 이름(String str에 파일 이름 저장)

	filename = multiRequest.getFilesystemName(str); // 저장된 파일 이름(서버에 저장할 파일명)

	original_filename = multiRequest.getOriginalFileName(str); // 원본 파일명(업로드 파일명)

	type = multiRequest.getContentType(str); // 파일 확장자(파일종류/확장자명)
	
	if (str != null) {
		File oldFile = new File(Folder + "\\" + original_filename);
		File newFile = new File(Folder + "\\" + str + "사진.jpg");
		oldFile.renameTo(newFile);
	}
	System.out.println("str : " + str);
	System.out.println("filename : " + filename);
	System.out.println("original_filename : " + original_filename);
	System.out.println("type : " + type);
	System.out.println("path : " + path);
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>