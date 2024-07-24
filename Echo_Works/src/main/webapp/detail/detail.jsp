<%@page import="java.util.List"%>
<%@page import="echoworks.dao.ProductStockDAO"%>
<%@page import="echoworks.dto.ProductStockDTO"%>
<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//String product=request.getParameter("product_no");	//상품 번호 가져오기
//ProductDTO product=ProductDAO.getDAO().selectProductByNo(Integer.parseInt(request.getParameter("product_no")));

String pNo="1";

// 상품 객체 생성
ProductDTO product=ProductDAO.getDAO().selectProductByNo(Integer.parseInt(pNo));

// 재고 객체 생성
List<ProductStockDTO> productStock= ProductStockDAO.getDAO().selectProductStockList(product.getPRODUCT_NO());

System.out.println(productStock.get(0));
%>

    
    
<style>
.itemInfo_td .itemInfo_td_div_area .itemOption_btn{width:100%; position:relative; padding:30px 0 0;}
.itemInfo_td.fixed .itemInfo_td_div_area .itemOption_btn{width:auto; position:absolute; top:0; right:0; padding:40px 0 0;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOption_cart_btn_area{display:inline-block; padding:0 3px 0 0;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOption_cart_btn_area .itemOption_cart_btn{width:200px; height:54px; font-size:18px; font-weight:500; background:#fff; border:1px solid #666; color:#666; cursor:pointer;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOption_order_btn_area .itemOption_order_btn{width:200px; height:54px; font-size:18px; font-weight:500; background:#666; color:#fff; border:0;  cursor:pointer;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn table{width:100%; border-collapse:collapse;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOptionJjim{display:inline-block; padding-left:4px; position:relative;}


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


/* op box(옵션) */
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
</style>

		<div class="container">
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
							<h3><%=product.getPRODUCT_NAME() %></h3>
							<h5 class="pt-3 pb-3 border-top" style="display:inline-block; font-size:32px; color: #333; font-weight: bold; font-family:'Tahoma', sans-serif; vertical-align: middle; padding-right:8px;"><%=String.format("%,d", product.getPRODUCT_PRICE()) %>원</h5>
							
							<div>
								<select id="select_option" class="form-select form-select-lg mb-3" onchange="selected_item('1441177158', '1441177158', '1441177158','pc')">
									<option value="basic" selected disabled hidden>상품옵션선택</option>
									<% for(int i=0;i<productStock.size();i++) { 
										String op=productStock.get(i).getpS_Option();
										int price=productStock.get(i).getpS_price();
									%>
									<option value="<%=op %>||<%=price %>||<%=56068+i %>" ><%=op %>   (<%=String.format("%,d", price) %>원)</option>
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
							<div class="d-flex justify-content-between align-items-center">
								<div class="col-6 d-grid p-1">
									<button type="button" class="btn btn-lg" style="font-size:18px; font-weight:500; background:#fff; border:1px solid #666; color:#666; cursor:pointer;">장바구니담기</button>
								</div>
								<div class="col-6 d-grid p-1">
									<button type="button" class="btn btn-lg" style="font-size:18px; font-weight:500; background:#666; color:#fff; border:0;  cursor:pointer;">주문하기</button>
								</div>
							</div>
							<!-- 
							<div class="itemOption_btn" style="width:100%; position:relative; padding:30px 0 0; text-align: right;">
								<span class="itemOption_cart_btn_area" style="display:inline-block; padding:0 3px 0 0;">
									<input type="submit" onclick="document.pressed=this.value;" value="장바구니" class="itemOption_cart_btn" style="width:200px; height:54px; font-size:18px; font-weight:500; background:#fff; border:1px solid #666; color:#666; cursor:pointer;">
								</span>
								<span class="itemOption_order_btn_area" style="display:inline-block; padding:0 3px 0 0;">
									<input type="submit" onclick="document.pressed=this.value;" value="바로구매" class="itemOption_order_btn" style="width:200px; height:54px; font-size:18px; font-weight:500; background:#666; color:#fff; border:0;  cursor:pointer;">
								</span>
							</div>
							 -->
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
								<span id="order_reviews">1</span>
							</a>
						</li>
						<li>
							<a href="#order_inquiry_area">상품문의
								<span id="order_inquiry">2</span>
							</a>
						</li>
					</ul>
				</div>
		
				<!-- 상세 페이지 -->
				
					<div  style="text-align: center;">
						<div id="itemContent_wrap" class="container p-0">
							<div id="item_info">
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/2047495408858.png?w=1536" class="img-fluid" /><br />
								<div class="ratio ratio-16x9 w-75 mx-auto mt-5 mb-3">
  <iframe src="https://www.youtube.com/embed/yiP6aLpHYfg?si=CF3zWx0-2Xyx5qPA"  title="YouTube video" allowfullscreen></iframe>
</div>
							
								<span style="font-size:30px;">갤러리</span>
								<hr>
								<div class="col-10 mx-auto">
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/09ff5cfd5709b.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/4fa0e7d70350a.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/35ecdbbf67d4a.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/be4ee49fb80bf.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/8a78c675434ba.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/8daaa931b9ebd.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/1a53495882d90.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/b990510e2068c.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/7d2a5551bca1a.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/7eaa11637baa1.jpg?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/08823c1fcc3de.png?w=1536" class="img-fluid" /><br />
								<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/18e6c1ccd9ea1.jpg?w=1536" class="img-fluid" /><br />
							
								</div>
								</div>
						</div>
					</div>
				
				<!-- 리뷰 -->
				
				                                   
			</div>
		</div>
		</div>

<script type="text/javascript" src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">

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
  opt += '<span><a href="javascript:"><img src="assets/img/detail/ui/item_min.png" alt="빼기" width="30px" onclick="item_minus('+str[2]+','+str[1]+')"></a></span>';
  opt += '<span class="item_num">';
  opt += '<input type="number" class="count" id="ct_qty'+str[2]+'" name="ct_qty[1710310953][]" value="1">';
  opt += '</span>';
  opt += '<span><a href="javascript:"><img src="assets/img/detail/ui/item_plus.png" alt="더하기" width="30px" onclick="item_plus('+str[2]+','+str[1]+')"></a></span>';
  opt += '</div>';
  opt += '<div class="item_select_price button price_font">'+numberWithCommas(str[1])+'<span>원</span>'+'<img src="assets/img/detail/ui/layer_close.png" alt="옵션 삭제('+str[2]+')" onclick="option_delete('+str[2]+','+str[1]+')" ></div>';
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