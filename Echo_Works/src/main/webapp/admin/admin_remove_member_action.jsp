<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%
    String memberNumStr = request.getParameter("memberNum");
    String returnUrl = request.getParameter("returnurl");

  
            // 문자열을 정수로 변환
            int memberNum = Integer.parseInt(memberNumStr);

            
            MemberDTO member = new MemberDTO();
            member.setMemberNum(memberNum);
            member.setMemberAuth(0); 

            // 회원 권한 업데이트
            int rowsAffected = MemberDAO.getDAO().updateAuth(member);

            // 성공적으로 처리된 경우 리다이렉트
             response.sendRedirect(request.getContextPath() + "/admin/admin_member.jsp");

%>
