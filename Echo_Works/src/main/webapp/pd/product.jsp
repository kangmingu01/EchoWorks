<%@page import="java.text.DecimalFormat"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//전달값(URL 주소)을 반환받아 저장
String url = request.getParameter("url");//왜 저장하지?
if (url == null) {url = "";}
String message = (String) session.getAttribute("message");
if (message == null){message = "";
} else {session.removeAttribute("message");}
String id = (String) session.getAttribute("id");
if (id == null) {id = "";
} else {session.removeAttribute("id");}

//검색리스트
	String cateOne =request.getParameter("cateOne");
	if(request.getParameter("cateOne") == null) {
		cateOne="";
	}
	String cateTwo =request.getParameter("cateTwo");
	if(request.getParameter("cateTwo") == null) {
		cateTwo="";
	}
	//List<ProductDTO> productList = ProductDAO.getDAO().selectProductAll();
	String keyword=request.getParameter("insearch");
	if(keyword == null) {
		keyword="";
	}
/* if(keyword==null){keyword="";
}else{productList=ProductDAO.getDAO().selectSearchList(keyword);} */
DecimalFormat money = new DecimalFormat("###,###");

//페이징 처리
	int pageNum=1;
	if(request.getParameter("pageNum") != null) {
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize=12;//체품 갯수
	int totalRow=ProductDAO.getDAO().selectTotalProductRows(keyword, cateOne, cateTwo);
	int totalPage=(int)Math.ceil((double)totalRow/pageSize);
	if(pageNum <= 0 || pageNum > totalPage) {
		pageNum=1;
	}
	int startRow=(pageNum-1)*pageSize+1;
	int endRow=pageNum*pageSize;
	if(endRow > totalRow) {
		endRow=totalRow;
	}
	int displayNum=totalRow-(pageNum-1)*pageSize;
	//리스트 받아와서 저장
	
	//List<ProductDTO> productList = ProductDAO.getDAO().selectProductAsList(startRow, endRow, keyword);
	List<ProductDTO> productList = ProductDAO.getDAO().selectProductList(startRow, endRow, keyword, cateOne, cateTwo);
%>
<style type="text/css">
<%if (request.getParameter("cateOne ") != null) { %> .<%=request .getParameter("cateOne")%>: { display : flex;}
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
#page_list{
	display:flex;
	justify-content:center;
	align-content:center;
}
#searchDiv{
	background: rgba(255, 255, 254, 1);
	z-index: 999;
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
			<form class="d-flex" method="post" action="<%=request.getContextPath() %>/index.jsp?workgroup=pd&work=product_action">
				<input class="form-control me-2" type="text" placeholder="Search" aria-label="Search" name="insearch" id="insearch">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
			<div class="form-control me-2" placeholder="Search" aria-label="Search" id="searchDiv" >
				<div id="searchList"></div>
			</div>
			<p id="inpopo"></p>
		</div> 
		<!--  상품 div -->
		<div class="keyboards_list mt-4 row gx-0 gy-3">
		<% if(totalRow == 0) { %>
			<tr>
				<td colspan="5">검색된 상품이 없습니다.</td>
			</tr>
		<% } else { %>
			<!--  상품 시작 ====================================== -->			
			<%if (productList != null) {%>
			    <%for (ProductDTO product : productList) {%>
		    	<%String price = money.format(product.getPRODUCT_PRICE());%>
			<div class="col-md-6 col-lg-4 col-xl-3 p-2 <%=product.getPRODUCT_CATEGORY_MAIN()%> <%=product.getPRODUCT_CATEGORY_SUB()%> PRDC">
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=detail&work=detail&product_no=<%=product.getPRODUCT_NO()%>" class="text-decoration-none text-black">
					<div class="Produck-img position-relative">
						<img src="<%=request.getContextPath()%>/assets/img/<%=product.getPRODUCT_IMG()%>.jpg" class="w-100" />
					</div>
					<div class="text-center">
						<p class="text-capitalize my-1"><%=product.getPRODUCT_NAME()%></p>
						<span class="fw-bold"><%=price%>원</span>
					</div>
				</a>
			</div>
			   <%}%>
			<%}%>
		<%}%>
			<!--  상품 끝 -->
			
		
			<%-- 페이지 번호 출력 --%>
	<%
		int blockSize=5;
		int startPage=(pageNum-1)/blockSize*blockSize+1; 
		int endPage=startPage+blockSize-1;
		if(endPage > totalPage) {
			endPage=totalPage;
		}
	%>
	<%
		String myUrl=request.getContextPath()+"/index.jsp?workgroup=pd&work=product"
			+"&pageSize="+pageSize+"&keyword="+keyword+"&cateOne="+cateOne+"&cateTwo="+cateTwo;
	%>
	
	<div id="page_list">
		<%-- 이전 블럭을 출력할 수 있는 링크 제공 --%>
		<% if(startPage > blockSize) { %>
			<a href="<%=myUrl%>&pageNum=<%=startPage-blockSize%>">[이전]</a>
		<% } else { %>
			[이전]
		<% } %>
	
		<% for(int i = startPage ; i <= endPage ; i++) { %>
			<%-- 현재 처리중인 페이지 번호와 출력된 페이지 번호가 같지 않은 경우 링크 제공 --%>
			<% if(pageNum != i) { %>
				<a href="<%=myUrl%>&pageNum=<%=i%>">[<%=i %>]</a>
			<%} else { %>
				[<%=i %>]
			<% } %>
		<% } %>

		<%-- 다음 블럭을 출력할 수 있는 링크 제공 --%>
		<% if(endPage != totalPage) { %>
			<a href="<%=myUrl%>&pageNum=<%=startPage+blockSize%>">[다음]</a>
		<% } else { %>
			[다음]
		<% } %>
	</div>
	
	
		</div>
	</div>
</section>
<!-- end product page -->


<!-- Js -->
<script type="text/javascript">	
	//---------------------------검색 기능 --------------------------------------
	 //$("#insearch").focus();
	 $("#insearch").keyup(function() {
		var insearch=$("#insearch").val();		
		if(insearch==""){
			$("#searchDiv").hide();
			return;
		}		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/pd/product_sch.jsp",
			data: {"insearch":insearch},
			dataType: "xml",
			success: function(xmlDoc) {
				var code=$(xmlDoc).find("code").text();				
				if(code=="success"){
					var data=$(xmlDoc).find("data").text();					
					var searchList=JSON.parse(data);					
					var html="";
					$(searchList).each(function() {
						html+="<a href='<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&insearch="+encodeURIComponent(this.pname)+"'>"+this.pname+"</a><br>";						
					});					
					$("#searchList").html(html);					
					$("#searchDiv").show();
				}else{
					$("#searchDiv").hide();
				}				
			},
			errror: function(xhr) {
				alert("에러코드 = "+xhr.status);
			}			
		});

	}); 
	//-------------상품 종류 수량 div-----
	var count = 0;
	<%if (request.getParameter("cateOne") != null) {%>
		<%if (request.getParameter("cateTwo") != null) {%>
			count = $(".<%=request.getParameter("cateTwo")%>").length-1;
		    $("#inpopo").text("<%=request.getParameter("cateTwo")%> " + count);							
		<%} else {%>
			count = $(".<%=request.getParameter("cateOne")%>").length-1;
	   	    $("#inpopo").text("<%=request.getParameter("cateOne")%> " + count);		
		<%}%>
	<%} else {%>
		/* count = $(".PRDC").length;
	    $("#inpopo").text("All " + count);	 */	
	<%}%>
	
	//내부버튼------------------
	$("#key_inStock").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keyboards&cateTwo=key_inStock"});
	$("#key_group").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keyboards&cateTwo=key_group"});
	$("#linear").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=switches&cateTwo=linear"});
	$("#tactile").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=switches&cateTwo=tactile"});
	$("#low").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=switches&cateTwo=low"});
	$("#magnet").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=switches&cateTwo=magnet"});
	$("#sw").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keycaps&cateTwo=sw"});
	$("#fbb").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keycaps&cateTwo=fbb"});
	$("#gmk").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keycaps&cateTwo=gmk"});
	$("#hammerworks").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=pd&work=product&cateOne=keycaps&cateTwo=hammerworks"});
	//=----------------------버튼  header버튼
	<%if (request.getParameter("cateOne") != null) {%>		
		<%-- $("#<%=request.getParameter("cateOne")%>Div").slideDown(250); --%>
		$(".PRDC").css({"display" : "none"});
		$("#<%=request.getParameter("cateOne")%>Div").css({"display" : "flex"});
		<%if (request.getParameter("cateTwo") != null) {%>
		$(".<%=request.getParameter("cateTwo")%>").css({"display" : ""});
		$("#<%=request.getParameter("cateTwo")%>").css({"font-weight" : "bold","color" : "white","border-radius" : "25px","background-color" : "rgb(85,85,85)"});	
		<%} else {%>	
		$(".<%=request.getParameter("cateOne")%>").css({"display" : ""});			
		<%}%>	
	<%}%>
    </script>