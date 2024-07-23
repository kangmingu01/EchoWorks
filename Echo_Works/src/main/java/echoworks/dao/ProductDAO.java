package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import echoworks.dto.ProductDTO;




public class ProductDAO extends JdbcDAO{
	private static ProductDAO _dao;
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	static {
		_dao=new ProductDAO();
	}	
	public static ProductDAO getDAO() {
		return _dao;
	}
	
	//상품테이블에서 상품 이름 , 이미지 , 가격 불러오기
	public List<echoworks.dto.ProductDTO> selectProductAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			String sql="select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB from product order by PRODUCT_NO";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setPRODUCT_NO(rs.getInt("PRODUCT_NO"));
				product.setPRODUCT_NAME(rs.getString("PRODUCT_NAME"));
				product.setPRODUCT_IMG(rs.getString("PRODUCT_IMG"));
				product.setPRODUCT_IMG_DETAIL(rs.getString("PRODUCT_IMG_DETAIL"));
				product.setPRODUCT_PRICE(rs.getInt("PRODUCT_PRICE"));
				product.setPRODUCT_CATEGORY_MAIN(rs.getString("PRODUCT_CATEGORY_MAIN"));
				product.setPRODUCT_CATEGORY_SUB(rs.getString("PRODUCT_CATEGORY_SUB"));
				
				
				productList.add(product);				
			}						
		}catch (SQLException e) {
			System.out.println("[에러]selectProductAll() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;				
	}
	
	// 상품 번호 NO 로 상품 정보 불러오기
	public ProductDTO selectProductByNo(int no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDTO product=null;
		try {
			con=getConnection();
			String sql="select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB from product where PRODUCT_NO=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				product=new ProductDTO();
				product.setPRODUCT_NO(rs.getInt("PRODUCT_NO"));				
				product.setPRODUCT_NAME(rs.getString("PRODUCT_NAME"));
				product.setPRODUCT_IMG(rs.getString("PRODUCT_IMG"));
				product.setPRODUCT_IMG_DETAIL(rs.getString("PRODUCT_IMG_DETAIL"));
				product.setPRODUCT_PRICE(rs.getInt("PRODUCT_PRICE"));
				product.setPRODUCT_CATEGORY_MAIN(rs.getString("PRODUCT_CATEGORY_MAIN"));
				product.setPRODUCT_CATEGORY_SUB(rs.getString("PRODUCT_CATEGORY_SUB"));														
			}																				
		}catch (SQLException e) {
			System.out.println("[에러]selectProductByNo() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;				
	}
	
	
	
	
}
