<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <style>
        body {
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

        .idfinditile {
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
<div class="form-container">
    <form id="findIdForm">
        <h4 class="idfinditile">아이디 찾기</h4>
        <div class="mb-3">
            <label for="nameInput" class="form-label">이름</label>
            <input type="text" class="form-control" id="nameInput" placeholder="이름을 입력하세요">
            <div id="nameError" class="error"></div>
        </div>
        <div class="mb-3">
            <label for="emailInput" class="form-label">이메일로 찾기</label>
            <input type="email" class="form-control" id="emailInput" placeholder="이메일을 입력하세요">
            <div id="emailError" class="error"></div>
        </div>
        <button type="submit" class="btn btn-primary mt-3">확인</button>
        <div id="resultMessage" class="result-message" style="display: none;"></div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('nameInput').focus();
    });

    document.getElementById('findIdForm').addEventListener('submit', function(event) {
        event.preventDefault();
        var name = document.getElementById('nameInput').value.trim();
        var email = document.getElementById('emailInput').value.trim();
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

        if (valid) {
            $.ajax({
                url: "<%=request.getContextPath()%>/member/idfind_action.jsp",
                type: 'POST',
                data: { name: name, email: email },
                success: function(response) {
                    $('#resultMessage').html(response).show();
                },
                error: function() {
                    alert('아이디 찾기에 실패했습니다. 다시 시도해주세요.');
                }
            });
        }
    });

    document.getElementById('findIdForm').addEventListener('keypress', function(event) {
        if (event.keyCode === 13) { // Enter key의 keyCode는 13입니다.
            event.preventDefault();
            var name = document.getElementById('nameInput').value.trim();
            var email = document.getElementById('emailInput').value.trim();
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

            if (valid) {
                $.ajax({
                    url: "<%=request.getContextPath()%>/member/idfind_action.jsp",
                    type: 'POST',
                    data: { name: name, email: email },
                    success: function(response) {
                        $('#resultMessage').html(response).show();
                    },
                    error: function() {
                        alert('아이디 찾기에 실패했습니다. 다시 시도해주세요.');
                    }
                });
            }
        }
    });
</script>