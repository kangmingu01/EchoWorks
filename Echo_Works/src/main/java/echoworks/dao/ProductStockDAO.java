package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import echoworks.dto.ProductDTO;
import echoworks.dto.ProductStockDTO;


public class ProductStockDAO extends JdbcDAO{
	private static ProductStockDAO _dao;
	public ProductStockDAO() {
		// TODO Auto-generated constructor stub
	}
	static {
		_dao=new ProductStockDAO();
	}	
	public static ProductStockDAO getDAO() {
		return _dao;
	}
	
	//재고테이블 불러오기
	public List<ProductStockDTO> selectProductStockList(int no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductStockDTO> productStockList=new ArrayList<ProductStockDTO>();
		try {
			con=getConnection();
			String sql="select product_stock_no, product_stock_pno, product_stock_option ,product_stock_stock ,product_stock_price from product_stock where product_stock_pno=? order by product_stock_no";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductStockDTO productStock=new ProductStockDTO();
				productStock.setpS_No(rs.getInt("product_stock_no"));
				productStock.setpS_pNo(rs.getInt("product_stock_pno"));
				productStock.setpS_Option(rs.getNString("product_stock_option"));
				productStock.setpS_Stock(rs.getInt("product_stock_stock"));
				productStock.setpS_price(rs.getInt("product_stock_price"));
				
				productStockList.add(productStock);				
			}						
		}catch (SQLException e) {
			System.out.println("[에러]selectProductStock() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productStockList;				
	}
	
	//재고 가져오기
	public ProductStockDTO selectProductStock(int psNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductStockDTO productStock=null;
		try {
			con=getConnection();
			String sql="select product_stock_no, product_stock_pno, product_stock_option ,product_stock_stock ,product_stock_price from product_stock where product_stock_no=? order by product_stock_no";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, psNo);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				productStock=new ProductStockDTO();
				productStock.setpS_No(rs.getInt("product_stock_no"));				
				productStock.setpS_pNo(rs.getInt("product_stock_pno"));
				productStock.setpS_Option(rs.getString("product_stock_option"));
				productStock.setpS_Stock(rs.getInt("product_stock_stock"));
				productStock.setpS_price(rs.getInt("product_stock_price"));
			}																				
		}catch (SQLException e) {
			System.out.println("[에러]selectProductStock() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productStock;	
	}
	
	
}
