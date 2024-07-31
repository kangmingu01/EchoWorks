<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <%-- 다음 우편번호 서비스 API 스크립트 --%>

    <style>
       
        .form-container {
            margin-top: 50px; <%-- 상단 마진 설정 --%>
            display: flex;
            justify-content: center; <%-- 가운데 정렬 --%>
        }
        form {
            width: 100%;
            max-width: 800px; <%-- 최대 너비 설정 --%>
            padding: 30px; <%-- 내부 여백 설정 --%>
            border: 2px solid black; <%-- 검은색 테두리 설정 --%>
            border-radius: 20px; <%-- 테두리 둥글게 설정 --%>
            box-shadow: 8px 4px 16px rgba(0, 0, 0, 0.3); <%-- 그림자 설정 --%>
            height: auto;
            display: flex;
            flex-direction: column; <%-- 세로 정렬 --%>
            justify-content: center;
        }
        .btn-primary, .btn-secondary {
            border: none;
            border-radius: 50px; <%-- 버튼 테두리 둥글게 설정 --%>
            background: black; <%-- 버튼 배경 색상 --%>
            transition: transform 0.3s ease; <%-- 버튼 호버 시 확대 효과 --%>
        }
        .btn-primary:hover, .btn-secondary:hover {
            transform: scale(1.05); <%-- 확대 효과 --%>
            background-color: black;
        }
        .form-control {
            color: black; <%-- 글자 색상 --%>
            border-bottom-color: rgba(0, 0, 0, .42); <%-- 하단 테두리 색상 --%>
            box-shadow: none !important;
            border: none;
            border-bottom: 1px solid; <%-- 하단 테두리 설정 --%>
            border-radius: 4px 4px 0 0; <%-- 테두리 둥글게 설정 --%>
        }
        .jointitle {
            font-size: 2rem; <%-- 제목 글자 크기 --%>
            font-weight: 700; <%-- 글자 굵기 --%>
            text-align: center; <%-- 가운데 정렬 --%>
            margin-bottom: 20px; <%-- 하단 여백 --%>
        }
        .form-text a {
            color: black; <%-- 링크 글자 색상 --%>
            text-decoration: none; <%-- 링크 밑줄 제거 --%>
        }
        .form-text a:hover {
            color: black;
            text-decoration: underline; <%-- 링크 호버 시 밑줄 추가 --%>
        }
        .error {
            color: red; <%-- 오류 메시지 글자 색상 --%>
            font-size: 0.875rem; <%-- 글자 크기 --%>
            margin-left: 10px; <%-- 왼쪽 여백 --%>
            display: block;
            visibility: hidden; <%-- 오류 메시지 기본 숨김 처리 --%>
            height: 1.2em; <%-- 최소 높이 설정 --%>
        }
        .form-control.is-invalid {
            border-color: red; <%-- 오류 발생 시 테두리 색상 --%>
            animation: shake 0.5s; <%-- 흔들림 애니메이션 --%>
        }
        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }
        #idCheck, #postSearch {
            font-size: 14px; <%-- 버튼 글자 크기 --%>
            font-weight: bold; <%-- 버튼 글자 굵기 --%>
            cursor: pointer; <%-- 포인터 커서 --%>
            margin-left: 10px; <%-- 왼쪽 여백 --%>
            padding: 5px 15px; <%-- 내부 여백 --%>
            border: 1px solid black; <%-- 테두리 설정 --%>
        }
        #idCheck:hover, #postSearch:hover {
            background: black; <%-- 버튼 호버 시 배경 색상 --%>
        }
    </style>

