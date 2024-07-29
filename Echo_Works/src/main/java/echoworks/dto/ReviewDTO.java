package echoworks.dto;

import java.sql.Date;

//create table ajax_comment(num number primary key, writer varchar2(50)
//	, content varchar2(500), regdate date);

//create sequence ajax_comment_seq;

public class ReviewDTO {
	private int review_No;
	private int review_pyNo;
	private String review_Content;
	private String review_Date;
	private String review_answer;
	private String review_ansDate;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int review_No, int review_pyNo, String review_Content, String review_Date, String review_answer,
			String review_ansDate) {
		super();
		this.review_No = review_No;
		this.review_pyNo = review_pyNo;
		this.review_Content = review_Content;
		this.review_Date = review_Date;
		this.review_answer = review_answer;
		this.review_ansDate = review_ansDate;
	}

	public int getReview_No() {
		return review_No;
	}

	public void setReview_No(int review_No) {
		this.review_No = review_No;
	}

	public int getReview_pyNo() {
		return review_pyNo;
	}

	public void setReview_pyNo(int review_pyNo) {
		this.review_pyNo = review_pyNo;
	}

	public String getReview_Content() {
		return review_Content;
	}

	public void setReview_Content(String review_Content) {
		this.review_Content = review_Content;
	}

	public String getReview_Date() {
		return review_Date;
	}

	public void setReview_Date(String review_Date) {
		this.review_Date = review_Date;
	}

	public String getReview_answer() {
		return review_answer;
	}

	public void setReview_answer(String review_answer) {
		this.review_answer = review_answer;
	}

	public String getReview_ansDate() {
		return review_ansDate;
	}

	public void setReview_ansDate(String review_ansDate) {
		this.review_ansDate = review_ansDate;
	}
}
