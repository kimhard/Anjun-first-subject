package Model;

public class UserDTO {
	// 사용자의 정보를 관리하기 위한 필드
	// id, pw, nick, name, email, rrn, grade 순서(DB기준)
	private String id; // 사용자 아이디
	private String pw; // 사용자 비밀번호
	private String nick; // 사용자 닉네임
	private String name; // 사용자 이름
	private String email; // 사용자 이메일
	private String rrn; // 사용자 주민번호
	private String grade; // 사용자 등급

	// 기본 생성자
	public UserDTO() {
		super();
	}
	
	// 생성자 메소드(로그인)
	public UserDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	
	// 생성자 메소드(정보수정)
	public UserDTO(String id, String pw, String nick, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.email = email;
	}
	
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

	// getter
	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getNick() {
		return nick;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getRrn() {
		return rrn;
	}

	public String getGrade() {
		return grade;
	}

	// setter
	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

}
