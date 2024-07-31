<%@page import="echoworks.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@include file="/security/admin_check.jspf" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap">
    <meta charset="UTF-8">
    <title>관리자 메인 페이지</title>
    <style>
        /* 전체 바디 스타일 */
       body {
    	font-family: 'Noto Sans KR', Arial, sans-serif;
	}	
        /* 컨테이너 스타일 */
        #container {
            display: flex;
            height: 100vh;
            overflow: hidden; /* 오버플로우가 있을 경우 숨김 처리 */
        }
        /* 사이드바 스타일 */
        .sidebar {
            width: 200px;
            background-color: #2c3e50;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: white;
            display: block;
            padding: 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .sidebar ul li a:hover {
            background-color: #34495e;
        }
        /* 메인 콘텐츠 스타일 */
        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin: 20px;
            border-radius: 8px;
            overflow-y: auto;
        }
        h2 {
            margin-top: 0;
        }
    </style>
</head>
<body>
    <div id="container">
        <div class="sidebar">
            <nav>
                <ul>
                    <li><a href="<%=request.getContextPath() %>/admin/admin_member.jsp">회원 관리</a></li>
                    <li><a href="<%=request.getContextPath() %>/admin/admin_payment.jsp">주문 관리</a></li>
                    <li><a href="<%=request.getContextPath() %>/admin/admin_qna.jsp">QnA 관리</a></li>
                    <li><a href="<%=request.getContextPath() %>/admin/admin_product.jsp">상품 관리</a></li>
                </ul>
            </nav>
        </div>
        <div class="main-content">
            <h1 style="text-align: center;">관리자 페이지</h1>
            <p>왼쪽 메뉴를 사용하여 관리 작업을 선택하십시오.</p>
             <a href="<%=request.getContextPath() %>/index.jsp" class="button">홈으로 돌아가기</a>
        </div>
    </div>
</body>
</html>
