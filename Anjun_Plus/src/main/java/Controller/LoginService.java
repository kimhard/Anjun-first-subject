package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserDAO;
import Model.UserDTO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDTO dto = new UserDTO(id, pw);
		UserDAO dao = new UserDAO();
		
		UserDTO result = dao.login(dto);
		
		String nextPage = "tempmain2.html"; 
		if(result != null) {
			System.out.println("로그인 완료!");
			HttpSession session = request.getSession();
			session.setAttribute("info", result);
		}else {
			System.out.println("로그인 실패");
			nextPage = "Login.jsp";
		}
	
		response.sendRedirect(nextPage);
		
	}

}
