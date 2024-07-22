<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달값(URL 주소)을 반환받아 저장
	String url=request.getParameter("url");//왜 저장하지?
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
	//리스트 받아와서 저장
	List<ProductDTO> productList=ProductDAO.getDAO().selectProductAll();
%>
<style type="text/css">
<% System.out.println(request.getParameter("cateOne"));%>
<%if(request.getParameter("cateOne")!=null){ %>
.<%=request.getParameter("cateOne")%>:{
	display: flex;
}
<%}%>


.btn:hover {
 font-weight: bold;
}

.Produck-img {
	overflow: hidden;
}

.Produck-img img {
 	-webkit-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
}

.Produck-img img:hover {
	-webkit-transform: scale(1.2);
	-ms-transform: scale(1.2);
	transform: scale(1.2);
}

.dropdown-menu {
	display: none;
}
</style>
<!-- product page -->

	<section id="PDpage" class="">
		<div class="container">
			<!-- button div 모음 -->
			<div class="row">
				<div class="flex-wrap justify-content-center sub-btn"
					id="keyboardsDiv" style="display: none;">
					<button type="button" class="btn m-2  active-filter-btn"
						id="key_inStock">Keyboard in-Stoke</button>
					<button type="button" class="btn m-2 " id="key_group">Keboard
						Group-buy</button>
				</div>
				<div class="flex-wrap justify-content-center sub-btn"
					id="switchesDiv" style="display: none;">
					<button type="button" class="btn m-2  active-filter-btn text-sm"
						id="linear">리니어</button>
					<button type="button" class="btn m-2 " id="tactile">택타일</button>
					<button type="button" class="btn m-2 " id="low">저소음</button>
					<button type="button" class="btn m-2 " id="magnet">마그네틱</button>
				</div>
				<div class=" flex-wrap justify-content-center sub-btn"
					id="keycapsDiv" style="display: none;">
					<button type="button" class="btn m-2 " id="sw">SW</button>
					<button type="button" class="btn m-2 " id="fbb">FBB</button>
					<button type="button" class="btn m-2 " id="gmk">GMK</button>
					<button type="button" class="btn m-2 " id="hammerworks">Hammerworks</button>
				</div>
			</div>
			<!--  버튼 div 끝  -->

			<!--  상황표 ? 그 숫자 =============================================================================-->
		
			<div class="" id="inpo">
				<p id="inpopo"></p>
			</div>
				

			<!--  상품 div -->
			<div class="keyboards_list mt-4 row gx-0 gy-3">
			<!--  상품 시작 ====================================== -->
			<%if(productList !=null){ %>
				<%for(ProductDTO product : productList){ %>
				<div
					class="col-md-6 col-lg-4 col-xl-3 p-2 <%=product.getPRODUCT_CATEGORY_MAIN()%> <%=product.getPRODUCT_CATEGORY_SUB()%> PRDC" >
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=pd_detail&work=detail&product_no=<%=product.getPRODUCT_NO()%>" class="text-decoration-none text-black">
						<div class="Produck-img position-relative">
							<img src="<%=request.getContextPath()%>/assets/img/<%=product.getPRODUCT_IMG() %>.jpg" class="w-100" />
						</div>
						<div class="text-center">
							<p class="text-capitalize my-1"><%=product.getPRODUCT_NAME()%></p>
							<span class="fw-bold"><%=product.getPRODUCT_PRICE()%>원</span>
						</div>
					</a>
				</div>
				<%} %>	
			<%} %>			
			<!--  상품 끝 -->
				
			</div>
		</div>
	</section>
	<!-- end product page -->


	<!-- Js -->
	<script type="text/javascript">	
	//-------------상품 종류 수량 div-----
	var count = 0;
	<%if(request.getParameter("cateOne")!=null){ %>
		<%if(request.getParameter("cateTwo")!=null){ %>
			count = $(".<%=request.getParameter("cateTwo")%>").length-1;
		    $("#inpopo").text("<%=request.getParameter("cateTwo")%> " + count);							
		<% }else{ %>
			count = $(".<%=request.getParameter("cateOne")%>").length-1;
	   	    $("#inpopo").text("<%=request.getParameter("cateOne")%> " + count);		
		<% } %>
	<% }else{ %>
		count = $(".PRDC").length;
	    $("#inpopo").text("All " + count);		
	<% } %>
	
	//내부버튼------------------
	$("#key_inStock").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keyboards&cateTwo=key_inStock"
	});
	$("#key_group").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keyboards&cateTwo=key_group"
	});
	$("#linear").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=switches&cateTwo=linear"
	});
	$("#tactile").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=switches&cateTwo=tactile"
	});
	$("#low").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=switches&cateTwo=low"
	});
	$("#magnet").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=switches&cateTwo=magnet"
	});
	$("#sw").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keycaps&cateTwo=sw"
	});
	$("#fbb").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keycaps&cateTwo=fbb"
	});
	$("#gmk").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keycaps&cateTwo=gmk"
	});
	$("#hammerworks").click(function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keycaps&cateTwo=hammerworks"
	});
	//=----------------------버튼  header버튼
	<%if(request.getParameter("cateOne")!=null){ %>		
		<%-- $("#<%=request.getParameter("cateOne")%>Div").slideDown(250); --%>
		$(".PRDC").css({"display" : "none"});
		$("#<%=request.getParameter("cateOne")%>Div").css({"display" : "flex"});
		<%if(request.getParameter("cateTwo")!=null){ %>
		$(".<%=request.getParameter("cateTwo")%>").css({"display" : ""});
		$("#<%=request.getParameter("cateTwo")%>").css({
			"font-weight" : "bold",
			"color" : "white",
			"border-radius" : "25px",
			"background-color" : "rgb(85,85,85)"
		});	
		<%}else{ %>	
		$(".<%=request.getParameter("cateOne")%>").css({"display" : ""});
			
		<%} %>	
	<%} %>
	
    </script>