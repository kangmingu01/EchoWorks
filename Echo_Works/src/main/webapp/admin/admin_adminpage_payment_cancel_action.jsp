<%@page import="echoworks.dao.PaymentDAO"%>
<%@page import="echoworks.dto.PaymentDTO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<%
    // 비정상적으로 JSP 문서를 요청한 경우에 대한 응답 처리
    if(request.getMethod().equals("GET")) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=error&work=error_400");
        return;
    }

    int num = Integer.parseInt(request.getParameter("paymentNo"));
    PaymentDTO payment = new PaymentDTO();
	
    payment.setPaymentNo(num);
    payment.setPaymentStatus(0);

    PaymentDAO.getDAO().updatePayment(payment);
    
    // 페이지 이동
    response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=admin&work=admin_payment");
%>
