<%@page import="echoworks.dao.ProductStockDAO"%>
<%@page import="echoworks.dto.ProductStockDTO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<%
    request.setCharacterEncoding("utf-8");

    String productName = request.getParameter("productName");
    String productImg = request.getParameter("productImg");
    String productImgDetail = request.getParameter("productImgDetail");
    int productPrice = Integer.parseInt(request.getParameter("productPrice"));
    String productCategoryMain = request.getParameter("productCategoryMain");
    String productCategorySub = request.getParameter("productCategorySub");
    String productVideoUrl = request.getParameter("productVideoUrl");

    // 옵션과 재고 정보
    String[] options = request.getParameterValues("pS_Option");
    String[] stocks = request.getParameterValues("pS_Stock");
    String[] prices = request.getParameterValues("pS_price");

    try {
        ProductDAO productDAO = ProductDAO.getDAO();
        ProductStockDAO stockDAO = ProductStockDAO.getDAO();
        
        // 1. 상품 정보 삽입
        ProductDTO product = new ProductDTO();
        product.setPRODUCT_NAME(productName);
        product.setPRODUCT_IMG(productImg);
        product.setPRODUCT_IMG_DETAIL(productImgDetail);
        product.setPRODUCT_PRICE(productPrice);
        product.setPRODUCT_CATEGORY_MAIN(productCategoryMain);
        product.setPRODUCT_CATEGORY_SUB(productCategorySub);
        product.setPRODUCT_VIDEO_URL(productVideoUrl);

        int productId = productDAO.insertProduct(product); // 상품 삽입 후 ID 반환

        // 2. 옵션 및 재고 정보 삽입
        if (options != null && options.length > 0) {
            for (int i = 0; i < options.length; i++) {
                ProductStockDTO stock = new ProductStockDTO();
                stock.setpS_pNo(productId); // 새로 생성된 상품 ID 사용
                stock.setpS_Option(options[i]);
                stock.setpS_Stock(Integer.parseInt(stocks[i]));
                stock.setpS_price(Integer.parseInt(prices[i]));
                stockDAO.insertProductStock(stock); // 옵션과 재고 정보 삽입
            }
        }

        response.sendRedirect("admin_product.jsp"); // 리디렉션
    } catch (Exception e) {
        e.printStackTrace();
        out.println("상품 추가 중 오류 발생: " + e.getMessage());
    }
%>
