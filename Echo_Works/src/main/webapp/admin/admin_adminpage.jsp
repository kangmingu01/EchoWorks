<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="echoworks.dto.PaymentDTO"%>
<%@page import="echoworks.dto.PaymentDTO"%>
<%@page import="java.util.List"%>
<%@page import="echoworks.dao.PaymentDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	//session 내장객체에서 권한 관련 정보가 저장된 속성값을 객체로 반환받아 저장
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

	//비로그인 사용자이거나 일반 사용자가 JSP 문서를 요청한 경우에 대한 응답 처리 - 비정상적인 요청
	if(loginMember == null || loginMember.getMemberAuth() != 9) {
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=error&work=error_400");
		return;			
	}
--%> 
<%@include file="/security/admin_check.jspf" %>   

<% 
			// 모든 결제내역 불러오기
List<PaymentDTO> paymentList = PaymentDAO.getDAO().selectAllPayments();

			// 모든 QnA내역 불러오기
List<QnaDTO> qnaList = QnaDAO.getDAO().selectAllQnAList();
%>

<h1>관리자 페이지</h1>