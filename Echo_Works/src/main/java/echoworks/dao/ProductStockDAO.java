package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import echoworks.dto.ProductStockDTO;

public class ProductStockDAO extends JdbcDAO {

    public ProductStockDTO getProductStockById(int productStockNo) throws SQLException {
        String sql = "SELECT * FROM product_stock WHERE product_stock_no = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductStockDTO stock = null;
        
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productStockNo);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                stock = new ProductStockDTO();
                stock.setProductStockNo(rs.getInt("product_stock_no"));
                stock.setProductStockPno(rs.getInt("product_stock_pno"));
                stock.setProductStockOption(rs.getString("product_stock_option"));
                stock.setProductStockStock(rs.getInt("product_stock_stock"));
                stock.setProductStockPrice(rs.getInt("product_stock_price"));
            }
        } finally {
            close(con, pstmt, rs);
        }
        
        return stock;
    }
}
