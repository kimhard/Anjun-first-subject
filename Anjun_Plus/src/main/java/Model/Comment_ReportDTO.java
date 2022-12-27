package Model;

public class Comment_ReportDTO {

	// 신고 필드 
		private int cr_seq; // 댓글신고 번호
		private int cmt_seq; // 댓글신고 번호
		private String cr_reason; //신고이유
		private String cr_DT; // 신고 시간 
		private String user_id; // 신고자 ID
		
		// 생성자 메소드(댓글 신고)
		
		public Comment_ReportDTO(int cr_seq, int cmt_seq, String cr_reason, String cr_DT, String user_id) {
			super();
			this.cr_seq = cr_seq;
			this.cmt_seq = cmt_seq;
			this.cr_reason = cr_reason;
			this.cr_DT = cr_DT;
			this.user_id = user_id;
		}

		
		// getter, setter
		public int getCr_seq() {
			return cr_seq;
		}

		public void setCr_seq(int cr_seq) {
			this.cr_seq = cr_seq;
		}

		public int getCmt_seq() {
			return cmt_seq;
		}
		
		public void setCmt_seq(int cmt_seq) {
			this.cmt_seq = cmt_seq;
		}

		public String getCr_reason() {
			return cr_reason;
		}

		public void setCr_reason(String cr_reason) {
			this.cr_reason = cr_reason;
		}

		public String getCr_DT() {
			return cr_DT;
		}

		public void setCr_DT(String cr_DT) {
			this.cr_DT = cr_DT;
		}

		public String getUser_id() {
			return user_id;
		}

		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		
		
		
}