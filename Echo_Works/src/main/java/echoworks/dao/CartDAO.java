package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import echoworks.dto.CartDTO;

public class CartDAO extends JdbcDAO {
    private static CartDAO _dao;

    public CartDAO() {
        // TODO Auto-generated constructor stub
    }

    static {
        _dao = new CartDAO();
    }

    public static CartDAO getDao() {
        return _dao;
    }

    // 카트에 상품 추가
    public void addCart(CartDTO cart) throws SQLException {
        String sql = "INSERT INTO CART (CART_NO, CART_PSNO, CART_MEMBER, CART_NUM) VALUES (CART_SEQ.NEXTVAL, ?, ?, ?)";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, cart.getCart_psno());
            pstmt.setInt(2, cart.getCart_member());
            pstmt.setInt(3, cart.getCart_num());
            pstmt.executeUpdate();
        } finally {
            close(con, pstmt);
        }
    }

    // 특정 회원의 장바구니 목록 조회
    public List<CartDTO> getCartList(int memberId) throws SQLException {
        List<CartDTO> cartList = new ArrayList<>();
        String sql = "SELECT * FROM CART WHERE CART_MEMBER = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, memberId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CartDTO cart = new CartDTO();
                cart.setCart_no(rs.getInt("CART_NO"));
                cart.setCart_psno(rs.getInt("CART_PSNO"));
                cart.setCart_member(rs.getInt("CART_MEMBER"));
                cart.setCart_num(rs.getInt("CART_NUM"));
                cartList.add(cart);
            }
        } finally {
            close(con, pstmt, rs);
        }
        return cartList;
    }

    // 장바구니 상품 수량 업데이트
    public void updateCart(int cartNo, int quantity) throws SQLException {
        String sql = "UPDATE CART SET CART_NUM = ? WHERE CART_NO = ?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, quantity);
            pstmt.setInt(2, cartNo);
            pstmt.executeUpdate();
        } finally {
            close(con, pstmt);
        }
    }

    // 장바구니에서 특정 상품 삭제
    public void deleteCart(int cartNo) throws SQLException {
        String sql = "DELETE FROM CART WHERE CART_NO = ?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, cartNo);
            pstmt.executeUpdate();
         
        } finally {
            close(con, pstmt);
        }
    }

    // 회원의 모든 장바구니 항목 삭제
    public void clearCart(int memberId) throws SQLException {
        String sql = "DELETE FROM CART WHERE CART_MEMBER = ?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, memberId);
            pstmt.executeUpdate();
        } finally {
            close(con, pstmt);
        }
    }

    public CartDTO getCartByNo(int cartNo) throws SQLException {
        String sql = "SELECT * FROM CART WHERE CART_NO = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        CartDTO cart = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, cartNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                cart = new CartDTO();
                cart.setCart_no(rs.getInt("CART_NO"));
                cart.setCart_psno(rs.getInt("CART_PSNO"));
                cart.setCart_member(rs.getInt("CART_MEMBER"));
                cart.setCart_num(rs.getInt("CART_NUM"));
            }
        } finally {
            close(con, pstmt, rs);
        }
        return cart;
    }

    // 선택된 장바구니 항목 삭제
    public void deleteSelectedCartItems(int[] cartNos) throws SQLException {
        String sql = "DELETE FROM CART WHERE CART_NO = ?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);

            for (int cartNo : cartNos) {
                pstmt.setInt(1, cartNo);
                pstmt.addBatch(); // Batch 처리
            }

            int[] results = pstmt.executeBatch(); // 일괄 실행
            for (int result : results) {
       
            }
        } finally {
            close(con, pstmt);
        }
    }
}
