<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디를 전달받아 MEMBER 테이블에 저장된 행의 아이디와 비교해 중복결과를 HTML 문서에
포함하여 응답하는 JSP 문서 --%>
<%-- => 아이디 미중복 : 아이디 사용 가능 메세지를 출력하고 [아이디 사용] 태그를 클릭하면
부모 브라우저의 아이디 입력태그에 입력값으로 아이디를 출력 후 브라우저 종료 --%>
<%-- => 아이디 중복 : 아이디 사용 불가능 메세지를 출력하고 새로운 아이디를 입력받아 현재 
실행중인 JSP 문서(id_check.jsp) 문서를 다시 요청 - 입력값(아이디) 전달 --%>    
<%
	//전달값을 반환받아 저장
	String id=request.getParameter("id");

	if(id == null) {//전달값이 없는 경우 - 비정상적인 요청
		response.sendRedirect(request.getContextPath()+"/error/error_400.jsp");
		return;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 하나의 행을 검색하여 검색된 회원정보를 반환하는
	//MemberDAO 클래스의 메소드 호출
	// => null 반환 : 회원정보 미검색 - 아이디 미중복(아이디 사용 가능)
	// => MemberDTO 객체 반환 : 회원정보 검색 - 아이디 중복(아이디 사용 불가능)
	MemberDTO member=MemberDAO.getDAO().selectMemberById(id);
%>
<style type="text/css">
div {
	text-align: center;
	margin: 10px;
}

.id {
	font-weight: bold;
	color: red;
}
</style>
	<% if(member == null) {//전달받은 아이디가 중복되지 않은 경우 %>
		<div>입력된 <span class="id">[<%=id %>]</span>는 사용 가능한 아이디입니다.</div>
		<div>
			<button type="button" onclick="selectId();">아이디 사용</button>
		</div>
		
		<script type="text/javascript">
		function selectId() {
			//opener 객체 : 브라우저를 생성한 부모 브라우저를 표현한 자바스크립트 객체
			opener.join.id.value="<%=id%>";
			opener.join.idCheckResult.value="1";
			window.close();//브라우저 종료
		}
		</script>
	<% } else {//전달받은 아이디가 중복된 경우 %>
		<div>입력된 <span class="id">[<%=id %>]</span>는 이미 사용중인 아이디입니다.<br>
		새로운 아이디를 입력하고 [확인] 버튼을 눌러주세요.</div>
		
		<div>
			<!-- form 태그의 action 속성을 생략하면 현재 실행중인 JSP 문서 요청 -->
			<!-- form 태그의 method 속성을 생략하면 GET 방식으로 JSP 문서 요청 -->
			<form name="checkForm">
				<input type="text" name="id">
				<button type="button" onclick="idCheck();">확인</button>
			</form>
		</div>
		<div id="message" style="color: red;"></div>
		
		<script type="text/javascript">
		function idCheck() {
			var id=checkForm.id.value;
			if(id == "") {
				document.getElementById("message").innerHTML="아이디를 입력해 주세요.";
				return;
			}
			
			var idReg=/^[a-zA-Z]\w{5,19}$/g;
			if(!idReg.test(id)) {
				document.getElementById("message").innerHTML="아이디를 형식에 맞게 입력해 주세요.";
				return;
			}
			
			checkForm.submit();
		}
		</script>
	<% } %>