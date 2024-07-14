package echoworks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//JDBC 기능을 제공하는 DAO 클래스가 상속받아 사용하기 위해 작성된 부모클래스
// => 추상클래스(상속을 목적으로 작성된 클래스)로 작성하는 것을 권장
// => WAS 프로그램에 의해 관리되는 DataSource 객체를 반환받아 필드에 저장하여 사용
public abstract class JdbcDAO {
	private static DataSource dataSource;

	// 클래스가 처음 로드될 때 실행됨
	// JNDI(Java Naming and Directory Interface)를 사용하여 DataSource 객체를 검색하고 초기화한다.
	static {
		try {
			dataSource=(DataSource)new InitialContext().lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	// DataSource 객체를 통해 데이터베이스 연결을 얻어 반환한다.
	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	// 밑에 3개는 자원을 해제하는 메서드
	public void close(Connection con) {
		try {
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt) {
		try {
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}