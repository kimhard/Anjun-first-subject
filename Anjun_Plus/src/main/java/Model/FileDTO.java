package Model;

public class FileDTO {
	// 필드
	private int media_seq;
	private int post_seq;
	private String media_file;
	private String media_real_file;
	private String media_ext;
	private String upload_time;

	// 생성자
	public FileDTO(int media_seq, int post_seq, String media_file, String media_real_file, String media_ext,
			String upload_time) {
		super();
		this.media_seq = media_seq;
		this.post_seq = post_seq;
		this.media_file = media_file;
		this.media_real_file = media_real_file;
		this.media_ext = media_ext;
		this.upload_time = upload_time;
	}

	public FileDTO(int post_seq, String media_file, String media_real_file, String media_ext) {
		super();
		this.post_seq = post_seq;
		this.media_file = media_file;
		this.media_real_file = media_real_file;
		this.media_ext = media_ext;
	}

	// getter
	public int getMedia_seq() {
		return media_seq;
	}

	public int getPost_seq() {
		return post_seq;
	}

	public String getMedia_file() {
		return media_file;
	}

	public String getmedia_real_file() {
		return media_real_file;
	}

	public String getMedia_ext() {
		return media_ext;
	}

	public String getUpload_time() {
		return upload_time;
	}

	// setter
	public void setMedia_seq(int media_seq) {
		this.media_seq = media_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public void setMedia_file(String media_file) {
		this.media_file = media_file;
	}

	public void setmedia_real_file(String media_real_file) {
		this.media_real_file = media_real_file;
	}

	public void setMedia_ext(String media_ext) {
		this.media_ext = media_ext;
	}

	public void setUpload_time(String upload_time) {
		this.upload_time = upload_time;
	}

}
