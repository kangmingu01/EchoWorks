<%@page import="echoworks.dao.ReviewDAO"%>
<%@page import="echoworks.dto.ReviewDTO"%>
<%@page import="echoworks.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 댓글정보(작성자와 내용)를 전달받아 AJAX_COMMENT 테이블에 저장된 행을 변경하고 실행결과를
JSON으로 응답하는 JSP 문서  --%>    
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	request.setCharacterEncoding("utf-8");
	
	int no=Integer.parseInt(request.getParameter("no"));
	int pyNo=Integer.parseInt(request.getParameter("pyNo"));
	String content=Utility.escapeTag(request.getParameter("content"));

	ReviewDTO review=new ReviewDTO();
	review.setReview_No(no);
	review.setReview_pyNo(pyNo);
	review.setReview_Content(content);
	
	int rows=ReviewDAO.getDAO().updateReview(review);
%>
<% if(rows > 0) {//변경행이 있는 경우 %>
{"code":"success"}
<% } else {//변경행이 없는 경우 %>
{"code":"error"}
<% } %>
