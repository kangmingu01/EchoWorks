<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="echoworks.util.Utility"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("qnaNo") == null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	int qnaNo=Integer.parseInt(request.getParameter("qnaNo"));
	String answerContent =request.getParameter("answerContent");
	System.out.println(answerContent);
	//업데이트 dao 작성
	QnaDTO qnaNew=new QnaDTO();	
	qnaNew.setQnaNo(qnaNo);
	qnaNew.setQnaAnswer(answerContent);
	
	int rows=QnaDAO.getDAO().insertAdminAnswer(qnaNew);
	
%>
<% if(rows > 0) { %>
{"code":"success"}
<% } else { %>
{"code":"error"}
<% } %>