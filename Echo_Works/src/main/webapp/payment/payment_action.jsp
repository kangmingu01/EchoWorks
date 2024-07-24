<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="echoworks.dao.PaymentDAO" %>
<%@ page import="echoworks.dto.PaymentDTO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="echoworks.dto.MemberDTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // 로그인된 사용자 정보 가져오기
    HttpSession currentSession = request.getSession();
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    if (loginMember == null) {
        out.println("<script>alert('로그인이 필요합니다.');location.href='index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    // 파라미터 처리
    String action = request.getParameter("action");
    PaymentDAO paymentDAO = new PaymentDAO();

    if (action != null && action.equals("pay")) {
        try {
            int psno = Integer.parseInt(request.getParameter("psno"));
            int num = Integer.parseInt(request.getParameter("num"));
            String total = request.getParameter("total");
            String jname = request.getParameter("jname");
            String phone = request.getParameter("phone");
            String zipcode = request.getParameter("zipcode");
            String address1 = request.getParameter("address1");
            String address2 = request.getParameter("address2");
            String omesg = request.getParameter("omesg");

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

            if (result > 0) {
                out.println("<script>alert('결제가 성공적으로 완료되었습니다.');location.href='order_complete.jsp';</script>");
            } else {
                out.println("<script>alert('결제 처리 중 오류가 발생했습니다. 다시 시도해 주세요.');history.back();</script>");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            out.println("<script>alert('Invalid Input!');history.back();</script>");
        }
    } else {
        out.println("<script>alert('Invalid Action!');history.back();</script>");
    }
%>
