package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Post_TagDAO {



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
	
	// 게시물 태그
	int cnt = 0;
	public int Post_TagDAO(Post_TagDTO dto) {
		try {
			getConn();
			
			String sql = "insert into ANJUN_POST_TAG values(ANJUN_POST_TAG_PT_SEQ, ?, ?, ?, ?, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPost_seq());
			psmt.setInt(2, dto.getPost_tag1());
			psmt.setInt(3, dto.getPost_tag2());
			psmt.setInt(4, dto.getPost_tag3());
			psmt.setInt(5, dto.getPost_tag4());
			psmt.setInt(6, dto.getPost_tag5());
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}	
	
}
