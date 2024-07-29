<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<%
    int productNo = 0;
    ProductDTO product = null;
    
    try {
        productNo = Integer.parseInt(request.getParameter("productNo"));
        product = ProductDAO.getDAO().selectProductByNo(productNo);
    } catch (NumberFormatException e) {
        // 에러 페이지로 리다이렉트 또는 에러 메시지 출력
        return;
    } catch (Exception e) {
        // 다른 예외 처리
        return;
    }
%>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
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
        form {
            display: inline;
        }
        .button {
            padding: 10px 20px;
            background-color: #2c3e50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            text-decoration: none;
        }
        .button:hover {
            background-color: #34495e;
        }
    </style>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 수정</title>
    
</head>
<body>
	<legend>
    <h2>상품 가격 수정</h2>
    <form action="<%=request.getContextPath() %>/admin/admin_product_modify_action.jsp" method="post">
        <input type="hidden" name="productNo" value="<%= product.getPRODUCT_NO() %>">
        <label for="productName">상품명:</label>
        <input type="text" id="productName" name="productName" value="<%= product.getPRODUCT_NAME() %>" readonly>
        <label for="productPrice">가격:</label>
        <input type="number" id="productPrice" name="productPrice" value="<%= product.getPRODUCT_PRICE() %>" required>
        <button type="submit">수정</button>
    </form>
    </legend>
</body>
</html>

  
