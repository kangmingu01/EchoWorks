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
        <a href="<%=request.getContextPath() %>/admin/admin_product.jsp" class="button back-button">뒤로가기</a>
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
            
             <label for="productStock">재고:
                <input type="number" id="productStock" name="pS_Stock" >
            </label>
            
            <label for="stockOption">옵션:
                <input type="text" id="stockOption" name="pS_Option" required>
            </label>
            
             <label for="stockOptionPrice">옵션 가격:
                <input type="number" id="stockOptionPrice" name="pS_price" required>
            </label>
            
            
            <label for="productCategoryMain">메인 카테고리:
                	            <select name="productCategoryMain" id="mainCategory" onchange="updateSubCategory()">
			                <option value="Keyboards">Keyboards</option>
			                <option value="Switches">Switches</option>
			                <option value="Keycaps">Keycaps</option>
			                <option value="Deskpads">Deskpads</option>
			            </select>
            </label>
            
            <label for="productCategorySub">서브 카테고리:
                <select name="productCategorySub" id="subCategory">
			            	<!-- 서브카테고리는 아래 자바스크립에 -->
			            </select>
            </label>
            
            <label for="productVideoUrl">비디오 URL:
                <input type="text" id="productVideoUrl" name="productVideoUrl">
            </label>
            
            <button type="submit">상품 추가</button>
        </form>
    </div>
   <script>
    function updateSubCategory() {
        const mainCategory = document.getElementById("mainCategory").value;
        const subCategory = document.getElementById("subCategory");
        
        const subCategoryOptions = {
            "Keyboards": ["In-Stock", "Group-Buy"],
            "Switches": ["Linear", "Tactile", "Low", "Magnet"],
            "Keycaps": ["SW", "FBB", "GMK", "HAMMERWORKS"],
            "Deskpads": [] // 빈 배열로 처리
        };

        // 서브 카테고리 옵션을 초기화
        subCategory.innerHTML = "";

        // 새로운 옵션 추가
        subCategoryOptions[mainCategory].forEach(function(option) {
            const newOption = document.createElement("option");
            newOption.value = option;
            newOption.textContent = option;
            subCategory.appendChild(newOption);
        });
    }

    // 페이지 로드 시 기본 메인 카테고리에 따른 서브 카테고리 옵션 설정
    document.addEventListener("DOMContentLoaded", function() {
        updateSubCategory();
    });
</script>
</body>
</html>
