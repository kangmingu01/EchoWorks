package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import echoworks.dto.ProductStockDTO;

public class ProductStockDAO extends JdbcDAO {
    private static ProductStockDAO _dao;

    public ProductStockDAO() {}

    static {
        _dao = new ProductStockDAO();
    }

    public static ProductStockDAO getDAO() {
        return _dao;
    }

    // 재고 테이블 불러오기
    public List<ProductStockDTO> selectProductStockList(int no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ProductStockDTO> productStockList = new ArrayList<ProductStockDTO>();
        try {
            con = getConnection();
            String sql = "select product_stock_no, product_stock_pno, product_stock_option, product_stock_stock, product_stock_price from product_stock where product_stock_pno=? order by product_stock_no";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductStockDTO productStock = new ProductStockDTO();
                productStock.setpS_No(rs.getInt("product_stock_no"));
                productStock.setpS_pNo(rs.getInt("product_stock_pno"));
                productStock.setpS_Option(rs.getString("product_stock_option"));
                productStock.setpS_Stock(rs.getInt("product_stock_stock"));
                productStock.setpS_price(rs.getInt("product_stock_price"));

                productStockList.add(productStock);
            }
        } catch (SQLException e) {
            System.out.println("[에러]selectProductStockList() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return productStockList;
    }

    // 재고 가져오기
    public ProductStockDTO selectProductStock(int psNo) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductStockDTO productStock = null;
        try {
            con = getConnection();
            String sql = "select product_stock_no, product_stock_pno, product_stock_option, product_stock_stock, product_stock_price from product_stock where product_stock_no=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, psNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                productStock = new ProductStockDTO();
                productStock.setpS_No(rs.getInt("product_stock_no"));
                productStock.setpS_pNo(rs.getInt("product_stock_pno"));
                productStock.setpS_Option(rs.getString("product_stock_option"));
                productStock.setpS_Stock(rs.getInt("product_stock_stock"));
                productStock.setpS_price(rs.getInt("product_stock_price"));
            }
        } catch (SQLException e) {
            System.out.println("[에러]selectProductStock() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return productStock;
    }

    // 재고 추가
    public int insertProductStock(ProductStockDTO productStock) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();
            String sql = "insert into product_stock (product_stock_no, product_stock_pno, product_stock_option, product_stock_stock, product_stock_price) values (PRODUCT_STOCK_SEQ.NEXTVAL, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productStock.getpS_pNo());
            pstmt.setString(2, productStock.getpS_Option());
            pstmt.setInt(3, productStock.getpS_Stock());
            pstmt.setInt(4, productStock.getpS_price());

            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]insertProductStock() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }

    // 재고 삭제
    public int deleteProductStock(int psNo) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();
            String sql = "delete from product_stock where product_stock_no=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, psNo);
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]deleteProductStock() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }

    // 재고 수정
    public int updateProductStock(ProductStockDTO productStock) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();
            String sql = "update product_stock set product_stock_pno=?, product_stock_option=?, product_stock_stock=?, product_stock_price=? where product_stock_no=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productStock.getpS_pNo());
            pstmt.setString(2, productStock.getpS_Option());
            pstmt.setInt(3, productStock.getpS_Stock());
            pstmt.setInt(4, productStock.getpS_price());
            pstmt.setInt(5, productStock.getpS_No());

            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]updateProductStock() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }
}
