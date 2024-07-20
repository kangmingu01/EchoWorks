<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리 후 [/main/main_page.jsp] 문서를 요청할 수 있는 URL 주소로 응답하는 JSP 문서 --%>
<%-- => 로그아웃 처리 : 세션에 저장된 권한 관련 속성값 삭제 --%>
<%
	//session.removeAttribute("loginMember");
	session.invalidate();

	request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=main&work=main_page");
%>
