<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>키보드쇼핑몰</title>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

<!-- fontawesome -->
<link
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous"
	referrerpolicy="no-referrer"
/>
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/light_header.css" />

</head>
<body>
 
<!-- 상단 -->
<!--Navbar-->
    <nav
      class="navbar navbar-expand-lg bg-white w-100 z-3 sticky-top border-bottom border-2 border-black"
    >
      <div class="container mt-2 align-items-center">
        <!-- Logo -->
        <a
          class="navbar-brand fs-4 m-0 p-0 d-flex align-items-center text-white nav_box"
          href="index.html"
        >
          <img
            src="../assets/img/logo_dark.svg"
            style="width: auto; height: 55px"
            alt="Logo"
          />
        </a>
        <!-- Toggle -->
        <button
          class="navbar-toggler shadow-none border-0"
          type="button"
          data-bs-toggle="offcanvas"
          data-bs-target="#offcanvasNavbar"
          aria-controls="offcanvasNavbar"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- SideBar -->
        <div
          class="sidebar offcanvas offcanvas-end"
          tabindex="-1"
          id="offcanvasNavbar"
          aria-labelledby="offcanvasNavbarLabel"
        >
          <div
            class="offcanvas-header text-dark border-bottom border-2 border-black justify-content-between align-items-center d-lg-none d-sm-flex"
          >
            <h5 class="offcanvas-title text-black" id="offcanvasNavbarLabel">
              EchoWorks
            </h5>

            <div class="d-flex gap-2 justify-content-center align-items-center">
              <!-- 로그인 성공 못했을 시 -->
              <a href="login.html" class="text-decoration-none text-black fs-5"
                >Login</a
              >

              <!-- 로그인 성공하면 -->
              <!-- <a href="#마이페이지" class="text-decoration-none text-black fs-5"
            >Mypage</a
          >
          <a href="#장바구니" class="text-decoration-none text-black fs-5"
            >Cart</a
          > -->
              <button
                type="button"
                class="btn-close shadow-none"
                data-bs-dismiss="offcanvas"
                aria-label="Close"
              ></button>
            </div>
          </div>

          <!-- SideBar Body -->
          <div class="offcanvas-body">
            <ul class="navbar-nav justify-content-center fs-5 flex-grow-1">
              <li class="nav-item dropdown mx-2">
                <a
                  class="nav-link dropdown-toggle keyboards"
                  href="product.html"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  name="keyboards"
                  onclick="handleClick(event, 'keyboards')"
                >
                  Keyboards
                </a>
                <ul
                  class="dropdown-menu bg-dark"
                  aria-labelledby="navbarDropdown"
                >
                  <li>
                    <a
                      class="dropdown-item text-white key_inStock"
                      name="key_inStock"
                      href="product.html"
                      >KeyBoard In-Stock</a
                    >
                  </li>
                  <li>
                    <a
                      class="dropdown-item text-white key_group"
                      name="key_group"
                      href="product.html"
                      >KeyBoard Group-buy</a
                    >
                  </li>
                </ul>
              </li>
              <li class="nav-item dropdown mx-2">
                <!-- 부트스트랩 dropdown 고질병으로 인해 onclick이벤트 호출해서 강제 이동 -->
                <a
                  class="nav-link dropdown-toggle switches"
                  href="product.html"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  name="switches"
                  onclick="handleClick(event, 'switches')"
                >
                  Switches
                </a>
                <ul
                  class="dropdown-menu bg-dark"
                  aria-labelledby="navbarDropdown"
                >
                  <li>
                    <a
                      class="dropdown-item text-white linear"
                      href="#"
                      name="linear"
                      >리니어</a
                    >
                  </li>
                  <li>
                    <a
                      class="dropdown-item text-white tactile"
                      href="#"
                      name="tactile"
                      >택타일</a
                    >
                  </li>
                  <li>
                    <a class="dropdown-item text-white low" href="#" name="low "
                      >저소음</a
                    >
                  </li>
                  <li>
                    <a
                      class="dropdown-item text-white magnet"
                      href="#"
                      name="magnet"
                      >마그네틱</a
                    >
                  </li>
                </ul>
              </li>
              <li class="nav-item dropdown mx-2">
                <!-- 부트스트랩 dropdown 고질병으로 인해 onclick이벤트 호출해서 강제 이동 -->
                <a
                  class="nav-link dropdown-toggle keycaps"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  name="keycaps"
                  onclick="handleClick(event, 'keycaps')"
                >
                  Keycaps
                </a>
                <ul
                  class="dropdown-menu bg-dark"
                  aria-labelledby="navbarDropdown"
                >
                  <li>
                    <a class="dropdown-item text-white sw" href="#" name="sw"
                      >SW</a
                    >
                  </li>
                  <li>
                    <a class="dropdown-item text-white fbb" href="#" name="fbb"
                      >FBB</a
                    >
                  </li>
                  <li>
                    <a class="dropdown-item text-white gmk" href="#" name="gmk"
                      >GMK</a
                    >
                  </li>
                  <li>
                    <a
                      class="dropdown-item text-white hammerworks"
                      href="#"
                      name="hammerworks"
                      >Hammerworks</a
                    >
                  </li>
                </ul>
              </li>
              <li class="nav-item mx-2">
                <a
                  href="#"
                  class="nav-link deskpads"
                  name="deskpads"
                  onclick="window.location.href='product.html#deskpads'"
                  >Deskpads</a
                >
              </li>
            </ul>

            <!-- Login/ Sign up -->
            <div
              class="justify-content-center align-items-center flex-nowrap nav_box nav_box_display d-lg-flex d-sm-none"
            >
              <!-- 회원 로그인 전 -->
              <a href="login.html" class="text-decoration-none text-black fs-5"
                >Login</a
              >

              <!-- 로그인 후 -->

              <!-- 아이콘으로 버전 -->
              <!-- <a href="#마이페이지" class="text-decoration-none text-black fs-5"
            ><i class="fa-regular fa-circle-user" style="color: #ffffff"></i
          ></a>
          <a href="#장바구니" class="text-decoration-none text-black fs-5"
            ><i class="fa-solid fa-cart-shopping" style="color: #ffffff"></i
          ></a> -->

              <!-- 글씨 버전 -->
              <!-- <a href="#마이페이지" class="text-decoration-none text-black fs-5"
            >Mypage</a
          >
          <a href="#장바구니" class="text-decoration-none text-black fs-5"
            >Cart</a
          > -->
            </div>
          </div>
        </div>
      </div>
    </nav>

