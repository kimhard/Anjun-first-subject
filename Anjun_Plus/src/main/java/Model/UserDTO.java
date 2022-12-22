package Model;

public class UserDTO {
	// 사용자의 정보를 관리하기 위한 필드
	// id, pw, nick, name, email, rrn, grade 순서(DB기준)
	private String id;
	private String pw;
	private String nick;
	private String name;
	private String email;
	private String rrn;
	private String grade;

	// 생성자 메소드(회원가입)
	public UserDTO(String id, String pw, String nick, String name, String email, String rrn, String grade) {
			super();
			this.id = id;
			this.pw = pw;
			this.nick = nick;
			this.name = name;
			this.email = email;
			this.rrn = rrn;
			this.grade = grade;
		}

	// 생성자 메소드(로그인)
	public UserDTO(String id, String pw) {
			super();
			this.id = id;
			this.pw = pw;
		}

	// 기본 생성자
	public UserDTO() {
			super();
		}

	// getter, setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

}
