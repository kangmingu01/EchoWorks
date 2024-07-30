<%@page import="java.sql.Date"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>답변 처리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
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
        <h4>답변 처리 완료</h4>

        <% 
            String qnaNoStr = request.getParameter("qnaNo");
            String answer = request.getParameter("qnaAnswer");

            if (qnaNoStr != null && !qnaNoStr.isEmpty() && answer != "") {
                int qnaNo = Integer.parseInt(qnaNoStr);
                
                QnaDTO qna = QnaDAO.getDAO().selectQnaByNo(qnaNo);
                if (qna != null) {
                    qna.setQnaAnswer(answer);
                    qna.setQnaStatus(1); 
                    QnaDAO.getDAO().updateQna(qna);
                    
                    out.println("<p>답변이 성공적으로 등록되었습니다.</p>");
                } else {
                    out.println("<p>Q&A를 찾을 수 없습니다.</p>");
                }
            } else {
                out.println("<p>잘못된 요청입니다.</p>");
            }
        %>

        <!-- 뒤로가기 버튼 -->
        <a href="<%=request.getContextPath() %>/admin/admin_qna.jsp" class="button back-button">뒤로가기</a>
    </div>
</body>
</html>
