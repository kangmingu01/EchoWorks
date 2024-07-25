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
					+ "values (qna_seq.nextval, ?, ?, ?, ?, sysdate,1)";
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
					+ "q.qna_date, q.qna_answer, q.qna_ansdate, m.member_name, p.product_name " + "from qna q "
					+ "join member m on q.qna_member_no = m.member_no "
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
					+ "q.qna_date, q.qna_answer, q.qna_ansdate, p.product_name " + "from qna q "
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

				qnaList.add(qna);

			}
		} catch (SQLException e) {
			System.out.println("[에러] selectQnaByMemberNo() 메서드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qnaList;
	}

	// QnA 테이블에 저장된 모든 행을 검색하여 List객체로 반환하는 메소드
	public List<QnaDTO> selectAjaxQnAList() {
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

	// 240724오후7시50분 새로 시작
	// 로그인 했는디 답변
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

	// ============================= 전체 미답변
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

	public List<QnaDTO> selectQnAList(int productNo, int secretCheck, String replyStatus, int memberNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaDTO> qnaList = new ArrayList<>();

		try {
			con = getConnection();
			// SELECT * FROM QNA WHERE QNA_PRODUCT_NO = ? AND QNA_STATUS = 2
			String sql = "SELECT * FROM QNA WHERE QNA_PRODUCT_NO = ?";
			if (secretCheck == 1) {
				sql += " AND QNA_STATUS = 2";
			}
			if ("unanswered_answer".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NULL";
			} else if ("answer_completed".equals(replyStatus)) {
				sql += " AND QNA_ANSWER IS NOT NULL";
			}
			if (memberNum != 0) {
				sql += " AND QNA_MEMBER_NO = ?";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			if (memberNum != 0) {
				pstmt.setInt(2, memberNum);
			}
			rs = pstmt.executeQuery();

			System.out.println(sql);

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
}
