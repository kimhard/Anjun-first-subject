<%@page import="Model.PostDAO"%>
<%@page import="Model.UserDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Model.FileDAO"%>
<%@page import="Model.FileDTO"%>
<%@page import="Model.PostDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter writer = response.getWriter();
	UserDTO info = (UserDTO) session.getAttribute("info");

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

	String str, post_file, media_real_file, media_ext;

	try {
		//이미지 업로드
		MultipartRequest multiRequest = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		// multiRequest의 3번째 size는 20MB 사이즈까지 파일 업로드가능 , 5번째는 중복 파일 이름이 들어올 경우 파일명 뒤에 숫자가 붙게끔 해줌.
		Enumeration files = multiRequest.getFileNames();

		str = (String) files.nextElement(); // 파라미터 이름(String str에 파일 이름 저장)

		post_file = multiRequest.getFilesystemName(str); // 저장된 파일 이름(서버에 저장할 파일명)

		media_real_file = multiRequest.getOriginalFileName(str); // 원본 파일명(업로드 파일명)

		media_ext = multiRequest.getContentType(str); // 파일 확장자(파일종류/확장자명)

		System.out.println("str : " + str);
		System.out.println("filename : " + post_file);
		System.out.println("media_real_file : " + media_real_file);
		System.out.println("media_ext : " + media_ext);
		System.out.println("path : " + path);

		int post_seq = new PostDTO().getPost_seq();
		String media_file = "C:\\Users\\user\\first_project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Anjun_Plus2\\uploadedFiles";

		FileDTO dto = new FileDTO(post_seq, media_file, media_real_file, media_ext);
		FileDAO dao = new FileDAO();
		
		int cnt2 = dao.uploadFile(dto);

		// 게시글 내용, 해쉬태그, 아이디
		String post_content = multiRequest.getParameter("post_content");
		String id = info.getId();
		String post_hashtag2 = multiRequest.getParameter("post_hashtag");
		
		
		String post_hashtag = post_hashtag2.substring(11, 13);
		
		System.out.println(post_content);
		System.out.println(id);
		System.out.println(post_hashtag);
		
		
		PostDTO dto2 = new PostDTO(post_content, id, post_hashtag);
		PostDAO dao2 = new PostDAO();
		
		System.out.println("post_content:"+dto2.getPost_content());
		System.out.println("user_id:"+dto2.getUser_id());
		System.out.println("post_hashtag:"+dto2.getPost_hashtag());

		PostDTO dto3 = dao2.post(dto2);
		if (dto3 != null) {
			writer.println("<script>alert('성공적으로 게시하였습니다.');</script>");
			response.sendRedirect("Blog.jsp?post_seq="+dto3.getPost_seq());
		} else {
			writer.println("<script>alert('게시물 작성을 실패하였습니다..');</script>");
		}
		writer.close();

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>