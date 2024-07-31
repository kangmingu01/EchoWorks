<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dto.PaymentDTO"%>
<%@page import="echoworks.dao.PaymentDAO"%>
<%@page import="echoworks.dao.ReviewDAO"%>
<%@page import="echoworks.dto.ReviewDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="echoworks.dto.CartDTO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.nio.file.Files"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="echoworks.dao.ProductStockDAO"%>
<%@page import="echoworks.dto.ProductStockDTO"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	String requestURI=request.getRequestURI();
	
	String queryString=request.getQueryString();		
	
	String url=requestURI;
	if(queryString != null) {
		url+="?"+queryString;
	}
	
	url=URLEncoder.encode(url, "utf-8");
	
	String contextPath = request.getContextPath();
	

// 현재 선택한 상품 정보 가져오기
ProductDTO product=ProductDAO.getDAO().selectProductByNo(Integer.parseInt(request.getParameter("product_no")));

// 재고 객체 생성
List<ProductStockDTO> productStockList= ProductStockDAO.getDAO().selectProductStockList(product.getPRODUCT_NO());

// 선택된 옵션
class ProductOption {
	int op_no;
	int op_id;
	int op_price;
	
	public ProductOption(int op_no, int id, int price) {
		this.op_no=op_no;
		this.op_id=id;
		this.op_price=price;
	}
	
	public int getOpNo() { return op_no; }
	public int getOpId() { return op_id; }
	public int getOpPrice() { return op_price; }
}

List<ProductOption> optionList=new ArrayList<ProductOption>();
%>

    
    
<style>
/* 공통 버튼 스타일 */
button {
    font-size: 18px;
    font-weight: 500;
    cursor: pointer;
    border-radius: 5px;
    padding: 10px 20px;
}

