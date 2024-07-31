<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="echoworks.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	
	
	request.setCharacterEncoding("utf-8");

	
	String title =Utility.escapeTag(request.getParameter("title"));
	String content = Utility.escapeContent(request.getParameter("content"));
	int productNo=Integer.parseInt(request.getParameter("productNo"));
	int secretCheck=Integer.parseInt(request.getParameter("secretCheck"));
	
	
	QnaDTO qnaNew=new QnaDTO();	
	qnaNew.setQnaMemberNo(loginMember.getMemberNum());
	qnaNew.setQnaProductNo(productNo);
	qnaNew.setQnaTitle(title);
	qnaNew.setQnaContent(content);
	
	if(secretCheck==1){
		qnaNew.setQnaStatus(1);
	}else{
		qnaNew.setQnaStatus(2);		
	}
	
	int rows=QnaDAO.getDAO().insertQnaUser(qnaNew);	
	System.out.println(rows);
%>

<%if(rows>0){//삽입행이 있는경우%>
{"code":"success"}
<%}else{//삽입행이 없는 경우%>
{"code":"error"}
<%}%>