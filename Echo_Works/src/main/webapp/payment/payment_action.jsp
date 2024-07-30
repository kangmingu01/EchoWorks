<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="echoworks.dao.CartDAO" %>
<%@ page import="echoworks.dao.ProductStockDAO" %>
<%@ page import="echoworks.dao.PaymentDAO" %>
<%@ page import="echoworks.dto.CartDTO" %>
<%@ page import="echoworks.dto.ProductStockDTO" %>
<%@ page import="echoworks.dto.PaymentDTO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="echoworks.dto.MemberDTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.SQLException" %>

<%
    // 로그인된 사용자 정보 가져오기
    HttpSession currentSession = request.getSession(); // 세션에서 로그인된 사용자 정보 가져오기
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    if (loginMember == null) {
        // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        out.println("<script>alert('로그인이 필요합니다.');location.href='index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    request.setCharacterEncoding("utf-8"); // 요청의 인코딩 설정

    // 파라미터 처리
    String action = request.getParameter("action"); // 클라이언트로부터 전달받은 액션 파라미터
    PaymentDAO paymentDAO = PaymentDAO.getDAO(); // PaymentDAO 객체 생성
    CartDAO cartDAO = CartDAO.getDao(); // CartDAO 객체 생성
    ProductStockDAO productStockDAO = ProductStockDAO.getDAO(); // ProductStockDAO 객체 생성

    if (action != null && action.equals("pay")) { // 결제 액션이 요청된 경우
        try {
            // 여러 psno와 num 값을 받기 위한 배열
            String[] psnoArray = request.getParameterValues("psno"); // 제품 번호 배열
            String[] numArray = request.getParameterValues("num"); // 수량 배열

            String total = request.getParameter("total"); // 총 결제 금액
            String jname = request.getParameter("jname"); // 주문자 이름
            String phone = request.getParameter("phone"); // 연락처
            String zipcode = request.getParameter("zipcode"); // 우편번호
            String address1 = request.getParameter("address1"); // 기본 주소
            String address2 = request.getParameter("address2"); // 상세 주소
            String omesg = request.getParameter("omesg"); // 배송 메모
            String omesgInput = request.getParameter("omesgInput"); // 직접 입력한 배송 메모

            if (omesg != null && omesg.equals("직접입력")) {
                omesg = omesgInput; // 배송 메모를 직접 입력한 값으로 설정
            }

            boolean isStockSufficient = true; // 재고 여부 확인 변수

            // 재고 확인 및 차감
            for (int i = 0; i < psnoArray.length; i++) {
                int psno = Integer.parseInt(psnoArray[i]);
                int num = Integer.parseInt(numArray[i]);
                
                ProductStockDTO productStock = productStockDAO.selectProductStock(psno);
                if (productStock != null && productStock.getpS_Stock() >= num) {
                    int newStock = productStock.getpS_Stock() - num;
                    productStock.setpS_Stock(newStock);
                    productStockDAO.updateProductStock(productStock); // 재고 업데이트
                } else {
                    isStockSufficient = false; // 재고가 부족한 경우
                    break;
                }
            }

            if (!isStockSufficient) {
                out.println("<script>alert('재고가 부족한 상품이 있습니다.');history.back();</script>");
                return;
            }

            // 결제 정보 저장
            for (int i = 0; i < psnoArray.length; i++) {
                int psno = Integer.parseInt(psnoArray[i]);
                int num = Integer.parseInt(numArray[i]);

                PaymentDTO payment = new PaymentDTO();
                payment.setPaymentPsno(psno); // 제품 번호 설정
                payment.setPaymentHno(loginMember.getMemberNum()); // 회원 번호 설정
                payment.setPaymentNum(num); // 수량 설정
                payment.setPaymentTotal(total); // 총 결제 금액 설정
                payment.setPaymentStatus(1); // 결제 완료 상태 설정
                payment.setPaymentJname(jname); // 주문자 이름 설정
                payment.setPaymentPhone(phone); // 연락처 설정
                payment.setPaymentZipcode(zipcode); // 우편번호 설정
                payment.setPaymentAddress1(address1); // 기본 주소 설정
                payment.setPaymentAddress2(address2); // 상세 주소 설정
                payment.setPaymentOmesg(omesg); // 배송 메모 설정
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                payment.setPaymentDate(sdf.format(new Date())); // 결제 날짜 설정

                int result = paymentDAO.insertPayment(payment); // 결제 정보 저장

                if (result <= 0) {
                    out.println("<script>alert('결제 처리 중 오류가 발생했습니다. 다시 시도해 주세요.');history.back();</script>");
                    return;
                }
            }

            // 결제가 완료된 장바구니 항목 삭제
            String[] selectedCartNosStr = request.getParameterValues("cart_no");
            if (selectedCartNosStr != null) {
                int[] selectedCartNos = new int[selectedCartNosStr.length];
                for (int i = 0; i < selectedCartNosStr.length; i++) {
                    selectedCartNos[i] = Integer.parseInt(selectedCartNosStr[i]);
                }


                cartDAO.deleteSelectedCartItems(selectedCartNos);

                cartDAO.deleteSelectedCartItems(selectedCartNos); // 선택된 장바구니 항목 삭제

            }

            // 결제 완료 후 결제 완료 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=payment&work=payment_complete");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            out.println("<script>alert('잘못된 입력입니다.');history.back();</script>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('DB 오류가 발생했습니다.');history.back();</script>");
        }
    } else {
        // 잘못된 액션일 경우
        out.println("<script>alert('잘못된 액션입니다.');history.back();</script>");
    }
%>
