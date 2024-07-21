<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap');
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            color: black;
        }
        body {
            background: white;
            font-family: 'Poppins', sans-serif;
        }
        .form-container {
            margin-top: 50px;
            display: flex;
            justify-content: center;
        }
        form {
            width: 100%;
            max-width: 600px;
            padding: 30px;
            border: 2px solid black;
            border-radius: 20px;
            box-shadow: 8px 4px 16px rgba(0, 0, 0, 0.3);
            height: auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .btn-primary, .btn-secondary {
            border: none;
            border-radius: 50px;
            background: black;
            transition: transform 0.3s ease;
        }
        .btn-primary:hover, .btn-secondary:hover {
            transform: scale(1.05);
            background-color: black;
        }
        .form-control {
            color: black;
            border-bottom-color: rgba(0, 0, 0, .42);
            box-shadow: none !important;
            border: none;
            border-bottom: 1px solid;
            border-radius: 4px 4px 0 0;
        }
        h4 {
            font-size: 2rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-text a {
            color: black;
            text-decoration: none;
        }
        .form-text a:hover {
            color: black;
            text-decoration: underline;
        }
        .error {
            color: red;
            font-size: 0.875rem;
            margin-left: 10px; /* 오류 메시지를 입력 필드 옆에 표시 */
             display: none; /* 초기 상태에서 오류 메시지 숨기기 */
        }
        .form-control.is-invalid {
            border-color: red;
            animation: shake 0.5s;
        }
        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }
        #idCheck, #postSearch {
            font-size: 12px;
            font-weight: bold;
            cursor: pointer;
            margin-left: 10px;
            padding: 2px 10px;
            border: 1px solid black;
        }
        #idCheck:hover, #postSearch:hover {
            background: aqua;
        }
    </style>
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 form-container">
            <form id="join" action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_join_action" method="post">
                <input type="hidden" id="idCheckResult" value="0">
                <h4>회원가입</h4>
                <div class="mb-3 row">
                    <label for="id" class="col-sm-3 col-form-label">아이디</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="id" id="id">
                    </div>
                    <div class="col-sm-3">
                        <span id="idCheck" class="btn btn-outline-secondary btn-sm">아이디 중복 검사</span>
                    </div>
                    <div class="col-sm-9 offset-sm-3">
                        <div id="idMsg" class="error">아이디를 입력해 주세요.</div>
                        <div id="idRegMsg" class="error">아이디는 영문자로 시작되는 영문자,숫자,_의 6~20범위의 문자로만 작성 가능합니다.</div>
                        <div id="idCheckMsg" class="error">아이디 중복 검사를 반드시 실행해 주세요.</div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="passwd" class="col-sm-3 col-form-label">비밀번호</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" name="passwd" id="passwd">
                        <div id="passwdMsg" class="error">비밀번호를 입력해 주세요.</div>
                        <div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="repasswd" class="col-sm-3 col-form-label">비밀번호 확인</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" name="repasswd" id="repasswd">
                        <div id="repasswdMsg" class="error">비밀번호 확인을 입력해 주세요.</div>
                        <div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이 서로 맞지 않습니다.</div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="name" class="col-sm-3 col-form-label">이름</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="name" id="name">
                        <div id="nameMsg" class="error">이름을 입력해 주세요.</div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="email" class="col-sm-3 col-form-label">이메일</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="email" id="email">
                        <div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
                        <div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
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
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="mobile2" id="mobile2" maxlength="4">
                    </div>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="mobile3" id="mobile3" maxlength="4">
                    </div>
                    <div class="col-sm-9 offset-sm-3">
                        <div id="mobileMsg" class="error">전화번호를 입력해 입력해 주세요.</div>
                        <div id="mobileRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해 주세요.</div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">우편번호</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="zipcode" id="zipcode" size="7" readonly="readonly">
                    </div>
                    <div class="col-sm-3">
                        <span id="postSearch" class="btn btn-outline-secondary btn-sm">우편번호 검색</span>
                    </div>
                    <div class="col-sm-9 offset-sm-3">
                        <div id="zipcodeMsg" class="error">우편번호를 입력해 주세요.</div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="address1" class="col-sm-3 col-form-label">기본주소</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="address1" id="address1" readonly="readonly">
                        <div id="address1Msg" class="error">기본주소를 입력해 주세요.</div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="address2" class="col-sm-3 col-form-label">상세주소</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="address2" id="address2">
                        <div id="address2Msg" class="error">상세주소를 입력해 주세요.</div>
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary mt-3">회원가입</button>
                    <button type="reset" class="btn btn-secondary mt-3 ms-2">다시입력</button>
                </div>
            </form>
        </div>
    </div>
