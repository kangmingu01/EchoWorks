<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="echoworks.dto.CartDTO" %>
<%@ page import="echoworks.dao.CartDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="echoworks.dto.MemberDTO" %>

<%
    // 로그인된 사용자 정보 가져오기
    HttpSession currentSession = request.getSession();
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    if (loginMember == null) {
        out.println("<script>alert('로그인이 필요합니다.');location.href='index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    int memberId = loginMember.getMemberNum(); // 회원 번호 가져오기
    out.println("Debug: memberId = " + memberId); // 디버그 메시지 추가

    CartDAO cartDAO = new CartDAO();
    List<CartDTO> cartList = null;
    try {
        cartList = cartDAO.getCartList(memberId);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('장바구니를 불러오는 중 오류가 발생했습니다.');history.back();</script>");
        return;
    }

    // 총 상품 금액 계산
    int totalProductPrice = 0;
    int shippingCost = 2500; // 고정 배송비
    for (CartDTO cart : cartList) {
        int unitPrice = 1000; // 예시 가격 설정 (DB에서 상품 가격을 가져와야 함)
        totalProductPrice += unitPrice * cart.getCart_num();
    }
    int finalPrice = totalProductPrice + shippingCost;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니 테스트</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table th, table td {
            text-align: center;
        }
        body {
            background-color: #fff;
            font-size: 13pt;
            padding: 50px 0;
        }
        .price {
            font-size: 20pt;
            font-weight: bold;
        }
        .btn-custom {
            border: none;
            color: white;
            padding: 5px 10px;
            font-size: 13px;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn-default {
            background-color: #fff;
            border: solid 1px gray;
            color: black;
        }
        .btn-default:hover {
            background: #ddd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>장바구니</h2>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>상품번호</th>
                    <th>수량</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (CartDTO cart : cartList) {
                %>
                <tr>
                    <td><%= cart.getCart_psno() %></td>
                    <td><%= cart.getCart_num() %></td>
                    <td>
                        <form action="cart_action.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="cart_no" value="<%= cart.getCart_no() %>">
                            <input type="number" name="quantity" value="<%= cart.getCart_num() %>" min="1">
                            <button type="submit" class="btn btn-default">변경</button>
                        </form>
                        <form action="cart_action.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="cart_no" value="<%= cart.getCart_no() %>">
                            <button type="submit" class="btn btn-default">삭제</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <form action="cart_action.jsp" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="member" value="<%= loginMember.getMemberNum() %>"> <!-- 회원 번호 -->
            <div class="form-group">
                <label for="psno">상품번호:</label>
                <input type="number" class="form-control" id="psno" name="psno" required>
            </div>
            <div class="form-group">
                <label for="num">수량:</label>
                <input type="number" class="form-control" id="num" name="num" min="1" required>
            </div>
            <button type="submit" class="btn btn-default">추가</button>
        </form>
        <h3>총 금액</h3>
        <p>상품 금액: <%= totalProductPrice %>원</p>
        <p>배송비: <%= shippingCost %>원</p>
        <p>최종 금액: <%= finalPrice %>원</p>
    </div>
</body>
</html>
