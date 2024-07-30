<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%
    String memberNumStr = request.getParameter("memberNum");
    String returnUrl = request.getParameter("returnurl");

    if (memberNumStr != null && !memberNumStr.trim().isEmpty()) {
        try {
            // 문자열을 정수로 변환
            int memberNum = Integer.parseInt(memberNumStr);

            
            MemberDTO member = new MemberDTO();
            member.setMemberNum(memberNum);
            member.setMemberAuth(0); 

            // 회원 권한 업데이트
            int rowsAffected = MemberDAO.getDAO().updateAuth(member);

            // 성공적으로 처리된 경우 리다이렉트
            if (rowsAffected > 0) {
                response.sendRedirect(returnUrl != null ? returnUrl : request.getContextPath() + "/index.jsp?workgroup=admin&work=admin_member");
            } else {
                // 처리 실패 시 리다이렉트
                response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=admin&work=admin_member");
            }
        } catch (NumberFormatException e) {
            // 숫자 형식 오류 처리
            e.printStackTrace(); // 로그에 오류 출력
            response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=admin&work=admin_member");
        }
    } else {
        // 회원 번호가 유효하지 않은 경우 처리
        response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=admin&work=admin_member");
    }
%>