<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 form-container">
            <form id="join" action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_join_action" method="post">
                <input type="hidden" id="idCheckResult" value="0"> <%-- 아이디 중복 체크 결과를 저장하는 숨겨진 필드 --%>
                <h4 class="jointitle">회원가입</h4>
                <div class="mb-3 row">
                    <label for="id" class="col-sm-3 col-form-label">아이디</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="id" id="id">
                    </div>
                    <div class="col-sm-3">
                        <span id="idCheck" class="btn btn-outline-secondary btn-sm">중복 검사</span> <%-- 중복 검사 버튼 --%>
                    </div>
                    <div class="col-sm-9 offset-sm-3">
                        <div id="idMsg" class="error">아이디를 입력해 주세요.</div> <%-- 아이디 입력 오류 메시지 --%>
                        <div id="idRegMsg" class="error">아이디는 영문자로 시작되는 영문자,숫자,_의 6~20범위의 문자로만 작성 가능합니다.</div> <%-- 아이디 형식 오류 메시지 --%>
                        <div id="idCheckMsg" class="error">아이디 중복 검사를 반드시 실행해 주세요.</div> <%-- 아이디 중복 검사 오류 메시지 --%>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="passwd" class="col-sm-3 col-form-label">비밀번호</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" name="passwd" id="passwd">
                        <div id="passwdMsg" class="error">비밀번호를 입력해 주세요.</div> <%-- 비밀번호 입력 오류 메시지 --%>
                        <div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div> <%-- 비밀번호 형식 오류 메시지 --%>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="repasswd" class="col-sm-3 col-form-label">비밀번호 확인</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" name="repasswd" id="repasswd">
                        <div id="repasswdMsg" class="error">비밀번호 확인을 입력해 주세요.</div> <%-- 비밀번호 확인 입력 오류 메시지 --%>
                        <div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이 서로 맞지 않습니다.</div> <%-- 비밀번호 일치 오류 메시지 --%>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="name" class="col-sm-3 col-form-label">이름</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="name" id="name">
                        <div id="nameMsg" class="error">이름을 입력해 주세요.</div> <%-- 이름 입력 오류 메시지 --%>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="email" class="col-sm-3 col-form-label">이메일</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="email" id="email">
                        <div id="emailMsg" class="error">이메일을 입력해 주세요.</div> <%-- 이메일 입력 오류 메시지 --%>
                        <div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div> <%-- 이메일 형식 오류 메시지 --%>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="mobile2" class="col-sm-3 col-form-label">전화번호</label>
                    <div class="col-sm-3">
                        <select name="mobile1" class="form-select">
                            <option value="010" selected>&nbsp;010&nbsp;</option>
                            <option value="011">&nbsp;011&nbsp;</option>
                            <option value="016">&nbsp;016&nbsp;</option>
                            <option value="017">&nbsp;017&nbsp;</option>
                            <option value="018">&nbsp;018&nbsp;</option>
                            <option value="019">&nbsp;019&nbsp;</option>
                        </select> <%-- 전화번호 앞자리 선택 필드 --%>
                    </div>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="mobile2" id="mobile2" maxlength="4">
                    </div>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="mobile3" id="mobile3" maxlength="4">
                    </div>
                    <div class="col-sm-9 offset-sm-3">
                        <div id="mobileMsg" class="error">전화번호를 입력해 주세요.</div> <%-- 전화번호 입력 오류 메시지 --%>
                        <div id="mobileRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해 주세요.</div> <%-- 전화번호 형식 오류 메시지 --%>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">우편번호</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="zipcode" id="zipcode" size="7" readonly="readonly">
                    </div>
                    <div class="col-sm-3">
                        <span id="postSearch" class="btn btn-outline-secondary btn-sm">우편번호 검색</span> <%-- 우편번호 검색 버튼 --%>
                    </div>
                    <div class="col-sm-9 offset-sm-3">
                        <div id="zipcodeMsg" class="error">우편번호를 입력해 주세요.</div> <%-- 우편번호 입력 오류 메시지 --%>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="address1" class="col-sm-3 col-form-label">기본주소</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="address1" id="address1" readonly="readonly">
                        <div id="address1Msg" class="error">기본주소를 입력해 주세요.</div> <%-- 기본주소 입력 오류 메시지 --%>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="address2" class="col-sm-3 col-form-label">상세주소</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="address2" id="address2">
                        <div id="address2Msg" class="error">상세주소를 입력해 주세요.</div> <%-- 상세주소 입력 오류 메시지 --%>
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary mt-3">회원가입</button> <%-- 회원가입 버튼 --%>
                    <button type="reset" class="btn btn-secondary mt-3 ms-2">다시입력</button> <%-- 폼 리셋 버튼 --%>
                </div>
            </form>
        </div>
    </div>
