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
	public void join(UserDTO dto) {
		try {
			getConn();
			String sql = "insert into anjun_user values (?, ? ,?, ?, )";
		} catch (Exception e) {
			
		} finally {
			
		}
	}

}
