package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UserDAO;
import Model.UserDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String rrn1 = request.getParameter("rrn1");
		String rrn2 = request.getParameter("rrn2");
		String rrn = rrn1 + "-" + rrn2;

		UserDTO dto = new UserDTO(id, pw, nick, name, email, rrn, "C");
		UserDAO dao = new UserDAO();

		int cnt = dao.join(dto);
		String PageUrl =  "Login.jsp";
		if (cnt > 0) {
			writer.println("<script>alert('회원가입을 성공하셨습니다.'); location.href='"+PageUrl+"';</script>"); 

		} else {
			writer.println("<script>alert('회원가입을 실패하셨습니다..'); location.href='"+PageUrl+"';</script>"); 
		}
		writer.close();

	}

}
