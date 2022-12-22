package Model;

public class PostDTO {
	
	// 필드
	private int post_seq; // 게시물 순번
	private String post_content; // 게시물 내용
	private String post_dt; // 게시물 작성일자
	private String user_id; // 게시물 작성자
	private int post_likes; // 게시물 추천수
	private int post_dislikes; // 게시물 비추천수
	private String post_hashtag; // 게시물 해시태그
	private double post_lat; // 게시물 위도
	private double post_lng; // 게시물 경도
	
	// 생성자
	public PostDTO() {
		
	}
	
	public PostDTO(int post_seq, String post_content, String post_dt, String user_id, int post_likes, int post_dislikes,
			String post_hashtag, double post_lat, double post_lng) {
		super();
		this.post_seq = post_seq;
		this.post_content = post_content;
		this.post_dt = post_dt;
		this.user_id = user_id;
		this.post_likes = post_likes;
		this.post_dislikes = post_dislikes;
		this.post_hashtag = post_hashtag;
		this.post_lat = post_lat;
		this.post_lng = post_lng;
	}

	// getter
	public int getPost_seq() {
		return post_seq;
	}

	public String getPost_content() {
		return post_content;
	}

	public String getPost_dt() {
		return post_dt;
	}

	public String getUser_id() {
		return user_id;
	}

	public int getPost_likes() {
		return post_likes;
	}

	public int getPost_dislikes() {
		return post_dislikes;
	}

	public String getPost_hashtag() {
		return post_hashtag;
	}

	public double getPost_lat() {
		return post_lat;
	}

	public double getPost_lng() {
		return post_lng;
	}

	// setter
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public void setPost_dt(String post_dt) {
		this.post_dt = post_dt;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setPost_likes(int post_likes) {
		this.post_likes = post_likes;
	}

	public void setPost_dislikes(int post_dislikes) {
		this.post_dislikes = post_dislikes;
	}

	public void setPost_hashtag(String post_hashtag) {
		this.post_hashtag = post_hashtag;
	}

	public void setPost_lat(double post_lat) {
		this.post_lat = post_lat;
	}

	public void setPost_lng(double post_lng) {
		this.post_lng = post_lng;
	}
	
}
