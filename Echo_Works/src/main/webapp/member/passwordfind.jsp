<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <style>
        body {
            background: white; /* 배경색을 흰색으로 설정 */
            margin: 0; /* 여백을 없앰 */
        }

        .form-container {
            width: 100%; /* 전체 너비 */
            max-width: 450px; /* 최대 너비 450px */
            padding: 30px; /* 내부 여백 */
            border: 2px solid black; /* 검은색 외곽선 */
            border-radius: 20px; /* 테두리 둥글게 설정 */
            box-shadow: 8px 4px 16px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
            margin: 100px auto; /* 상단 여백 100px, 수평 중앙 정렬 */
        }

        .btn-primary {
            width: 100%; /* 버튼 너비를 100%로 설정 */
            border: none; /* 외곽선 제거 */
            border-radius: 50px; /* 버튼을 둥글게 설정 */
            background: black; /* 배경색을 검은색으로 설정 */
            transition: transform 0.3s ease; /* 트랜지션 효과 설정 */
        }

        .btn-primary:hover {
            transform: scale(1.05); /* 마우스 오버 시 크기 확대 */
            background-color: black; /* 배경색을 검은색으로 유지 */
        }

        .form-control {
            color: black; /* 텍스트 색상을 검은색으로 설정 */
            border-bottom-color: rgba(0, 0, 0, .42); /* 하단 테두리 색상 설정 */
            box-shadow: none !important; /* 박스 그림자 제거 */
            border: none; /* 외곽선 제거 */
            border-bottom: 1px solid; /* 하단에만 테두리 설정 */
            border-radius: 4px 4px 0 0; /* 하단 테두리 둥글게 설정 */
        }

        .passwordfindtitle {
            font-size: 2rem; /* 제목 글자 크기 설정 */
            font-weight: 700; /* 글자 굵기 설정 */
            text-align: center; /* 텍스트 중앙 정렬 */
            margin-bottom: 20px; /* 하단 여백 설정 */
        }

        .error {
            color: red; /* 오류 메시지 색상 설정 */
            font-size: 0.875rem; /* 글자 크기 설정 */
            margin-top: 0.5rem; /* 상단 여백 설정 */
        }

        .form-control.is-invalid {
            border-color: red; /* 오류 시 테두리 색상 빨간색으로 설정 */
            animation: shake 0.5s; /* 애니메이션 설정 */
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
<div class="form-container">
    <form id="findPasswordForm" method="post" action="passwordfind_action.jsp">
        <h4 class="passwordfindtitle">비밀번호 찾기</h4> <%-- 페이지 제목 --%>
        <div class="mb-3">
            <label for="nameInput" class="form-label">이름</label> <%-- 이름 입력 필드 라벨 --%>
            <input type="text" class="form-control" id="nameInput" name="name" placeholder="이름을 입력하세요">
            <div id="nameError" class="error"></div> <%-- 이름 입력 오류 메시지 --%>
        </div>
        <div class="mb-3">
            <label for="emailInput" class="form-label">이메일</label> <%-- 이메일 입력 필드 라벨 --%>
            <input type="email" class="form-control" id="emailInput" name="email" placeholder="이메일을 입력하세요">
            <div id="emailError" class="error"></div> <%-- 이메일 입력 오류 메시지 --%>
        </div>
        <div class="mb-3">
            <label for="idInput" class="form-label">아이디</label> <%-- 아이디 입력 필드 라벨 --%>
            <input type="text" class="form-control" id="idInput" name="id" placeholder="아이디를 입력하세요">
            <div id="idError" class="error"></div> <%-- 아이디 입력 오류 메시지 --%>
        </div>
        <button type="submit" class="btn btn-primary mt-3">확인</button> <%-- 확인 버튼 --%>
    </form>
    <div id="result" class="mt-3"></div> <%-- 결과 출력 영역 --%>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('nameInput').focus(); <%-- 페이지 로드 시 이름 입력 필드에 포커스 --%>
    });

    document.getElementById('findPasswordForm').addEventListener('submit', function(event) {
        event.preventDefault(); <%-- 폼 제출 기본 동작 방지 --%>
        var name = document.getElementById('nameInput').value.trim();
        var email = document.getElementById('emailInput').value.trim();
        var id = document.getElementById('idInput').value.trim();
        var valid = true;

        if (name === "") {
            valid = false;
            document.getElementById('nameError').textContent = "이름을 입력해 주세요."; <%-- 이름 입력 오류 메시지 --%>
            document.getElementById('nameInput').classList.add('is-invalid'); <%-- 이름 입력 필드에 오류 클래스 추가 --%>
        } else {
            document.getElementById('nameError').textContent = ""; 
            document.getElementById('nameInput').classList.remove('is-invalid');
        }

        if (email === "") {
            valid = false;
            document.getElementById('emailError').textContent = "이메일을 입력해 주세요."; <%-- 이메일 입력 오류 메시지 --%>
            document.getElementById('emailInput').classList.add('is-invalid'); <%-- 이메일 입력 필드에 오류 클래스 추가 --%>
        } else {
            document.getElementById('emailError').textContent = "";
            document.getElementById('emailInput').classList.remove('is-invalid');
        }

        if (id === "") {
            valid = false;
            document.getElementById('idError').textContent = "아이디를 입력해 주세요."; <%-- 아이디 입력 오류 메시지 --%>
            document.getElementById('idInput').classList.add('is-invalid'); <%-- 아이디 입력 필드에 오류 클래스 추가 --%>
        } else {
            document.getElementById('idError').textContent = ""; 
            document.getElementById('idInput').classList.remove('is-invalid');
        }

        if (valid) {
        	 $.post('<%=request.getContextPath()%>/member/passwordfind_action.jsp', { name: name, email: email, id: id }, function(response) {
                document.getElementById('result').innerHTML = response; <%-- 서버 응답을 결과 영역에 표시 --%>
            });
        }
    });
</script>
</body>
</html>
