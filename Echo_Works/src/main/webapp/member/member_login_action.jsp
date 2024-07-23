<%@page import="echoworks.util.Utility"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 인증정보를 전달받아 MEMBER 테이블에 저장된 회원정보와 비교하여 로그인 처리하고  
[/member/main_page.jsp] 문서를 요청할 수 있는 URL 주소로 응답하는 JSP 문서 --%>
<%-- => 로그인 처리 : 인증 성공시 권한 관련 정보를 저장하는 명령 --%>
<%-- => 인증정보외에 URL 주소를 전달받은 경우 [/member/main_page.jsp] 문서 대신 전달받은 
URL 주소로 응답 처리 --%>
<%-- => 인증 실패시 [/member/main_login.jsp] 문서를 요청할 수 있는 URL 주소로 응답 처리 --%>
<%
	//비정상적으로 JSP 문서를 요청한 경우에 대한 응답 처리
	if(request.getMethod().equals("GET")) {//JSP 문서를 GET 방식으로 요청한 경우
		//request 내장객체의 속성값으로 에러메세지를 출력하는 페이지의 URL 주소를 저장하여 요청  
		//JSP 문서(index.jsp)에게 제공 - 요청 JSP 문서(index.jsp)에서 리다이렉트 이동 처리
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=error&work=error_400");
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=error&work=error_400");
		return;
	}
	
	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	String url=request.getParameter("url");
	if(url == null) {
		url="";
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 하나의 행을 검색하여 검색된 회원정보를 반환하는
	//MemberDAO 클래스의 메소드 호출
	MemberDTO member=MemberDAO.getDAO().selectMemberById(id);
	
	//검색된 회원정보가 없거나 검색된 회원정보의 비밀번호가 전달받은 비밀번호와 같지 않거나
	//검색된 회원정보이 탈퇴회원인 경우 인증 실패 처리 
	if(member == null || !member.getMemberPasswd().equals(passwd)
		|| member.getMemberAuth() == 0) {
		session.setAttribute("message", "아이디 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.");
		session.setAttribute("id", id);
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=member&work=member_login");
		return;
	}

	//인증 성공 - 권한 관련 정보가 저장된 객체를 session 내장객체의 속성값으로 저장
	// => session 내장객체에 로그인 사용자의 정보(MemberDTO 객체)를 속성값으로 저장
	//session.setAttribute("loginMemberNum", member.getMemberNum());
	session.setAttribute("loginMember", member);
	
	//회원번호를 전달받아 MEMBER 테이블에 저장된 행에서 마지막 로그인 날짜를 현재 날짜와 시간으로 
	//변경하고 변경행의 갯수(int)를 반환하는 MemberDAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateLastLogin(member.getMemberNum());

	//페이지 이동 처리
	if(url.equals("")) {//전달받은 URL 주소가 없는 경우 - 메인 페이지로 이동
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=main&work=main_page");
	} else {//전달받은 URL 주소가 있는 경우 - URL 주소의 페이지로 이동
		request.setAttribute("returnUrl", url);
	}
%>
