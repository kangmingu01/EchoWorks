<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<%
    int productNo = 0;
    int productPrice = 0;
    String message = "";

    try {
        // 폼 데이터에서 상품 번호와 새로운 가격 가져오기
        productNo = Integer.parseInt(request.getParameter("productNo"));
        productPrice = Integer.parseInt(request.getParameter("productPrice"));

        // ProductDTO 객체 생성 및 값 설정
        ProductDTO product = new ProductDTO();
        product.setPRODUCT_NO(productNo);
        product.setPRODUCT_PRICE(productPrice);

        // DAO를 통해 상품 가격 업데이트
        ProductDAO productDAO = ProductDAO.getDAO();
        int result = productDAO.updateProduct(product);

        // 결과에 따라 메시지 설정
        if (result > 0) {
            message = "상품 가격이 성공적으로 수정되었습니다.";
        } else {
            message = "상품 가격 수정에 실패하였습니다.";
        }
    } catch (NumberFormatException e) {
        message = "잘못된 입력입니다.";
    } catch (Exception e) {
        message = "오류가 발생하였습니다: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 가격 수정 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message-box {
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }
        .message {
            font-size: 1.2em;
            margin-bottom: 20px;
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
</head>
<body>
    <div class="message-box">
        <div class="message"><%= message %></div>
        <a href="<%= request.getContextPath() %>/index.jsp?workgroup=admin&work=admin_adminpage#admin_product" class="button">돌아가기</a>
    </div>
</body>
</html>
