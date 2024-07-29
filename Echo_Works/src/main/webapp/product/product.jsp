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
	
	#searchDiv {
		margin-top: 40px;
        background-color: white;
        border: 1px solid #ced4da;
        border-radius: .25rem;
        box-shadow: 0 0 5px rgba(0,0,0,0.2);
        max-width: 324px; /* input 태그와 같은 최대 너비 설정 */
    }
    #searchList a {
        display: block;
        padding: .5rem;
        color: black;
        text-decoration: none;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    #searchList a:hover {
        background-color: rgba(33, 37, 41, 0.1);
    }
    
.keyboards_list {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 기본: 4개의 열 */
    gap: 1rem; /* 항목 간의 간격 추가 */
    justify-content: start; /* 전체적으로 항목을 왼쪽 정렬 */
}

.keyboards_list > .card {
    width: 100%; /* 그리드 열의 전체 너비 사용 */
    max-width: 18rem; /* 각 카드의 최대 너비 설정 */
    margin: 0 auto; /* 카드를 가운데 정렬 */
}

/* 중간 화면: 3개의 열 */
@media (max-width: 992px) {
    .keyboards_list {
        grid-template-columns: repeat(3, 1fr); /* 3개의 열 */
    }
}

/* 작은 화면: 2개의 열 */
@media (max-width: 768px) {
    .keyboards_list {
        grid-template-columns: repeat(2, 1fr); /* 2개의 열 */
    }
}

/* 아주 작은 화면: 1개의 열 */
@media (max-width: 576px) {
    .keyboards_list {
        grid-template-columns: repeat(1, 1fr); /* 1개의 열 */
    }

    .keyboards_list > .card {
        max-width: 20rem; /* 한 줄에 하나의 상품일 때 크기를 약간 줄임 */
    }
}

.page-item .page-link.text-white.bg-dark {
    background-color: rgb(33,37,41);
    color: white;
}

.page-item .page-link.text-dark.bg-white {
    background-color: white;
    color: rgb(33,37,41);
}