</div>
<br>
<script>
    $("#id").focus(); <%-- 페이지 로드 시 아이디 입력 필드에 포커스 --%>
    $("#join").submit(function() {
        var submitResult = true; <%-- 제출 가능 여부를 저장하는 변수 --%>
        $(".error").css("visibility", "hidden"); <%-- 모든 오류 메시지를 숨김 --%>
        var idReg = /^[a-zA-Z]\w{5,19}$/g; <%-- 아이디 정규표현식 --%>
        if ($("#id").val() == "") {
            $("#idMsg").css("visibility", "visible");
            $("#id").addClass("is-invalid");
            submitResult = false;
        } else if (!idReg.test($("#id").val())) {
            $("#idRegMsg").css("visibility", "visible");
            $("#id").addClass("is-invalid");
            submitResult = false;
        } else if ($("#idCheckResult").val() == "0") {
            $("#idCheckMsg").css("visibility", "visible");
            $("#id").addClass("is-invalid");
            submitResult = false;
        }
        var passwdReg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g; <%-- 비밀번호 정규표현식 --%>
        if ($("#passwd").val() == "") {
            $("#passwdMsg").css("visibility", "visible");
            $("#passwd").addClass("is-invalid");
            submitResult = false;
        } else if (!passwdReg.test($("#passwd").val())) {
            $("#passwdRegMsg").css("visibility", "visible");
            $("#passwd").addClass("is-invalid");
            submitResult = false;
        }
        if ($("#repasswd").val() == "") {
            $("#repasswdMsg").css("visibility", "visible");
            $("#repasswd").addClass("is-invalid");
            submitResult = false;
        } else if ($("#passwd").val() != $("#repasswd").val()) {
            $("#repasswdMatchMsg").css("visibility", "visible");
            $("#repasswd").addClass("is-invalid");
            submitResult = false;
        }
        if ($("#name").val() == "") {
            $("#nameMsg").css("visibility", "visible");
            $("#name").addClass("is-invalid");
            submitResult = false;
        }
        var emailReg = /^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g; <%-- 이메일 정규표현식 --%>
        if ($("#email").val() == "") {
            $("#emailMsg").css("visibility", "visible");
            $("#email").addClass("is-invalid");
            submitResult = false;
        } else if (!emailReg.test($("#email").val())) {
            $("#emailRegMsg").css("visibility", "visible");
            $("#email").addClass("is-invalid");
            submitResult = false;
        }
        var mobile2Reg = /\d{3,4}/; <%-- 전화번호 중간 번호 정규표현식 --%>
        var mobile3Reg = /\d{4}/; <%-- 전화번호 끝 번호 정규표현식 --%>
        if ($("#mobile2").val() == "" || $("#mobile3").val() == "") {
            $("#mobileMsg").css("visibility", "visible");
            $("#mobile2").addClass("is-invalid");
            $("#mobile3").addClass("is-invalid");
            submitResult = false;
        } else if (!mobile2Reg.test($("#mobile2").val()) || !mobile3Reg.test($("#mobile3").val())) {
            $("#mobileRegMsg").css("visibility", "visible");
            $("#mobile2").addClass("is-invalid");
            $("#mobile3").addClass("is-invalid");
            submitResult = false;
        }
        if ($("#zipcode").val() == "") {
            $("#zipcodeMsg").css("visibility", "visible");
            $("#zipcode").addClass("is-invalid");
            submitResult = false;
        }
        if ($("#address1").val() == "") {
            $("#address1Msg").css("visibility", "visible");
            $("#address1").addClass("is-invalid");
            submitResult = false;
        }
        if ($("#address2").val() == "") {
            $("#address2Msg").css("visibility", "visible");
            $("#address2").addClass("is-invalid");
            submitResult = false;
        }
        return submitResult;
    });
    $("#idCheck").click(function() {
        $("#idMsg").css("visibility", "hidden");
        $("#idRegMsg").css("visibility", "hidden");
        var idReg = /^[a-zA-Z]\w{5,19}$/g;
        if ($("#id").val() == "") {
            $("#idMsg").css("visibility", "visible");
            $("#id").addClass("is-invalid");
            return;
        } else if (!idReg.test($("#id").val())) {
            $("#idRegMsg").css("visibility", "visible");
            $("#id").addClass("is-invalid");
            return;
        }
        window.open("<%=request.getContextPath()%>/member/id_check.jsp?id=" + $("#id").val(), "idCheck", "width=450, height=130, left=700, top=400"); <%-- 아이디 중복 체크 팝업 창 열기 --%>
    });
    $("#id").change(function() {
        $("#idCheckResult").val("0");
        $("#id").removeClass("is-invalid");
    });
    function openPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                $("#zipcode").val(data.zonecode);
                $("#address1").val(data.address);
                $("#zipcode").removeClass("is-invalid");
                $("#address1").removeClass("is-invalid");
            }
        }).open(); <%-- 다음 우편번호 서비스 팝업 열기 --%>
    }
    $("#postSearch").click(openPostcode);
    $("#zipcode").click(openPostcode);
    $("#address1").click(openPostcode);
</script>