<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@ page import="echoworks.dto.PaymentDTO" %>
<%@ page import="echoworks.dao.PaymentDAO" %>
<%@ page import="echoworks.dto.MemberDTO" %>
<%@ page import="echoworks.dao.ProductStockDAO" %>
<%@ page import="echoworks.dto.ProductStockDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MemberDTO memberId = (MemberDTO) session.getAttribute("loginMember");
    if (memberId == null) {
        response.sendRedirect("member_login.jsp");
        return;
    }
 
    MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
    List<PaymentDTO> paymentList = PaymentDAO.getDAO().selectPaymentByMemberNo(loginMember.getMemberNum());
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
    
    }
</style>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제 내역</title>
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
            <div id="payment-history" class="content-section">
                <h2>결제 내역</h2>
                <table>
                    <thead>
                        <tr>
                            <th>결제 번호</th>
                            <th style="text-align: center;">결제 날짜</th>
                            <th style="text-align: center;">상품</th>
                            <th>결제 총액</th>
                            <th>결제 수량</th>
                            <th>배송지 이름</th>
                            <th>주문자 전화번호</th>
                            <th style="text-align: center;" >배송지 주소</th>
                            <th style="text-align: center;">배송 메시지</th>
                            <th>결제 상태</th>
                            <th style="text-align: center;">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (paymentList.isEmpty()) { %>
                            <tr>
                                <td colspan="10">결제 내역이 없습니다.</td>
                            </tr>
                        <% } else { %>
                            <% for (PaymentDTO payment : paymentList) { %>
                                <tr>
                                    <td><%= payment.getPaymentNo() %></td>
                                    <td><%= payment.getPaymentDate() %></td>
                                      <%   ProductStockDTO stock = ProductStockDAO.getDAO().selectProductStock(payment.getPaymentPsno());%>
                     			   <% ProductDTO product = ProductDAO.getDAO().selectProductByNo(stock.getpS_pNo()); %>
                                    <td><%= product.getPRODUCT_NAME()%></td>
                                    <%
                                        int total = stock.getpS_price();
                                        int total2 = payment.getPaymentNum();
                                        int total3 = total * total2;
                                    %>
                                    <td><%= total3 %></td>
                                    <td><%= payment.getPaymentNum() %></td>
                                    <td><%= payment.getPaymentJname() %></td>
                                    <td><%= payment.getPaymentPhone() %></td>
                                    <td><%= payment.getPaymentAddress1() %> <%= payment.getPaymentAddress2() %></td>
                                    <td><%= payment.getPaymentOmesg() %></td>
                                    <td>
                                        <% if (payment.getPaymentStatus() == 0) { %>
                                            결제취소
                                        <% } else if (payment.getPaymentStatus() == 1) { %>
                                            결제완료
                                        <% } else if (payment.getPaymentStatus() == 2) { %>
                                            배송중
                                        <% } else if (payment.getPaymentStatus() == 3) { %>
                                            배송완료
                                        <% } %>
                                    </td>
                                    <td>
                                        <form action="<%=request.getContextPath() %>/member/member_mypage_payment_cancel_action.jsp" method="post">
                                            <button type="submit" name="paymentNo" value="<%= payment.getPaymentNo() %>">결제취소</button>
                                        </form>
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
