package Model;

public class HashtagDTO {
	// 해시태그 필드
	private int tag_seq;
	private String tag_name;
	private String tag_type;
	
	// 기본 생성자
	public HashtagDTO() {
		super();
	}

	// 생성자 메소드(해시태그)
	public HashtagDTO(int tag_seq, String tag_name, String tag_type) {
		super();
		this.tag_seq = tag_seq;
		this.tag_name = tag_name;
		this.tag_type = tag_type;
	}

	// getter
	public int getTag_seq() {
		return tag_seq;
	}

	public String getTag_name() {
		return tag_name;
	}

	public String getTag_type() {
		return tag_type;
	}

	// setter
	public void setTag_seq(int tag_seq) {
		this.tag_seq = tag_seq;
	}

	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}

	public void setTag_type(String tag_type) {
		this.tag_type = tag_type;
	}
	
}
