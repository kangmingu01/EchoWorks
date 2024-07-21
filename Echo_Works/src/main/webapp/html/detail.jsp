<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>키보드쇼핑몰</title>
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

<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/detail.css" />

</head>
<body>
  	<%-- Header 영역 --%>
<div> <jsp:include page="../header.jsp"/> </div>

<form name="fitem" method="post">
<div>
	<div id="item_wrap">
		<div class="item_content_box">
			<div>
				<table>
					<tr>
						<!-- 상품이미지 -->
                        <td class="itemImg_area" >
                            <div>
                            	<img src="https://cdn.imweb.me/thumbnail/20240424/eb47e73cc9357.jpg" width="480" height="480" alt="" >
                            </div>
                            <!-- 
                            <div class="info">
                            	<ul>
                            		<li class="review_star">
                            		<img src="../assets/img/star.png" alt="별점">
                            		<img src="../assets/img/star.png" alt="별점">
                            		<img src="../assets/img/star.png" alt="별점">
                            		<img src="../assets/img/star.png" alt="별점">
                            		<img src="../assets/img/star_off.png" alt="별점">
                            	</ul>
                                <span>4.5</span>
                                <span class="reviews ">리뷰수<span>1</span></span>
                            </div>
                            -->
                        </td>
                        <!-- 상품주문 -->
                        <td class="itemInfo_td">
                        	<!-- 상품 설명 -->
                            <div>
                                <div class="itemInfo_td_div_area">
                                    <div class="orderItem_title">SC Studio Bridge 75 기계식 키보드 브릿지 75</div>
                                    <div class="orderItem_prc">
                                        <input type="hidden" id="it_price" value="23270">
                                        <input type="hidden" id="it_point" value="465">
                                        <span class="sell_prc">19,900<span class="price_unit">원</span></span>
									</div>
									<div class="shop_item_option">
                                        <select id="select_option" class="form-select form-select-lg mb-3" aria-label="Large select example" onchange="selected_item('1441177158', '1441177158', '1441177158','pc')">
                                            <option value="basic" selected disabled hidden>상품옵션선택</option>
                                            <option value="Black-Black-Brass||166100||56068" >Black-Black-Brass   (66,100원)</option>
                                            <option value="Black-Black-Copper||182600||56069" >Black-Black-Copper   (182,600원)</option>
                                            <option value="Lilac-Lilac-White||109850||56070" >Lilac-Lilac-White   (109,850원)</option>
                                            <option value="Pink-Pink-White||214500||56071" >Pink-Pink-White   (214,500원)</option>
                                     	</select>
                                    </div>
                                    
                                    <!-- 옵션 -->
                                    <div class="shop_item_select_box"></div>
                                    <!-- 옵션 -->
                                    <div class="itemOption_b">
                                    	<span class="itemOptionPrice_t">총 상품금액</span> 
                                    	<span name="cartprice1" id="cartprice1" class="itemOptionPrice_p">0
                                    	<span class="price_unit">원</span></span> 
                                    	<input type="hidden" name="total_price" id="total_price" value="0">
                                    </div>
                                    <div class="itemOption_btn">
                                    	<span class="itemOption_cart_btn_area">
                                    		<input type="submit" onclick="document.pressed=this.value;" value="장바구니" class="itemOption_cart_btn">
                                    	</span>
                                        <span class="itemOption_order_btn_area">
                                        	<input type="submit" onclick="document.pressed=this.value;" value="바로구매" class="itemOption_order_btn">
                                        </span>
                                        <!-- 상품 재고부족할 경우 -->
                                        <!--<span class="itemOption_sold_out_area"><input value="상품의 재고가 부족하여 구매할 수 없습니다." class="itemOption_sold_out"></span>-->
                                        
                                    </div>
                                </div>
                      		</div>
                        </td>
                    </tr>
                    <tr>
                        <!-- 메뉴 탭 -->
                        <td colspan="2">
                        <aside class="bd-aside sticky-xl-top text-body-secondary align-self-start mb-3 mb-xl-5 px-2">
                            <ul class="itemMenu_tap_area">
                                <li>
                                	<a href="#item_info" class="i_m_selected">상품정보</a>
                                </li>
                                <li>
                                    <a href="#order_reviews_area">구매후기
                                    	<span id="order_reviews">1</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#order_inquiry_area">상품문의
                                        <span id="order_inquiry">2</span>
                                    </a>
                                </li>
                            </ul>
                 		</aside>
						<!-- content -->
						<div id="itemContent_wrap">

						<!-- 상품정보상세 -->
						<div id="item_info" class="tabcnt_detail0">
							<div class="content">
								<!-- 상품 정보 시작 { -->
								<section id="sit_inf">
        							<!--<h3>상품 상세설명</h3>-->
    								<div id="sit_inf_explan">
        								<div style="margin:0px auto;width:100%;text-align:center;"> 
        									<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/2047495408858.png?w=1536" /><br />
        									<div style="margin:50px;">
        											<iframe width="560" height="315" src="https://www.youtube.com/embed/yiP6aLpHYfg?si=CF3zWx0-2Xyx5qPA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        									</div>
        									<div style="margin:50px;text-align:left;">
        										<span style="font-size:30px;">갤러리</span>
        										<hr>
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/09ff5cfd5709b.jpg?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/4fa0e7d70350a.jpg?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/35ecdbbf67d4a.jpg?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/be4ee49fb80bf.jpg?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/8a78c675434ba.jpg?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/8daaa931b9ebd.jpg?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/1a53495882d90.jpg?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/b990510e2068c.jpg?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/7d2a5551bca1a.jpg?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/7eaa11637baa1.jpg?w=1536" /><br />
        										<hr>
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/08823c1fcc3de.png?w=1536" /><br />
        										<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/18e6c1ccd9ea1.jpg?w=1536" /><br />
        									</div>
        								</div>
									</div>
								</section>
								<!-- } 상품 정보 끝 -->

