package echoworks.dto;

/*
create table member(member_num number primary key, member_id varchar2(30) unique, member_passwd varchar2(200)
    , member_name varchar2(30), member_email varchar2(50), member_mobile varchar2(20), member_zipcode varchar2(10)
    , member_address1 varchar2(200), member_address2 varchar2(100), member_register_date date
    , member_update_date date, member_last_login date, member_auth number(1));
    
create sequence member_seq;
*/

/*
이름                   널?       유형            
-------------------- -------- ------------- 
MEMBER_NUM           NOT NULL NUMBER        - 회원번호(PK)
MEMBER_ID                     VARCHAR2(30)  - 아이디(UNIQUE)
MEMBER_PASSWD                 VARCHAR2(200) - 비밀번호(암호화 처리)
MEMBER_NAME                   VARCHAR2(30)  - 이름
MEMBER_EMAIL                  VARCHAR2(50)  - 이메일 
MEMBER_MOBILE                 VARCHAR2(20)  - 전화번호 
MEMBER_ZIPCODE                VARCHAR2(10)  - 우편번호
MEMBER_ADDRESS1               VARCHAR2(200) - 기본주소
MEMBER_ADDRESS2               VARCHAR2(100) - 상세주소
MEMBER_REGISTER_DATE          DATE          - 회원가입날짜
MEMBER_UPDATE_DATE            DATE          - 회원변경날짜
MEMBER_LAST_LOGIN             DATE          - 마지막 로그인 날짜
MEMBER_AUTH                   NUMBER(1)     - 회원권한 : 0(탈퇴회원), 1(일반회원), 9(관리자)
*/

public class MemberDTO {
	private int memberNum;
	private String memberId;
	private String memberPasswd;
	private String memberName;
	private String memberEmail;
	private String memberMobile;
	private String memberZipcode;
	private String memberAddress1;
	private String memberAddress2;
	private String memberRegisterDate;
	private String memberUpdateDate;
	private String memberLastLogin;
	private int memberAuth;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPasswd() {
		return memberPasswd;
	}

	public void setMemberPasswd(String memberPasswd) {
		this.memberPasswd = memberPasswd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberMobile() {
		return memberMobile;
	}

	public void setMemberMobile(String memberMobile) {
		this.memberMobile = memberMobile;
	}

	public String getMemberZipcode() {
		return memberZipcode;
	}

	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}

	public String getMemberAddress1() {
		return memberAddress1;
	}

	public void setMemberAddress1(String memberAddress1) {
		this.memberAddress1 = memberAddress1;
	}

	public String getMemberAddress2() {
		return memberAddress2;
	}

	public void setMemberAddress2(String memberAddress2) {
		this.memberAddress2 = memberAddress2;
	}

	public String getMemberRegisterDate() {
		return memberRegisterDate;
	}

	public void setMemberRegisterDate(String memberRegisterDate) {
		this.memberRegisterDate = memberRegisterDate;
	}

	public String getMemberUpdateDate() {
		return memberUpdateDate;
	}

	public void setMemberUpdateDate(String memberUpdateDate) {
		this.memberUpdateDate = memberUpdateDate;
	}

	public String getMemberLastLogin() {
		return memberLastLogin;
	}

	public void setMemberLastLogin(String memberLastLogin) {
		this.memberLastLogin = memberLastLogin;
	}

	public int getMemberAuth() {
		return memberAuth;
	}

	public void setMemberAuth(int memberAuth) {
		this.memberAuth = memberAuth;
	}
}