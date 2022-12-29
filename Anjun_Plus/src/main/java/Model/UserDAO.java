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
	public UserDTO login(UserDTO dto) {
		try {
			getConn();
			// 실제로 존재하는 회원인지 DB에서 확인하는 SQL문
			String sql = "SELECT * FROM anjun_user WHERE user_id=? AND user_pw=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			rs = psmt.executeQuery();
			// 만약 첫번째 행에 데이터가 있다면 각각의 컬럼의 데이터를 가져온 뒤
			// 새로운 UserDTO타입의 변수 result에 담아 반환
			if(rs.next()) { 
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String nick = rs.getString(3);
				String name = rs.getString(4);
				String email = rs.getString(5);
				String rrn = rs.getString(6);
				String grade = rs.getString(7);
				result = new UserDTO(id, pw, nick, name, email, rrn, grade);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 사용자의 회원정보 수정용 update()
	public int update(UserDTO dto) {
		try {
			getConn();
			// ID가 dto.getID()인 사람의 행을 수정하는 SQL문
			String sql = "UPDATE anjun_user SET user_pw=?, user_nick=?, user_email=? WHERE user_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPw());
			psmt.setString(2, dto.getNick());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getId());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 관리자의 회원등급 수정용 changeGrade()
	public int changeGrade(UserDTO dto) {
		try {
			getConn();
			// 관리자가 사용자의 ID를 알고 사용자의 등급을 수정하는 SQL문
			String sql = "UPDATE anjun_user SET user_grade=? WHERE user_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getGrade());
			psmt.setString(2, dto.getId());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
}
