<%@page import="echoworks.dao.CartDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

List<CartDTO> cartList = null;
int cnt = 0;
if(loginMember != null){
	 cartList = CartDAO.getDao().getCartList(loginMember.getMemberNum());
	 cnt = cartList.size();
}

%>
{"code":"success",
"count":<%=cnt %>}