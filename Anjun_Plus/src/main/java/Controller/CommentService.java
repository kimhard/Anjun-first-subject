package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CommentDAO;
import Model.CommentDTO;
import Model.UserDTO;

@WebServlet("/CommentService")
public class CommentService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String cmt_content = request.getParameter("cmt_content");
		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		String user_id = request.getParameter("user_id");
		
		HttpSession session = request.getSession();
		UserDTO info = (UserDTO)session.getAttribute("info");
		//String user_id = info.getId();
		
		CommentDAO dao = new CommentDAO();
		CommentDTO dto = new CommentDTO(post_seq, cmt_content, user_id);

		
		System.out.println(post_seq);
		System.out.println(cmt_content);
		System.out.println(user_id);
		
		
		int cnt = dao.comment(dto);
		
		String nextPage = "Blog.jsp?post_seq="+post_seq;
		if (cnt>0) {
			System.out.println("댓글 입력 완료");
		}else {
			System.out.println("댓글 입력 완료");
		}
		response.sendRedirect(nextPage);
	}

}
