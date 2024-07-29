<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<%
    // 비정상적으로 JSP 문서를 요청한 경우에 대한 응답 처리
 	

    int num = Integer.parseInt(request.getParameter("qnaNo"));
    

    QnaDAO.getDAO().deleteQna(num);
    
    // 페이지 이동
    response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=admin&work=admin_adminpage#admin_qna");
%>
