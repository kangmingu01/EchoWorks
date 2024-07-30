<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="echoworks.dao.CartDAO" %>
<%@ page import="echoworks.dto.CartDTO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="echoworks.dto.MemberDTO" %>

<%
    // 로그인된 사용자 정보 가져오기
    HttpSession currentSession = request.getSession(); // 현재 세션 가져오기, 변수명을 currentSession으로 변경
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember"); // 로그인된 사용자 정보 가져오기

    if (loginMember == null) { // 로그인되지 않은 경우
        out.println("<script>alert('로그인이 필요합니다.');location.href='" + request.getContextPath() + "/index.jsp?workgroup=member&work=member_login';</script>");
        return; // 로그인 페이지로 리다이렉트
    }

    // 파라미터 처리
    String action = request.getParameter("action"); // 요청된 작업(action) 파라미터 값 가져오기
    CartDAO dao = CartDAO.getDao(); // CartDAO 객체 생성
    String returnUrl = request.getParameter("returnUrl"); // 작업 완료 후 돌아갈 URL

    if (action != null) { // action 파라미터가 존재하는 경우
        try {
            if (action.equals("add")) { // 장바구니에 상품 추가
                int psno = Integer.parseInt(request.getParameter("psno")); // 상품 번호
                int num = Integer.parseInt(request.getParameter("num")); // 상품 수량
                int member = loginMember.getMemberNum(); // 회원 번호 가져오기

                CartDTO cart = new CartDTO();
                cart.setCart_psno(psno); // 장바구니 DTO에 상품 번호 설정
                cart.setCart_member(member); // 장바구니 DTO에 회원 번호 설정
                cart.setCart_num(num); // 장바구니 DTO에 상품 수량 설정

                dao.addCart(cart); // 장바구니에 상품 추가
                response.sendRedirect(returnUrl); // 지정된 URL로 리다이렉트

            } else if (action.equals("update")) { // 장바구니 상품 수량 업데이트
                int cartNo = Integer.parseInt(request.getParameter("cart_no")); // 장바구니 번호
                int quantity = Integer.parseInt(request.getParameter("quantity")); // 새로운 수량

                dao.updateCart(cartNo, quantity); // 장바구니 수량 업데이트
                response.sendRedirect(returnUrl); // 지정된 URL로 리다이렉트

            } else if (action.equals("delete")) { // 장바구니에서 상품 삭제
                // 여러 개의 cart_no 값을 배열로 받아옴
                String[] cartNos = request.getParameterValues("cart_no"); // 선택된 장바구니 항목들

                if (cartNos != null) {
                    for (String cartNo : cartNos) {
                        int cartNoInt = Integer.parseInt(cartNo); // 각 장바구니 번호를 정수형으로 변환
                        dao.deleteCart(cartNoInt); // 해당 장바구니 항목 삭제
                    }
                }

                response.sendRedirect(returnUrl); // 지정된 URL로 리다이렉트

            } else if (action.equals("clear")) { // 장바구니 비우기
                int memberId = loginMember.getMemberNum(); // 회원 번호 가져오기

                dao.clearCart(memberId); // 해당 회원의 장바구니 비우기
                response.sendRedirect(returnUrl); // 지정된 URL로 리다이렉트

            } else if (action.equals("checkout")) { // 선택된 상품 주문 처리
                // 선택된 상품 주문 처리 로직 추가
                String[] selectedCartNos = request.getParameterValues("cart_no"); // 선택된 장바구니 항목들
                if (selectedCartNos != null) {
                    String query = "&";
                    for (String cartNo : selectedCartNos) {
                        query += "cart_no=" + cartNo + "&"; // 쿼리 문자열 생성
                    }
                    response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=payment&work=payment" + query); // 결제 페이지로 리다이렉트
                } else {
                    out.println("<script>alert('선택된 상품이 없습니다.');history.back();</script>"); // 선택된 상품이 없는 경우 경고
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // SQLException 발생 시 오류 출력
            out.println("<script>alert('DB Error!');history.back();</script>"); // DB 오류 메시지 출력
        } catch (NumberFormatException e) {
            e.printStackTrace(); // NumberFormatException 발생 시 오류 출력
            out.println("<script>alert('Invalid Input!');history.back();</script>"); // 잘못된 입력에 대한 메시지 출력
        }
    } else {
        out.println("<script>alert('Invalid Action!');history.back();</script>"); // 잘못된 action 요청에 대한 메시지 출력
    }
%>
