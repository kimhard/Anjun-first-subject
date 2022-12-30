package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.PostDAO;
import Model.PostDTO;

@WebServlet("/PostService")
public class PostService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String content = request.getParameter("post_content	");
		String id = (String) session.getAttribute("id");
		String hashtag = request.getParameter("post_hashtag");

		PostDTO dto = new PostDTO(content, id, hashtag);
		PostDAO dao = new PostDAO();

		
		int cnt = dao.ImgUpload(dto);
		if (cnt > 0) {
			writer.println("<script>alert('성공적으로 게시하였습니다.');</script>");

		} else {
			writer.println("<script>alert('게시를 실패하였습니다..');</script>");
		}
		writer.close();
		String nextPage = "NewMain.jsp";
		response.sendRedirect(nextPage);

	}
}