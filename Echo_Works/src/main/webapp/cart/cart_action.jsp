<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="echoworks.dao.CartDAO" %>
<%@ page import="echoworks.dto.CartDTO" %>

<%
    // 파라미터 처리
    String action = request.getParameter("action");
    CartDAO dao = new CartDAO();

    if (action != null) {
        try {
            if (action.equals("add")) {
                int psno = Integer.parseInt(request.getParameter("psno"));
                int member = Integer.parseInt(request.getParameter("member"));
                int num = Integer.parseInt(request.getParameter("num"));
                
                CartDTO cart = new CartDTO();
                cart.setCart_psno(psno);
                cart.setCart_member(member);
                cart.setCart_num(num);

                dao.addCart(cart);
                response.sendRedirect("cart.jsp");

            } else if (action.equals("update")) {
                int cartNo = Integer.parseInt(request.getParameter("cart_no"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                dao.updateCart(cartNo, quantity);
                response.sendRedirect("cart.jsp");

            } else if (action.equals("delete")) {
                int cartNo = Integer.parseInt(request.getParameter("cart_no"));

                dao.deleteCart(cartNo);
                response.sendRedirect("cart.jsp");

            } else if (action.equals("clear")) {
                int memberId = Integer.parseInt(request.getParameter("member"));

                dao.clearCart(memberId);
                response.sendRedirect("cart.jsp");
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
