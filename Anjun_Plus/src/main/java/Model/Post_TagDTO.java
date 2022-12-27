package Model;

public class Post_TagDTO {
	
	// 필드
	private int pt_seq; // 게시물태그 순번
	private int post_seq; // 게시글 순번
	private int post_tag1; // 태그 순번1
	private int post_tag2; // 태그 순번2
	private int post_tag3; // 태그 순번3
	private int post_tag4; // 태그 순번4
	private int post_tag5; // 태그 순번5
	
	// 기본생성자
	public Post_TagDTO() {
	}
	
	// 생성자
	public Post_TagDTO(int pt_seq, int post_seq, int post_tag1, int post_tag2, int post_tag3, int post_tag4,
			int post_tag5) {
		super();
		this.pt_seq = pt_seq;
		this.post_seq = post_seq;
		this.post_tag1 = post_tag1;
		this.post_tag2 = post_tag2;
		this.post_tag3 = post_tag3;
		this.post_tag4 = post_tag4;
		this.post_tag5 = post_tag5;
	}
	
	// getter
	public int getPt_seq() {
		return pt_seq;
	}

	public int getPost_seq() {
		return post_seq;
	}

	public int getPost_tag1() {
		return post_tag1;
	}

	public int getPost_tag2() {
		return post_tag2;
	}

	public int getPost_tag3() {
		return post_tag3;
	}

	public int getPost_tag4() {
		return post_tag4;
	}

	public int getPost_tag5() {
		return post_tag5;
	}
	
	
	// setter
	public void setPt_seq(int pt_seq) {
		this.pt_seq = pt_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public void setPost_tag1(int post_tag1) {
		this.post_tag1 = post_tag1;
	}

	public void setPost_tag2(int post_tag2) {
		this.post_tag2 = post_tag2;
	}

	public void setPost_tag3(int post_tag3) {
		this.post_tag3 = post_tag3;
	}

	public void setPost_tag4(int post_tag4) {
		this.post_tag4 = post_tag4;
	}

	public void setPost_tag5(int post_tag5) {
		this.post_tag5 = post_tag5;
	}

	
	
	



	
	
	
	
	
	
	
	
	
	
	
}
