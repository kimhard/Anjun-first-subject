package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CommentDAO {

	// DB 연결용 객체 생성
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
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

	// 댓글쓰기용 comment()
	public int comment(CommentDTO dto) {
		getConn();
		// 댓글 순번(cmt_seq)는 시퀀스 사용
		// 댓글 작성일자(cmt_dt)는 CURRENT_DATE로 현재시각 입력
		// 댓글 공감수(cmt_likes)는 기본값 0을 부여
		try {
			String sql = "INSERT INTO anjun_comment VALUES (ANJUN_COMMENT_SEQ.NEXTVAL, ?, ?, CURRENT_DATE, 0, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPost_seq());
			psmt.setString(2, dto.getCmt_content());
			psmt.setString(3, dto.getUser_id());
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 댓글삭제용 delete_comment()
	public int delete_comment(CommentDTO dto) {
		getConn();
		// 댓글 순번(cmt_seq)로 anjun_comment테이블 조회 후 데이터 삭제
		try {
			String sql = "DELETE FROM anjun_comment WHERE cmt_seq=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getCmt_seq());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 댓글공감용 like_comment()
	public int like_comment(CommentDTO dto) {
		getConn();
		// 기본 생성자에서 setter를 이용해 cmt_seq, cmt_likes를 가져오기
		try {
			String sql = "UPDATE anjun_comment SET cmt_likes=? WHERE cmt_seq=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getCmt_likes());
			psmt.setInt(2, dto.getCmt_seq());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}
