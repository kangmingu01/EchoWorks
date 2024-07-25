<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="echoworks.dao.CartDAO" %>
<%@ page import="echoworks.dto.CartDTO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="echoworks.dto.MemberDTO" %>

<%
    // 로그인된 사용자 정보 가져오기
    HttpSession currentSession = request.getSession(); // 변수명을 currentSession으로 변경
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    if (loginMember == null) {
        out.println("<script>alert('로그인이 필요합니다.');location.href='" + request.getContextPath() + "/index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    // 파라미터 처리
    String action = request.getParameter("action");
    CartDAO dao = CartDAO.getDao();
    String returnUrl = request.getParameter("returnUrl");

    if (action != null) {
        try {
            if (action.equals("add")) {
                int psno = Integer.parseInt(request.getParameter("psno"));
                int num = Integer.parseInt(request.getParameter("num"));
                int member = loginMember.getMemberNum(); // 세션에서 가져옴

                CartDTO cart = new CartDTO();
                cart.setCart_psno(psno);
                cart.setCart_member(member);
                cart.setCart_num(num);

                dao.addCart(cart);
                response.sendRedirect(returnUrl);

            } else if (action.equals("update")) {
                int cartNo = Integer.parseInt(request.getParameter("cart_no"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                dao.updateCart(cartNo, quantity);
                response.sendRedirect(returnUrl);

            } else if (action.equals("delete")) {
                // 여러 개의 cart_no 값을 배열로 받아옴
                String[] cartNos = request.getParameterValues("cart_no");

                if (cartNos != null) {
                    for (String cartNo : cartNos) {
                        int cartNoInt = Integer.parseInt(cartNo);
                        dao.deleteCart(cartNoInt);
                    }
                }

                response.sendRedirect(returnUrl);

            } else if (action.equals("clear")) {
                int memberId = loginMember.getMemberNum(); // 세션에서 가져옴

                dao.clearCart(memberId);
                response.sendRedirect(returnUrl);

            } else if (action.equals("checkout")) {
                // 선택된 상품 주문 처리 로직 추가
                String[] selectedCartNos = request.getParameterValues("cart_no");
                if (selectedCartNos != null) {
                    String query = "?";
                    for (String cartNo : selectedCartNos) {
                        query += "cart_no=" + cartNo + "&";
                    }
                    response.sendRedirect(request.getContextPath() + "/payment/payment.jsp" + query);
                } else {
                    out.println("<script>alert('선택된 상품이 없습니다.');history.back();</script>");
                }
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
