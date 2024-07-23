<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="echoworks.dao.CartDAO" %>
<%@ page import="echoworks.dto.CartDTO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="echoworks.dto.MemberDTO" %>

<%
    // 로그인된 사용자 정보 가져오기
    HttpSession currentSession = request.getSession();
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    if (loginMember == null) {
        out.println("<script>alert('로그인이 필요합니다.');location.href='index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    int memberId = loginMember.getMemberNum(); // 회원 번호 가져오기
    out.println("Debug: memberId = " + memberId); // 디버그 메시지 추가

    // 파라미터 처리
    String action = request.getParameter("action");
    CartDAO dao = new CartDAO();

    if (action != null) {
        try {
            if (action.equals("add")) {
                int psno = Integer.parseInt(request.getParameter("psno"));
                int num = Integer.parseInt(request.getParameter("num"));

                CartDTO cart = new CartDTO();
                cart.setCart_psno(psno);
                cart.setCart_member(memberId);
                cart.setCart_num(num);

                dao.addCart(cart);
                response.sendRedirect("cart_test.jsp");

            } else if (action.equals("update")) {
                int cartNo = Integer.parseInt(request.getParameter("cart_no"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                dao.updateCart(cartNo, quantity);
                response.sendRedirect("cart_test.jsp");

            } else if (action.equals("delete")) {
                int cartNo = Integer.parseInt(request.getParameter("cart_no"));

                dao.deleteCart(cartNo);
                response.sendRedirect("cart_test.jsp");

            } else if (action.equals("clear")) {
                dao.clearCart(memberId);
                response.sendRedirect("cart_test.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('DB Error!');history.back();</script>");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            out.println("<script>alert('Invalid Input!');history.back();</script>");
        }
    } else {
        out.println("<script>alert('Invalid Action!');history.back();</script>");
    }
%>
