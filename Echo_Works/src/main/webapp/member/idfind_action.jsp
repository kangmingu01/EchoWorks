<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="echoworks.dao.MemberDAO" %>
<%@ page import="echoworks.dto.MemberDTO" %>

<%
    // 전달받은 이름과 이메일을 변수에 저장
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    // MemberDAO 객체 생성 및 초기화
    MemberDAO memberDAO = MemberDAO.getDAO();
    
    // 이름과 이메일을 사용하여 회원 정보 조회
    MemberDTO member = memberDAO.findMemberByNameAndEmail(name, email);

    if (member != null) {
        // 일치하는 회원 정보가 있을 경우 회원 아이디 출력
%>
    <p><%= name %> 님의 아이디는 <%= member.getMemberId() %> 입니다.</p>
<%
    } else {
        // 일치하는 회원 정보가 없을 경우 메시지 출력
%>
    <p>일치하는 회원 정보를 찾을 수 없습니다.</p>
<%
    }
%>
