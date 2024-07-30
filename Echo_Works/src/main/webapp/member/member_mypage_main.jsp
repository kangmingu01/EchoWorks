<%@page import="echoworks.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MemberDTO memberId = (MemberDTO) session.getAttribute("loginMember");
    if (memberId == null) {
        response.sendRedirect("member_login.jsp");
        return; 
    }
%>
<style>
    body, html {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        height: 100%;
        width: 100%;
        background-color: #f4f4f4;
        overflow: hidden; /* Prevent scrolling */
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
        overflow-y: auto; /* Allow vertical scrolling for content */
    }
    h2 {
        color: #333;
        border-bottom: 2px solid #007bff;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }
    @media (max-width: 768px) {
        #page-container {
            flex-direction: column;
        }
        #sidebar {
            width: 100%;
            text-align: center;
        }
        #sidebar ul li {
            display: inline-block;
            margin: 10px;
        }
        #content {
            margin: 0;
            padding: 20px;
        }
    }
</style>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
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
            <h1>마이페이지</h1>
        </div>
    </div>
</body>
</html>
