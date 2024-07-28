<%@page import="java.util.List"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<%
    // 모든 상품정보 불러오기
    List<ProductDTO> productList = ProductDAO.getDAO().selectProductAll();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 관리</title>
    <style>
        /* 스타일 코드 생략 */
        .hidden { display: none; }
    </style>
    <script>
        function showEditForm(productNo) {
            document.querySelectorAll('.edit-form').forEach(form => form.classList.add('hidden'));
            document.getElementById('edit-form-' + productNo).classList.remove('hidden');
        }
    </script>
</head>
<body>
    <h2>상품 목록</h2>
    <table>
        <thead>
            <tr>
                <th>상품번호</th>
                <th>상품명</th>
                <th>이미지</th>
                <th>상세이미지</th>
                <th>가격</th>
                <th>대분류</th>
                <th>소분류</th>
                <th>비디오 URL</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <% if (productList.isEmpty()) { %>
                <tr>
                    <td colspan="9">상품이 없습니다.</td>
                </tr>
            <% } else { %>
                <% for (ProductDTO product : productList) { %>
                    <tr>
                        <td><%= product.getPRODUCT_NO() %></td>
                        <td><%= product.getPRODUCT_NAME() %></td>
                        <td><img src="<%= product.getPRODUCT_IMG() %>" alt="Product Image" style="width:50px;height:50px;"></td>
                        <td><img src="<%= product.getPRODUCT_IMG_DETAIL() %>" alt="Product Detail Image" style="width:50px;height:50px;"></td>
                        <td><%= product.getPRODUCT_PRICE() %></td>
                        <td><%= product.getPRODUCT_CATEGORY_MAIN() %></td>
                        <td><%= product.getPRODUCT_CATEGORY_SUB() %></td>
                        <td><%= product.getPRODUCT_VIDEO_URL() %></td>
                        <td>
                            <a href="javascript:void(0);" onclick="showEditForm(<%= product.getPRODUCT_NO() %>)">수정</a>
                            <a href="admin_delete_product.jsp?productNo=<%= product.getPRODUCT_NO() %>" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                    <tr class="hidden edit-form" id="edit-form-<%= product.getPRODUCT_NO() %>">
                        <td colspan="9">
                            <form action="admin_update_product.jsp" method="post">
                                <input type="hidden" name="productNo" value="<%= product.getPRODUCT_NO() %>">
                                <label>상품명: <input type="text" name="productName" value="<%= product.getPRODUCT_NAME() %>" required></label><br>
                                <label>이미지 URL: <input type="text" name="productImg" value="<%= product.getPRODUCT_IMG() %>" required></label><br>
                                <label>상세이미지 URL: <input type="text" name="productImgDetail" value="<%= product.getPRODUCT_IMG_DETAIL() %>" required></label><br>
                                <label>가격: <input type="number" name="productPrice" value="<%= product.getPRODUCT_PRICE() %>" required></label><br>
                                <label>대분류: <input type="text" name="productCategoryMain" value="<%= product.getPRODUCT_CATEGORY_MAIN() %>" required></label><br>
                                <label>소분류: <input type="text" name="productCategorySub" value="<%= product.getPRODUCT_CATEGORY_SUB() %>" required></label><br>
                                <label>비디오 URL: <input type="text" name="productVideoUrl" value="<%= product.getPRODUCT_VIDEO_URL() %>"></label><br>
                                <button type="submit">수정</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>

    <h3>상품 추가</h3>
    <form action="admin_add_product.jsp" method="post">
        <label>상품명: <input type="text" name="productName" required></label><br>
        <label>이미지 URL: <input type="text" name="productImg" required></label><br>
        <label>상세이미지 URL: <input type="text" name="productImgDetail" required></label><
