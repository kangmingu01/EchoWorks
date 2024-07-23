<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap');
* {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            color: black;
        }

.form-container {
            margin-top: 50px;
            display: flex;
            justify-content: center;
        }
        
form {
            width: 100%;
            max-width: 450px;
            padding: 30px;
            border: 2px solid black;
            border-radius: 20px;
            box-shadow: 8px 4px 16px rgba(0, 0, 0, 0.3);
            height: 550px; 
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
  .btn-primary {
            width: 100%;
            border: none;
            border-radius: 50px;
            background: black;
            transition: transform 0.3s ease;
        }
        .btn-primary:hover {
            transform: scale(1.05); /* 호버 시 버튼을 약간 크게 확대 */
            background-color: black; /* 배경색을 검정색으로 유지 */
        }
   .form-control {
            color: black;
            border-bottom-color: rgba(0, 0, 0, .42);
            box-shadow: none !important;
            border: none;
            border-bottom: 1px solid;
            border-radius: 4px 4px 0 0;
        }
    .form-text a {
            color: black;
            text-decoration: none;
        }
    .form-text a:hover {
            color: black; /* 링크에 호버 시 검정색으로 유지 */
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
    @keyframes shake { /* 흔들리는 효과 */
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }
</style>
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 form-container">
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
                    <div id="join" class="form-text mt-3"><a href="http://localhost:8000/Echo_Works/member/member_join.jsp">회원가입</a></div>
                    <div class="form-text mt-3 links-container">
                        <a href="http://localhost:8000/web/project/idfind.html">아이디 찾기 | </a>
                        <a href="http://localhost:8000/web/project/passwordfind.html">비밀번호 찾기</a>
                    </div>
                </div>
                <button type="button" class="btn btn-primary mt-3" id="login_btn">로그인</button>
                <div id="message"><%=message %></div>
            </form>
        </div>
    </div>
</div>
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