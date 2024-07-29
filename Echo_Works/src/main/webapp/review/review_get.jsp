<%@page import="echoworks.util.Utility"%>
<%@page import="echoworks.dao.ReviewDAO"%>
<%@page import="echoworks.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 댓글번호를 전달받아 AJAX_COMMENT 테이블에서 댓글번호의 행을 검색하여 JSON으로 응답하는 JSP 문서 --%>    
<%
	if(request.getParameter("num") == null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	int no=Integer.parseInt(request.getParameter("no"));
	
	ReviewDTO review=ReviewDAO.getDAO().selectReview(no);
%>
<% if(review != null) {//검색된 댓글이 있는 경우 %>
{
	"code":"success"
	, "data":{"num":<%=review.getReview_No() %>
		
		, "content":"<%=Utility.toJSON(review.getReview_Content()) %>"
		, "regdate":"<%=review.getReview_Date() %>"
	}
}
<% } else {//검색된 댓글이 없는 경우 %>
{"code":"empty"}	
<% } %>