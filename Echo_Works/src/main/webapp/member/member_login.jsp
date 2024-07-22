<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 사용자로부터 인증정보(아이디와 비밀번호)를 입력받기 위한 JSP 문서 --%>
<%-- => [로그인] 태그를 클릭한 경우 [/member/member_login_action.jsp] 문서를 요청하여 페이지 이동 - 입력값 전달 --%>
<%
    //전달값(URL 주소)을 반환받아 저장
    String url=request.getParameter("url");
    if(url == null) {
        url="";
    }

    String message=(String)session.getAttribute("message");
    if(message == null) {
        message="";
    } else {
        session.removeAttribute("message");
    }

    String id=(String)session.getAttribute("id");
    if(id == null) {
        id="";
    } else {
        session.removeAttribute("id");
    }

%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<!doctype html>
<html lang="ko" data-bs-theme="auto">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: white;
            margin: 0;
        }

        .form-container {
            width: 100%;
            max-width: 450px;
            padding: 30px;
            border: 2px solid black;
            border-radius: 20px;
            box-shadow: 8px 4px 16px rgba(0, 0, 0, 0.3);
            margin: 100px auto;
        }

        .btn-primary {
            width: 100%;
            border: none;
            border-radius: 50px;
            background: black;
            transition: transform 0.3s ease;
        }

        .btn-primary:hover {
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
            margin-top: 0.5rem;
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

        .result-message {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            border: 1px solid #c3e6cb;
            border-radius: 4px;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="form-container">
    <form id="loginForm" name="loginForm" method="post" action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_login_action">
        <input type="hidden" name="url" value="<%=url%>">
        <h4>로그인</h4>
        <div class="mb-3">
            <label for="exampleInputId" class="form-label">아이디</label>
            <input type="text" class="form-control" id="exampleInputId" name="id" value="<%=id%>" aria-describedby="idHelp" placeholder="아이디를 입력해주세요.">
            <div id="idError" class="error"></div>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="passwd" placeholder="비밀번호를 입력해주세요.">
            <div id="passwordError" class="error"></div>
            <div class="form-text mt-3">
                <a href="<%=request.getContextPath()%>/member/terms.jsp">회원가입</a>
            </div>
            <div class="form-text mt-3 links-container">
                <a href="<%=request.getContextPath()%>/member/idfind.jsp">아이디 찾기 | </a>
                <a href="<%=request.getContextPath()%>/member/passwordfind.jsp">비밀번호 찾기</a>
            </div>
        </div>
        <button type="button" class="btn btn-primary mt-3" id="login_btn">로그인</button>
        <div id="message" class="result-message" style="<%= message.isEmpty() ? "display:none;" : "" %>"><%=message %></div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $("#exampleInputId").focus();

        $("#login_btn").click(function() {
            var isValid = true;

            if($("#exampleInputId").val().trim() == "") {
                $("#exampleInputId").addClass("is-invalid");
                $("#idError").text("아이디를 입력해 주세요.");
                isValid = false;
            } else {
                $("#exampleInputId").removeClass("is-invalid");
                $("#idError").text("");
            }
            
            if($("#exampleInputPassword1").val().trim() == "") {
                $("#exampleInputPassword1").addClass("is-invalid");
                $("#passwordError").text("비밀번호를 입력해 주세요.");
                isValid = false;
            } else {
                $("#exampleInputPassword1").removeClass("is-invalid");
                $("#passwordError").text("");
            }

            if(isValid) {
                $("#loginForm").submit();
            }
        });
    });
</script>
</body>
</html>
