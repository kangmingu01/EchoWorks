package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import echoworks.dto.MemberDTO;



public class MemberDAO extends JdbcDAO {
	private static MemberDAO _dao;
	
	private MemberDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new MemberDAO();		
	}
	
	public static MemberDAO getDAO() {
		return _dao;
	}
	
	//회원정보(MemberDTO 객체)를 전달받아 MEMBER 테이블의 행으로 삽입하고 삽입행의 갯수(int)를 반환하는 메소드
	public int insertMember(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?,sysdate,null,null,1)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPasswd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getMemberEmail());
			pstmt.setString(5, member.getMemberMobile());
			pstmt.setString(6, member.getMemberZipcode());
			pstmt.setString(7, member.getMemberAddress1());
			pstmt.setString(8, member.getMemberAddress2());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertMember() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	// 아이디 찾기 기능 추가
	public MemberDTO findMemberByNameAndEmail(String name, String email) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    MemberDTO member = null;
	    try {
	        con = getConnection();
	        String sql = "SELECT * FROM member WHERE member_name = ? AND member_email = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, name);
	        pstmt.setString(2, email);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            member = new MemberDTO();
	            member.setMemberNum(rs.getInt("member_num"));
	            member.setMemberId(rs.getString("member_id"));
	            member.setMemberPasswd(rs.getString("member_passwd"));
	            member.setMemberName(rs.getString("member_name"));
	            member.setMemberEmail(rs.getString("member_email"));
	            member.setMemberMobile(rs.getString("member_mobile"));
	            member.setMemberZipcode(rs.getString("member_zipcode"));
	            member.setMemberAddress1(rs.getString("member_address1"));
	            member.setMemberAddress2(rs.getString("member_address2"));
	            member.setMemberRegisterDate(rs.getString("member_register_date"));
	            member.setMemberUpdateDate(rs.getString("member_update_date"));
	            member.setMemberLastLogin(rs.getString("member_last_login"));
	            member.setMemberAuth(rs.getInt("member_auth"));
	        }
	    } catch (SQLException e) {
	        System.out.println("[에러]findMemberByNameAndEmail() 메서드의 SQL 오류 = " + e.getMessage());
	    } finally {
	        close(con, pstmt, rs);
	    }
	    return member;
	}

    // 비밀번호 찾기
    public MemberDTO findPassword(String id, String name, String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO member = null;
        try {
            con = getConnection();
            String sql = "SELECT * FROM member WHERE member_id=? AND member_name=? AND member_email=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                member = new MemberDTO();
                member.setMemberNum(rs.getInt("member_num"));
                member.setMemberId(rs.getString("member_id"));
                member.setMemberPasswd(rs.getString("member_passwd"));
                member.setMemberName(rs.getString("member_name"));
                member.setMemberEmail(rs.getString("member_email"));
                member.setMemberMobile(rs.getString("member_mobile"));
                member.setMemberZipcode(rs.getString("member_zipcode"));
                member.setMemberAddress1(rs.getString("member_address1"));
                member.setMemberAddress2(rs.getString("member_address2"));
                member.setMemberRegisterDate(rs.getString("member_register_date"));
                member.setMemberUpdateDate(rs.getString("member_update_date"));
                member.setMemberLastLogin(rs.getString("member_last_login"));
                member.setMemberAuth(rs.getInt("member_auth"));
            }
        } catch (SQLException e) {
            System.out.println("[에러]findPassword() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return member;
    }
    // 이메일, 이름, 아이디로 회원 정보 조회
    public MemberDTO selectMemberByEmailNameAndId(String email, String name, String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO member = null;
        try {
            con = getConnection();
            String sql = "SELECT member_num, member_id, member_passwd, member_name, member_email, "
                       + "member_mobile, member_zipcode, member_address1, member_address2, "
                       + "member_register_date, member_update_date, member_last_login, member_auth "
                       + "FROM member WHERE member_email=? AND member_name=? AND member_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, name);
            pstmt.setString(3, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new MemberDTO();
                member.setMemberNum(rs.getInt("member_num"));
                member.setMemberId(rs.getString("member_id"));
                member.setMemberPasswd(rs.getString("member_passwd"));
                member.setMemberName(rs.getString("member_name"));
                member.setMemberEmail(rs.getString("member_email"));
                member.setMemberMobile(rs.getString("member_mobile"));
                member.setMemberZipcode(rs.getString("member_zipcode"));
                member.setMemberAddress1(rs.getString("member_address1"));
                member.setMemberAddress2(rs.getString("member_address2"));
                member.setMemberRegisterDate(rs.getString("member_register_date"));
                member.setMemberUpdateDate(rs.getString("member_update_date"));
                member.setMemberLastLogin(rs.getString("member_last_login"));
                member.setMemberAuth(rs.getInt("member_auth"));
            }
        } catch (SQLException e) {
            System.out.println("[에러]selectMemberByEmailNameAndId() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return member;
    }

	//아이디(String 객체)를 전달받아 MEMBER 테이블에 저장된 하나의 행을 검색하여 검색된 
	//회원정보(MemberDTO)를 반환하는 메소드
	public MemberDTO selectMemberById(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO member=null;
		try {
			con=getConnection();
			
			String sql="select member_num,member_id,member_passwd,member_name,member_email"
				+",member_mobile,member_zipcode,member_address1,member_address2"
				+",member_register_date,member_update_date,member_last_login,member_auth"
				+" from member where member_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();			
			
			if(rs.next()) {
				member=new MemberDTO();
				member.setMemberNum(rs.getInt("member_num"));
				member.setMemberId(rs.getString("member_id"));
				member.setMemberPasswd(rs.getString("member_passwd"));
				member.setMemberName(rs.getString("member_name"));
				member.setMemberEmail(rs.getString("member_email"));
				member.setMemberMobile(rs.getString("member_mobile"));
				member.setMemberZipcode(rs.getString("member_zipcode"));
				member.setMemberAddress1(rs.getString("member_address1"));
				member.setMemberAddress2(rs.getString("member_address2"));
				member.setMemberRegisterDate(rs.getString("member_register_date"));
				member.setMemberUpdateDate(rs.getString("member_update_date"));
				member.setMemberLastLogin(rs.getString("member_last_login"));
				member.setMemberAuth(rs.getInt("member_auth"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectMemberById() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	
	//회원번로(int)를 전달받아 MEMBER 테이블에 저장된 하나의 행을 검색하여 검색된 회원정보
	//(MemberDTO)를 반환하는 메소드
	public MemberDTO selectMemberByNum(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO member=null;
		try {
			con=getConnection();
			
			String sql="select member_num,member_id,member_passwd,member_name,member_email"
				+",member_mobile,member_zipcode,member_address1,member_address2"
				+",member_register_date,member_update_date,member_last_login,member_auth"
				+" from member where member_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();			
			
			if(rs.next()) {
				member=new MemberDTO();
				member.setMemberNum(rs.getInt("member_num"));
				member.setMemberId(rs.getString("member_id"));
				member.setMemberPasswd(rs.getString("member_passwd"));
				member.setMemberName(rs.getString("member_name"));
				member.setMemberEmail(rs.getString("member_email"));
				member.setMemberMobile(rs.getString("member_mobile"));
				member.setMemberZipcode(rs.getString("member_zipcode"));
				member.setMemberAddress1(rs.getString("member_address1"));
				member.setMemberAddress2(rs.getString("member_address2"));
				member.setMemberRegisterDate(rs.getString("member_register_date"));
				member.setMemberUpdateDate(rs.getString("member_update_date"));
				member.setMemberLastLogin(rs.getString("member_last_login"));
				member.setMemberAuth(rs.getInt("member_auth"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectMemberByNum() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	
	//회원번호(int)를 전달받아 MEMBER 테이블에 저장된 행에서 마지막 로그인 날짜를 현재 날짜와
	//시간으로 변경하고 변경행의 갯수(int)를 반환하는 메소드
	public int updateLastLogin(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update member set member_last_login=sysdate where member_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateLastLogin() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//회원정보(MemberDTO 객체)를 전달받아 MEMBER 테이블에 저장된 행을 변경하고 변경행의 갯수를 
	//반환하는 메소드
	public int updateMember(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update member set member_name=?,member_email=?,member_mobile=?"
					+ ",member_zipcode=?,member_address1=?,member_address2=? where member_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getMemberEmail());
			pstmt.setString(3, member.getMemberMobile());
			pstmt.setString(4, member.getMemberZipcode());
			pstmt.setString(5, member.getMemberAddress1());
			pstmt.setString(6, member.getMemberAddress2());
			pstmt.setInt(7, member.getMemberNum());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateMember() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//회원정보(MemberDTO 객체)를 전달받아 MEMBER 테이블에 저장된 행의 비빌번호를 변경하고 
	//변경행의 갯수를 반환하는 메소드
	public int updatePassword(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update member set member_passwd=? where member_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getMemberPasswd());
			pstmt.setInt(2, member.getMemberNum());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updatePassword() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//회원정보(MemberDTO 객체)를 전달받아 MEMBER 테이블에 저장된 행의 회원권한을 변경하고 
	//변경행의 갯수를 반환하는 메소드
	public int updateAuth(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update member set member_auth=? where member_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, member.getMemberAuth());
			pstmt.setInt(2, member.getMemberNum());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateAuth() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

}















