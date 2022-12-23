package Model;

public class CommentDTO {
	
	// 필드
	private int cmt_seq;
	private int post_seq;
	private String cmt_content;
	private String cmt_dt;
	private int cmt_likes;
	private String user_id;
	
	// 기본 생성자
	public CommentDTO() {
	}
	
	// 생성자
	public CommentDTO(int cmt_seq, int post_seq, String cmt_content, String cmt_dt, int cmt_likes, String user_id) {
		super();
		this.cmt_seq = cmt_seq;
		this.post_seq = post_seq;
		this.cmt_content = cmt_content;
		this.cmt_dt = cmt_dt;
		this.cmt_likes = cmt_likes;
		this.user_id = user_id;
	}
	
	// 생성자(코멘트)
	public CommentDTO(int post_seq, String cmt_content, String user_id) {
		super();
		this.post_seq = post_seq;
		this.cmt_content = cmt_content;
		this.user_id = user_id;
	}
	
	// 생성자(코멘트삭제)
	public CommentDTO(int cmt_seq) {
		super();
		this.cmt_seq = cmt_seq;
	}

	// getter
	public int getCmt_seq() {
		return cmt_seq;
	}

	public int getPost_seq() {
		return post_seq;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public String getCmt_dt() {
		return cmt_dt;
	}

	public int getCmt_likes() {
		return cmt_likes;
	}

	public String getUser_id() {
		return user_id;
	}

	// setter
	public void setCmt_seq(int cmt_seq) {
		this.cmt_seq = cmt_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public void setCmt_dt(String cmt_dt) {
		this.cmt_dt = cmt_dt;
	}

	public void setCmt_likes(int cmt_likes) {
		this.cmt_likes = cmt_likes;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
