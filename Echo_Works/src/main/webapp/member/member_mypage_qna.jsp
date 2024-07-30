<%@page import="java.util.List"%>
<%@ page import="echoworks.dto.QnaDTO" %>
<%@ page import="echoworks.dao.QnaDAO" %>
<%@ page import="echoworks.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MemberDTO memberId = (MemberDTO) session.getAttribute("loginMember");
    if (memberId == null) {
        response.sendRedirect("member_login.jsp");
        return;
    }

    MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
    List<QnaDTO> qnaList = QnaDAO.getDAO().selectQnaByMemberNo(loginMember.getMemberNum());
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
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    table th, table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    table th {
        background-color: #007bff;
        color: white;
    }
    table tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    table tr:hover {
        background-color: #f1f1f1;
    }
</style>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>QnA</title>
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
            <div id="qna" class="content-section">
                <h2>QnA</h2>
                <table>
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>내용</th>
                            <th>날짜</th>
                            <th>답변유무</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (qnaList.isEmpty()) { %>
                            <tr>
                                <td colspan="4">문의 내역이 없습니다.</td>
                            </tr>
                        <% } else { %>
                            <% for (QnaDTO qna : qnaList) { %>
                                <tr>
                                    <td><%= qna.getQnaTitle() %></td>
                                    <td><%= qna.getQnaContent() %></td>
                                    <td><%= qna.getQnaDate() %></td>
                                    <td>
                                        <% if (qna.getQnaStatus() == 0) { %>
                                            삭제된 글
                                        <% } else if (qna.getQnaAnswer() == null && qna.getQnaStatus() == 1) { %>
                                            답변 대기 중(일반글)
                                        <% } else if (qna.getQnaAnswer() != null && qna.getQnaStatus() == 1) { %>
                                            답변 완료(일반글)
                                        <% } else if (qna.getQnaAnswer() == null && qna.getQnaStatus() == 2) { %>
                                            답변 대기 중(비밀글)
                                        <% } else if (qna.getQnaAnswer() != null && qna.getQnaStatus() == 2) { %>
                                            답변 완료(비밀글)
                                        <% } %>
                                    </td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
