<%@page import="java.sql.Date"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<%@page import="echoworks.util.Utility"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A 답변</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .content-section {
            max-width: 800px;
            margin: auto;
        }
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
        .button:hover {
            background-color: #45a049;
        }
        .back-button {
            background-color: #007bff;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="content-section">
        <h1 style="text-align: center;">Q&A 답변 작성</h1>

        <!-- 뒤로가기 버튼 -->
        <a href="<%=request.getContextPath() %>/admin/admin_qna.jsp" class="button back-button">뒤로가기</a>

        <% 
            String qnaNoStr = request.getParameter("qnaNo");
            if (qnaNoStr != null && !qnaNoStr.isEmpty()) {
                try {
                    int qnaNo = Integer.parseInt(qnaNoStr);
                    QnaDTO qna = QnaDAO.getDAO().selectQnaByNo(qnaNo);
                    if (qna != null) {
                        MemberDTO member = MemberDAO.getDAO().selectMemberByNum(qna.getQnaMemberNo());
        %>
        <form action="<%=request.getContextPath() %>/admin/admin_qna_reply_action.jsp" method="post">
            <input type="hidden" name="qnaNo" value="<%= qna.getQnaNo() %>" />
            
            <p><strong>작성자: <%=member.getMemberName() %></strong>
            <p><strong>제목:</strong> <%= qna.getQnaTitle() %></p>
            <p><strong>내용:</strong></p>
            <textarea rows="5" cols="80" readonly><%= qna.getQnaContent() %></textarea>
            <br><br>

            <label for="answer" style="margin-bottom: 50px">답변:</label>
            <textarea id="answer" name="answer" rows="10" cols="80" required></textarea>
            <br><br>

            <button type="submit" class="button">답변 제출</button>
        </form>

        <% 
                    } else {
                        out.println("<p>Q&A를 찾을 수 없습니다.</p>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<p>잘못된 Q&A 번호입니다.</p>");
                }
            } else {
                out.println("<p>Q&A 번호가 없습니다.</p>");
            }
        %>
    </div>
</body>
</html>
