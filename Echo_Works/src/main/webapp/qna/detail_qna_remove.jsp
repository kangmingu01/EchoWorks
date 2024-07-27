<%@page import="echoworks.dao.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("qnaNo") == null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	int qnaNo=Integer.parseInt(request.getParameter("qnaNo"));
	
	int rows=QnaDAO.getDAO().deleteQna(qnaNo);
%>
<% if(rows > 0) {//삭제행이 있는 경우 %>
{"code":"success"}
<% } else {//삭제행이 없는 경우 %>
{"code":"error"}
<% } %>