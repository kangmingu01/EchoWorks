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
    HttpSession currentSession = request.getSession();
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    if (loginMember == null) {
        out.println("<script>alert('로그인이 필요합니다.');location.href='index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    request.setCharacterEncoding("utf-8");

    // 파라미터 처리
    String action = request.getParameter("action");
    PaymentDAO paymentDAO = PaymentDAO.getDAO();
    CartDAO cartDAO = CartDAO.getDao();
    ProductStockDAO productStockDAO = ProductStockDAO.getDAO();

    if (action != null && action.equals("pay")) {
        try {
            // 여러 psno와 num 값을 받기 위한 배열
            String[] psnoArray = request.getParameterValues("psno");
            String[] numArray = request.getParameterValues("num");

            String total = request.getParameter("total");
            String jname = request.getParameter("jname");
            String phone = request.getParameter("phone");
            String zipcode = request.getParameter("zipcode");
            String address1 = request.getParameter("address1");
            String address2 = request.getParameter("address2");
            String omesg = request.getParameter("omesg");
            String omesgInput = request.getParameter("omesgInput");

            if (omesg != null && omesg.equals("직접입력")) {
                omesg = omesgInput;  // 직접 입력한 배송메모로 설정
            }

            boolean isStockSufficient = true;

            // 재고 확인 및 차감
            for (int i = 0; i < psnoArray.length; i++) {
                int psno = Integer.parseInt(psnoArray[i]);
                int num = Integer.parseInt(numArray[i]);
                
                ProductStockDTO productStock = productStockDAO.selectProductStock(psno);
                if (productStock != null && productStock.getpS_Stock() >= num) {
                    int newStock = productStock.getpS_Stock() - num;
                    productStock.setpS_Stock(newStock);
                    productStockDAO.updateProductStock(productStock);
                } else {
                    isStockSufficient = false;
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
                payment.setPaymentPsno(psno);
                payment.setPaymentHno(loginMember.getMemberNum());
                payment.setPaymentNum(num);
                payment.setPaymentTotal(total);
                payment.setPaymentStatus(1); // 결제 완료 상태
                payment.setPaymentJname(jname);
                payment.setPaymentPhone(phone);
                payment.setPaymentZipcode(zipcode);
                payment.setPaymentAddress1(address1);
                payment.setPaymentAddress2(address2);
                payment.setPaymentOmesg(omesg);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                payment.setPaymentDate(sdf.format(new Date()));

                int result = paymentDAO.insertPayment(payment);

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
            }

            response.sendRedirect(request.getContextPath() + "/index.jsp?workgroup=payment&work=payment_complete");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            out.println("<script>alert('잘못된 입력입니다.');history.back();</script>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('DB 오류가 발생했습니다.');history.back();</script>");
        }
    } else {
        out.println("<script>alert('잘못된 액션입니다.');history.back();</script>");
    }
%>