package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PostDAO {

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
	
	// 글쓰기용 post()
	public int post(PostDTO dto) {
		getConn();
		// 게시물 순번(post_seq)는 시퀀스 사용
		// 게시물 추천수(post_likes), 게시물 비추천수(post_dislikes)는 기본값 0을 부여
		try {
			String sql = "INSERT INTO anjun_post VALUES (anjun_post_seq.NEXTVAL, ?, ?, ?, 0, 0, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPost_content());
			psmt.setString(2, dto.getPost_dt());
			psmt.setString(3, dto.getUser_id());
			psmt.setString(4, dto.getPost_hashtag());
			psmt.setDouble(5, dto.getPost_lat());
			psmt.setDouble(6, dto.getPost_lng());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 글삭제용 delete_post()
	public int delete_post(PostDTO dto) {
		getConn();
		// 게시물 순번으로 anjun_post테이블 조회 후 데이터 삭제
		try {
			String sql = "DELETE FROM anjun_post WHERE post_seq=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPost_seq());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
