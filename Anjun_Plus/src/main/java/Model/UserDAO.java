package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	// DB 연결용 객체 생성
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	UserDTO result = null;
	int cnt = 0;

	
	// DB 연결용 getConn()
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "cgi_4_1220_3";
			String dbpw = "smhrd3";
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DB 연결용 객체 반환 close()
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원가입용 join()
	public int join(UserDTO dto) {
		try {
			getConn();
			// user_grade는 값을 입력하지 않을 경우 자동으로 'C'로 들어가기 때문에 명시하지 않았다.(default값)
			String sql = "INSERT INTO anjun_user (user_id, user_pw, user_nick, user_name, user_email, user_rrn) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getNick());
			psmt.setString(4, dto.getName());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getRrn());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 로그인용 login()
	public void name() {
		
	}
}