.page-item.disabled .page-link {
    color: rgba(33,37,41,0.5);
}
// 상품
    .card-body {
      position: relative;
    }
    .card-text {
      position: absolute;
      right: 16px;
      bottom: 5px;
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
		<div class="d-flex justify-content-between align-items-center mt-3" id="inpo">
		    <span class="fs-5 col-3 text-nowrap" id="inpopo"></span>
		    <div class="d-flex col-3 justify-content-end position-relative">
		        <form class="d-flex w-100" method="post" action="<%=request.getContextPath() %>/index.jsp?workgroup=product&work=product_action">
		            <input class="form-control me-2 flex-grow-1" type="text" style="min-width: 100px; max-width: 250px;" placeholder="Search" aria-label="Search" name="insearch" id="insearch">
		            <button class="btn btn-outline-success" type="submit">Search</button>
		        </form>
		        <div class="position-absolute w-100" id="searchDiv" style="display:none; z-index: 1000;">
		            <div id="searchList"></div>
		        </div>
		    </div>
		</div>
		<!--  상품 div -->
		<!-- row row-cols-1 row-cols-sm-2 row-cols-lg-4 g-4 -->
		<div class="keyboards_list mt-4 w-100">
		    <% if(totalRow == 0) { %>
		        <div class="col-12 text-center">
		            <p>검색된 상품이 없습니다.</p>
		        </div>
		    <% } else { %>
		        <% if (productList != null) { %>
		            <% for (ProductDTO product : productList) { %>
		                <% String price = money.format(product.getPRODUCT_PRICE()); %>
						<div class="card p-0 <%=product.getPRODUCT_CATEGORY_MAIN()%> <%=product.getPRODUCT_CATEGORY_SUB()%> PRDC">
						    <a href="<%=request.getContextPath()%>/index.jsp?workgroup=detail&work=detail&product_no=<%=product.getPRODUCT_NO()%>" class="text-decoration-none text-black">
						      <img class="card-img-top" src="<%=request.getContextPath()%>/assets/img/<%=product.getPRODUCT_IMG()%>.jpg" style="width: 100%;" />
						      <div class="card-body mb-">
						        <p class="card-title"><%=product.getPRODUCT_NAME()%></p>
						        <span class="card-text"><%=price%>원</span>
						      </div>
						    </a>
						  </div>
		            <% } %>
		        <% } %>
		    <% } %>
		</div>
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
		String myUrl=request.getContextPath()+"/index.jsp?workgroup=product&work=product"
			+"&pageSize="+pageSize+"&keyword="+keyword+"&cateOne="+cateOne+"&cateTwo="+cateTwo;
	%>
	
		<nav aria-label="Page navigation" class="mt-4">
		  <ul class="pagination justify-content-center">
		    <% if(totalPage > 5) { %>
		      <%-- 이전 블럭을 출력할 수 있는 링크 제공 --%>
		      <li class="page-item <%= (startPage > blockSize) ? "" : "disabled" %>">
		        <a class="page-link" href="<%= (startPage > blockSize) ? myUrl + "&pageNum=" + (startPage - blockSize) : "#" %>" tabindex="-1">이전</a>
		      </li>
		    <% } %>
		
		    <%-- 페이지 번호 링크 생성 --%>
		    <% for(int i = startPage; i <= endPage; i++) { %>
		      <li class="page-item <%= (pageNum == i) ? "active" : "" %>">
		        <a class="page-link <%= (pageNum == i) ? "text-white bg-dark" : "text-dark bg-white" %>" href="<%= myUrl + "&pageNum=" + i %>"><%= i %></a>
		      </li>
		    <% } %>
		
		    <% if(totalPage > 5) { %>
		      <%-- 다음 블럭을 출력할 수 있는 링크 제공 --%>
		      <li class="page-item <%= (endPage != totalPage) ? "" : "disabled" %>">
		        <a class="page-link" href="<%= (endPage != totalPage) ? myUrl + "&pageNum=" + (startPage + blockSize) : "#" %>">다음</a>
		      </li>
		    <% } %>
		  </ul>
		</nav>
	</div>
</section>

<!-- end product page -->


<!-- Js -->
<script type="text/javascript">	
	//---------------------------검색 기능 --------------------------------------
	 //$("#insearch").focus();
	$("#insearch").keyup(function() {
    var insearch = $("#insearch").val();
    if (insearch == "") {
        $("#searchDiv").hide();
        return;
    }
    $.ajax({
        type: "post",
        url: "<%=request.getContextPath()%>/product/product_sch.jsp",
        data: { "insearch": insearch },
        dataType: "xml",
        success: function(xmlDoc) {
            var code = $(xmlDoc).find("code").text();
            if (code == "success") {
                var data = $(xmlDoc).find("data").text();
                var searchList = JSON.parse(data);
                var html = "";
                $(searchList).each(function() {
                    html += "<a href='<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&insearch=" + encodeURIComponent(this.pname) + "'>" + this.pname + "</a>";
                });
                $("#searchList").html(html);
                $("#searchDiv").show();
            } else {
                $("#searchDiv").hide();
            }
        },
        error: function(xhr) {
            alert("에러코드 = " + xhr.status);
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
	$("#key_inStock").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=keyboards&cateTwo=key_inStock"});
	$("#key_group").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=keyboards&cateTwo=key_group"});
	$("#linear").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=switches&cateTwo=linear"});
	$("#tactile").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=switches&cateTwo=tactile"});
	$("#low").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=switches&cateTwo=low"});
	$("#magnet").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=switches&cateTwo=magnet"});
	$("#sw").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=keycaps&cateTwo=sw"});
	$("#fbb").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=keycaps&cateTwo=fbb"});
	$("#gmk").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=keycaps&cateTwo=gmk"});
	$("#hammerworks").click(function() {location.href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product&cateOne=keycaps&cateTwo=hammerworks"});
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