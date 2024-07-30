<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="echoworks.dao.MemberDAO" %>
<%@ page import="echoworks.dto.MemberDTO" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    MemberDAO memberDAO = MemberDAO.getDAO();
    MemberDTO member = memberDAO.findMemberByNameAndEmail(name, email);

    if (member != null) {
%>
    <p><%= name %> 님의 아이디는 <%= member.getMemberId() %> 입니다.</p>
<%
    } else {
%>
    <p>일치하는 회원 정보를 찾을 수 없습니다.</p>
<%
    }
%>