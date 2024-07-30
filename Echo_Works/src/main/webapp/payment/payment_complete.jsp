<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.show {
margin-top:160px;
margin-bottom: 50px;
}
.complete {
font-size: 250px;
}
</style>
</head>
<body>
<div class="d-flex justify-content-center align-items-center flex-grow-1 show">
<div class="d-flex justify-content-center flex-column align-items-center">
<i class="fa-solid fa-check-to-slot fa-bounce complete" style="color: #515b7b;"></i>
<div>
<h1>결제 완료!</h1>
<div>
<a href="<%=request.getContextPath() %>/index.jsp?" class="btn btn-dark btn-custom">홈으로</a>
<a href="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_mypage&paymentreocord" class="btn btn-outline-dark btn-custom">주문내역</a>
</div>
</div>
</div>
</div>

</body>
</html>