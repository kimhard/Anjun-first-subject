package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AttendenceDAO {

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
	
	// 오늘 이미 출석했는지 확인하는 출석여부 확인용 stampCheck()
	public int stampCheck(AttendenceDTO dto) {
		try {
			getConn();
			// 출석을 시도하려는 시점의 년월일과 같은 년월일에 출석 기록이 있는지 확인하는 SQL문
			String sql = "SELECT * FROM anjun_attendance"
					+ "WHERE TO_CHAR(at_time, 'YYYY:MM:DD') = (SELECT TO_CHAR(current_date, 'YYYY:MM:DD') FROM dual)"
					+ "AND user_id= ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUser_id());
			rs = psmt.executeQuery();
			// 만약 SELECT문을 실행했을 때 1열이 조회되면 1을 리턴, 0열이 조회되면 -1을 리턴
			if(rs.next()) {
				cnt = 1;
			}else {
				cnt = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 출석체크용 stamp()
	public int stamp(AttendenceDTO dto) {
		try {
			getConn();
			// 오늘 출석을 한 적 있는지를 확인
			if(stampCheck(dto) == 1) {
				// 출석을 안했다면 출석을 하도록 SQL문 작성
				String sql = "INSERT INTO anjun_attendence (at_time, user_id) values (?, ?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getAt_time());
				psmt.setString(2, dto.getUser_id());
				cnt = psmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
