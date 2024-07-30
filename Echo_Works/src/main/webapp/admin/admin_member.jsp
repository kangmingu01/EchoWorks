<%@page import="java.util.List"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>

<%
    // 회원 목록을 가져옴
    List<MemberDTO> memberList = MemberDAO.getDAO().selectAllMembers();
    // 현재 페이지의 URI를 returnUrl로 설정
    String returnUrl = request.getContextPath() + "/index.jsp?workgroup=admin&work=admin_member";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        tbody tr:nth-child(even) { background-color: #f9f9f9; }
        tbody tr:hover { background-color: #f1f1f1; }
        .button { 
            background-color: #4CAF50; 
            border: none; 
            color: white; 
            padding: 10px 20px; 
            text-align: center; 
            text-decoration: none; 
            display: inline-block; 
            font-size: 16px; 
            margin: 10px 2px; 
            cursor: pointer; 
            border-radius: 4px; 
            transition: background-color 0.3s; 
        }
        .button:hover { background-color: #45a049; }
    </style>
    <script>
        function confirmRemoval(memberId) {
            if (confirm(memberId + "님을 탈퇴시키겠습니까?")) {
                // 회원 번호와 리턴 URL을 쿼리 문자열로 추가
                var returnUrl = encodeURIComponent('<%= returnUrl %>');
                window.location.href = '<%=request.getContextPath() %>/admin/admin_remove_member_action.jsp?memberNum=' + memberId + '&returnurl=' + returnUrl;
            }
        }
    </script>
</head>
<body>
    <h1 style="text-align: center;">회원 목록</h1>
     <button class="button" onclick="window.location.href='<%=request.getContextPath() %>/admin/admin_main.jsp'">뒤로가기</button>
    <table>
        <thead>
            <tr>
                <th>회원번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>주소</th>
                <th>회원가입일</th>
                <th>마지막 로그인</th>
                <th>회원 상태</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <% if (memberList.isEmpty()) { %>
                <tr>
                    <td colspan="10">회원이 없습니다.</td>
                </tr>
            <% } else { %>
                <% for (MemberDTO member : memberList) { %>
                    <tr>
                        <td><%= member.getMemberNum() %></td>
                        <td><%= member.getMemberId() %></td>
                        <td><%= member.getMemberName() %></td>
                        <td><%= member.getMemberMobile() %></td>
                        <td><%= member.getMemberEmail() %></td>
                        <td>[<%= member.getMemberZipcode() %>] <%= member.getMemberAddress1() %> <%= member.getMemberAddress2() %></td>
                        <td><%= member.getMemberRegisterDate() %></td>
                        <td><%= member.getMemberLastLogin() %></td>
                        <td><%= (member.getMemberAuth() == 0) ? "탈퇴 회원" : (member.getMemberAuth() == 1) ? "일반 회원" : "관리자" %></td>
                        <td>
                            <button class="button" onclick="confirmRemoval('<%= member.getMemberNum() %>')">탈퇴</button>
                        </td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>
   
</body>
</html>
