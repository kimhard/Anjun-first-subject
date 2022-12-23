package Model;

public class Post_reportDTO {
	// 게시물 신고 필드
	private int pr_seq;
	private int post_seq;
	private String pr_reason;
	private String pr_dt;
	private String user_id;
	
	// 기본 생성자
	public Post_reportDTO() {
		super();
	}

	// 생성자 메소드(게시물 신고)
	public Post_reportDTO(int pr_seq, int post_seq, String pr_reason, String pr_dt, String user_id) {
		super();
		this.pr_seq = pr_seq;
		this.post_seq = post_seq;
		this.pr_reason = pr_reason;
		this.pr_dt = pr_dt;
		this.user_id = user_id;
	}

	// getter
	public int getPr_seq() {
		return pr_seq;
	}

	public int getPost_seq() {
		return post_seq;
	}

	public String getPr_reason() {
		return pr_reason;
	}

	public String getPr_dt() {
		return pr_dt;
	}

	public String getUser_id() {
		return user_id;
	}

	// setter
	public void setPr_seq(int pr_seq) {
		this.pr_seq = pr_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public void setPr_reason(String pr_reason) {
		this.pr_reason = pr_reason;
	}

	public void setPr_dt(String pr_dt) {
		this.pr_dt = pr_dt;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}	
	
}
