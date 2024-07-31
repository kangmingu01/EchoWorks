<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
	
	request.setCharacterEncoding("utf-8");
	
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	String qnaTitle = Utility.escapeTag(request.getParameter("editedTitle"));
	String qnaContent = Utility.escapeContent(request.getParameter("editedContent"));
	
	
	QnaDTO updateQna = new QnaDTO();
	updateQna.setQnaMemberNo(loginMember.getMemberNum());
	updateQna.setQnaNo(qnaNo);
	updateQna.setQnaProductNo(productNo);
	updateQna.setQnaTitle(qnaTitle);
	updateQna.setQnaContent(qnaContent);

	int rows = QnaDAO.getDAO().updateQna(updateQna);

%>
<% if(rows > 0) {//변경행이 있는 경우 %>
{"code":"success"}
<% } else {//변경행이 없는 경우 %>
{"code":"error"}
<% } %>