<script>

//금액 합산
function numberWithCommas(n) {
    var parts = n.toString().split(".");
    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//옵션 선택 값 출력 pc
//var ea_count = 0;
function selected_item(io_type, io_id, io_value,ver){
  var select_option=$("#select_option").val();
  
  if(ver=='pc'){
      var str = select_option.split("||");
  }

  opt = '<div class="shop_item_select" id="io_append'+str[2]+'" name="io_append['+str[2]+'][]" command='+str[2]+' >';
  opt += '<input type="hidden" name="io_type['+io_type+'][]" value="0">';
  opt += '<input type="hidden" name="io_id['+io_id+'][]" value="'+str[0]+'">';
  opt += '<input type="hidden" name="io_value['+io_value+'][]" value="'+str[0]+'">';
  opt += '<input type="hidden" name="io_price['+io_value+'][]" value="'+str[1]+'">';
  opt += '<input type="hidden" name="io_stock" value="1">';
  opt += '<div id="item_select_name" class="item_select_text">'+str[0]+'</div>';
  opt += '<div class="item_select_num">';
  opt += '<span><a href="javascript:"><img src="../assets/img/item_min.png" alt="빼기" width="30px" onclick="item_minus('+str[2]+','+str[1]+')"></a></span>';
  opt += '<span class="item_num">';
  opt += '<input type="number"  id="ct_qty'+str[2]+'" name="ct_qty[1710310953][]" value="1">';
  opt += '</span>';
  opt += '<span><a href="javascript:"><img src="../assets/img/item_plus.png" alt="더하기" width="30px" onclick="item_plus('+str[2]+','+str[1]+')"></a></span>';
  opt += '</div>';
  opt += '<div class="item_select_price button price_font">'+numberWithCommas(str[1])+'<span>원</span>'+'<img src="../assets/img/layer_close.png" alt="옵션 삭제('+str[2]+')" onclick="option_delete('+str[2]+','+str[1]+')" ></div>';
  opt += '</div>';

  

  //옵션 중복검사
  if(document.getElementById('io_append'+str[2])){
      alert('이미 선택된 옵션입니다');
  }else{

      // 옵션리스트에 추가 시키기                                        
      $(".shop_item_select_box").css({"margin":"16px 0 0"}).append(opt); //pc 옵션 추가

      
      var total_price = $("#total_price").val();
      var total_price_tmp = Number(total_price) + Number(str[1]);

      //var shop_point = total_price_tmp *'0.02';  //pc 포인트

      $("#total_price").val(total_price_tmp);
      
      $("#cartprice1").html(numberWithCommas(total_price_tmp)+'<span class="price_unit">원</span>');

      //$("#shop_point").text(numberWithCommas(shop_point));//pc 포인트 
 
  }
  
  $(".shop_item_select_box div:eq(0)").css({
      "border-top":"none",

  });
}

//수량 추가
function item_plus(sss,price){
    var ttt = $("#ct_qty"+sss).val();
    ttt++;
    
    $("#ct_qty"+sss).val(ttt);

    var total_price = $("#total_price").val();
    var total_price_tmp = Number(total_price) + Number(price);
    //var shop_point = total_price_tmp *'0.02';  //pc 포인트 

    $("#total_price").val(total_price_tmp); 
    $("#cartprice1").html(numberWithCommas(total_price_tmp)+'<span class="price_unit">원</span>');
    //$("#shop_point").text(numberWithCommas(shop_point));//pc 포인트 
}

//수량 감소
function item_minus(sss,price){
    var ttt = $("#ct_qty"+sss).val();
    ttt--;
    
    if(ttt<1){// 최소 수량1로 고정
        ttt=1;
    }else{
        $("#ct_qty"+sss).val(ttt);

        var total_price = $("#total_price").val();
        var total_price_tmp = Number(total_price) - Number(price);
        //var shop_point = total_price_tmp *'0.02';  //pc 포인트 

        $("#total_price").val(total_price_tmp); 
        $("#cartprice1").html(numberWithCommas(total_price_tmp)+'<span class="price_unit">원</span>');
        //$("#shop_point").text(numberWithCommas(shop_point));//pc 포인트  
    }
}

//선택한 옵션 삭제 
function option_delete(io_ano,price){
    var plus_qty = $("#ct_qty"+io_ano).val();
    var total_price = $("#total_price").val();
    var total_price_tmp = Number(total_price) - Number(price*plus_qty);

    $("#total_price").val(total_price_tmp); 

    //var shop_point = total_price_tmp *'0.02';  //pc 포인트 

    $("#cartprice1").text(numberWithCommas(total_price_tmp));
    //$("#shop_point").text(numberWithCommas(shop_point));//pc 포인트  

    $("#io_append"+io_ano).remove();

    $("#select_option").val('basic');//레이어 삭제하면  

    if( $(".shop_item_select_box").height() <= 30 ){
        $(".shop_item_select_box").css({"margin":"0"});
    }
}

</script>                                    

							</div>
							
						</div> 
						<!-- // 상품정보상세 -->

						<!-- 구매 후기 -->
						<div id="order_reviews_area">
							<div class="order_reviews_title">구매후기<span>(38)</span>
						</div>
						<div class="order_reviews_n_btn_area">
							<ul class="order_reviews_n_btn">
								<li class="order_reviews_n">
									<ul>
										<li class="order_reviews_n_list">· 상품을 구매하신 분들이 작성한 리뷰입니다.</li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="order_reviews_list_area" name="appendArea_use" id="appendArea_use">
							<!-- 상품후기 작성&답변 -->
							<div class="order_reviews_list">
								<!-- 상품후기 작성 -->
								<div>
									<table class="review_table">
										<tr>
											<td>
												<ul class="review_star_days">
													<li class="review_star">
														<img src="../assets/img/star.png" alt="별점">
													</li>
													<li class="review_star">
														<img src="../assets/img/star.png" alt="별점">
													</li>
													<li class="review_star">
														<img src="../assets/img/star.png" alt="별점">
													</li>
													<li class="review_star">
														<img src="../assets/img/star_off.png" alt="별점">
													</li>
													<li class="review_star">
														<img src="../assets/img/star_off.png" alt="별점">
													</li>
													<li class="score">3.0</li>
													<li class="review_user_id">itw****</li>
													<li class="review_days">2024.07.08</li>
												</ul>
												<div class="review_text_area">
													<div class="review_text">
														완제품이지만 스위치랑 키캡 바꿔가면서 재밌게 사용하고 있습니다!<br />
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div> <!-- // 상품후기 작성 -->
							</div> <!-- // 상품후기 작성&답변 -->
							
							<!-- 페이징 -->
							<!-- 
							<div class="item_paging_box">&nbsp;
								<a><span style="color: #fa8702; font-weight: bold;">1</span></a> &nbsp;
								<a href='javascript:ajax_item_use(1441177158,2);'><span>2</span></a> &nbsp;
								<a href='javascript:ajax_item_use(1441177158,3);'><span>3</span></a>
							</div>
							-->
						</div>
					</div> <!-- // 구매 후기 -->
					
					<!-- 상품 문의 -->
					<div id="order_inquiry_area">
						<div>
							<ul class="item_inquiry_title_area">
								<li class="item_inquiry_title">상품문의<span>(66)</span></li>
							</ul>
						</div>
						<!-- 회원 상품문의 & 상품문의 list wrap -->
						<div class="itemqa_list_wrap">
						<!--// 회원 상품문의 폼-->
							<div class="itemqa_area">
								<div id=itemqa class="itemqa_regist">
									<input type="hidden" name="iq_category" id="iq_category" value="상품문의">
										<table style="margin:10px;">
											<tr>
												<td class="itemqa_regist_phrase">
													<div>· 상품문의에서는 상품과 무관한 요청은 처리되지 않습니다.</div>
													<div>· 배송문의·취소·환불 등은 1:1상담게시판을 통해 문의남겨주시기 바랍니다.</div>
													<div>· 미구매,비방이나 양도 광고성, 욕설, 도배글, 개인정보가 포함된 글은 예고없이 삭제되거나 노출이 제한될 수 있습니다.</div>
                                            		
                                            		<!-- 상담 등록 -->
                                            		<div class="write_box">
                                            			<table width=100% cellpadding=0 cellspacing=0 border=0>                 
                                            				<tr>
                                            					<td>
                                            						<span style="display: inline-block; margin:0 5px 5px 0;">
                                            							<input type="text" class="qa_regist_input_middle" maxlength=20 minlength=2 placeholder="제목" style="padding-left: 20px;"/>
                                            						</span>
                                            					</td>
                                            				</tr>
                                            				<tr>
                                            					<td>
                                            						<div>
                                            							<textarea name="iq_question" id="iq_question" class=qa_regist_textarea placeholder="상품문의 외에 문의·요청은 1:1 상담게시판을 이용해주세요."></textarea>
                                            							<input type="button" value="등록" class="regist_submit_btn" onclick=" "/>
                                            						</div>
                                            					</td>
                                            				</tr>
                                            			</table>
                                            		</div>
                                            		<!-- /상담 등록 -->
                                            	</td>
                                            </tr>
										</table>
									</div><!-- #itemqa //-->    
								</div>
								<!-- 회원 상품문의 폼 // -->
								
								<!-- 상품문의 list -->
								<div  name="appendArea_qa" id="appendArea_qa">
									<!-- 1:1문의내역 -->
									<div class="inquireLine">
										<!-- 1:1문의 회원입력 문의내용 -->
										<div class="inquireCon">
											<table class="inquireListTable">
												<colgroup>
													<col width="70px">
													<col width="710px">
													<col width="120px">
													<col width="100px">
												</colgroup>
												<tr>
													<td>
														<div class="reply">
															<small class="ver2">답변완료</small>
														</div>
													</td>
													<!-- 상품문의 타이틀 -->
													<td class="inquireIconQ_area">
														<div class="inquireContent_title">[상품문의] 입니다.</div>
													</td>
													<td><div class="inquireUserId">it*</div></td>
													<td><div class="inquireDays">2024.04.07</div></td>
												</tr>
											</table>
										</div>
										<div class="inquireAwrap" style="display:none;">
											<div class="inquireContent">맥에서 호환해서 쓸 수 있는지 궁금합니다.</div>
											<div class="">
												<table class="inquireListTable">
													<colgroup>
														<col width="3%">
														<col width="75%">
														<col width="22%">
													</colgroup>
														<tr>
															<td class="inquireIconA"></td>
															<td>
																<div class="inquirAnswer">
																	<div class="answerDays"><span class="adm">관리자</span>2024.04.07</div>
																	<p style="padding-bottom: 10px; line-height: 1.7em; word-break: break-all; font-family: dotum; background-color: rgb(255, 255, 255);">
																	안녕하세요 고객님<br>네 정상 사용 가능합니다.<br>감사합니다<br>
																	</p>
																</div>
															</td>
														</tr>
													</table>
												</div>
											</div>
											<div id="qa_insert_box_1926"></div>
										</div> <!-- // 1:1문의내역 -->
										<!-- 페이징 -->
										<!-- 
										<div class="item_paging_box">&nbsp;
											<a><span style="color: #fa8702; font-weight: bold;">1</span></a> &nbsp;
											<a href='javascript:ajax_item_qa(1441177158,2);'><span>2</span></a> &nbsp;
											<a href='javascript:ajax_item_qa(1441177158,3);'><span>3</span></a> &nbsp;
											<a href='javascript:ajax_item_qa(1441177158,4);'><span>4</span></a> &nbsp;
											<a href='javascript:ajax_item_qa(1441177158,5);'><span class="next_prev"> ▶ </span></a>
										</div>
										-->
									</div>
								</div>
							</div> <!-- // 상품 문의 -->
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

</form>

<script type="text/javascript" src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">

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


/* 페이징 addClass */
$(document).ready(function(){
    $(".item_paging_box ul li a").click(function(){
        $(".item_paging_box ul li a").removeClass("mypage_paging_select");
        $(this).addClass("mypage_paging_select");
    });
});
</script>


 	
	<%-- Footer 영역 --%>
	<div id="footer"> <jsp:include page="../footer.jsp" /> </div>

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
