package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import echoworks.dto.PaymentDTO;


public class PaymentDAO extends JdbcDAO {
    private static PaymentDAO _dao;

    public PaymentDAO() {
		// TODO Auto-generated constructor stub
	}
    static {
        _dao = new PaymentDAO();
    }

    public static PaymentDAO getDAO() {
        return _dao;
    }

    // 결제 정보 삽입
    public int insertPayment(PaymentDTO payment) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();
            String sql = "INSERT INTO PAYMENT (PAYMENT_NO, PAYMENT_PSNO, PAYMENT_HNO, PAYMENT_NUM, PAYMENT_TOTAL, "
                         + "PAYMENT_DATE, PAYMENT_STATUS, PAYMENT_JNAME, PAYMENT_PHONE, PAYMENT_ZIPCODE, "
                         + "PAYMENT_ADDRESS1, PAYMENT_ADDRESS2, PAYMENT_OMESG) "
                         + "VALUES (PAYMENT_SEQ.NEXTVAL, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, payment.getPaymentPsno());
            pstmt.setInt(2, payment.getPaymentHno());
            pstmt.setInt(3, payment.getPaymentNum());
            pstmt.setString(4, payment.getPaymentTotal());
            pstmt.setInt(5, payment.getPaymentStatus());
            pstmt.setString(6, payment.getPaymentJname());
            pstmt.setString(7, payment.getPaymentPhone());
            pstmt.setString(8, payment.getPaymentZipcode());
            pstmt.setString(9, payment.getPaymentAddress1());
            pstmt.setString(10, payment.getPaymentAddress2());
            pstmt.setString(11, payment.getPaymentOmesg());

            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]insertPayment() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }
   
    // 특정 결제 정보 조회
    public PaymentDTO selectPaymentByMemberNo(int memberNo) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        PaymentDTO payment = null;
        try {
            con = getConnection();
        
            String sql = "select p.payment_no, p.payment_psno, p.payment_hno, p.payment_num, p.payment_total, "
                       + "p.payment_date, p.payment_status, p.payment_jname, p.payment_phone, p.payment_zipcode, "
                       + "p.payment_address1, p.payment_address2, p.payment_omesg, m.member_name "
                       + "from payment p "
                       + "join member m on p.payment_hno = m.member_no "
                       + "where p.payment_hno = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, memberNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                payment = new PaymentDTO();
                payment.setPaymentNo(rs.getInt("payment_no"));
                payment.setPaymentPsno(rs.getInt("payment_psno"));
                payment.setPaymentHno(rs.getInt("payment_hno"));
                payment.setPaymentNum(rs.getInt("payment_num"));
                payment.setPaymentTotal(rs.getString("payment_total"));
                payment.setPaymentDate(rs.getString("payment_date"));
                payment.setPaymentStatus(rs.getInt("payment_status"));
                payment.setPaymentJname(rs.getString("payment_jname"));
                payment.setPaymentPhone(rs.getString("payment_phone"));
                payment.setPaymentZipcode(rs.getString("payment_zipcode"));
                payment.setPaymentAddress1(rs.getString("payment_address1"));
                payment.setPaymentAddress2(rs.getString("payment_address2"));
                payment.setPaymentOmesg(rs.getString("payment_omesg"));
            }
        } catch (SQLException e) {
            System.out.println("[에러]selectPaymentByMemberNo() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return payment;
    }


    // 모든 결제 정보 조회
    public List<PaymentDTO> selectAllPayments() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PaymentDTO> paymentList = new ArrayList<>();
        try {
            con = getConnection();
            String sql = "select p.payment_no, p.payment_psno, p.payment_hno, p.payment_num, p.payment_total, "
                    + "p.payment_date, p.payment_status, p.payment_jname, p.payment_phone, p.payment_zipcode, "
                    + "p.payment_address1, p.payment_address2, p.payment_omesg "
                    + "from payment p "
                    + "join member m on p.payment_hno = m.member_no";
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();

         while (rs.next()) {
             PaymentDTO payment = new PaymentDTO();
             payment.setPaymentNo(rs.getInt("payment_no"));
             payment.setPaymentPsno(rs.getInt("payment_psno"));
             payment.setPaymentHno(rs.getInt("payment_hno"));
             payment.setPaymentNum(rs.getInt("payment_num"));
             payment.setPaymentTotal(rs.getString("payment_total"));
             payment.setPaymentDate(rs.getString("payment_date"));
             payment.setPaymentStatus(rs.getInt("payment_status"));
             payment.setPaymentJname(rs.getString("payment_jname"));
             payment.setPaymentPhone(rs.getString("payment_phone"));
             payment.setPaymentZipcode(rs.getString("payment_zipcode"));
             payment.setPaymentAddress1(rs.getString("payment_address1"));
             payment.setPaymentAddress2(rs.getString("payment_address2"));
             payment.setPaymentOmesg(rs.getString("payment_omesg"));
             paymentList.add(payment);
         }

        } catch (SQLException e) {
            System.out.println("[에러]selectAllPayments() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return paymentList;
    }
}
