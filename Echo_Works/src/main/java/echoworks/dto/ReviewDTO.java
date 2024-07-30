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
	private int review_state;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int review_No, int review_pyNo, String review_Content, String review_Date, int review_state) {
		super();
		this.review_No = review_No;
		this.review_pyNo = review_pyNo;
		this.review_Content = review_Content;
		this.review_Date = review_Date;
		this.review_state = review_state;
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

	public int getReview_state() {
		return review_state;
	}

	public void setReview_state(int review_state) {
		this.review_state = review_state;
	}
}