/* 기존 스타일 */
.itemInfo_td .itemInfo_td_div_area .itemOption_btn{width:100%; position:relative; padding:30px 0 0;}
.itemInfo_td.fixed .itemInfo_td_div_area .itemOption_btn{width:auto; position:absolute; top:0; right:0; padding:40px 0 0;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOption_cart_btn_area{display:inline-block; padding:0 3px 0 0;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOption_cart_btn_area .itemOption_cart_btn{width:200px; height:54px; font-size:18px; font-weight:500; background:#fff; border:1px solid #666; color:#666; cursor:pointer;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOption_order_btn_area .itemOption_order_btn{width:200px; height:54px; font-size:18px; font-weight:500; background:#666; color:#fff; border:0;  cursor:pointer;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn table{width:100%; border-collapse:collapse;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOptionJjim{display:inline-block; padding-left:4px; position:relative;}

/* 탭 스타일 */
.itemMenu_tap_area:after{content:''; display:block; clear:both;}
.itemMenu_tap_area{margin:0px 0 40px 0;}
.itemMenu_tap_area li{float:left; width:100%; list-style-type: none; }
.itemMenu_tap_area li a{display:block; width:100%; height:54px; background:#fff; line-height:54px; font-size:15px; color:#666; border:1px solid #ccc; border-right:0; text-align:center;  text-decoration:none; }
.itemMenu_tap_area li a.i_m_selected{color:#fff; background:#555; border:1px solid #555; border-right:0;}
.itemMenu_tap_area li:last-child a{border-right:1px solid #ccc;}
.itemMenu_tap_area li a #order_reviews, .itemMenu_tap_area li a #order_inquiry{color:#666; font-size:18px; font-family:'Tahoma', sans-serif; margin-left:2px; vertical-align:bottom;}
.itemMenu_tap_area li a.i_m_selected #order_reviews, .itemMenu_tap_area li a.i_m_selected #order_inquiry{color:#FAE078;}
#itemContent_wrap #item_info{max-height:auto; overflow:hidden;}
#itemContent_wrap #item_info.tabcnt_detail0.expand{max-height:inherit;}

/* 옵션 박스 스타일 */
.shop_item_select_box {max-height:240px; overflow-y:auto;}
.shop_item_select_box .shop_item_select:first-child{margin:0;}
.shop_item_select_box .shop_item_select{background:#F8F8F8; padding:20px 24px; border-radius:5px; margin:10px 0 0; position:relative;}
.shop_item_select_box .shop_item_select .item_select_text{font-size:15px; margin:0 0 10px; line-height:22px; max-height:45px; overflow:hidden; box-sizing:content-box;}
.shop_item_select_box .shop_item_select .item_select_num .item_num input{width:40px; height:30px; font-size:14px; color:#222; font-family:'Tahoma', sans-serif; border:0; border-top:1px solid #ccc; border-bottom:1px solid #ccc; text-align:center; top:1px; position:relative; }
.shop_item_select_box .shop_item_select .item_select_price{font-size:18px; font-weight:500; font-family:'Tahoma', sans-serif; line-height:30px; position:absolute; bottom:20px; right:24px;}
.shop_item_select_box .shop_item_select .item_select_price span{font-size:16px; font-weight:500;}
.shop_item_select_box .shop_item_select .item_select_price img{padding:0 0 0 12px; vertical-align:baseline; cursor:pointer;}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

/* 리뷰 목록 스타일 */
.review-list {
    margin-top: 20px;
}

.review {
    padding: 15px;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    margin-bottom: 15px;
    background-color: #f8f9fa;
}

.review b {
    display: block;
    margin-bottom: 5px;
    color: #343a40;
}

/* 버튼 스타일 변경 */
.review button, .review-form .btn-submit, .review-form .btn-cancel, .review-remove .btn-submit, .review-remove .btn-cancel {
    padding: 5px 10px;
    font-size: 18px;
    font-weight: 500;
    cursor: pointer;
    border-radius: 5px;
}

/* 댓글 등록, 댓글 변경, 댓글 삭제 버튼 스타일 구분 */
.review button, .review-form .btn-submit, .review-remove .btn-submit {
    background-color: #666;
    color: #fff;
    border: none;
}

.review-form .btn-cancel {
    background-color: #fff;
    color: #666;
    border: 1px solid #666;
}

.review-remove .btn-cancel {
    background-color: #fff;
    color: #666;
    border: 1px solid #666;
}

.review button:hover, .review-form .btn-submit:hover, .review-form .btn-cancel:hover, .review-remove .btn-submit:hover, .review-remove .btn-cancel:hover {
    background-color: #555;
    border-color: #555;
    color: #fff;
}

/* 리뷰 폼 스타일 */
.review-form {
    padding: 15px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.05);
    margin-bottom: 20px;
}

.review-form .form-header {
    font-weight: bold;
    margin-bottom: 10px;
}

.review-form textarea {
    width: 100%;
    height: 80px;
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    resize: none;
}

.review-form .message {
    margin-top: 10px;
    color: #e74c3c;
    font-size: 14px;
    min-height: 20px; /* 최소 높이 설정 */
    display: flex; /* 수직 중앙 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
}


/* 리뷰 제거 스타일 */
.review-remove {
    display: none;
    padding: 15px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.05);
}

.review-remove .message {
    font-size: 14px;
    color: #000;
}

/* 페이징 버튼 스타일 */
.pagination button {
    padding: 10px 15px;
    font-size: 16px;
    font-weight: 500;
    border-radius: 5px;
    margin: 5px;
    cursor: pointer;
    background-color: #fff; /* 기본 배경색 */
    border: 1px solid #666;
    color: #666;
}

.pagination button:hover {
    background-color: #e6e6e6; /* 호버 시 배경색 */
}

.pagination button.active {
    background-color: #666; /* 현재 페이지 배경색 */
    color: #fff; /* 현재 페이지 글자색 */
    border-color: #666;
}

.pagination button:disabled {
    background-color: #f8f8f8; /* 비활성화 버튼 배경색 */
    color: #ccc;
    cursor: not-allowed;
}



</style>
	<div class="container mt-4">
		<div>
			<div class="row">
				<div class="col-md-5">
					<div>
						<img src="assets/img/<%=product.getPRODUCT_IMG()%>.jpg" class="d-block w-100" alt="...">
					</div>
				</div>

				<div class="col-md-7">
					<div>
						<div>
							<h3 class="mt-sm-3 mt-md-0"><%=product.getPRODUCT_NAME() %></h3>
							<hr>
							<h5 class="pb-3" style="display:inline-block; font-size:32px; color: #333; font-weight: bold; vertical-align: middle; padding-right:8px;"><%=String.format("%,d", product.getPRODUCT_PRICE()) %>원</h5>
							
							<div>
								
								<select id="select_option" class="form-select form-select-lg mb-3" onchange="selected_item('1441177158', '1441177158', '1441177158')">
								<%if(productStockList.size() == 0) { %>
									<option value="basic" selected disabled>상품옵션선택</option>
								<% } else { %>
									<option value="basic" selected disabled hidden>상품옵션선택</option>
									<% for(int i=0;i<productStockList.size();i++) { 
										String op=productStockList.get(i).getpS_Option();
										int price=productStockList.get(i).getpS_price();
										int stock=productStockList.get(i).getpS_Stock();
										
										ProductOption option=new ProductOption(productStockList.get(i).getpS_No(),56068+i, price);
										optionList.add(option);
									%>
									<option value="<%=op %>||<%=price %>||<%=stock %>||<%=56068+i %>" ><%=op %>   (<%=String.format("%,d", price) %>원)</option>
									<% } %>
								<% } %>
								</select>
							</div>
							
							<!-- 옵션 -->
							<div class="shop_item_select_box"></div>
							
							<div class="row pt-3 pb-3">
								<div style="text-align: right;">
									<div class="itemOption_b">
                                    	<span style="font-size:16px; padding:0 20px 0 0;">총 상품금액</span> 
                                    	<input type="hidden" name="total_price" id="total_price" value="0">
                                    	<span name="cartprice1" id="cartprice1" class="itemOptionPrice_p" style="font-size:32px; font-family:'Tahoma', sans-serif; font-weight:bold;">0
                                    	<span class="price_unit">원</span>
                                    </span>
                                    </div>
								</div>
								<div style="text-align: right;">
									
								</div>
							</div>
							<div class="d-flex justify-content-between align-items-center mb-sm-3 mb-md-0">
								<div class="col-6 d-grid p-1">
									<button type="button" class="btn_cart btn btn-lg" style="font-size:18px; font-weight:500; background:#fff; border:1px solid #666; color:#666; cursor:pointer;">장바구니담기</button>
								</div>
								<div class="col-6 d-grid p-1">
									<button type="button" class="btn_payment btn btn-lg" style="font-size:18px; font-weight:500; background:#666; color:#fff; border:0;  cursor:pointer;">주문하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="row" style="margin-top:10px;">

				<!-- 탭 -->
				
				<div class="container">
					<ul class="itemMenu_tap_area ps-0 d-flex">
						<li>
							<a href="#item_info" class="i_m_selected">상품정보</a>
						</li>
						<li>
							<a href="#order_reviews_area">구매후기
								<span id="order_reviews"></span>
							</a>
						</li>
						<li>
							<a href="#order_inquiry_area">상품문의
								<span class="arrLength_tab" id="order_inquiry"></span>
							</a>
						</li>
					</ul>
				</div>
		
				<!-- 상세 페이지 -->
				
				<div>
					<div id="itemContent_wrap" class="container p-0">
						<div id="item_info" style="text-align: center;">
							<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/2047495408858.png?w=1536" class="img-fluid" /><br />
							
							<% if(product.getPRODUCT_VIDEO_URL() != null) { //상품 영상 %>
							<div class="ratio ratio-16x9 w-75 mx-auto mt-5 mb-3">
 								<iframe src=<%=product.getPRODUCT_VIDEO_URL() %> title="YouTube video" allowfullscreen></iframe>
							</div>
							<% } %>
						
							<%
							int count =1;
							Path path = Paths.get(request.getRealPath("")+product.getPRODUCT_IMG_DETAIL()+"/"+count+".jpg");
							if(Files.exists(path)) {
							%>
							<span style="font-size:30px;">갤러리</span>
							<hr>
							<% } %>
							
							<div class="col-10 mx-auto">
							
							<!-- 상세 이미지 -->
							<% while (Files.exists(path)){ %>
								<img alt="상세" src="<%=product.getPRODUCT_IMG_DETAIL()%>/<%=count%>.jpg" class="img-fluid mt-3" /><br />
							<% 
								count++;
								path = Paths.get(request.getRealPath("")+product.getPRODUCT_IMG_DETAIL()+"/"+count+".jpg");
								}
							%>
								<div class="mt-3">
									<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/08823c1fcc3de.png?w=1536" class="img-fluid" /><br />
									<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/18e6c1ccd9ea1.jpg?w=1536" class="img-fluid" /><br />
								</div>
							</div>
						</div>
						
						<!-- 댓글 -->
						<!-- 댓글 영역 -->
						<div id="order_reviews_area" class="container mt-3">
						    <div>
						        <span class="fw-normal fs-5">구매후기
						            <span class="text-danger fs-6 ms-1"></span>
						        </span>
						        <hr />
						        <ul>
						            <li>
						                <small>상품을 구매하신 분들이 작성한 리뷰입니다.</small>
						            </li>
						        </ul>
						        <hr>
						        <% if (loginMember != null) { %>
						        <div id="review_add" class="review-form">
						            <div class="form-header">리뷰 작성</div>
						            <textarea id="add_content" placeholder="리뷰를 입력하세요."></textarea>
						            <div>
						                <button type="button" id="add_btn" class="btn-submit">댓글등록</button>
						                <div id="add_message" class="message">&nbsp;</div>
						            </div>
						        </div>
						        <% } %>
						        <div id="review_list" class="review-list"></div>
						        <div id="pagination" class="pagination"></div>
						        <div id="review_modify" class="review-form" style="display:none;">
						            <input type="hidden" id="modify_num">
						            <div class="form-header">리뷰 수정</div>
						            <textarea id="modify_content" placeholder="리뷰를 수정하세요."></textarea>
						            <div>
						                <button type="button" id="modify_btn" class="btn-submit">변경</button>
						                <button type="button" id="modify_cancel_btn" class="btn-cancel">취소</button>
						                <div id="modify_message" class="message">&nbsp;</div>
						            </div>
						        </div>
						        <div id="review_remove" class="review-remove" style="display:none;">
						            <input type="hidden" id="remove_num">
						            <div id="remove_message" class="message">
						                <b>정말로 삭제 하시겠습니까?</b>
						                <button type="button" id="remove_btn" class="btn-submit">삭제</button>
						                <button type="button" id="remove_cancel_btn" class="btn-cancel">취소</button>
						            </div>
						        </div>
						        <script type="text/javascript">
						        var currentPage = 1;
						        var itemsPerPage = 5; // 페이지당 리뷰 수 설정

						        function displayReview(page = 1) {
						            currentPage = page; // 현재 페이지를 업데이트
						            $.ajax({
						                type: "get",
						                url: "<%=request.getContextPath()%>/review/review_list.jsp",
						                data: { page: page, itemsPerPage: itemsPerPage, productNo:<%=product.getPRODUCT_NO()%> },
						                dataType: "json",
						                success: function(result) {
						                    $("#review_list").empty();
						                    $("#pagination").empty();

						                    if (result.code == "success") {
												var product_count=0;
						                        $(result.data).each(function() {
						                            
						                                var html = "<div class='review' id='review_" + this.num + "'>";
						                                html += "<b>[" + this.writer + "]</b><br>";
						                                html += this.content.replace(/\n/g, "<br>") + "<br>";
						                                html += "(" + this.regdate + ")<br>";
						                                <% if (loginMember != null) { %>
						                                var mb = "<%=loginMember.getMemberName()%>";
						                                if (this.writer == mb) {
						                                    html += "<button type='button' class='btn-submit' onclick='modifyreview(" + this.num + ");'>댓글변경</button>&nbsp;";
						                                    html += "<button type='button' class='btn-cancel' onclick='removereview(" + this.num + ");'>댓글삭제</button>&nbsp;";
						                                }
						                                <% } %>
						                                html += "</div>";

						                                $("#review_list").append(html);
						                                product_count++;
						                            //}
						                        });
						                        $("#review_count").text(product_count);
						                        setupPagination(result.totalPages, result.currentPage);
						                    } else {
						                        //$("#review_list").html("<div class='no_review'>" + result.message + "</div>");
						                    }
						                },
						                error: function(xhr) {
						                    alert("에러코드 = " + xhr.status);
						                }
						            });
						        }

						        function setupPagination(totalPages, currentPage) {
						            var paginationHtml = '';

						            if (totalPages > 1) {
						                if (currentPage > 1) {
						                    paginationHtml += '<button onclick="displayReview(' + (currentPage - 1) + ')" class="btn_page">이전</button>';
						                } else {
						                    paginationHtml += '<button class="btn_page" disabled>이전</button>';
						                }

						                for (var i = 1; i <= totalPages; i++) {
						                    paginationHtml += '<button onclick="displayReview(' + i + ')" class="btn_page' + (i === currentPage ? ' active' : '') + '">' + i + '</button>';
						                }

						                if (currentPage < totalPages) {
						                    paginationHtml += '<button onclick="displayReview(' + (currentPage + 1) + ')" class="btn_page">다음</button>';
						                } else {
						                    paginationHtml += '<button class="btn_page" disabled>다음</button>';
						                }
						            }

						            $('#pagination').html(paginationHtml);
						        }

						        $(document).ready(function() {
						            displayReview(currentPage);
						        });
						            
						            $("#add_btn").click(function() {
						                var pyNo = 0;
						                var content = $("#add_content").val();
						                if (content == "") {
						                    $("#add_message").html("내용을 입력해 주세요.");
						                    $("#add_content").focus();
						                    return;
						                }
						                $("#add_content").val("");
						                $("#add_message").html("");
						                $.ajax({
						                    type: "post",
						                    url: "<%=request.getContextPath()%>/review/review_add.jsp",
						                    data: {"content": content},
						                    dataType: "json",
						                    success: function(result) {
						                        if (result.code == "success") {
						                            displayReview();
						                        } else {
						                            alert("구매평 작성이 가능한 주문이 존재하지 않습니다.\n구매평은 주문당 품목별로 1번만 작성이 가능하며, 삭제 후 재작성은 불가합니다.");
						                        }
						                    },
						                    error: function(xhr) {
						                        alert("에러코드 = " + xhr.status);
						                    }
						                });
						            });
						
						            function resetForms() {
						                $("#review_modify").hide().appendTo(document.documentElement);
						                $("#modify_num").val("");
						                $("#modify_content").val("");
						                $("#modify_message").html("&nbsp;");
						                $("#review_remove").hide().appendTo(document.documentElement);
						                $("#remove_num").val("");
						            }
						
						            function modifyreview(num) {
						                resetForms();
						                $("#review_modify").show().appendTo("#review_" + num);
						                $.ajax({
						                    type: "get",
						                    url: "<%=request.getContextPath()%>/review/review_get.jsp",
						                    data: {"no": num},
						                    dataType: "json",
						                    success: function(result) {
						                        if (result.code == "success") {
						                            $("#modify_num").val(result.data.num);
						                            $("#modify_content").val(result.data.content);
						                        } else {
						                            resetForms();
						                        }
						                    },
						                    error: function(xhr) {
						                        alert("에러코드 = " + xhr.status);
						                    }
						                });
						            }
						            
						            $("#modify_btn").click(function() {
						                var num = $("#modify_num").val();
						                var content = $("#modify_content").val();
						                if (content == "") {
						                    $("#modify_message").html("내용을 입력해 주세요.");
						                    $("#modify_content").focus();
						                    return;
						                }
						                $.ajax({
						                    type: "post",
						                    url: "<%=request.getContextPath()%>/review/review_modify.jsp",
						                    data: {"no": num, "content": content},
						                    dataType: "json",
						                    success: function(result) {
						                        if (result.code == "success") {
						                            resetForms();
						                            displayReview();
						                        } else {
						                            alert("댓글 변경 실패");
						                        }
						                    },
						                    error: function(xhr) {
						                        alert("에러코드 = " + xhr.status);
						                    }
						                });
						            });
						            
						            $("#modify_cancel_btn").click(resetForms);
						            
						            function removereview(num) {
						                resetForms();
						                $("#review_remove").show().appendTo("#review_" + num);
						                $("#remove_num").val(num);
						            }
						            
						            $("#remove_btn").click(function() {
						                var num = $("#remove_num").val();
						                $.ajax({
						                    type: "get",
						                    url: "<%=request.getContextPath()%>/review/review_remove.jsp",
						                    data: {"no": num},
						                    dataType: "json",
						                    success: function(result) {
						                        if (result.code == "success") {
						                            resetForms();
						                            displayReview();
						                        } else {
						                            alert("댓글 삭제 실패");
						                        }
						                    },
						                    error: function(xhr) {
						                        alert("에러코드 = " + xhr.status);
						                    }
						                });
						            });
						            
						            $("#remove_cancel_btn").click(resetForms);
						
						            $(document).ready(function() {
						                displayReview();
						            });
						        </script>
						    </div>
						</div>



						<!-- 상품문의 -->
						<div id="order_inquiry_area">
							<jsp:include page="/qna/detail_qna.jsp" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">

//금액 합산
function numberWithCommas() {
	var total=0;
	
<% for(int i=0;i<optionList.size();i++){%>
	var opId = <%=optionList.get(i).getOpId()%>;//해당 옵션 id
	var curNum=$("#ct_qty"+opId).val();//해당 옵션의 현재 수량
	var price=<%=optionList.get(i).getOpPrice()%>;//해당 옵션 가격
	if(isNaN(curNum) == false) {//해당 옵션이 현재 선택되어 있다면 false
		total+= Number(curNum)*Number(price);
	}
	
<%}%>
	if(total != null) {
		var parts = total.toString().split(".");
		var totalText =  parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#cartprice1").html(totalText+'<span class="price_unit">원</span>');
	}
}

//옵션 선택 값 출력 pc
//var ea_count = 0;
function selected_item(io_type, io_id, io_value){
  var select_option=$("#select_option").val();
      var str = select_option.split("||");
      var op=str[0];
      var price=str[1];
      var stock=str[2];
      var sid=str[3];

  opt = '<div class="shop_item_select" id="io_append'+sid+'" name="io_append['+sid+'][]" command='+sid+' >';
  opt += '<input type="hidden" name="io_type['+io_type+'][]" value="0">';
  opt += '<input type="hidden" name="io_id['+io_id+'][]" value="'+op+'">';
  opt += '<input type="hidden" name="io_value['+io_value+'][]" value="'+op+'">';
  opt += '<input type="hidden" name="io_price['+io_value+'][]" value="'+price+'">';
  opt += '<input type="hidden" name="io_stock" value="1">';
  opt += '<div id="item_select_name" class="item_select_text">'+op+'</div>';
  opt += '<div class="item_select_num">';
  opt += '<span><a href="javascript:"><img src="assets/img/detail/ui/item_min.png" alt="빼기" width="30px" onclick="item_minus('+sid+','+price+')"></a></span>';
  opt += '<span class="item_num">';
  opt += '<input type="number" class="count" id="ct_qty'+sid+'" name="ct_qty[1710310953][]" value="1" onkeypress="show_num(event, '+sid+','+price+','+stock+')">';
  opt += '</span>';
  opt += '<span><a href="javascript:"><img src="assets/img/detail/ui/item_plus.png" alt="더하기" width="30px" onclick="item_plus('+sid+','+price+','+stock+')"></a></span>';
  opt += '</div>';
  opt += '<div class="item_select_price button price_font">'+price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+'<span>원</span>'+'<img src="assets/img/detail/ui/layer_close.png" alt="옵션 삭제('+sid+')" onclick="option_delete('+sid+','+price+')" ></div>';
  opt += '</div>';

  //옵션 중복검사
  if(document.getElementById('io_append'+sid)){
      alert('이미 선택된 옵션입니다');
  } else if(stock == 0) {
	  alert('재고가 없습니다');  
  } else{

      // 옵션리스트에 추가 시키기                                        
      $(".shop_item_select_box").css({"margin":"16px 0 0"}).append(opt); //pc 옵션 추가

      numberWithCommas();
  }
  
  $(".shop_item_select_box div:eq(0)").css({
      "border-top":"none",

  });
}

//수량 추가
function item_plus(sid,price,stock){
    var num = $("#ct_qty"+sid).val();
    
    if(num < stock) {
    	num++;
	    $("#ct_qty"+sid).val(num);
	
	    numberWithCommas();
    } else {
    	alert(stock + "이하의 수량만 가능합니다.");
    }
}

//수량 감소
function item_minus(sid,price){
    var num = $("#ct_qty"+sid).val();
    num--;
    
    if(num<1){// 최소 수량1로 고정
    	num=1;
    	$("#ct_qty"+sid).val(num);
    }else{
    	$("#ct_qty"+sid).val(num);
        numberWithCommas();
    }
}

//선택한 옵션 삭제 
function option_delete(opId,price){

    $("#ct_qty"+opId).val(0);
    numberWithCommas(price);
    
    $("#io_append"+opId).remove();

    $("#select_option").val('basic');//레이어 삭제하면  

    if( $(".shop_item_select_box").height() <= 30 ){
        $(".shop_item_select_box").css({"margin":"0"});
    }
    
    numberWithCommas();
}

function option_deleteAll() {
	
	<% for(int i=0;i<optionList.size();i++){%>
		var opId = <%=optionList.get(i).getOpId()%>;//해당 옵션 id
		var curNum=$("#ct_qty"+opId).val();//해당 옵션의 현재 수량
		var price=<%=optionList.get(i).getOpPrice()%>;//해당 옵션 가격
		if(isNaN(curNum) == false) {//해당 옵션이 현재 선택되어 있다면 false
			option_delete(opId, price);
		}
	<%}%>
}

$(document).ready(function(){
    $('.buy_tab.t_open span').click(function(){
        $('.buy_tab.t_open').hide();
        $('.buy_tab.t_close').show();
        $('.itemInfo_td').addClass('fixed');
    });
    $('.buy_tab.t_close span').click(function(){
        $('.buy_tab.t_close').hide();
        $('.buy_tab.t_open').show();
        $('.itemInfo_td').removeClass('fixed');
    });

    $(window).scroll(function(){
        var y= $(this).scrollTop();
        var tabY = $('.itemMenu_tap_area').offset().top;
        if( y >= tabY){
            if($('.itemInfo_td').hasClass('fixed')==false){
                $('.buy_tab.t_open').show();
                $('.buy_tab.t_close').hide();
            } else {
                $('.buy_tab.t_close').show();
                $('.buy_tab.t_open').hide();
            };
        } else {
            $('.buy_tab').hide();
            $('.itemInfo_td').removeClass('fixed');
        }
    });
});

//상품정보, 구매후기, 상품문의 탭메뉴
// #itemContent_wrap 의 모든 자식 div를 안보이게 설정
$("#itemContent_wrap>div").hide();  


// #itemContent_wrap 의 첫 번째 자식 div만 보이게 설정
$("#itemContent_wrap>div:eq(0)").show();  
    
// .itemMenu_tap_area a 클릭하면
$(".itemMenu_tap_area a").click(function(){
    
    // 모든 #itemContent_wrap 의 자식 div 안 보이게 설정
   $("#itemContent_wrap>div").hide();
    
    // 변수 changeId에 클릭한 a의 href 속성 값 저장
   changeId = $(this).attr("href"); 

    // 변수 changeId에 저장된 해당 div 보이게 설정
   $(changeId).fadeIn(500); 
    
 // 모든 탭에서 클래스 i_m_selected 제거해서 기본 디자인 설정
 $(".itemMenu_tap_area a").removeClass("i_m_selected");
    
    // 클릭한 탭(a) 에 클래스 i_m_selected 추가해서 디자인 변경
   $(this).addClass("i_m_selected");       
   return false; 
});


$(document).ready(function(){
    //상품문의
    jQuery(".inquireAwrap").hide();

    $(".inquireCon").click(function(){
        $(".inquireAwrap").not( $(this).next(".inquireAwrap").slideToggle(100) ).slideUp(100);
    });

});


function show_num(e, sid, price, stock) {
	if(e.keyCode == 13) {
		var curNum = $("#ct_qty"+sid).val();
		if(curNum <= 1 || curNum=="") {//0이하거나 빈칸일 경우 1
			$("#ct_qty"+sid).val(1);
		} else if(curNum > stock) {//최대 재고 수량을 넘을경우 최대 재고 수량으로 변경
			alert(stock + "이하의 수량만 가능합니다.");
			$("#ct_qty"+sid).val(stock);	
		}
		numberWithCommas();
	}
}

// 장바구니 버튼 클릭
$(".btn_cart").click(function() {

<%if(loginMember == null){%>
	checkLogin();
<%}else {%>
	var cartArr = "";
	<%for(int i=0;i<optionList.size();i++) {%>
	cartArr += <%=optionList.get(i).getOpNo()%>
	cartArr+=" ";	
	cartArr += $("#ct_qty"+(56068+<%=i%>)).val();	// 수량
	cartArr+=",";	
	<%}%>
	
	//alert(cartArr);
	$.ajax({
		type: "post",
		url: "<%=request.getContextPath()%>/detail/detail_cart.jsp",
		data: {
			"state":"cart",
			"cartArr":cartArr
			},
		dataType: "json",
		success: function(result) {
			if(result.code == "success") {
				alert("장바구니에 담았습니다.");
				option_deleteAll();
				cartCount();
			} else if(result.code == "notOption") {
				alert("옵션을 선택해 주세요.");
			} else {
				//alert("실패");
			}
		},
		error: function(xhr) {
			alert("에러코드 = "+xhr.status);
		}
	});
<%}%>
});


$(".btn_payment").click(function() {

<%if(loginMember == null){%>
	checkLogin();
<%}else {%>
	var cartArr = "";
	<%for(int i=0;i<optionList.size();i++) {%>
	cartArr += <%=optionList.get(i).getOpNo()%>
	cartArr+=" ";	
	cartArr += $("#ct_qty"+(56068+<%=i%>)).val();	// 수량
	cartArr+=",";	
	<%}%>
	
	//alert(cartArr);
	$.ajax({
		type: "post",
		url: "<%=request.getContextPath()%>/detail/detail_cart.jsp",
		data: {
			"state":"payment",
			"cartArr":cartArr
			},
		dataType: "json",
		success: function(result) {
			if(result.code == "success") {
				//alert("성공");
				window.location.href = "<%=contextPath%>" + "/index.jsp?workgroup=payment&work=payment&url=" + "<%=url%>";
			} else if(result.code == "notOption") {
				alert("옵션을 선택해 주세요.");
			} else {
				//alert("실패");
			}
		},
		error: function(xhr) {
			alert("에러코드 = "+xhr.status);
		}
	});
<%}%>
});

function checkLogin() {	
    loginConfirm = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");    
    if(loginConfirm) {
		window.location.href = "<%=contextPath%>" + "/index.jsp?workgroup=member&work=member_login&url=" + "<%=url%>";
		console.log("<%=contextPath%>" + "/index.jsp?workgroup=member&work=member_login&url=" + "<%=url%>");
    }
}








</script>
