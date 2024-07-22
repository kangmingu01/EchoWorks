package echoworks.dto;

import java.util.Date;

public class QnaDTO {
    private int qnaNo;        // 문의 글 번호
    private int qnaMemberNo;  // 질문자 번호
    private int qnaProductNo; // 문의할 제품 번호
    private String qnaTitle;  // 문의제목
    private String qnaContent;// 문의내용
    private Date qnaDate;     // 문의작성일
    private String qnaAnswer; // 답변내용
    private Date qnaAnsDate;  // 답변날짜
    
    public QnaDTO() {
		// TODO Auto-generated constructor stub
	}
    
    
    public int getQnaNo() {
        return qnaNo;
    }

    public void setQnaNo(int qnaNo) {
        this.qnaNo = qnaNo;
    }

    public int getQnaMemberNo() {
        return qnaMemberNo;
    }

    public void setQnaMemberNo(int qnaMemberNo) {
        this.qnaMemberNo = qnaMemberNo;
    }

    public int getQnaProductNo() {
        return qnaProductNo;
    }

    public void setQnaProductNo(int qnaProductNo) {
        this.qnaProductNo = qnaProductNo;
    }

    public String getQnaTitle() {
        return qnaTitle;
    }

    public void setQnaTitle(String qnaTitle) {
        this.qnaTitle = qnaTitle;
    }

    public String getQnaContent() {
        return qnaContent;
    }

    public void setQnaContent(String qnaContent) {
        this.qnaContent = qnaContent;
    }

    public Date getQnaDate() {
        return qnaDate;
    }

    public void setQnaDate(Date qnaDate) {
        this.qnaDate = qnaDate;
    }

    public String getQnaAnswer() {
        return qnaAnswer;
    }

    public void setQnaAnswer(String qnaAnswer) {
        this.qnaAnswer = qnaAnswer;
    }

    public Date getQnaAnsDate() {
        return qnaAnsDate;
    }

    public void setQnaAnsDate(Date qnaAnsDate) {
        this.qnaAnsDate = qnaAnsDate;
    }
}
