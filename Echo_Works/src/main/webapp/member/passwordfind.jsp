<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
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
    </style>
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="form-container">
    <form id="findPasswordForm" method="post" action="passwordfind_action.jsp">
        <h4>비밀번호 찾기</h4>
        <div class="mb-3">
            <label for="nameInput" class="form-label">이름</label>
            <input type="text" class="form-control" id="nameInput" name="name" placeholder="이름을 입력하세요">
            <div id="nameError" class="error"></div>
        </div>
        <div class="mb-3">
            <label for="emailInput" class="form-label">이메일</label>
            <input type="email" class="form-control" id="emailInput" name="email" placeholder="이메일을 입력하세요">
            <div id="emailError" class="error"></div>
        </div>
        <div class="mb-3">
            <label for="idInput" class="form-label">아이디</label>
            <input type="text" class="form-control" id="idInput" name="id" placeholder="아이디를 입력하세요">
            <div id="idError" class="error"></div>
        </div>
        <button type="submit" class="btn btn-primary mt-3">확인</button>
    </form>
    <div id="result" class="mt-3"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.getElementById('findPasswordForm').addEventListener('submit', function(event) {
        event.preventDefault();
        var name = document.getElementById('nameInput').value.trim();
        var email = document.getElementById('emailInput').value.trim();
        var id = document.getElementById('idInput').value.trim();
        var valid = true;

        if (name === "") {
            valid = false;
            document.getElementById('nameError').textContent = "이름을 입력해 주세요.";
            document.getElementById('nameInput').classList.add('is-invalid');
        } else {
            document.getElementById('nameError').textContent = "";
            document.getElementById('nameInput').classList.remove('is-invalid');
        }

        if (email === "") {
            valid = false;
            document.getElementById('emailError').textContent = "이메일을 입력해 주세요.";
            document.getElementById('emailInput').classList.add('is-invalid');
        } else {
            document.getElementById('emailError').textContent = "";
            document.getElementById('emailInput').classList.remove('is-invalid');
        }

        if (id === "") {
            valid = false;
            document.getElementById('idError').textContent = "아이디를 입력해 주세요.";
            document.getElementById('idInput').classList.add('is-invalid');
        } else {
            document.getElementById('idError').textContent = "";
            document.getElementById('idInput').classList.remove('is-invalid');
        }

        if (valid) {
            $.post('passwordfind_action.jsp', { name: name, email: email, id: id }, function(response) {
                document.getElementById('result').innerHTML = response;
            });
        }
    });
</script>
<jsp:include page="/footer.jsp" />
</body>
</html>
