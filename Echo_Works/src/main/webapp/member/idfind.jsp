<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
   
    <style>
        /* 전체 body 스타일 설정 */
        body {
            background: white; /* 배경색을 흰색으로 설정 */
            margin: 0; /* 페이지 여백을 0으로 설정 */
        }

        /* 폼 컨테이너 스타일 설정 */
        .form-container {
            width: 100%; /* 너비를 100%로 설정 */
            max-width: 450px; /* 최대 너비를 450px로 설정 */
            padding: 30px; /* 내부 여백을 30px로 설정 */
            border: 2px solid black; /* 테두리를 검정색으로 설정 */
            border-radius: 20px; /* 모서리를 둥글게 설정 */
            box-shadow: 8px 4px 16px rgba(0, 0, 0, 0.3); /* 그림자를 설정하여 입체감을 줌 */
            margin: 100px auto; /* 상단 여백 100px, 중앙 정렬 */
        }

        /* 기본 버튼 스타일 설정 */
        .btn-primary {
            width: 100%; /* 너비를 100%로 설정 */
            border: none; /* 테두리를 제거 */
            border-radius: 50px; /* 모서리를 둥글게 설정 */
            background: black; /* 배경색을 검정색으로 설정 */
            transition: transform 0.3s ease; /* 부드러운 크기 변환 효과 추가 */
        }

        /* 기본 버튼 hover 시 스타일 설정 */
        .btn-primary:hover {
            transform: scale(1.05); /* 버튼 크기를 1.05배 확대 */
            background-color: black; /* 배경색을 검정색으로 유지 */
        }

        /* 입력 필드 스타일 설정 */
        .form-control {
            color: black; /* 글자 색상을 검정색으로 설정 */
            border-bottom-color: rgba(0, 0, 0, .42); /* 하단 테두리 색상 설정 */
            box-shadow: none !important; /* 그림자 제거 */
            border: none; /* 테두리를 제거 */
            border-bottom: 1px solid; /* 하단 테두리 추가 */
            border-radius: 4px 4px 0 0; /* 하단 모서리를 둥글게 설정 */
        }

        /* 타이틀 스타일 설정 */
        .idfinditile {
            font-size: 2rem; /* 글자 크기 설정 */
            font-weight: 700; /* 글자 두께 설정 */
            text-align: center; /* 텍스트 가운데 정렬 */
            margin-bottom: 20px; /* 하단 여백 설정 */
        }

        /* 에러 메세지 스타일 설정 */
        .error {
            color: red; /* 글자 색상을 빨간색으로 설정 */
            font-size: 0.875rem; /* 글자 크기 설정 */
            margin-top: 0.5rem; /* 상단 여백 설정 */
        }

        /* 유효성 검사 실패 시 입력 필드 스타일 설정 */
        .form-control.is-invalid {
            border-color: red; /* 테두리 색상을 빨간색으로 설정 */
            animation: shake 0.5s; /* 흔들림 애니메이션 추가 */
        }

        /* 흔들림 애니메이션 키프레임 설정 */
        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }

        /* 결과 메세지 스타일 설정 */
        .result-message {
            background-color: #d4edda; /* 배경색을 연녹색으로 설정 */
            color: #155724; /* 글자 색상을 짙은 녹색으로 설정 */
            padding: 10px; /* 내부 여백 설정 */
            border: 1px solid #c3e6cb; /* 테두리 설정 */
            border-radius: 4px; /* 모서리를 둥글게 설정 */
            margin-top: 20px; /* 상단 여백 설정 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }
    </style>
</head>
<body>
<div class="form-container">
    <!-- 아이디 찾기 폼 -->
    <form id="findIdForm">
        <h4 class="idfinditile">아이디 찾기</h4>
        <!-- 이름 입력 필드 -->
        <div class="mb-3">
            <label for="nameInput" class="form-label">이름</label>
            <input type="text" class="form-control" id="nameInput" placeholder="이름을 입력하세요">
            <div id="nameError" class="error"></div>
        </div>
        <!-- 이메일 입력 필드 -->
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
</body>
</html>
