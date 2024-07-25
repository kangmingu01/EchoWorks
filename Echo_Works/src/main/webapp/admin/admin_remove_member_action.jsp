<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 비밀번호를 전달받아 MEMBER 테이블에 저장된 회원정보의 비밀번호와 비교하여 같은 경우 
MEMBER 테이블에 저장된 행의 권한을 변경하고 [/member/member_logout_action.jsp] 문서를 
요청할 수 있는 URL 주소로 응답하는 JSP 문서 - 세션에 저장된 회원정보를 사용 가능 --%>
<%@include file="/security/admin_check.jspf" %>

<%
    String memberNum = request.getParameter("memberNum");
    
    if (memberNum != null) {
        MemberDTO member = new MemberDTO();
        member.setMemberNum(Integer.parseInt(memberNum));
        member.setMemberAuth(0);
        
        // 회원정보(MemberDTO 객체)를 전달받아 MEMBER 테이블에 저장된 행의 회원권한을 변경하고 
        // 변경행의 갯수를 반환하는 MemberDAO 클래스의 메소드 호출
        MemberDAO.getDAO().updateAuth(member);
        
        // 페이지 이동
        request.setAttribute("returnUrl", request.getContextPath() + "/index.jsp?workgroup=admin&work=admin_adminpage");
    } else {
        // 회원번호가 없는 경우 에러 처리
        request.setAttribute("errorMsg", "회원 번호가 유효하지 않습니다.");
    }
%>

