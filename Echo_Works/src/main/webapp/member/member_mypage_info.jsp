<%@page import="echoworks.dto.MemberDTO" %>
<%@page import="echoworks.dao.MemberDAO" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MemberDTO memberId = (MemberDTO) session.getAttribute("loginMember");
    if (memberId == null) {
        response.sendRedirect("member_login.jsp");
        return;
    }

    MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
%>
<style>
    body, html {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        height: 100%;
        width: 100%;
        background-color: #f4f4f4;
    }
    #page-container {
        display: flex;
        height: 100%;
        width: 100%;
    }
    #sidebar {
        width: 250px;
        background-color: #34495e;
        padding-top: 30px;
        transition: width 0.3s;
        flex-shrink: 0;
        display: flex;
        flex-direction: column;
    }
    #sidebar ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }
    #sidebar ul li {
        margin: 20px 0;
    }
    #sidebar ul li a {
        text-decoration: none;
        color: white;
        display: block;
        padding: 15px 20px;
        border-radius: 4px;
        transition: background-color 0.3s;
    }
    #sidebar ul li a:hover {
        background-color: #2c3e50;
    }
    #content {
        flex: 1;
        padding: 30px;
        background-color: #ffffff;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        border-radius: 8px;
        margin-left: 20px;
        overflow-y: auto;
    }
    h2 {
        color: #333;
        padding-bottom: 10px;
        margin-bottom: 20px;
        border-bottom: none; /* Remove underline */
    }
    .info-item {
        margin-bottom: 15px;
    }
    .info-item label {
        font-weight: bold;
    }
    .info-item span {
        margin-left: 10px;
    }
    .button-group a {
        text-decoration: none;
        background-color: #007bff;
        color: white;
        padding: 10px 15px;
        border-radius: 4px;
        margin: 5px;
        display: inline-block;
        text-align: center;
    }
    .button-group a:hover {
        background-color: #0056b3;
    }
</style>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 정보</title>
</head>
<body>
    <div id="page-container">
        <div id="sidebar">
            <nav>
                <ul>
                    <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_mypage_info">내 정보</a></li>
                    <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_mypage_payment">결제 내역</a></li>
                    <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_mypage_qna">QnA</a></li>
                </ul>
            </nav>
        </div>
        <div id="content">
            <div id="info" class="content-section">
                <h2>내 정보</h2>
                <div class="info-item">
                    <label>이름:</label>
                    <span><%= loginMember.getMemberName() %></span>
                </div>
                <div class="info-item">
                    <label>이메일:</label>
                    <span><%= loginMember.getMemberEmail() %></span>
                </div>
                <div class="info-item">
                    <label>전화번호:</label>
                    <span><%= loginMember.getMemberMobile() %></span>
                </div>
                <div class="info-item">
                    <label>주소:</label>
                    <span>[<%= loginMember.getMemberZipcode() %>] <%= loginMember.getMemberAddress1() %> <%= loginMember.getMemberAddress2() %></span>
                </div>
                <div class="info-item">
                    <label>회원가입날짜:</label>
                    <span><%= loginMember.getMemberRegisterDate() %></span>
                </div>
                <div class="info-item">
                    <label>마지막 로그인 날짜:</label>
                    <span><%= loginMember.getMemberLastLogin() %></span>
                </div>
                <div class="button-group">
                    <a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=password_confirm&action=modify">회원정보변경</a>
                    <a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=password_confirm&action=remove">회원탈퇴</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
