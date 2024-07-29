package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import echoworks.dto.QnaDTO;

public class QnaDAO extends JdbcDAO {
	private static QnaDAO _dao;

	static {
		_dao = new QnaDAO();
	}

	public static QnaDAO getDAO() {
		return _dao;
	}

	// QNA 테이블에 새로운 질문을 삽입
	public int insertQna(QnaDTO qna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			String sql = "insert into qna (qna_no, qna_member_no, qna_product_no, qna_title, qna_content, qna_date) "
					+ "values (qna_seq.nextval, ?, ?, ?, ?, sysdate,null,null,1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna.getQnaMemberNo());
			pstmt.setInt(2, qna.getQnaProductNo());
			pstmt.setString(3, qna.getQnaTitle());
			pstmt.setString(4, qna.getQnaContent());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러] insertQna() 메서드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// QNA 글 번호로 특정 질문을 조회
	public QnaDTO selectQnaByNo(int qnaNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnaDTO qna = null;
		try {
			con = getConnection();
			String sql = "select q.qna_no, q.qna_member_no, q.qna_product_no, q.qna_title, q.qna_content, "
					+ "q.qna_date, q.qna_answer, q.qna_ansdate, m.member_name, p.product_name, q.qna_status "
					+ "from qna q " + "join member m on q.qna_member_no = m.member_no "
					+ "join product p on q.qna_product_no = p.product_no " + "where q.qna_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				qna = new QnaDTO();
				qna.setQnaNo(rs.getInt("qna_no"));
				qna.setQnaMemberNo(rs.getInt("qna_member_no"));
				qna.setQnaProductNo(rs.getInt("qna_product_no"));
				qna.setQnaTitle(rs.getString("qna_title"));
				qna.setQnaContent(rs.getString("qna_content"));
				qna.setQnaDate(rs.getDate("qna_date"));
				qna.setQnaAnswer(rs.getString("qna_answer"));
				qna.setQnaAnsDate(rs.getDate("qna_ansdate"));
				qna.setQnaStatus(rs.getInt("qna_status"));
			}
		} catch (SQLException e) {
			System.out.println("[에러] selectQnaByNo() 메서드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qna;
	}

	// 특정 회원의 모든 질문을 조회(마이페이지 qna내역)
	public List<QnaDTO> selectQnaByMemberNo(int memberNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaDTO> qnaList = new ArrayList<>();
		try {
			con = getConnection();
			String sql = "select q.qna_no, q.qna_member_no, q.qna_product_no, q.qna_title, q.qna_content, "
					+ "q.qna_date, q.qna_answer, q.qna_ansdate, p.product_name, q.qna_status " + "from qna q "
					+ "join product p on q.qna_product_no = p.product_no " + "where q.qna_member_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setQnaNo(rs.getInt("qna_no"));
				qna.setQnaMemberNo(rs.getInt("qna_member_no"));
				qna.setQnaProductNo(rs.getInt("qna_product_no"));
				qna.setQnaTitle(rs.getString("qna_title"));
				qna.setQnaContent(rs.getString("qna_content"));
				qna.setQnaDate(rs.getDate("qna_date"));
				qna.setQnaAnswer(rs.getString("qna_answer"));
				qna.setQnaAnsDate(rs.getDate("qna_ansdate"));
				qna.setQnaStatus(rs.getInt("qna_status"));

				qnaList.add(qna);

			}
		} catch (SQLException e) {
			System.out.println("[에러] selectQnaByMemberNo() 메서드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qnaList;
	}

	// QnA 테이블에 저장된 모든 행을 검색(관리자페이지에서 모든 회원들의 qna 내역)
	public List<QnaDTO> selectAllQnAList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		try {
			con = getConnection();
			String sql = "select qna_no, qna_member_no,qna_product_no, qna_title,qna_content,"
					+ "qna_date, qna_answer, qna_ansdate, qna_status from qna order by qna_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setQnaNo(rs.getInt("qna_no"));
				qna.setQnaMemberNo(rs.getInt("qna_member_no"));
				qna.setQnaProductNo(rs.getInt("qna_product_no"));
				qna.setQnaTitle(rs.getString("qna_title"));
				qna.setQnaContent(rs.getString("qna_content"));
				qna.setQnaDate(rs.getDate("qna_date"));
				qna.setQnaAnswer(rs.getString("qna_answer"));
				qna.setQnaAnsDate(rs.getDate("qna_ansdate"));
				qna.setQnaStatus(rs.getInt("qna_status"));

				qnaList.add(qna);

			}
		} catch (SQLException e) {
			System.out.println("[에러] selectAjaxQnAList() 메서드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qnaList;
	}

	public List<QnaDTO> selectQnaByMemberNoN(int memberNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaDTO> qnaList = new ArrayList<>();
		try {
			con = getConnection();
			String sql = "select q.qna_no, q.qna_member_no, q.qna_product_no, q.qna_title, q.qna_content, "
					+ "q.qna_date, q.qna_answer, q.qna_ansdate,q.qna_status, p.product_name from qna q "
					+ "join product p on q.qna_product_no = p.product_no "
					+ "where q.qna_member_no = ? and q.qna_status=2";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setQnaNo(rs.getInt("qna_no"));
				qna.setQnaMemberNo(rs.getInt("qna_member_no"));
				qna.setQnaProductNo(rs.getInt("qna_product_no"));
				qna.setQnaTitle(rs.getString("qna_title"));
				qna.setQnaContent(rs.getString("qna_content"));
				qna.setQnaDate(rs.getDate("qna_date"));
				qna.setQnaAnswer(rs.getString("qna_answer"));
				qna.setQnaAnsDate(rs.getDate("qna_ansdate"));
				qna.setQnaStatus(rs.getInt("qna_status"));

				qnaList.add(qna);

			}
		} catch (SQLException e) {
			System.out.println("[에러] selectQnaByMemberNo() 메서드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qnaList;
	}

	public List<QnaDTO> selectQnaNOList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		try {
			con = getConnection();
			String sql = "select qna_no, qna_member_no,qna_product_no, qna_title,qna_content,"
					+ "qna_date, qna_answer, qna_ansdate, qna_status from where qna_status=2 qna order by qna_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setQnaNo(rs.getInt("qna_no"));
				qna.setQnaMemberNo(rs.getInt("qna_member_no"));
				qna.setQnaProductNo(rs.getInt("qna_product_no"));
				qna.setQnaTitle(rs.getString("qna_title"));
				qna.setQnaContent(rs.getString("qna_content"));
				qna.setQnaDate(rs.getDate("qna_date"));
				qna.setQnaAnswer(rs.getString("qna_answer"));
				qna.setQnaAnsDate(rs.getDate("qna_ansdate"));
				qna.setQnaStatus(rs.getInt("qna_status"));

				qnaList.add(qna);

			}
		} catch (SQLException e) {
			System.out.println("[에러] selectAjaxQnAList() 메서드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qnaList;
	}

	public List<QnaDTO> selectQnAAList(int productNo, int secretCheck, String replyStatus, int memberNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaDTO> qnaList = new ArrayList<>();

		try {
			con = getConnection();

			String sql = "SELECT qna_no, qna_member_num, qna_product_no, qna_title, qna_content, "
					+ "qna_date, qna_answer, qna_ansdate, qna_status " + "FROM QNA WHERE QNA_PRODUCT_NO = ?";
			if (secretCheck == 1) {
				sql += " AND QNA_STATUS = 2";
			}
			if ("".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NULL";
			} else if ("answer_completed".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NOT NULL";
			}
			if (!"0".equals(memberNo)) {
				sql += " AND qna_member_num=? ";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, memberNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setQnaNo(rs.getInt("QNA_NO"));
				qna.setQnaMemberNo(rs.getInt("QNA_MEMBER_NO"));
				qna.setQnaProductNo(rs.getInt("QNA_PRODUCT_NO"));
				qna.setQnaTitle(rs.getString("QNA_TITLE"));
				qna.setQnaContent(rs.getString("QNA_CONTENT"));
				qna.setQnaDate(rs.getDate("QNA_DATE"));
				qna.setQnaAnswer(rs.getString("QNA_ANSWER"));
				qna.setQnaAnsDate(rs.getDate("QNA_ANSDATE"));
				qna.setQnaStatus(rs.getInt("QNA_STATUS"));

				qnaList.add(qna);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return qnaList;

	}

	// Q&A 상품 번호마다 다른 Q&A 게시판 리스트 뽑는 기능(일단 보류)
	public List<QnaDTO> selectQnAList(int productNo, int secretCheck, String replyStatus, int memberNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaDTO> qnaList = new ArrayList<>();

		try {
			con = getConnection();

			String sql = "SELECT qna_no, qna_member_no, qna_product_no, qna_title, qna_content, "
					+ "qna_date, qna_answer, qna_ansdate, qna_status " + "FROM QNA WHERE QNA_PRODUCT_NO = ?";

			if (secretCheck == 1) {
				sql += " AND QNA_STATUS = 1";
			}else {
				sql += " AND QNA_STATUS between 1 and 2 ";
			}
			if ("unanswered_answer".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NULL";
			} else if ("answer_completed".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NOT NULL";
			} else {
				sql += "";
			}
			if (memberNum != 0) {
				sql += " AND QNA_MEMBER_NO = ? order by qna_no desc";
			} else {
				sql += " order by qna_no desc ";
			}

			/*
			 * pstmt = con.prepareStatement(sql); pstmt.setInt(1, productNo); if (memberNum
			 * != 0) { pstmt.setInt(2, memberNum); }
			 */

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			if (memberNum != 0) {
				pstmt.setInt(2, memberNum);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setQnaNo(rs.getInt("QNA_NO"));
				qna.setQnaMemberNo(rs.getInt("QNA_MEMBER_NO"));
				qna.setQnaProductNo(rs.getInt("QNA_PRODUCT_NO"));
				qna.setQnaTitle(rs.getString("QNA_TITLE"));
				qna.setQnaContent(rs.getString("QNA_CONTENT"));
				qna.setQnaDate(rs.getDate("QNA_DATE"));
				qna.setQnaAnswer(rs.getString("QNA_ANSWER"));
				qna.setQnaAnsDate(rs.getDate("QNA_ANSDATE"));
				qna.setQnaStatus(rs.getInt("QNA_STATUS"));

				qnaList.add(qna);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return qnaList;
	}

	// ========================24.07.26 insert DAO 추가
	public int insertQnaUser(QnaDTO qna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into qna values(qna_seq.nextval,?,?,?,?,sysdate,null,null,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna.getQnaMemberNo());
			pstmt.setInt(2, qna.getQnaProductNo());
			pstmt.setString(3, qna.getQnaTitle());
			pstmt.setString(4, qna.getQnaContent());
			pstmt.setInt(5, qna.getQnaStatus());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertQnaUser() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// 변경 버튼 누르고 제목이랑 내용 업데이트 하는 기능
	public int updateQna(QnaDTO qna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update qna set QNA_TITLE = ?, QNA_CONTENT = ? where QNA_NO = ? and QNA_PRODUCT_NO = ? and QNA_MEMBER_NO = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna.getQnaTitle());
			pstmt.setString(2, qna.getQnaContent());
			pstmt.setInt(3, qna.getQnaNo());
			pstmt.setInt(4, qna.getQnaProductNo());
			pstmt.setInt(5, qna.getQnaMemberNo());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateQna() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// Q&A 질문 글 삭제
	public int deleteQna(int qnaNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update qna set QNA_STATUS=0 where QNA_NO = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteQna() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// =================조건별 행 갯수 출력
	public int selectTotalQnaRows(int productNo, int secretCheck, String replyStatus, int memberNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from qna where QNA_PRODUCT_NO=? ";
			if (secretCheck == 1) {
				sql += " AND QNA_STATUS = 1";
			}
			if ("unanswered_answer".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NULL";
			} else if ("answer_completed".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NOT NULL";
			} else {
				sql += "";
			}
			if (memberNum != 0) {
				sql += " AND QNA_MEMBER_NO = ? ";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productNo);

			if (memberNum != 0) {
				pstmt.setInt(2, memberNum);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectTotalQnaRows() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}

	// ---------페이징 처리된 글 수 출력----- 있는거 포함 ///2
	public List<QnaDTO> selectQnaList(int startRow, int endRow, int productNo, int secretCheck, String replyStatus,
			int memberNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		try {
			con = getConnection();
			String sql = "select * from (select rownum rn, temp.* from (select QNA_NO, QNA_MEMBER_NO,QNA_PRODUCT_NO,QNA_TITLE,QNA_CONTENT,QNA_DATE,QNA_ANSWER,QNA_ANSDATE,QNA_STATUS from qna where QNA_PRODUCT_NO=? ";
			if (secretCheck == 1) {
				sql += " AND QNA_STATUS = 1";
			}else {
				sql += " and QNA_STATUS between 1and 2 ";
			}
			if ("unanswered_answer".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NULL";
			} else if ("answer_completed".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NOT NULL";
			} else {
				sql += "";
			}
			if (memberNum != 0) {
				sql += " AND QNA_MEMBER_NO = ? ";
				sql += " order by QNA_NO desc ) temp) where rn between ? and ?";
			} else {
				sql += " order by QNA_NO desc ) temp) where rn between ? and ?";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			if (memberNum != 0) {
				pstmt.setInt(2, memberNum);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			} else {
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setQnaNo(rs.getInt("QNA_NO"));
				qna.setQnaMemberNo(rs.getInt("QNA_MEMBER_NO"));
				qna.setQnaProductNo(rs.getInt("QNA_PRODUCT_NO"));
				qna.setQnaTitle(rs.getString("QNA_TITLE"));
				qna.setQnaContent(rs.getString("QNA_CONTENT"));
				qna.setQnaDate(rs.getDate("QNA_DATE"));
				qna.setQnaAnswer(rs.getString("QNA_ANSWER"));
				qna.setQnaAnsDate(rs.getDate("QNA_ANSDATE"));
				qna.setQnaStatus(rs.getInt("QNA_STATUS"));

				qnaList.add(qna);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectQnaList() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qnaList;
	}
	
	// QNA 관리자 답글 
		public int insertAdminAnswer(QnaDTO qna) {
			Connection con = null;
			PreparedStatement pstmt = null;
			int rows = 0;
			try {
				con = getConnection();
				String sql = "update qna set qna_answer=? ,QNA_ANSDATE=sysdate where qna_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, qna.getQnaAnswer());
				pstmt.setInt(2, qna.getQnaNo());
				
				rows = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러] insertAdminAnswer() 메서드의 SQL 오류 = " + e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
}