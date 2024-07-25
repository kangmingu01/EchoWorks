<%@page import="echoworks.util.Utility"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 비밀번호를 전달받아 MEMBER 테이블에 저장된 회원정보의 비밀번호와 비교하여 같은 경우 
MEMBER 테이블에 저장된 행의 권한을 변경하고 [/member/member_logout_action.jsp] 문서를 
요청할 수 있는 URL 주소로 응답하는 JSP 문서 - 세션에 저장된 회원정보를 사용 가능 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적으로 JSP 문서를 요청한 경우에 대한 응답 처리
	if(request.getMethod().equals("GET")) {//JSP 문서를 GET 방식으로 요청한 경우
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=error&work=error_400");
		return;
	}

	//전달값을 반환받아 저장
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	
	//로그인 사용자의 비밀번호와 전달받은 비밀번호를 비교하여 같지 않은 경우에 대한 응답 처리
	if(!loginMember.getMemberPasswd().equals(passwd)) {
		session.setAttribute("message", "입력하신 비밀번호가 맞지 않습니다. 비밀번호를 정확히 입력해 주세요.");
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=member&work=password_confirm&action=remove");
		return;		
	}
	
	MemberDTO member=new MemberDTO();
	member.setMemberNum(loginMember.getMemberNum());
	member.setMemberAuth(0);
	
	//회원정보(MemberDTO 객체)를 전달받아 MEMBER 테이블에 저장된 행의 회원권한을 변경하고 
	//변경행의 갯수를 반환하는 MemberDAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateAuth(member);
	
	//페이지 이동
	request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=member&work=member_logout_action");
%>