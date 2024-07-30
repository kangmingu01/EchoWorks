<%@page import="echoworks.dao.ProductStockDAO"%>
<%@page import="echoworks.dto.ProductStockDTO"%>
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
        body {
            font-family: 'Noto Sans KR', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
            vertical-align: middle; /* 세로 정렬을 중앙으로 설정 */
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            max-width: 100px; /* 이미지의 최대 너비를 설정 */
            max-height: 100px; /* 이미지의 최대 높이를 설정 */
            width: auto; /* 너비를 자동으로 조정 */
            height: auto; /* 높이를 자동으로 조정 */
        }
        .hidden { display: none; }
        .edit-form {
            margin-top: 20px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #ffffff;
            background-color: #3498db;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">상품 목록</h1>
    <button class="button" onclick="window.location.href='<%=request.getContextPath() %>/index.jsp?workgroup=admin&work=admin_main'">뒤로가기</button>
    <button class="button" onclick="window.location.href='<%=request.getContextPath() %>/admin/admin_product_add.jsp'">상품 추가</button>
    <hr>
    <table>
        <thead>
            <tr>
                <th>상품번호</th>
                <th>상품명</th>
                <th>이미지</th>
                <th>상세이미지</th>
                <th>가격</th>
                <th>재고</th>
                <th>메인 카테고리</th>
                <th>서브 카테고리</th>
                <th>옵션</th>
                <th>비디오 URL</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <% if (productList.isEmpty()) { %>
                <tr>
                    <td colspan="11">상품이 없습니다.</td>
                </tr>
            <% } else { %>
                <% for (ProductDTO product : productList) {
                    List<ProductStockDTO> stockList = ProductStockDAO.getDAO().selectProductStockList(product.getPRODUCT_NO());
                    StringBuilder options = new StringBuilder();
                    int totalStock = 0;

                    for (ProductStockDTO stock : stockList) {
                        if (stock.getpS_pNo() == product.getPRODUCT_NO()) {
                            if (options.length() > 0) {
                                options.append("<br>"); // 줄바꿈을 추가하여 옵션을 구분
                            }
                            options.append(stock.getpS_Option()); // 옵션 추가
                            options.append(" - ");
                            options.append(stock.getpS_price()+"원");

                            totalStock += stock.getpS_Stock();
                        }
                    }

                    // 재고 및 옵션이 없을 경우 기본값 설정
                    if (stockList.isEmpty()) {
                        totalStock = 0;
                        options.append("옵션 없음");
                    }
                %>
                    <tr>
                        <td><%= product.getPRODUCT_NO() %></td>
                        <td><%= product.getPRODUCT_NAME() %></td>
                        <td><img src="<%= product.getPRODUCT_IMG() %>" alt="Product Image"></td>
                        <td><img src="<%= product.getPRODUCT_IMG_DETAIL() %>" alt="Product Detail Image"></td>
                        <td><%= product.getPRODUCT_PRICE() %>원</td>
                        <td><%= totalStock %>개</td>
                        <td><%= product.getPRODUCT_CATEGORY_MAIN() %></td>
                        <td><%= product.getPRODUCT_CATEGORY_SUB() %></td>
                        <td><%= options.toString() %></td>
                        <td><%= product.getPRODUCT_VIDEO_URL() %></td>
                        <td>
                            <a href="<%=request.getContextPath() %>/admin/admin_product_modify.jsp?productNo=<%= product.getPRODUCT_NO() %>">수정</a>
                        </td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>
</body>
</html>
