<%@page import="echoworks.dao.PaymentDAO"%>
<%@page import="echoworks.dto.PaymentDTO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문 내역 관리</title>
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
    </style>
    <script>
    function confirmCancel(memberId) {
        return confirm(memberId+'님의 주문을 취소하시겠습니까?');
    }
    </script>
</head>
<body>
    <div id="admin-payment" class="content-section">
        <h1 style="text-align: center;">주문 내역</h1>

        <!-- 뒤로가기 버튼 -->
        <a href="<%=request.getContextPath() %>/admin/admin_main.jsp" class="button back-button">뒤로가기</a>

        <table>
            <thead>
                <tr>
                    <th>결제번호</th>
                    <th>결제날짜</th>
                    <th>주문자아이디</th>
                    <th>상품</th>
                    <th>결제상태</th>
                    <th>결제총액</th>
                    <th>결제수량</th>
                    <th>배송지이름</th>
                    <th>주문자전화번호</th>
                    <th>배송지주소</th>
                    <th>배송 메시지</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<PaymentDTO> paymentList = PaymentDAO.getDAO().selectAllPayments();
                    
                    if (paymentList.isEmpty()) { 
                %>
                    <tr>
                        <td colspan="12">결제 내역이 없습니다.</td>
                    </tr>
                <% 
                    } else { 
                        for (PaymentDTO payment : paymentList) { 
                            int memberNum = payment.getPaymentHno();
                            MemberDTO member = MemberDAO.getDAO().selectMemberByNum(memberNum);
                            ProductDTO product = ProductDAO.getDAO().selectProductByNo(payment.getPaymentPsno());
                %>
                    <tr>
                        <td><%= payment.getPaymentNo() %></td>
                        <td><%= payment.getPaymentDate() %></td>
                        <td><%= member.getMemberId() %></td>
                        <td><%= product.getPRODUCT_NAME() %></td>
                        <% if(payment.getPaymentStatus() == 0) { %>
                                    <td>결제취소</td>
                                    <% } else if(payment.getPaymentStatus() == 1) { %>
                                    <td>결제완료</td>
                                   <% } else if(payment.getPaymentStatus() == 2) { %>
                                    <td>배송중</td>
                                    <% } else if(payment.getPaymentStatus() == 3) { %>
                                    <td>배송완료</td>
                                    <%} %>
                        <td><%= payment.getPaymentTotal() %></td>
                        <td><%= payment.getPaymentNum() %></td>
                        <td><%= payment.getPaymentJname() %></td>
                        <td><%= payment.getPaymentPhone() %></td>
                        <td><%= payment.getPaymentAddress1() %> <%= payment.getPaymentAddress2() %></td>
                        <td><%= payment.getPaymentOmesg() %></td>
                        <td>
                            <form action="<%=request.getContextPath() %>/admin/admin_adminpage_payment_cancel_action.jsp" method="post" onsubmit="return confirmCancel('<%= member.getMemberId() %>');">
                                <input type="hidden" name="paymentNo" value="<%= payment.getPaymentNo() %>" />
                                <button type="submit" class="button">결제취소</button>
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
