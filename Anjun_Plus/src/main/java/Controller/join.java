package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UserDAO;
import Model.UserDTO;

@WebServlet("/join")
public class join extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String rrn = request.getParameter("rrn");
		
		UserDTO dto = new UserDTO(id, pw, nick, name, email, rrn, "C");
		UserDAO dao = new UserDAO();
		
		System.out.println(dto.getId());
		System.out.println(dto.getPw());
		System.out.println(dto.getNick());
		System.out.println(dto.getName());
		System.out.println(dto.getEmail());
		System.out.println(dto.getRrn());
		
		int cnt = dao.join(dto);
		if (cnt > 0) {
			System.out.println("회원가입이 완료되었습니다.");
		}else {
			System.out.println("회원가입 실패.");
		}
		response.sendRedirect("join.jsp");
		
	}

}
