<%@page import="echoworks.util.Utility"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블의 행으로 삽입하고 [/member/member_login.jsp] 문서를 
요청할 수 있는 URL 주소로 응답하는 JSP 문서 --%>    
<%
	//비정상적으로 JSP 문서를 요청한 경우에 대한 응답 처리
	if(request.getMethod().equals("GET")) {//JSP 문서를 GET 방식으로 요청한 경우
		//에러 메세지를 출력하는 페이지(/error/error_400.jsp)를 요청할 수 있는 URL 주소를 전달하여 응답
		// => URL 주소를 클라이언트에게 전달하여 응답하지 않고 요청 JSP 문서(index.jsp)에게
		//전달하여 응답하므로 페이지 이동 불가능
		//response.sendRedirect(request.getContextPath()+"/error/error_400.jsp");
		//return;
		
		//request 내장객체의 속성값으로 에러메세지를 출력하는 페이지의 URL 주소를 저장하여 
		//요청 JSP 문서(index.jsp)에게 제공
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=error&work=error_400");
		return;
	}

	//POST 방식으로 JSP 문서를 요청해 전달된 값을 제공받기 위한 문자형태 변경
	// => 요청 JSP 문서(index.jsp)에서 전달값에 대한 문자형태 변경
	//request.setCharacterEncoding("utf-8");
	
	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	//전달받은 비밀번호를 암호화 처리한 후 변수에 저장
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile1")+"-"+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2=request.getParameter("address2");

	//MemberDTO 객체를 생성하여 전달값으로 필드값 변경
	MemberDTO member=new MemberDTO();
	member.setMemberId(id);
	member.setMemberPasswd(passwd);
	member.setMemberName(name);
	member.setMemberEmail(email);
	member.setMemberMobile(mobile);
	member.setMemberZipcode(zipcode);
	member.setMemberAddress1(address1);
	member.setMemberAddress2(address2);
	
	//회원정보(MemberDTO 객체)를 전달받아 MEMBER 테이블의 행으로 삽입하고 삽입행의 갯수를 
	//반환하는 MemberDAO 클래스의 메소드 호출
	MemberDAO.getDAO().insertMember(member);
	
	//request 내장객체의 속성값으로 URL 주소를 저장하여 요청 JSP 문서(index.jsp)에게 제공
	// => 요청 JSP 문서(index.jsp)에서 URL 주소를 반환받아 리다이렉트 이동 
	request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=member&work=member_login");
%>
