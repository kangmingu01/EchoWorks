package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import echoworks.dto.MemberDTO;
import echoworks.dto.PaymentDTO;
import echoworks.dto.ReviewDTO;

public class ReviewDAO extends JdbcDAO {
	private static ReviewDAO _dao;
	
	private ReviewDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ReviewDAO();
	}
	
	public static ReviewDAO getDAO() {
		return _dao;
	}
	
	//댓글정보(AjaxCommentDTO 객체)를 전달받아 AJAX_COMMENT 테이블의 행으로 삽입하고 삽입행의
	//갯수(int)를 반환하는 메소드
	public int insertReveiw(ReviewDTO review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into review values(review_seq.nextval,?,?,sysdate,1)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, review.getReview_pyNo());
			pstmt.setString(2, review.getReview_Content());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertReveiw() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//댓글정보(AjaxCommentDTO 객체)를 전달받아 AJAX_COMMENT 테이블에 저장된 행을 변경하고 
	//변경행의 갯수(int)를 반환하는 메소드
	public int updateReview(ReviewDTO review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			System.out.println(review.getReview_pyNo() + "  " + review.getReview_Content() + "   " + review.getReview_No());
			String sql="update review set review_pyno=?,review_content=?,review_date=sysdate where review_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, review.getReview_pyNo());
			pstmt.setString(2, review.getReview_Content());
			pstmt.setInt(3, review.getReview_No());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateReview() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//댓글번호(int)를 전달받아 AJAX_COMMENT 테이블에 저장된 행을 삭제하고 삭제행의 갯수(int)를
	//반환하는 메소드
	public int deleteReview(int no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update review set review_state=0 where review_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteReview() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//댓글번호(int)를 전달받아 AJAX_COMMENT 테이블에 저장된 행을 검색하여 댓글정보(AjaxCommentDTO 객체)를
	//반환하는 메소드
	public ReviewDTO selectReview(int no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ReviewDTO review=null;
		try {
			con=getConnection();
			
			String sql="select review_no,review_pyno,review_content,review_date,review_state from review where review_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				review=new ReviewDTO();
				review.setReview_No(rs.getInt("review_no"));
				review.setReview_pyNo(rs.getInt("review_pyno"));
				review.setReview_Content(rs.getString("review_content"));
				review.setReview_Date(rs.getString("review_date"));
				review.setReview_state(rs.getInt("review_state"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReview() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return review;
	}
	
	//AJAX_COMMENT 테이블에 저장된 모든 행을 검색하여 댓글목록(List 객체)를 반환하는 메소드
	public List<ReviewDTO> selectReviewList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ReviewDTO> reviewList=new ArrayList<ReviewDTO>();
		try {
			con=getConnection();
			System.out.println(1);
			String sql="select review_no,review_pyno,review_content,review_date,review_state from review order by review_no desc";
			pstmt=con.prepareStatement(sql);
			System.out.println(2);
			rs=pstmt.executeQuery();
			System.out.println(3);
			while(rs.next()) {
				ReviewDTO review=new ReviewDTO();
				review.setReview_No(rs.getInt("review_no"));
				review.setReview_pyNo(rs.getInt("review_pyno"));
				review.setReview_Content(rs.getString("review_content"));
				review.setReview_Date(rs.getString("review_date"));
				System.out.println(4);
				review.setReview_state(rs.getInt("review_state"));
				System.out.println(5);
				reviewList.add(review);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return reviewList;
	}
	
	public String selectMember(int pyNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select payment_hno from payment where payment_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pyNo);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return MemberDAO.getDAO().selectMemberByNum(rs.getInt("payment_hno")).getMemberName();
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReview() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return "";
	}
	
	public int selectPreductNo(int pyNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select product_stock_pno from product_stock where product_stock_no=(select payment_psno from payment where payment_no=?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pyNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("product_stock_pno");
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectPreductNo() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return 0;
	}
	
	//구매 목록 중 리뷰 달지 않은 목록 확인
	public int selectPaymentNo(PaymentDTO py) {

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select count(*) from review where review_pyno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, py.getPaymentNo());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectPreductNo() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return 0;
	}
}
