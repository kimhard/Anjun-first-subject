package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Post_reportDAO {

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
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 게시물 신고 메소드 reportPost()
	public int reportPost(Post_reportDTO dto) {
		try {
			getConn();
			String sql = "INSERT INTO anjun_post_report(post_seq, pr_reason, pr_dt, user_id) VALUES (?, ?, current_date, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPost_seq());
			psmt.setString(2, dto.getPr_reason());
			psmt.setString(3, dto.getUser_id());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
