<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.dao.PaymentDAO"%>
<%@page import="echoworks.dto.PaymentDTO"%>
<%@page import="java.util.List"%>
<%@page import="echoworks.dao.ReviewDAO"%>
<%@page import="echoworks.dto.ReviewDTO"%>
<%@page import="echoworks.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 댓글정보(작성자와 내용)를 전달받아 AJAX_COMMENT 테이블의 행으로 삽입하고 실행결과를
JSON으로 응답하는 JSP 문서  --%>    
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	request.setCharacterEncoding("utf-8");
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	List<PaymentDTO> paymentList =PaymentDAO.getDAO().selectPaymentByMemberNo(loginMember.getMemberNum());
	
	int pyNo = 0;
	for(int i=0;i<paymentList.size();i++) {
		
		// 리뷰테이블에 해당 구매 상품에 대한 리뷰를 안썼을 경우 0
		if(ReviewDAO.getDAO().selectReviewCount(paymentList.get(i).getPaymentNo()) == 0) { 
		pyNo =paymentList.get(i).getPaymentNo();
		}
	}
	
	String content=Utility.escapeTag(request.getParameter("content"));

	int rows = 0;
	if(pyNo != 0){
	ReviewDTO review=new ReviewDTO();
	review.setReview_pyNo(pyNo);
	review.setReview_Content(content);
	rows=ReviewDAO.getDAO().insertReveiw(review);
	}
	
%>
<% if(rows > 0) {//삽입행이 있는 경우 %>
{"code":"success"}
<% } else {//삽입행이 없는 경우 %>
{"code":"error"}
<% } %>
