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
	String headerPath="/header.jsp";
	
	if(workgroup.equals("main")) {
		headerPath="/main_header.jsp";
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
</head>
<body>
	<%-- Header 영역 --%>
	<div>
		<jsp:include page="<%=headerPath%>"/>
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
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- 부트스트랩 offcanvas -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"
	></script>

	<!-- 부트스트랩 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"
	></script>
</body>
</html>