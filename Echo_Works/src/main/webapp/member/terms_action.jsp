<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 이용약관 및 개인정보 수집 및 이용 동의 여부 확인
    boolean agreeTerms = request.getParameter("agreeTerms") != null;
    boolean agreePrivacy = request.getParameter("agreePrivacy") != null;

    if (agreeTerms && agreePrivacy) {
        // 동의했을 경우 회원가입 페이지로 이동
        response.sendRedirect(request.getContextPath() + "/member/member_join.jsp");
    } else {
        // 동의하지 않았을 경우 에러 메시지와 함께 다시 terms.jsp로 이동
        request.setAttribute("errorMessage", "이용약관 및 개인정보 처리방침에 동의하셔야 가입이 가능합니다.");
        request.getRequestDispatcher("/member/terms.jsp").forward(request, response);
    }
%>
