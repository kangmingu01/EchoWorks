<?xml version="1.0" encoding="utf-8"?>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	request.setCharacterEncoding("utf-8");	
	String keyword=request.getParameter("insearch");
	List<ProductDTO> productList=ProductDAO.getDAO().selectSearchList(keyword);	
%>
<result>
	<% if(!productList.isEmpty()) { %>
	<code>success</code>
	<data><![CDATA[
		[
		<% for(int i=0;i<productList.size();i++) { %>
			<% if(i > 0) {%>,<% } %>
			{"pname":"<%=productList.get(i).getPRODUCT_NAME()%>"}
		<% } %>
		]	
	]]></data>
	<% } else {%>
	<code>empty</code>
	<% } %>
</result>
	