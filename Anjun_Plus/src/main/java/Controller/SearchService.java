package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.PostDAO;
import Model.PostDTO;

@WebServlet("/SearchService")
public class SearchService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); // 서버 출력 = 클라이언트로 전송.

		// 검색어
		String keyWord = request.getParameter("keyWord");
		String searchWord = request.getParameter("searchWord");

		// 글 목록 전체 가져오기
		PostDAO dao = new PostDAO(); // Dao 정보 가져오기
		ArrayList<PostDTO> boards = dao.getBoardSearch(keyWord, searchWord);

		if (boards.size() > 0) {
			for (PostDTO board : boards) {
				out.println("<table>");
				out.println("<tr>");
				out.println("<th width = '10%'>번호</th>");
				out.println("<th width = '50%'>제목</th>");
				out.println("<th width = '10%'>작성자</th>");
				out.println("<th width = '10%'>작성일</th>");
				out.println("<th width = '10%'>좋아요</th>");
				out.println("<th width = '10%'>싫어요</th>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>" + board.getPost_seq() + "</td>");
				out.println("<td>" + board.getPost_content() + "</td>");
				out.println("<td>" + board.getUser_id() + "</td>");
				out.println("<td>" + board.getPost_dt() + "</td>");
				out.println("<td>" + board.getPost_likes() + "</td>");
				out.println("<td>" + board.getPost_dislikes() + "</td>");
				out.println("</tr>");
				out.println("/<table>");
			}
		} else {
			out.println("<tr><td colspan='6'>게시글이 없습니다.</td></tr>");
		}
	}
}