</div>
<br>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $("#id").focus();
    $("#join").submit(function() {
        var submitResult = true;
        $(".error").css("display", "none");
        var idReg = /^[a-zA-Z]\w{5,19}$/g;
        if ($("#id").val() == "") {
            $("#idMsg").css("display", "inline");
            submitResult = false;
        } else if (!idReg.test($("#id").val())) {
            $("#idRegMsg").css("display", "inline");
            submitResult = false;
        } else if ($("#idCheckResult").val() == "0") {
            $("#idCheckMsg").css("display", "inline");
            submitResult = false;
        }
        var passwdReg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
        if ($("#passwd").val() == "") {
            $("#passwdMsg").css("display", "inline");
            submitResult = false;
        } else if (!passwdReg.test($("#passwd").val())) {
            $("#passwdRegMsg").css("display", "inline");
            submitResult = false;
        }
        if ($("#repasswd").val() == "") {
            $("#repasswdMsg").css("display", "inline");
            submitResult = false;
        } else if ($("#passwd").val() != $("#repasswd").val()) {
            $("#repasswdMatchMsg").css("display", "inline");
            submitResult = false;
        }
        if ($("#name").val() == "") {
            $("#nameMsg").css("display", "inline");
            submitResult = false;
        }
        var emailReg = /^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
        if ($("#email").val() == "") {
            $("#emailMsg").css("display", "inline");
            submitResult = false;
        } else if (!emailReg.test($("#email").val())) {
            $("#emailRegMsg").css("display", "inline");
            submitResult = false;
        }
        var mobile2Reg = /\d{3,4}/;
        var mobile3Reg = /\d{4}/;
        if ($("#mobile2").val() == "" || $("#mobile3").val() == "") {
            $("#mobileMsg").css("display", "inline");
            submitResult = false;
        } else if (!mobile2Reg.test($("#mobile2").val()) || !mobile3Reg.test($("#mobile3").val())) {
            $("#mobileRegMsg").css("display", "inline");
            submitResult = false;
        }
        if ($("#zipcode").val() == "") {
            $("#zipcodeMsg").css("display", "inline");
            submitResult = false;
        }
        if ($("#address1").val() == "") {
            $("#address1Msg").css("display", "inline");
            submitResult = false;
        }
        if ($("#address2").val() == "") {
            $("#address2Msg").css("display", "inline");
            submitResult = false;
        }
        return submitResult;
    });
    $("#idCheck").click(function() {
        $("#idMsg").css("display", "none");
        $("#idRegMsg").css("display", "none");
        var idReg = /^[a-zA-Z]\w{5,19}$/g;
        if ($("#id").val() == "") {
            $("#idMsg").css("display", "inline");
            return;
        } else if (!idReg.test($("#id").val())) {
            $("#idRegMsg").css("display", "inline");
            return;
        }
        window.open("<%=request.getContextPath()%>/member/id_check.jsp?id=" + $("#id").val(), "idCheck", "width=450, height=130, left=700, top=400");
    });
    $("#id").change(function() {
        $("#idCheckResult").val("0");
    });
    $("#postSearch").click(function() {
        new daum.Postcode({
            oncomplete: function(data) {
                $("#zipcode").val(data.zonecode);
                $("#address1").val(data.address);
            }
        }).open();
    });
</script>
</body>
</html>