<!-- 콘텐츠 시작 { -->
<div id="">
<link href="https://masitdak.com/bbs/bootstrap-select.min.css" rel="stylesheet" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
*{color:#222; font-size:15px; padding:0; margin:0; font-family: 'Noto Sans KR', sans-serif;}
ul { padding-left: 0; margin: 0; }
li { list-style-type: none; }
a:link, a:visited{ text-decoration:none; }
input,select{font-family: 'Noto Sans KR', sans-serif; font-size:14px;}
input, textarea{outline:none;}
input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {color:#999 !important; font-family: 'Noto Sans KR', sans-serif; font-size:14px;}
input::-moz-placeholder, textarea::-moz-placeholder {color:#999 !important; font-family: 'Noto Sans KR', sans-serif; font-size:14px;}
input:-ms-input-placeholder, textarea:-ms-input-placeholder {color:#999 !important; font-family: 'Noto Sans KR', sans-serif; font-size:14px;}
.mypage_title { padding-bottom: 30px; font-size: 25px; font-weight: bold; padding-left: 10px; }
#wrapper{width:100%; padding:0;}
#container{width:100%;}
.eventContent_area{text-align:center; padding:60px 0 150px;}

#item_wrap { width: 100%; font-family: 'Noto Sans KR', sans-serif;}
#item_wrap .item_content_box{width:1000px; margin:0 auto;}
#item_wrap .item_content_box > div{padding:75px 0 150px; position:relative;}
#item_wrap .item_content_box table{width:100%; border-collapse:collapse;}
.itemImg_area{padding-right:50px; vertical-align:top;}
.itemImg_area > div > img{width:480px; height:480px; border-radius:5px;}
.itemImg_area > div.info{text-align:center; padding:24px 0 0;}
.itemImg_area > div.info ul{display:inline-block;}
.itemImg_area > div.info ul .review_star{float:inherit; padding-right:5px;}
.itemImg_area > div.info span{font-size:16px; font-family:'Tahoma', sans-serif;}
.itemImg_area > div.info span.reviews{font-size:15px; color:#333; padding:0 0 0 10px;}
.itemImg_area > div.info span.reviews span{color:#666; border-bottom:1px solid #666; margin:0 0 0 4px;}
.itemImg_area > div.info span.reviews.zero span{border-bottom:0;}
.itemInfo_td{width:470px; vertical-align:top; position:relative;}
.itemInfo_td .itemInfo_td_div_area .orderItem_title{color:#333; font-weight:500; font-size:28px; line-height:40px; padding-bottom:18px;}
.itemInfo_td .itemInfo_td_div_area .orderItem_prc{border-bottom:1px solid #000; padding:0 0 15px 0;}
.itemInfo_td .itemInfo_td_div_area .orderItem_prc .sell_prc{display:inline-block; font-size:32px; color: #333; font-weight: bold; font-family:'Tahoma', sans-serif; vertical-align: middle; padding-right:8px;}
.itemInfo_td .itemInfo_td_div_area .orderItem_prc .sell_prc .price_unit{font-size:20px; font-family:'Noto Sans KR', sans-serif; font-weight:normal; color:#333;}
.itemInfo_td .itemInfo_td_div_area .orderItem_prc .normal_prc{display:inline-block; color:#999; font-size:20px; font-family:'Tahoma', sans-serif; text-decoration:line-through; vertical-align:bottom;     margin-bottom: 3px;}
.itemInfo_td .itemInfo_td_div_area .orderItem_prc .normal_prc .price_unit{color:#999; font-size:15px; font-family:'Noto Sans KR', sans-serif;}
.itemInfo_td .itemInfo_td_div_area .orderItem_prc .discount_percent{font-size: 32px; font-weight: 500; color: #FF5353; vertical-align: middle;}
.itemInfo_td .itemInfo_td_div_area .orderItem_prc .discount_percent .percent_unit{font-size: 20px; color: #FF5353; margin-right: 8px; vertical-align: middle;}
.itemInfo_td .itemInfo_td_div_area .info dl{padding:20px 0; border-bottom:1px solid #ededed;}
.itemInfo_td .itemInfo_td_div_area .info dl:last-child{border-bottom:0;}
.itemInfo_td .itemInfo_td_div_area .info dl:after{content:''; display:block; clear:both;}
.itemInfo_td .itemInfo_td_div_area .info dl > dt{float:left; width:100px; font-size:14px; color:#666; font-weight:300;}
.itemInfo_td .itemInfo_td_div_area .info dl > dd{float:left; max-width:370px; font-size:14px;}
.itemInfo_td .itemInfo_td_div_area .info dl > dd .delivery{font-size:14px; color:#B11116; padding:0 5px 0 0; vertical-align:baseline;}
.itemInfo_td .itemInfo_td_div_area .info dl > dd .price{font-family:'Tahoma', sans-serif;}
.itemInfo_td .itemInfo_td_div_area .info dl > dd > div:first-child{padding:0;}
.itemInfo_td .itemInfo_td_div_area .info dl > dd > div{font-size:14px; padding:5px 0 0;}
.itemInfo_td .itemInfo_td_div_area .itemOption_b{text-align:right; padding:25px 0 0;}
.itemInfo_td .itemInfo_td_div_area .itemOption_b .itemOptionPrice_t{font-size:16px; padding:0 20px 0 0;}
.itemInfo_td .itemInfo_td_div_area .itemOption_b .itemOptionPrice_p{font-size:32px; font-family:'Tahoma', sans-serif; font-weight:bold;}
.itemInfo_td .itemInfo_td_div_area .itemOption_b .itemOptionPrice_p .price_unit{font-size:22px; font-weight:500;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn{width:100%; position:relative; padding:30px 0 0;}
.itemInfo_td.fixed .itemInfo_td_div_area .itemOption_btn{width:auto; position:absolute; top:0; right:0; padding:40px 0 0;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOption_cart_btn_area{display:inline-block; padding:0 3px 0 0;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOption_cart_btn_area .itemOption_cart_btn{width:200px; height:54px; font-size:18px; font-weight:500; background:#fff; border:1px solid #666; color:#666; cursor:pointer;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOption_order_btn_area .itemOption_order_btn{width:200px; height:54px; font-size:18px; font-weight:500; background:#666; color:#fff; border:0;  cursor:pointer;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn table{width:100%; border-collapse:collapse;}
.itemInfo_td .itemInfo_td_div_area .itemOption_btn .itemOptionJjim{display:inline-block; padding-left:4px; position:relative;}
.itemInfo_td.fixed .shop_item_option{width:470px; padding:40px 0 0;}
.itemInfo_td.fixed .shop_item_select_box{width:470px; max-height:200px; margin:10px 0 0; overflow-y:auto;}
.itemInfo_td.fixed .shop_item_select_box .shop_item_select:first-child{margin:0;}
.itemInfo_td.fixed{width:100%; height:326px; background:#fff; position:fixed; bottom:0; left:0; z-index:99;}
.itemInfo_td.fixed > div{width:1000px; margin:0 auto; position:relative;}
.itemInfo_td.fixed > div .itemInfo_td_div_area .orderItem_title, .itemInfo_td.fixed > div .itemInfo_td_div_area .orderItem_prc, .itemInfo_td.fixed > div .itemInfo_td_div_area .info, 
.itemInfo_td.fixed > div .itemInfo_td_div_area .itemOption_b{display:none;}
.itemInfo_td.fixed .itemform-naverpay{position:absolute; top:94px; right:0;}
#jjim_btn, #b_jjim_btn{cursor:pointer;}
.itemMenu_tap_area:after{content:''; display:block; clear:both;}
.itemMenu_tap_area{margin:66px 0 40px 0;}
.itemMenu_tap_area li{float:left; width:25%;}
.itemMenu_tap_area li a{display:block; width:100%; height:54px; background:#fff; line-height:54px; font-size:15px; color:#666; border:1px solid #ccc; border-right:0; text-align:center;}
.itemMenu_tap_area li a.i_m_selected{color:#fff; background:#555; border:1px solid #555; border-right:0;}
.itemMenu_tap_area li:last-child a{border-right:1px solid #ccc;}
.itemMenu_tap_area li a #order_reviews, .itemMenu_tap_area li a #order_inquiry{color:#666; font-size:18px; font-family:'Tahoma', sans-serif; margin-left:2px; vertical-align:bottom;}
.itemMenu_tap_area li a.i_m_selected #order_reviews, .itemMenu_tap_area li a.i_m_selected #order_inquiry{color:#FAE078;}
#itemContent_wrap #item_info{max-height:4000px; overflow:hidden;}
#itemContent_wrap #item_info.tabcnt_detail0.expand{max-height:inherit;}
#itemContent_wrap #item_info .detail_more{position:absolute; width:260px; height:50px; bottom:70px; left:50%; z-index:2; margin-left:-130px; background:#fff; border:1px solid #222; border-radius:50px; text-align: center; cursor:pointer;}
#itemContent_wrap #item_info .detail_more span {color:#333; font-size:15px; line-height:50px;}
#itemContent_wrap #item_info .detail_more span img{padding:0 0 0 5px; margin-top:-2px;}
#itemContent_wrap #item_info .detail_more .d_close{display:none;}
#itemContent_wrap #item_info.tabcnt_detail0.expand .detail_more .d_close{display:block;}
#itemContent_wrap #item_info.tabcnt_detail0.expand .detail_more .d_open{display:none;}


#item_wrap .item_content_box .buy_tab {display:none; position:fixed; bottom:0; left:0; z-index:100; width:100%; height:4px;}
#item_wrap .item_content_box .buy_tab > div {position:absolute; bottom:0; left:50%; z-index:100; width:173px; margin-left:299px; text-align:right;}
#item_wrap .item_content_box .buy_tab > div span {cursor:pointer;}
#item_wrap .item_content_box .buy_tab.t_open {border-bottom:2px solid #eee;}
#item_wrap .item_content_box .buy_tab.t_close {bottom:326px; border-bottom:2px solid #eee;}
#item_wrap .item_content_box .order_option_b_area .order_option_b.fixed {position:fixed; bottom:0; left:0; z-index:100; width:100%; height:350px; background:#fff;}


#item_wrap .item_benefit{color: #f22; border: 1px solid #f22; padding: 3px 5px; text-align: center; box-sizing: border-box; font-size: 13px; vertical-align:middle;}
.item_benefit_m{margin-right:5px;}


.item_cart_amount { display: table;}
.item_cart_amount li { display: table-cell; }
.item_cart_amount img{cursor:pointer;}


.itemoption_amount > div{background:#F8F8F8; padding:20px 24px; border-radius:5px; position:relative;}
.itemoption_amount .itemoption_amount_title{font-size:15px; margin:0 0 10px; line-height:22px; max-height:45px; overflow:hidden; box-sizing:content-box;}
.itemoption_amount .itemCartAmount_area .item_count{margin:0 -4px 0px -3px;}
.itemoption_amount .itemCartAmount_area .item_count input{width:40px; height:30px; font-size:14px; color:#222; font-family:'Tahoma', sans-serif; border:0; border-top:1px solid #ccc; border-bottom:1px solid #ccc; text-align:center;}
.itemoption_amount .itemoption_amount_price{font-size:18px; font-weight:500; font-family:'Tahoma', sans-serif; line-height:30px; position:absolute; bottom:20px; right:24px;}
.itemoption_amount .itemoption_amount_price span{font-size:16px; font-weight:500;}
.itemInfo_td.fixed .itemoption_amount{width:470px; padding:40px 0 0;}


.itemOptionPrice:after{content:''; display:block; clear:both;}

.itemOptionPrice{padding-bottom:10px;}

.itemOptionPoint{padding-bottom:30px;}
.itemOptionPoint:after{content:''; display:block; clear:both;}
.itemOptionPoint_t{float:left; color:#333; font-size:24px;}
.itemOptionPoint_n{float:right; color:#333; font-size:24px; font-family:'Tahoma', sans-serif; font-weight:bold;}
.itemOptionPoint_n span{color:#333; font-size:24px; font-weight:bold;}


.b_itemOption_cart_btn_area{padding:0 10px;}
.b_itemOption_cart_btn{background-color: #fff; border: 1px solid #f22; color: #f22; width: 155px; height: 50px; font-size: 18px; cursor:pointer;}


.b_itemOption_order_btn_area{text-align:right; position:relative;}
.b_itemOption_order_btn{background-color: #f22; color: #fff; border: 0; width: 155px; height: 50px; font-size: 18px; cursor:pointer;}
.b_itemOption_sold_out{color: #999; border:1px solid #999; width: 322px; height: 50px; text-align:center; margin-left:10px;}


#jjim_complete{position: absolute; left:-4.3%; bottom:110%; width: 100%; box-sizing: border-box;}
#b_jjim_complete{position:absolute; left:-71%; bottom:109%; width: 100%; box-sizing: border-box;}
#jjim_complete img{max-width:100%;}
#b_jjim_complete img{max-width:100%;}
.itemOption_sold_out_area{display:inline-block;}
.itemOption_sold_out{color: #999; border:1px solid #999; width: 412px; height: 50px; text-align:center;}
/* 상품정보상세 */
.order_option_b_area{position: fixed; left: 0; bottom: -1px; width: 100%; background-color:#fff; z-index:9999; display:none;}
.order_option_b{width: 1000px; margin: 0 auto; padding:12px 24px; box-sizing:border-box;}
/* 구매후기 */
.order_reviews_title{color:#333; font-size:20px; font-weight:500; border-bottom:1px solid #000; padding:10px 5px; position:relative;}
.order_reviews_title span{font-size:14px; font-family:'Tahoma', sans-serif; font-weight:normal; color:#B11116; padding:0 0 0 5px;}
.order_reviews_title .order_reviews_btn{width:90px; height:34px; line-height:34px; font-size:13px; font-weight:500; background:#3A4C67; color:#fff; cursor:pointer; text-align:center; position:absolute;
bottom:10px; right:0;}
.order_reviews_n_btn_area{padding:20px 0; border-bottom:1px solid #ddd;}
.order_reviews_n_btn_area .order_reviews_n_list{font-size:13px; font-weight:300;}
.order_reviews_n_btn_area .order_reviews_n_list.order_reviews_n_list_m{padding:10px 0;}
.order_reviews_n_list .list_strong{color:#f22;}
.order_reviews_n_btn:after{content:''; display:block; clear:both;}
.order_reviews_n{float:left;}
/* 구매후기 리스트 */
.order_reviews_list_area{padding-bottom:50px;}
.order_reviews_list_area .order_reviews_list{padding:30px 0; border-bottom:1px solid #ededed;}
.review_table{ width:100%; border-collapse:collapse; }
.review_title{display:none; color:#333; padding-bottom:8px; font-weight:bold;}
.review_text{font-size:14px; color:#666;}
.review_point_i{ padding:0 14px; }
.review_point_i img{ width:28px; }
.review_point_t{ color:#999; font-size:12px; }
.review_star_days{ padding-bottom:12px;}
.review_star_days:after{ content:''; display:block; clear:both; }
.review_star_days .score{float:left; padding:0 10px 0 4px;}
.talk_answer{color:#666;}
.review_star{ float:left; margin:0 2px;}
.review_star img{margin-top:-4px;}
.review_user_id{float: left; line-height:21px; padding-right:8px; margin-right:8px; color:#888; font-size:13px; position:relative;}
.review_user_id:after{content:''; display:block; width:1px; height:10px; background:#e6e6e6; position:absolute; top:50%; right:0; margin-top:-5px;}
.review_days{color:#888; float:left; font-size:13px; font-family:'Tahoma', sans-serif; line-height:21px;}
.review_answer_manager{ padding-bottom:6px; }
.review_answer_manager:after{ content:''; display:block; clear:both; }
.review_manager{ color:#999; float:left; padding-right:12px; font-size:13px;}
.review_answer_icon_area{ vertical-align: top; padding-right: 10px; }
.review_answer_icon{ width:16px; margin-top:-14px;}
.review_none{ color:#999; height:300px; line-height:300px; text-align:center; display:none; }
/* 상품후기 답변 */
.review_answer_wrap{padding-top:10px;}
/* 상품 문의 */
.itemqa_list_wrap{padding-bottom:50px;}
.itemqa_list_wrap #appendArea_qa .inquireCon{padding:29px 0; cursor:pointer;}
.itemqa_list_wrap #appendArea_qa .inquireCon table td{text-align:center;}
.itemqa_list_wrap #appendArea_qa .inquireCon table td div.reply small{font-size:14px; color:#666; line-height:21px;}
.itemqa_list_wrap #appendArea_qa .inquireCon table td div.reply small.ver2{color:#B11116;}
.itemqa_list_wrap #appendArea_qa .inquireCon table td.inquireIconQ_area{text-align:left; padding:0 25px;}
.itemqa_list_wrap #appendArea_qa .inquireCon table td.inquireIconQ_area .inquireContent_title{font-size:14px; vertical-align:middle;}
.itemqa_list_wrap #appendArea_qa .inquireCon table td div.inquireUserId{font-size:14px; color:#666;}
.itemqa_list_wrap #appendArea_qa .inquireCon table td div.inquireDays{font-size:14px; color:#666; font-family:'Tahoma', sans-serif;}

.item_list_check{padding:0 0 12px;}
.item_list_check li{width:115px; font-size:14px;}
.itemqa_regist_phrase{padding:0;}
.itemqa_regist_phrase > div{font-size:13px;}
.itemqa_regist_phrase .write_box{background:#f7f7f7; padding:26px 22px 26px 27px; margin:20px 0 0; border:1px solid #ddd;}
.itemqa_regist_phrase_c{padding:10px 0;}
.itemqa_regist_phrase_c a{font-size:12px; color:#666; padding:0 0 0 5px; position:relative;}
.itemqa_regist_phrase_c a:after{content:""; display:block; width:4px; height:4px; border-top:1px solid #999; border-right:1px solid #999; -webkit-transform: rotate(45deg); transform: rotate(45deg);
 position:absolute; right:-8px; top:50%; margin-top:-2px;}
.itemqa_regist{margin:0; border:0; background:none;}
.pointColor{color:#f22;}
.regist_submit_btn{float:right; width:90px; height:80px; line-height:80px; background:#999; font-size:16px;}
.qa_regist_textarea{color:#333; width:852px; height:80px; font-size:14px; padding:20px; border:1px solid #ccc; font-family: 'Noto Sans KR', sans-serif; box-sizing:border-box; vertical-align:top;}
#iq_question::-webkit-input-placeholder {color:#B3B3B3 !important; font-family: 'Noto Sans KR', sans-serif; font-size:14px; vertical-align:top; line-height:inherit; text-transform: uppercase;}
#iq_question::-moz-placeholder {color:#B3B3B3 !important; font-family: 'Noto Sans KR', sans-serif; font-size:14px; vertical-align:top; line-height:inherit; text-transform: uppercase;}
#iq_question:-ms-input-placeholder {color:#B3B3B3 !important; font-family: 'Noto Sans KR', sans-serif; font-size:14px; vertical-align:top; line-height:inherit; text-transform: uppercase;}
.qa_regist_input_middle{color:#333; border:1px solid #ccc; height:40px; box-sizing:border-box;}
.item_inquiry_title_area{border-bottom:1px solid #000; padding:10px 5px; position:relative;}
.item_inquiry_title_area:after{content:''; display:block; clear:both;}
.item_inquiry_title_area .item_inquiry_title{float:left; color:#333; font-size:20px; font-weight:500;}
.item_inquiry_title_area .item_inquiry_title span{font-size:14px; font-family:'Tahoma', sans-serif; font-weight:normal; color:#B11116; padding:0 0 0 5px;}
.oneToone_inquiry{float:right; margin-top:-7px;}
.oneToone_inquiry a{display:block; width:116px; height:34px; line-height:34px; font-size:13px; border:1px solid #ccc; text-align:center;}
.item_list_check li img{vertical-align: middle; width: 20px;}
.nonmembership_qa_delete_btn{width: 50px; height: 40px; background-color: #fff; border: 1px solid #f22; color: #f22; box-sizing: border-box; cursor:pointer;}
/* 상품문의 list */
.itemqa_area{padding:20px 0 0;}
.inquireListTable{ width:100%; border-collapse:collapse; }
.inquirAnswer{color:#333; background:#f8f8f8; border-radius:0px 5px 5px 5px; padding:16px 20px; position:relative;}
.inquirAnswer:before{content:''; display:block; width:40px; height:23px; background:url('../img/msd_answer.png') no-repeat; position:absolute; top:0; left:-16px; z-index:-1;}
.inquirAnswer p:first-child br{display:none;}
.inquireIconA{ width:52px; vertical-align:top; padding-right:10px; }


.m_d_a_btn_area{vertical-align:top;}
.m_d_a_btn{text-align:right; padding-bottom:12px;}
.m_d_a_btn a{display:inline-block;}


.answerDays{color:#666; font-size:12px; font-family:'Tahoma', sans-serif; padding:0 0 10px 0;}
.answerDays .adm{color:#666; font-size:12px; font-family:'Noto Sans KR', sans-serif; position:relative; padding:0 8px 0 0; margin:0 8px 0 0;}
.answerDays .adm:after{content:''; display:block; width:1px; height:12px; background:#e6e6e6; position:absolute; top:50%; right:0; margin-top:-4px;}
.inquireLine{border-bottom: 1px solid #eee;}
.inquireLine .inquireAwrap{display:none; padding:24px 10px 30px; border-top:1px solid #ededed;}
.inquireLine .inquireAwrap .inquireContent{font-size:14px; padding:0 0 20px;}
.userinquire_m_d_icon{width:60px; height:30px; line-height:30px; text-align:center; vertical-align: middle; border: 1px solid #ccc; color: #666; /*padding: 3px 10px;*/ font-size: 13px; display:inline-block; box-sizing:border-box;}
.userinquire_delete{/*margin:0 20px 0 5px;*/ cursor:pointer;}
#iq_question2{color:#333; font-family:'Noto Sans KR', sans-serif;}
/* 페이징 */
.item_paging_box { height: 50px; line-height: 50px; text-align: center; }
.item_paging_box ul { padding-left: 0;}
.item_paging_box li { list-style: none; display: inline-block;} 
.item_paging_box li a { text-decoration: none; display: inline-block; width: 30px; height: 30px; text-align: center; line-height: 30px; font-size: 13px; color: #222;
font-family: "Tahoma";}
.item_paging_box li a .mypage_paging_all { width: 8px;}
.item_paging_box li a.mypage_paging_select { border: 1px solid #ff2222; color: #ff2222;}
.item_paging_box li a .mypage_paging_one { width: 5px;}
::-webkit-input-placeholder {color:#999;}
::-moz-placeholder {color:#999;}
:-ms-input-placeholder {color:#999;}
input:-moz-placeholder {color:#999;}
#top_btn{position:fixed; right:15%; bottom:50%; display: none; z-index:999; cursor:pointer;}

.nonmembership_inquire_d_t{display:none;}
.itemform-naverpay{padding: 20px 0; text-align: right;}
/* selectpicker */
.h1, .h2, .h3, h1, h2, h3{margin:0; line-height:inherit;}
p{margin:0;}
dl{margin:0;}
dt{font-weight:normal;}
dd, dt{line-height:inherit;}
.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn){width:470px;}
.bootstrap-select .dropdown-toggle .filter-option-inner-inner{color:#666; font-weight:300;}
/*.bootstrap-select>.dropdown-toggle{padding:12.5px 18px; border-radius:5px;}*/
.btn-default:hover{color:#666; background-color:#fff; border-color:#ccc;}
.btn-default.active.focus, .btn-default.active:focus, .btn-default.active:hover, .btn-default:active.focus, .btn-default:active:focus, .btn-default:active:hover, .open>.dropdown-toggle.btn-default.focus, .open>.dropdown-toggle.btn-default:focus, .open>.dropdown-toggle.btn-default:hover{color:#666; background-color:#fff; border-color:#ccc;}
.btn-default.active, .btn-default:active, .open>.dropdown-toggle.btn-default{color:#666; background-color:#fff; border-color:#ccc;}
.dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover {color:#333; text-decoration:none; background-color:#fff;}
.bootstrap-select .dropdown-menu li a span.text{color:#333;}
.dropdown-menu>li>a{padding:6px 18px;}
.dropdown-menu{padding:8px 0; margin:0;}
.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover{background-color:#fff;}
.btn-default.focus, .btn-default:focus{outline:none; outline-offset:inherit;}
.btn-default.focus, .btn-default:focus{background-color:#fff; border-color:#ccc;}
.bootstrap-select .dropdown-toggle:focus, .bootstrap-select>select.mobile-device:focus+.dropdown-toggle{outline:none !important; outline-offset:inherit; box-shadow: none !important;}
.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover, .bootstrap-select .dropdown-menu li, .bootstrap-select .dropdown-menu li a{outline:none !important;}
.bootstrap-select .dropdown-menu li.disabled a span.text {color:#999;}

/* op box */
.shop_item_select_box {max-height:240px; overflow-y:auto;}
.shop_item_select_box .shop_item_select:first-child{margin:0;}
.shop_item_select_box .shop_item_select{background:#F8F8F8; padding:20px 24px; border-radius:5px; margin:10px 0 0; position:relative;}
.shop_item_select_box .shop_item_select .item_select_text{font-size:15px; margin:0 0 10px; line-height:22px; max-height:45px; overflow:hidden; box-sizing:content-box;}
.shop_item_select_box .shop_item_select .item_select_num .item_num input{width:40px; height:30px; font-size:14px; color:#222; font-family:'Tahoma', sans-serif; border:0; border-top:1px solid #ccc; border-bottom:1px solid #ccc; text-align:center;}
.shop_item_select_box .shop_item_select .item_select_price{font-size:18px; font-weight:500; font-family:'Tahoma', sans-serif; line-height:30px; position:absolute; bottom:20px; right:24px;}
.shop_item_select_box .shop_item_select .item_select_price span{font-size:16px; font-weight:500;}
.shop_item_select_box .shop_item_select .item_select_price img{padding:0 0 0 12px; vertical-align:baseline; cursor:pointer;}
/* 배송안내 */
#order_delivery_area h2{font-size:20px; padding:10px 5px; border-bottom:1px solid #000;}
#order_delivery_area table th, #order_delivery_area table td{font-size:14px; font-weight:normal; border-bottom:1px solid #e6e6e6;}
#order_delivery_area table th{width:160px; background:#f8f8f8; padding:24px; vertical-align:top; word-break:keep-all;}
#order_delivery_area table td{padding:20px 24px 20px 40px; line-height:24px; word-break:keep-all;}
#order_delivery_area h2.bottom_t{padding-top:54px;}
#order_delivery_area table.bottom td{font-size:13px;}
</style>

<form name="fitem" method="post">
<div>
	<div id="item_wrap">
		<div class="item_content_box">
			<div>
				<table>
					<tr>
						<!-- 상품이미지 -->
                        <td class="itemImg_area">
                            <div>
                            	<img src="https://cdn.imweb.me/thumbnail/20240424/eb47e73cc9357.jpg" width="300" height="300" id="1441177158" id="1441177158" alt="" >
                            </div>
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
                                        <select name="select_option" id="select_option" class="selectpicker" onchange="selected_item('1441177158', '1441177158', '1441177158','pc')">
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
                                <li class="iteminfo_menu">
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
                                <li>
                                	<a href="#order_delivery_area">배송안내</a>
                               	</li>
                            </ul>
                 		</aside>
						<!-- content -->
						<div id="itemContent_wrap">

						<!-- 상품정보상세 -->
						<div id="item_info" class="tabcnt_detail0">
							<div class="content">
                                        
<style>
#sit_inf_explan{line-height:0;}
#sit_inf_explan img{
max-width: 860px; 
height: auto;
display: block;
vertical-align: top;
margin: 0 auto;
padding: 0;
}
</style>
								<!-- 상품 정보 시작 { -->
								<section id="sit_inf">
        							<!--<h3>상품 상세설명</h3>-->
    								<div id="sit_inf_explan">
        								<div style="margin:0px auto;width:100%;text-align:center;"> 
        									<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/2047495408858.png?w=1536" /><br />
        									<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/18e6c1ccd9ea1.jpg?w=1536" /><br />
        									<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/18e6c1ccd9ea1.jpg?w=1536" /><br />
        									<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/18e6c1ccd9ea1.jpg?w=1536" /><br />
        									<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/18e6c1ccd9ea1.jpg?w=1536" /><br />
        									<img alt="상세" src="https://cdn-optimized.imweb.me/upload/S20220103536cb52c56eda/18e6c1ccd9ea1.jpg?w=1536" /><br />
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
  opt += '<span class="item_num" id="item_count2" name="item_count2">';
  opt += '<input type="text"  id="ct_qty'+str[2]+'" name="ct_qty[1710310953][]" value="1" readonly>';
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
							<div class="detail_more">
								<span class="d_open">상품정보 더보기
									<img src="../assets/img/ar_down.png" alt="상품정보 더보기">
								</span>
								<span class="d_close">상품정보 닫기
									<img src="../assets/img/ar_up.png" alt="상품정보 닫기">
								</span>
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
							<div class="item_paging_box">&nbsp;
								<a><span style="color: #fa8702; font-weight: bold;">1</span></a> &nbsp;
								<a href='javascript:ajax_item_use(1441177158,2);'><span>2</span></a> &nbsp;
								<a href='javascript:ajax_item_use(1441177158,3);'><span>3</span></a>
							</div>
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
										<table width=100% cellpadding=0 cellspacing=0>
											<tr>
												<td class="itemqa_regist_phrase">
													<div>· 상품문의에서는 상품과 무관한 요청은 처리되지 않습니다.</div>
													<div>· 배송문의·취소·환불 등은 1:1상담게시판을 통해 문의남겨주시기 바랍니다.</div>
													<div>· 미구매,비방이나 양도 광고성, 욕설, 도배글, 개인정보가 포함된 글은 예고없이 삭제되거나 노출이 제한될 수 있습니다.</div>
                                            		
                                            		<!-- 상담 등록 -->
                                            		<div class="write_box">
                                            			<table width=100% cellpadding=0 cellspacing=0 border=0>                 
                                            				<tr>
                                            					<td class="item_list_check">
                                            						<ul style="margin-bottom: 5px;">
                                            							<li>
                                            								<img class="goods" src="../assets/img/check_02.png" onclick="qa_select('상품문의')">상품문의
                                            							</li>
                                            							<li>
                                            								<img class="goods" src="../assets/img/check_01.png" onclick="qa_select('배송문의')">배송문의
                                            							</li>
                                            							<li>
                                            								<img class="goods" src="../assets/img/check_01.png" onclick="qa_select('기타문의')">기타문의
                                            							</li>
                                            						</ul>
                                            					</td>
                                            				</tr>
                                            				<tr>
                                            					<td>
                                            						<span style="display: inline-block; margin:0 5px 5px 0;">
                                            							<input type="text" name="iq_name" id="iq_name" class="qa_regist_input_middle" maxlength=20 minlength=2  itemname="이름" placeholder="이름" style="padding-left: 20px;"/>
                                            						</span>
                                            						<span style="display: inline-block; margin:0 0 5px 0;">
                                            							<input type="password" name="iq_password" id="iq_password" class="qa_regist_input_middle" maxlength=20 minlength=3  itemname="패스워드" placeholder="패스워드" style="padding-left: 20px;" />
                                            						</span>
                                            					</td>
                                            				</tr>
                                            				<tr>
                                            					<td>
                                            						<div>
                                            							<textarea name="iq_question" id="iq_question" itemname="내용" class=qa_regist_textarea placeholder="상품문의 외에 문의·요청은 1:1 상담게시판을 이용해주세요."></textarea>
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
										<textarea id='tmp_iq_id0' style='display:none;'>1926</textarea>
										<textarea id='tmp_iq_member0' style='display:none;'></textarea>
										<textarea id='tmp_iq_name0' style='display:none;'>ㅇㅇ</textarea>
										<textarea id='tmp_iq_password0' style='display:none;'>24eb60438e77548b221428f6b624cc20cb5a3b2dcbf80730532d7843bdef85c2</textarea>
										<textarea id='tmp_iq_ca0' style='display:none;'>상품문의</textarea>
										<textarea id='tmp_iq_question0' style='display:none;'>100g 몇봉지인가요?</textarea>                             
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
														<td colspan="3" class="m_d_a_btn_area">
															<!-- 회원 수정삭제가능 -->
															<div class="answerCompletion m_d_a_btn">
																<table>
																	<tr>
																		<td>
																			<span class="userinquire_delete userinquire_m_d_icon" onclick="javascript:del_btn('1926');">삭제</span>
																		</td>
																	</tr>
																</table>
                                                                </div>
                                                                <div>
                                                                	<table class="nonmembership_inquire_d_t">
                                                                		<tr>
                                                                			<td style="text-align:right; padding:0 0 10px 0;">
                                                                				<input type="password" name="del_password1926" id="del_password1926" class="qa_regist_input_middle" maxlength=20 minlength=2  itemname="패스워드" placeholder="패스워드" style="padding-left: 10px;"/>
                                                                				<input type="button" value="확인" class="nonmembership_qa_delete_btn" onclick="javascript:del_submit('1926');">
                                                                			</td>
                                                                		</tr>
                                                                	</table>
                                                                </div>
															</td>
														</tr>
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
										<div class="item_paging_box">&nbsp;
											<a><span style="color: #fa8702; font-weight: bold;">1</span></a> &nbsp;
											<a href='javascript:ajax_item_qa(1441177158,2);'><span>2</span></a> &nbsp;
											<a href='javascript:ajax_item_qa(1441177158,3);'><span>3</span></a> &nbsp;
											<a href='javascript:ajax_item_qa(1441177158,4);'><span>4</span></a> &nbsp;
											<a href='javascript:ajax_item_qa(1441177158,5);'><span class="next_prev"> ▶ </span></a>
										</div>
									</div>
								</div>
							</div> <!-- // 상품 문의 -->
							
							<!-- 배송안내 -->
							<div id="order_delivery_area">
								<h2>배송안내</h2>
                                    <table>
                                    	<tr>
                                            <th>배송 방법</th>
                                            <td>CJ대한통운(1588-1255), 롯데택배(1588-2121), 한진택배(1588-0011)</td>
                                        </tr>
                                        <tr>
                                            <th>배송 지역</th>
                                            <td>전국</td>
                                        </tr>
                                        <tr>
                                            <th>배송 비용</th>
                                            <td>3,000원 (20,000원이상 무료배송)<br>제주도 및 도서산간 지역 추가 운임 : 4,000원</td>
                                        </tr>
                                        <tr>
                                            <th>배송 기간</th>
                                            <td>결제(입금)일로부터 1~2일 후 (주말/공휴일 제외)</td>
                                        </tr>
                                        <tr>
                                            <th>배송 마감</th>
                                            <td>- 월~금요일 : 17시까지 주문 시, 내일 도착<br>
- 일요일 : 15시까지 주문 시, 내일 도착
<br>
<br>
 ※ 토요일/공휴일 결제 시, 다음 영업일 발송<br>
 ※ 도서산간, 택배사 사유 등의 이유로 도착 예정일은 변동될 수 있습니다.<br>
 ※ 금요일 주문 마감 시간 이전 주문은 토요일에 배송됩니다.<br>
    주말 수령이 어려운 경우, 배송 메시지에 표시해주시면<br>
    월요일에 발송되어 화요일에 받아보실 수 있습니다.<br>
(공휴일인 경우, 다음 영업일 발송)			</td>
                                        </tr>
                                        <tr>
                                            <th>주말 출고</th>
                                            <td>- 목요일 배송 마감 시간 이후 주문은 금요일 출고되어 토요일에 배송됩니다.<br>
- 토요일 수령이 어려우신 고객님께서는 배송 메시지에 “월요일출고” 라고 적어주시면 월요일에 출고되어 화요일에 받아보실 수 있습니다. (공휴일인 경우 다음 영업일 출고)<br>
※ 야채 및 개별 출고일정을 따르는 제품은 제외<br></td>
                                        </tr>
									</table>

                                    <h2 class="bottom_t">교환/반품 안내</h2>
                                    <table class="bottom">
                                    	<tr>
                                            <th>주의사항</th>
                                            <td>- 본 상품은 제품 특성상 단순 변심에 의한 교환 · 반품은 불가합니다.<br>
- 군부대, 사서함 주소의 경우 배송이 안될 수 있으니 고객센터 확인 후 주문 바랍니다.<br>
(구매 전 제품 상세 및 배송 · 반품에 대한 내용을 확인해 주세요.)<br></td>
                                        </tr>
                                        <tr>
                                            <th>교환/반품 신청</th>
                                            <td>제품의 교환 및 반품 시 고객센터 담당자에게 교환 또는 반품 신청을 해주시기 바랍니다.<br>
(전화 : 070-8984-5771 / 홈페이지 고객센터)<br>
<br>
- 교환 및 반품은 고객센터 담당자와 협의를 통해 이루어지며, 임의로 수취거부 및 반송하는 경우 반품 처리되지 않습니다.<br>
- 냉동/냉장 식품의 경우 제품의 특성상 ‘단순변심’에 의한 반품 및 환불은 불가합니다.<br>
  주문전 충분히 제품 상세페이지 및 제품 설명을 참고하시고 주문바랍니다. <br>
- N페이 결제건은 출고/반품 주소지가 상품별로 상이하여, 자동 수거 지시 기능이 불가합니다.</td>
                                        </tr>
                                        <tr>
                                            <th>교환/반품이 가능한 경우</th>
                                            <td>- 주문한 제품과 다르거나 판매자의 제공정보와 상이한 경우<br>
- 제품이 불량이거나 손상된 경우<br>
- 배송사의 귀책 사유에 따른 배송 지연 발생 및 제품이 변질 된 경우<br></td>
                                        </tr>
                                        <tr>
                                            <th>교환/반품이 불가능한 경우</th>
                                            <td>- 판매자와 교환/반품에 대한 협의 없이 임의로 폐기 처분 또는 반품/배송한 경우<br>
- 냉동·냉장 보관 식품 및 채소, 유통기한이 2개월 미만인 상품에 대한 단순 변심의 경우<br>
- 잘못된 주소나 연락처 기재로 인한 반송 또는 고객의 부재로 인해 배송이 지연되어 제품이 변질된 경우<br>
- 수령 후, 보관/취급 부주의로 인해 제품이 변질 또는 손상된 경우<br>
- PC 및 휴대폰의 화면과 실제 상품의 색상이나 이미지 차이 또는 개인적 취향이나 기호에 따른 교환/반품<br></td>
                                        </tr>
                                        <tr>
                                            <th>교환/반품 절차</th>
                                            <td>- 전화 및 이메일을 통해 반송처 및 교환/반품 방법을 안내해드립니다.<br>
- 반품시 결제방식에 따라 카드 승인취소 또는 계좌입금 처리를 해드립니다.<br></td>
                                        </tr>
                                   	</table>
                                </div>
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
<script type="text/javascript"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
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

//상품정보 더보기
var scroll_expand = 0;
$('.detail_more').on('click',function(){
    if($('#itemContent_wrap .tabcnt_detail0').hasClass('expand')){
        $('#itemContent_wrap .tabcnt_detail0').removeClass('expand');
        $(window).scrollTop(scroll_expand);
    } else {
        $('#itemContent_wrap .tabcnt_detail0').addClass('expand');
        scroll_expand = $(window).scrollTop();
    }
    $(window).scroll();
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
<!-- } 콘텐츠 끝 -->

<hr>

<!-- 하단 -->
<footer class="bg-dark pt-5">
	<div class="py-12 border-bottom border-gray-700">
        <div class="container pb-5">
          <div class="row">
            <div class="col-12 col-md-3">
              <!-- Heading -->
              <h4 class="mb-6 text-white text-center">ECHOWORKS</h4>

              <!-- Social -->
              <ul class="list-unstyled list-inline mb-7 mb-md-0 d-flex justify-content-center text-center align-items-center">
                <li class="list-inline-item">
                  <a href="#!" class="text-gray-350">
                    <i class="fa-brands fa-x-twitter fs-5"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#!" class="text-gray-350">
                    <i class="fa-brands fa-youtube fs-5"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#!" class="text-gray-350">
                    <i class="fa-brands fa-instagram fs-5"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#!" class="text-gray-350">
                    <i class="fa-brands fa-discord fs-5"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#!" class="text-gray-350">
                    <i class="fa-brands fa-github fs-5"></i>
                  </a>
                </li>
              </ul>
            </div>
            <div class="col-6 col-sm">
              <!-- Heading -->
              <h6 class="heading-xxs mb-4 text-white">MEMBER</h6>
              <!-- Links -->
              <ul class="list-unstyled mb-7 mb-sm-0">
                <li>
                  <a class="text-gray-300" href="#">강민구</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#">강성환</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#">김혜련</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#">이정현</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#">조원익</a>
                </li>
              </ul>
            </div>
            <div class="col-6 col-sm">
              <!-- Heading -->
              <h6 class="heading-xxs mb-4 text-white">Shop</h6>

              <!-- Links: 나중에 여기에 상품 링크 걸면 될 듯 -->
              <ul class="list-unstyled mb-7 mb-sm-0">
                <li>
                  <a class="text-gray-300" href="#">Keyboards</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#">Switches</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#">Keycaps</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#">Deskpads</a>
                </li>
              </ul>
            </div>
            <div class="col-6 col-sm">
              <!-- Heading -->
              <h6 class="heading-xxs mb-4 text-white">Company</h6>

              <!-- Links -->
              <ul class="list-unstyled mb-0">
                <li>
                  <a class="text-gray-300" href="./about.html">Our Story</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#!">Careers</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#!">Terms &amp; Conditions</a>
                </li>
                <li>
                  <a class="text-gray-300" href="#!"
                    >Privacy &amp; Cookie policy</a
                  >
                </li>
              </ul>
            </div>
            <div class="col-6 col-sm">
              <!-- Heading -->
              <h6 class="heading-xxs mb-4 text-white">Contact</h6>

              <!-- Links -->
              <ul class="list-unstyled mb-0" style="text-align: left">
                <li>
                  <i class="fas fa-home me-3 text-white-50"></i>
                  <a class="text-gray-300" href="#!"
                    >서울특별시 강남구 역삼동</a
                  >
                </li>
                <li>
                  <i class="fas fa-envelope me-3 text-white-50"></i>
                  <a class="text-gray-300" href="#!">02-6255-8002</a>
                </li>
                <li>
                  <i class="fas fa-phone me-3 text-white-50"></i>
                  <a class="text-gray-300" href="#!">EW@itwill.com</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>

<!-- } 하단 끝 -->
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

    <script>
      function handleClick(event, category) {
        if ($(window).width() >= 992) {
          // lg 사이즈 이상
          event.preventDefault();
          window.location.href = `product.html#${category}`;
        }
      }
    </script>
</body>
</html>
