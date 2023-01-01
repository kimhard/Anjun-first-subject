package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FileDAO {

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
	
	// 파일 업로드
	public int uploadFile(FileDTO dto) {
		getConn();
		try {
			String sql = "INSERT INTO anjun_file VALUES (ANJUN_FILE_SEQ.NEXTVAL, ?, ?, ?, ?, CURRENT_DATE)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPost_seq());
			psmt.setString(2, dto.getMedia_file());
			psmt.setString(3, dto.getmedia_real_file());
			psmt.setString(4, dto.getMedia_ext());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 글에 표시되는 이미지 불러오기(수정중)
	public ArrayList<FileDTO> postFile(int post_seq) {
		ArrayList<FileDTO> files = new ArrayList<FileDTO>();
		FileDTO file = null;
		try {
			getConn();
			String sql = "SELECT * FROM anjun_file WHERE post_seq=? ORDER BY upload_time DESC";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, post_seq);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				int media_seq = rs.getInt(1);
				post_seq = rs.getInt(2);
				String media_file = rs.getString(3);
				String media_real_file = rs.getString(4);
				String media_ext = rs.getString(5);
				String upload_time = rs.getString(6);
				
				file = new FileDTO(media_seq, post_seq, media_file, media_real_file, media_ext, upload_time);
				files.add(file);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return files;
	}
}
