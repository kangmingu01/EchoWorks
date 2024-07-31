<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<%@page import="echoworks.util.Utility"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A 관리</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tbody tr:hover {
            background-color: #f1f1f1;
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
        .delete-button {
            background-color: #f44336;
        }
        .delete-button:hover {
            background-color: #c62828;
        }
    </style>
</head>
<body>
    <div id="admin-qna" class="content-section">
        <h1 style="text-align: center;">Q&A 내역</h1>

        <!-- 뒤로가기 버튼 -->
        <a href="<%=request.getContextPath() %>/admin/admin_main.jsp" class="button back-button">뒤로가기</a>

        <table>
            <thead>
                <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>상품</th>
                    <th>내용</th>
                    <th>작성자아이디</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>답변유무</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <% 
                	List<ProductDTO> productList = ProductDAO.getDAO().selectProductAll();
                    List<QnaDTO> qnaList = QnaDAO.getDAO().selectAllQnAList();

                    if (qnaList.isEmpty()) { 
                %>
                    <tr>
                        <td colspan="8">문의 내역이 없습니다.</td>
                    </tr>
                <% 
                    } else { 
                        for (QnaDTO qna : qnaList) { 
                            int memberNum = qna.getQnaMemberNo();
                            MemberDTO member = MemberDAO.getDAO().selectMemberByNum(memberNum);
                            int productNo = qna.getQnaProductNo();
                            ProductDTO product = ProductDAO.getDAO().selectProductByNo(productNo);
                %>
                    <tr>
                        <td><%= qna.getQnaNo() %></td>
                        <td><%= qna.getQnaTitle() %></td>
                        <td><%= product.getPRODUCT_NAME()%></td>
                        <td><%= qna.getQnaContent() %></td>
                        <td><%= member.getMemberId() %></td>
                        <td><%= member.getMemberName() %></td>
                        <td><%= qna.getQnaDate() %></td>
                        <td>
                            <% 
                                if (qna.getQnaStatus() == 0) { %>
                                    삭제된 글
                                <% } else if (qna.getQnaAnswer() == null && qna.getQnaStatus() == 1) { %>
                                    답변 대기 중(일반글)
                                <% } else if (qna.getQnaAnswer() != null && qna.getQnaStatus() == 1) { %>
                                    답변완료(일반글)
                                <% } else if (qna.getQnaAnswer() == null && qna.getQnaStatus() == 2) { %>
                                    답변 대기 중(비밀글)
                                <% } else if (qna.getQnaAnswer() != null && qna.getQnaStatus() == 2) { %>
                                    답변 완료(비밀글)
                            <% } %>
                        </td>
                        <td>
                       	<a href="<%=request.getContextPath() %>/admin/admin_qna_reply.jsp?qnaNo=<%= qna.getQnaNo() %>" class="button">답변</a>
                            
                            <form action="<%=request.getContextPath() %>/admin/admin_qna_remove_action.jsp" method="post" style="display:inline;" onsubmit="return confirm('정말로 이 Q&A를 삭제하시겠습니까?');">
                                <input type="hidden" name="qnaNo" value="<%= qna.getQnaNo() %>" />
                                <button type="submit" class="button delete-button">삭제</button>
                            </form>
                        </td>
                    </tr>
                <% 
                        } 
                    } 
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
