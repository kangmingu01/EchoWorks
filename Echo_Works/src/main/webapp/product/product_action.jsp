<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String encoder=request.getParameter("insearch");
String keyword=URLEncoder.encode(encoder, "utf-8");
request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=product&work=product&insearch="+keyword);
%>