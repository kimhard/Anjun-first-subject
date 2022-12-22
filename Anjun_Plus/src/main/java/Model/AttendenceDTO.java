package Model;

public class AttendenceDTO {
	// 출석 필드
	private int at_seq; // 출석 순번
	private String at_time; // 출석 시간
	private String user_id; // 사용자 ID
	
	// 기본 생성자
	public AttendenceDTO() {
		super();
	}
	
	// 생성자 메소드(출석)
	public AttendenceDTO(int at_seq, String at_time, String user_id) {
		super();
		this.at_seq = at_seq;
		this.at_time = at_time;
		this.user_id = user_id;
	}

	// getter
	public int getAt_seq() {
		return at_seq;
	}

	public String getAt_time() {
		return at_time;
	}

	public String getUser_id() {
		return user_id;
	}

	// setter
	public void setAt_seq(int at_seq) {
		this.at_seq = at_seq;
	}

	public void setAt_time(String at_time) {
		this.at_time = at_time;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
