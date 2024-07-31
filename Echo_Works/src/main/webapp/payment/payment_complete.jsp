<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="echoworks.dto.MemberDTO" %>
<%
    // 현재 세션에서 로그인된 사용자 정보 가져오기
    HttpSession currentSession = request.getSession();
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    // 로그인되지 않은 경우 로그인 페이지로 리디렉션
    if (loginMember == null) {
        out.println("<script>alert('로그인이 필요합니다.');location.href='" + request.getContextPath() + "/index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    // 로그인된 사용자인 경우, 결제 완료 페이지로 이동
    response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=payment&work=payment_complete");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.show {
margin-top:160px;
margin-bottom: 50px;
}
.complete {
font-size: 250px;
}
</style>
</head>
<body>
<div class="d-flex justify-content-center align-items-center flex-grow-1 show">
<div class="d-flex justify-content-center flex-column align-items-center">
<i class="fa-solid fa-check-to-slot fa-bounce complete" style="color: #515b7b;"></i>
<div>
<h1>결제 완료!</h1>
<div>
<a href="<%=request.getContextPath() %>/index.jsp?" class="btn btn-dark btn-custom">홈으로</a>
<a href="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_mypage_payment" class="btn btn-outline-dark btn-custom">주문내역</a>
</div>
</div>
</div>
</div> 