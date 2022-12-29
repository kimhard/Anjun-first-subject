package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserDAO;
import Model.UserDTO;

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = "smhrd";
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		
		UserDTO dto = new UserDTO(id, pw, nick, email);
		UserDAO dao = new UserDAO();
		
		System.out.println(dto.getId());
		System.out.println(dto.getPw());
		System.out.println(dto.getNick());
		System.out.println(dto.getEmail());
		
		int cnt = dao.update(dto);

		String PageUrl =  "Profile.jsp";
		if (cnt > 0) {
			writer.println("<script>alert('회원정보 수정을 완료했습니다.'); location.href='"+PageUrl+"';</script>"); 

		} else {
			writer.println("<script>alert('회원정보 수정에 실패했습니다..'); location.href='"+PageUrl+"';</script>"); 
		}
		writer.close();
	}

}
