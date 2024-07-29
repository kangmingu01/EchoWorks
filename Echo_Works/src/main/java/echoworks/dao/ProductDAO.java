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
			String sql="select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product order by PRODUCT_NO";
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
				product.setPRODUCT_VIDEO_URL(rs.getString("PRODUCT_VIDEO_URL"));
				
				
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
			String sql="select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product where PRODUCT_NO=?";
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
				product.setPRODUCT_VIDEO_URL(rs.getString("PRODUCT_VIDEO_URL"));
			}																				
		}catch (SQLException e) {
			System.out.println("[에러]selectProductByNo() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;				
	}
	//-------------------------검색 리스트
		public List<ProductDTO> selectSearchList(String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<ProductDTO> searchList=new ArrayList<ProductDTO>();
			try {
				con=getConnection();
				
				String sql="select rownum, temp.* from (select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product where upper(PRODUCT_NAME) like '%'||upper(?)||'%' order by PRODUCT_NAME) temp where rownum<=10";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				
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
					product.setPRODUCT_VIDEO_URL(rs.getString("PRODUCT_VIDEO_URL"));
					
					searchList.add(product);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectSearchList() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return searchList;
		}
		
		//------------전체 및 검색 상품의 행 갯수 가져오기
		public int selectTotalProductRows(String keyword,String cateOne, String cateTwo) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				if(keyword.equals("")&&cateOne.equals("")&&cateTwo.equals("")) {
					String sql="select count(*) from product";
					pstmt=con.prepareStatement(sql);					
				}else if(keyword.equals("")&&!cateOne.equals("")&&cateTwo.equals("")) {
					String sql="select Count(*) from product where PRODUCT_CATEGORY_MAIN=? ";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, cateOne);
				}else if(keyword.equals("")&&!cateOne.equals("")&&!cateTwo.equals("")){
					String sql="select Count(*) from product where PRODUCT_CATEGORY_MAIN=? and PRODUCT_CATEGORY_SUB=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, cateOne);
					pstmt.setString(2, cateTwo);
				}else if(!keyword.equals("")&&cateOne.equals("")&&cateTwo.equals("")){
					String sql="select Count(*) from product where PRODUCT_name like '%'||?||'%'";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
				}else if(!keyword.equals("")&&!cateOne.equals("")&&cateTwo.equals("")){
					String sql="select Count(*) from product where PRODUCT_CATEGORY_MAIN=? and PRODUCT_name like '%'||?||'%'";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, cateOne);
					pstmt.setString(2, keyword);
				}else if(!keyword.equals("")&&!cateOne.equals("")&&!cateTwo.equals("")){
					String sql="select Count(*) from product where PRODUCT_CATEGORY_MAIN=? and PRODUCT_CATEGORY_SUB=? and PRODUCT_name like '%'||?||'%'";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, cateOne);
					pstmt.setString(2, cateTwo);
					pstmt.setString(3, keyword);
				}
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					count=rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectTotalProductRows() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return count;
		}
		
		//---------페이징 처리된 상품개수 출력-----keyword 있는거 포함
		public List<ProductDTO> selectProductAsList(int startRow, int endRow,String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<ProductDTO> productList=new ArrayList<ProductDTO>();
			try {
				con=getConnection();
				
				if(keyword.equals("")) {
					String sql="select * from (select rownum rn, temp.* from (select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product order by PRODUCT_NAME ) temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} else {
					String sql="select * from (select rownum rn, temp.* from (select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product where PRODUCT_NAME like '%'||?||'%' order by PRODUCT_NAME ) temp) where rn between ? and ?";				
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
				}
				
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
					product.setPRODUCT_VIDEO_URL(rs.getString("PRODUCT_VIDEO_URL"));
					
					productList.add(product);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectProductAsList() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
		
		//---------페이징 처리된 상품개수 출력-----keyword 있는거 포함 ///2
				public List<ProductDTO> selectProductList(int startRow, int endRow,String keyword, String cateOne, String cateTwo) {
					Connection con=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					List<ProductDTO> productList=new ArrayList<ProductDTO>();
					try {
						con=getConnection();
						
						if(keyword.equals("")&&cateOne.equals("")&&cateTwo.equals("")) {
							String sql="select * from (select rownum rn, temp.* from (select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product order by PRODUCT_NAME ) temp) where rn between ? and ?";
							pstmt=con.prepareStatement(sql);
							pstmt.setInt(1, startRow);
							pstmt.setInt(2, endRow);
						} else if(keyword.equals("")&&!cateOne.equals("")&&cateTwo.equals("")){
							String sql="select * from (select rownum rn, temp.* from (select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product where PRODUCT_CATEGORY_MAIN=? order by PRODUCT_NAME ) temp) where rn between ? and ?";				
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1, cateOne);
							pstmt.setInt(2, startRow);
							pstmt.setInt(3, endRow);
						} else if(keyword.equals("")&&!cateOne.equals("")&&!cateTwo.equals("")){
							String sql="select * from (select rownum rn, temp.* from (select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product where PRODUCT_CATEGORY_MAIN=? and  PRODUCT_CATEGORY_SUB=? order by PRODUCT_NAME ) temp) where rn between ? and ?";				
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1, cateOne);
							pstmt.setString(2, cateTwo);
							pstmt.setInt(3, startRow);
							pstmt.setInt(4, endRow);
						} else if(!keyword.equals("")&&cateOne.equals("")&&cateTwo.equals("")){
							String sql="select * from (select rownum rn, temp.* from (select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product where PRODUCT_NAME like '%'||?||'%' order by PRODUCT_NAME ) temp) where rn between ? and ?";				
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1, keyword);
							pstmt.setInt(2, startRow);
							pstmt.setInt(3, endRow);
						}else if(!keyword.equals("")&&!cateOne.equals("")&&cateTwo.equals("")){
							String sql="select * from (select rownum rn, temp.* from (select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product where PRODUCT_CATEGORY_MAIN=? order and PRODUCT_NAME like '%'||?||'%' by PRODUCT_NAME ) temp) where rn between ? and ?";				
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1, cateOne);
							pstmt.setString(2, keyword);
							pstmt.setInt(3, startRow);
							pstmt.setInt(4, endRow);
						} else if(!keyword.equals("")&&!cateOne.equals("")&&!cateTwo.equals("")){
							String sql="select * from (select rownum rn, temp.* from (select PRODUCT_NO, PRODUCT_NAME,PRODUCT_IMG,PRODUCT_IMG_DETAIL,PRODUCT_PRICE,PRODUCT_CATEGORY_MAIN,PRODUCT_CATEGORY_SUB,PRODUCT_VIDEO_URL from product where PRODUCT_CATEGORY_MAIN=? and  PRODUCT_CATEGORY_SUB=? and PRODUCT_NAME like '%'||?||'%' order by PRODUCT_NAME ) temp) where rn between ? and ?";				
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1, cateOne);
							pstmt.setString(2, cateTwo);
							pstmt.setString(3, keyword);
							pstmt.setInt(4, startRow);
							pstmt.setInt(5, endRow);
						}
						
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
							product.setPRODUCT_VIDEO_URL(rs.getString("PRODUCT_VIDEO_URL"));
							
							productList.add(product);
						}
					} catch (SQLException e) {
						System.out.println("[에러]selectProductAsList() 메소드의 SQL 오류 = "+e.getMessage());
					} finally {
						close(con, pstmt, rs);
					}
					return productList;
				}
			
	
				// 관리자 페이지에서 상품 추가
				public int insertProduct(ProductDTO product){
					Connection con=null;
					PreparedStatement pstmt=null;
					int rows=0;
					try {
						con=getConnection();
						String sql="insert into product values(PRODUCT_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, product.getPRODUCT_NAME());
						pstmt.setString(2, product.getPRODUCT_IMG());
						pstmt.setString(3, product.getPRODUCT_IMG_DETAIL());
						pstmt.setInt(4, product.getPRODUCT_PRICE());
						pstmt.setString(5, product.getPRODUCT_CATEGORY_MAIN());
						pstmt.setString(6, product.getPRODUCT_CATEGORY_SUB());
						pstmt.setString(7, product.getPRODUCT_VIDEO_URL());
						
						rows=pstmt.executeUpdate();
								
					}catch (SQLException e) {
						System.out.println("[에러]selectProductByNo() 메소드의 SQL 오류 = "+e.getMessage());
					} finally {
						close(con, pstmt);
					}
					return rows;		
}
				// 관리자 페이지에서 상품 삭제
				public int deleteProduct(int productNo){
					Connection con=null;
					PreparedStatement pstmt=null;
					int rows=0;
					try {
						con=getConnection();
						String sql="delete from product where product_no=?";
						 pstmt = con.prepareStatement(sql);
				            pstmt.setInt(1, productNo);
				            pstmt.executeUpdate();
						
								
					}catch (SQLException e) {
						System.out.println("[에러]selectProductByNo() 메소드의 SQL 오류 = "+e.getMessage());
					} finally {
						close(con, pstmt);
					}
					return rows;		
				
}
		
				// 관리자 페이지에서 상품 가격 수정
				public int updateProduct(int productNo){
					Connection con=null;
					PreparedStatement pstmt=null;
					int rows=0;
					try {
						con=getConnection();
						String sql="update product set product_price=?, product_img=?, product_img_detail=?, product_url=?, product_main_category=?, product_sub_category=? where product_no=?";
						 pstmt = con.prepareStatement(sql);
				            pstmt.setInt(1, productNo);
				            pstmt.executeUpdate();
						
								
					}catch (SQLException e) {
						System.out.println("[에러]selectProductByNo() 메소드의 SQL 오류 = "+e.getMessage());
					} finally {
						close(con, pstmt);
					}
					return rows;		
				
}
				
}
