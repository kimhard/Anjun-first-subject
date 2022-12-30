package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.PostDAO;
import Model.PostDTO;

@WebServlet("/PostService")
public class PostService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String content = request.getParameter("post_content	");
		String hashtag = request.getParameter("post_hashtag");

		PostDTO dto = new PostDTO(content, hashtag);
		PostDAO dao = new PostDAO();
		
		
		
	}

}

