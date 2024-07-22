<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/detail.css" />
</head>
<body>

	<%-- Header 영역 --%>
<div> <jsp:include page="../header.jsp"/> </div>

	<main class="mt-3">
		<div class="container">
			<div class="row">
				<!--  상품 이미지 -->
				<div class="col-md-5">
					<div id="carouselExampleCaptions"
						class="carousel carousel-dark slide" data-bs-ride="carousel">
						
						<!-- 상품 이미지 버튼-->
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="3" aria-label="Slide 4"></button>
						</div>
						
						<!-- 상품 이미지 -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img
									src="https://cdn.imweb.me/thumbnail/20240424/eb47e73cc9357.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block"></div>
							</div>
							<div class="carousel-item">
								<img
									src="https://cdn.imweb.me/thumbnail/20240424/447fb8a2905cc.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block"></div>
							</div>
							<div class="carousel-item">
								<img
									src="https://cdn.imweb.me/thumbnail/20240424/03f6c2d64b7fa.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block"></div>
							</div>
							<div class="carousel-item">
								<img
									src="https://cdn.imweb.me/thumbnail/20240424/bc2956c30dbd4.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block"></div>
							</div>
						</div>
						
						<!-- 상품 이미지 화살표 -->
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>

				<div class="col-md-7">
					<div class="card"shadow-sm">
						<div class="card-body">
							<h5 class="card-title">제품이름1</h5>
							<h5 class="card-title pt-3 pb-3 border-top">119,000원</h5>
							
							<div>
								<select id="select_option" class="form-select form-select-lg mb-3" onchange="selected_item('1441177158', '1441177158', '1441177158','pc')">
									<option value="basic" selected disabled hidden>상품옵션선택</option>
									<option value="Black-Black-Brass||166100||56068" >Black-Black-Brass   (66,100원)</option>
									<option value="Black-Black-Copper||182600||56069" >Black-Black-Copper   (182,600원)</option>
									<option value="Lilac-Lilac-White||109850||56070" >Lilac-Lilac-White   (109,850원)</option>
									<option value="Pink-Pink-White||214500||56071" >Pink-Pink-White   (214,500원)</option>
								</select>
							</div>
							
							<!-- 옵션 -->
							<div class="shop_item_select_box"></div>
							
							
							<div class="row pt-3 pb-3 border-top">
								<div class="col-6">
									<h3>총 상품 금액</h3>
								</div>
								<div class="col-6" style="text-align: right;">
									<h3>119,000</h3>
								</div>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								<div class="col-6 d-grid p-1">
									<button type="button" class="btn btn-lg btn-dark">장바구니담기</button>
								</div>
								<div class="col-6 d-grid p-1">
									<button type="button" class="btn btn-lg btn-danger">주문하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="row">

				<!-- 탭 -->
				<aside class="bd-aside sticky-xl-top text-body-secondary align-self-start mb-3 mb-xl-5 px-2">
					<div class="btn-group col-12" role="group" aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked> 
							<label class="btn btn-outline-dark btn-light" for="btnradio1">상세정보</label> 
							
							<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"> 
							<label class="btn btn-outline-dark btn-light" for="btnradio2">리뷰</label> 
							
							<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off"> 
							<label class="btn btn-outline-dark btn-light" for="btnradio3">Q&A</label>
					</div>
				</aside>
				<!-- 상세 페이지 -->
				<div class="col-12" style="text-align: center;">
					<img src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/2047495408858.png?w=1536" class="img-fluid" />
				</div>

				<!-- 리뷰 -->
				
				                                   
			</div>
		</div>
	</main>
	
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
	

	<!-- 하단 -->
	<footer class="mt-5 py-5 bg-dark">
		<div class="row">
			<div class="col-12 col-md">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="none" stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2" class="d-block mb-2"
					role="img" viewBox="0 0 24 24">
					<title>Product</title><circle cx="12" cy="12" r="10" />
					<path
						d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94" /></svg>
				<small class="d-block mb-3 text-muted">&copy; 2017–2024</small>
			</div>
			<div class="col-6 col-md">
				<h5>Features</h5>
				<ul class="list-unstyled text-small">
					<li><a class="link-secondary text-decoration-none" href="#">Cool
							stuff</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Random
							feature</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Team
							feature</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Stuff
							for developers</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Another
							one</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Last
							time</a></li>
				</ul>
			</div>
			<div class="col-6 col-md">
				<h5>Resources</h5>
				<ul class="list-unstyled text-small">
					<li><a class="link-secondary text-decoration-none" href="#">Resource
							name</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Resource</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Another
							resource</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Final
							resource</a></li>
				</ul>
			</div>
			<div class="col-6 col-md">
				<h5>Resources</h5>
				<ul class="list-unstyled text-small">
					<li><a class="link-secondary text-decoration-none" href="#">Business</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Education</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Government</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Gaming</a></li>
				</ul>
			</div>
			<div class="col-6 col-md">
				<h5>About</h5>
				<ul class="list-unstyled text-small">
					<li><a class="link-secondary text-decoration-none" href="#">Team</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Locations</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Privacy</a></li>
					<li><a class="link-secondary text-decoration-none" href="#">Terms</a></li>
				</ul>
			</div>
		</div>
	</footer>

<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous">
	</script>
</body>
</html>