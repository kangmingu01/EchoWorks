<%@page import="java.util.ArrayList"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="echoworks.dao.CartDAO"%>
<%@page import="echoworks.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	String state = request.getParameter("state");
	String cartArr = request.getParameter("cartArr");
	String[] cartSplit1 = cartArr.split(",");
	List<CartDTO> cartList = new ArrayList<CartDTO>();
	
	for(int i = 0; i < cartSplit1.length;i++) {
		String[] cartSplit2 = cartSplit1[i].split(" ");
		if(!cartSplit2[1].equals("undefined")) {
			CartDTO cartDto = new CartDTO(Integer.parseInt(cartSplit2[0]), loginMember.getMemberNum(), Integer.parseInt(cartSplit2[1]));  
			cartList.add(cartDto);
		} 
	}
	
	if(state == "cart") {
		for(int i=0;i<cartList.size();i++) {
			CartDAO.getDao().addCart(cartList.get(i));
		}
	} else {
		session.setAttribute("cartList", cartList);
		System.out.println("카드 " + session.getAttribute("cartList"));
	}
	
	
	/*
	int rows=AjaxCommentDAO.getDAO().updateAjaxComment(ajaxComment);
	*/
%>
<% if(true) {//변경행이 있는 경우 %>
{"code":"success"}
<% } else {//변경행이 없는 경우 %>
{"code":"error"}
<% } %>
