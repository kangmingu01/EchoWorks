<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>
<%@include file="/security/admin_check.jspf" %>

<%
    String productName = request.getParameter("productName");
    String productImg = request.getParameter("productImg");
    String productImgDetail = request.getParameter("productImgDetail");
    int productPrice = Integer.parseInt(request.getParameter("productPrice"));
    String productCategoryMain = request.getParameter("productCategoryMain");
    String productCategorySub = request.getParameter("productCategorySub");
    String productVideoUrl = request.getParameter("productVideoUrl");

    try {
        ProductDTO product = new ProductDTO();
        product.setPRODUCT_NAME(productName);
        product.setPRODUCT_IMG(productImg);
        product.setPRODUCT_IMG_DETAIL(productImgDetail);
        product.setPRODUCT_PRICE(productPrice);
        product.setPRODUCT_CATEGORY_MAIN(productCategoryMain);
        product.setPRODUCT_CATEGORY_SUB(productCategorySub);
        product.setPRODUCT_VIDEO_URL(productVideoUrl);

        ProductDAO dao = ProductDAO.getDAO();
        dao.insertProduct(product);

        response.sendRedirect("admin_product.jsp"); // 상품 목록 페이지로 리디렉션
    } catch (Exception e) {
        e.printStackTrace();
        out.println("상품 추가 중 오류 발생: " + e.getMessage());
    }
%>
