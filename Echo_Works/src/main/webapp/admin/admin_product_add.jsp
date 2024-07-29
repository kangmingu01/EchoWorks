<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="echoworks.dao.ProductStockDAO"%>
<%@page import="echoworks.dto.ProductStockDTO"%>
<%@include file="/security/admin_check.jspf" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 추가</title>
    <style>
        body {
            font-family: 'Noto Sans KR', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="number"] {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            color: #ffffff;
            background-color: #3498db;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>상품 추가</h1>
        <form action="admin_product_add_action.jsp" method="post">
            <label for="productName">상품명:
                <input type="text" id="productName" name="productName" >
            </label>
            <label for="productImg">이미지:
                <input type="file" id="productImg" name="productImg" >
            </label>
            <label for="productImgDetail">상세이미지:
                <input type="file" id="productImgDetail" name="productImgDetail" >
            </label>
            <label for="productPrice">가격:
                <input type="number" id="productPrice" name="productPrice" required>
            </label>
            <label for="productCategoryMain">메인 카테고리:
                <input type="text" id="productCategoryMain" name="productCategoryMain" required>
            </label>
            <label for="productCategorySub">서브 카테고리:
                <input type="text" id="productCategorySub" name="productCategorySub" required>
            </label>
            <label for="productVideoUrl">비디오 URL:
                <input type="text" id="productVideoUrl" name="productVideoUrl">
            </label>
            <button type="submit">상품 추가</button>
        </form>
    </div>
</body>
</html>
