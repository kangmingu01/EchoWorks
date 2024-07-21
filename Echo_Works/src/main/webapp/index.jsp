<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%
request.setCharacterEncoding("utf-8");

// 페이지 몸체부에 포함될 JSP 문서의 자겁 폴더명을 반환받아 저장
String workgroup = request.getParameter("workgroup");
if (workgroup == null) {
	workgroup = "main";
}

// 페이지 몸체부에 포함될 JSP 문서의 파일명을 반환받아 저장
String work = request.getParameter("work");
if (work == null) {
	work = "main_page";
}

String contentPath = workgroup + "/" + work + ".jsp";

// Header 교체
String headerPath = "/header.jsp";

if (workgroup.equals("main")) {
	headerPath = "/main_header.jsp";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ECHO WORKS</title>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
/>

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"
/>

<link rel="stylesheet" href="css/style.css" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body class="d-flex flex-column min-vh-100" >
	<%-- Header 영역 --%>
	<div>
		<jsp:include page="<%=headerPath%>" />
	</div>

	<%-- Content 영역 --%>
	<div id="content">
		<jsp:include page="<%=contentPath%>" />
		<%
		String returnUrl = (String) request.getAttribute("returnUrl");

		if (returnUrl != null) {
			response.sendRedirect(returnUrl);
			return;
		}
		%>
	</div>
	<%-- Footer 영역 --%>
	<div id="footer" class="mt-auto">
		<jsp:include page="footer.jsp" />
	</div>

	<!-- 부트스트랩 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"
	></script>
</body>
</html>