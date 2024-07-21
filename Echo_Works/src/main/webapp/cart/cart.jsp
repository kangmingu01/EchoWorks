<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style type="text/css">
        body.sijunBody { 
            background-color: #fff; 
            font-size: 13pt;
            min-width: 1480px;
            width: 100%;
            padding: 50px 0;
        }
        #frame { 
            width: 80%; 
            margin: 0 auto;
            padding: 50px 50px;
            background-color: #fff;
        }
        #frame2 { 
            border-bottom: solid 1px #e0e0eb;
            padding-bottom: 10px;
        }
        .home { 
            float: right;
        }
        table.calculation1, table.calculation2 { 
            clear: both;
            border: solid 1px #e0e0eb;
            border-collapse: collapse;
            background-color: #fff; 
            width: 100%;
            font-size: 10pt;
            text-align: center;
        }
        table.calculation1 th, table.calculation2 th { 
            border: solid 1px #e0e0eb;
            padding: 10px 0;
        }
        table.calculation1 td, table.calculation2 td { 
            border: solid 1px #e0e0eb;
            text-align: center;
        }
        .price { 
            font-size: 20pt;
            font-weight: bold;
        }
        .lifont { font-size: 10pt; color: gray; }
        .btn {
            border: none;
            color: white;
            padding: 5px 10px;
            font-size: 13px;
            cursor: pointer;
            border-radius: 5px;
        }
        .default { background-color: #fff; border: solid 1px gray; color: black; }
        .default:hover { background: #ddd; }
        .backBtn { background: #fff; border: solid 1px gray; }
        .btnFloat { float: left; }
        .btnFloat2 { float: right; }
        .clearboth { clear: both; }
        .footerbtn { float: right; font-weight: bolder; font-size: 12pt; border-radius: 3px; }
        #allProduct, #productClear, #footerbtn { padding: 11px 25px; }
        #allProduct { margin-left: 140px; background-color: #000; color: #fff; font-weight: bold; font-size: 12pt; }
        #productClear { background-color: gray; color: #fff; font-weight: bold; font-size: 12pt; }
        .aa:hover { cursor: pointer; }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<nav class="navbar navbar-expand-lg bg-transparent w-100">
      <div class="container mt-2 align-items-center">
        <!-- Logo -->
        <a class="navbar-brand fs-4 m-0 p-0 d-flex align-items-center text-white" href="#">
          <img src="../assets/img/logo_dark.svg" style="width: auto; height: 55px" alt="Logo" />
        </a>
        <!-- Toggle -->
        <button class="navbar-toggler shadow-none border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcavasNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- SideBar -->
        <div class="sidebar offcanvas offcanvas-end bg-white" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
          <!-- SideBar Header -->
          <div class="offcanvas-header border-dark border-bottom border-2">
            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">
              EchoWorks
            </h5>
            <button type="button" class="btn-close shadow-none" data-bs-dismiss="offcanvas" aria-label="Close"></button>
          </div>

          <!-- SideBar Body -->
          <div class="offcanvas-body">
            <ul class="navbar-nav justify-content-center fs-5 flex-grow-1 ps-lg-5 ms-lg-5">
              <li class="nav-item mx-2">
                <a href="#Keyboards" class="nav-link text-dark">Keyboards</a>
              </li>
              <li class="nav-item dropdown mx-2">
                <a href="#" class="nav-link dropdown-toggle text-dark" role="" data-bs-toggle="dropdown" aria-expanded="false">Switches</a>
                <ul class="dropdown-menu">
                  <li><a href="#" class="dropdown-item">리니어</a></li>
                  <li><a href="#" class="dropdown-item">택타일</a></li>
                  <li><a href="#" class="dropdown-item">저소음</a></li>
                  <li><a href="#" class="dropdown-item">마그네틱</a></li>
                </ul>
              </li>
              <li class="nav-item mx-2">
                <a href="#Keycaps" class="nav-link text-dark">Keycaps</a>
              </li>
              <li class="nav-item mx-2">
                <a href="#Deskpads" class="nav-link text-dark">Deskpads</a>
              </li>
            </ul>

            <!-- Login/ Sign up -->
            <div class="d-flex justify-content-center align-items-center gap-3 flex-nowrap">
              <a href="#login" class="text-decoration-none fs-5 text-dark">Login</a>
              <a href="#signup" class="text-decoration-none px-3 py-1 fs-5 text-dark">Sign up</a>
            </div>
            
          </div>
        </div>
      </div>
    </nav>
<body class="sijunBody">
    <div id="frame">
        <form>
            <div id="frame2">
                <span style="font-size: 16pt; font-weight: bold;">장바구니</span>
                <span class="home">홈 > 장바구니</span>
            </div>
            <br/>
            <div>
                <!-- 상품정보 테이블 -->
                <table class="calculation1">
                    <thead>
                        <tr>
                            <th colspan="8" style="text-align: left; padding-left: 10px;">일반상품(1)</th>
                        </tr>
                        <tr>
                            <th><input type="checkbox" id="check-all" /></th>
                            <th><span>이미지</span></th>
                            <th style="width: 550px;"><span>상품정보</span></th>
                            <th>판매가</th>
                            <th>수량</th>
                            <th>배송구분</th>
                            <th>배송비</th>
                            <th>합계</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="height: 90px; background-color: #fff;">
                            <td><input type="checkbox" class="check-item" /></td>
                            <td><img style="width: 80%;" src="상품 이미지 등록하기"/></td>
                            <td style="font-weight: bold;">상품 이름 입력하기</td>
                            <td class="unit-price">1000원</td> <!-- 예시 가격 1000원 설정 -->
                            <td>
                                <input type="number" class="quantity-input" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99" step="1" value="1"/>
                                <button type="button" class="btn default update-btn" style="border-radius: 3px; size: 10px;">변경</button>
                            </td>
                            <td>기본배송</td>
                            <td>2,500원<br/>고정</td>
                            <td class="total-price">1000원</td> <!-- 예시 가격 1000원 설정 -->
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr style="height: 60px;">
                            <td colspan="4" style="text-align: left; padding-left: 10px;"><span>[기본배송]</span></td>
                            <td colspan="4" style="text-align: right; padding-right: 10px;">
                                상품금액<span id="total-product-price">1000</span> + <span>배송비 2,500</span> = 합계<span id="final-price" style="font-weight: bold; font-size: 15pt;">3500</span>원
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <button type="button" class="btn default" id="delete-selected" style="margin-top: 10px;">삭제하기</button>
                <br/><br/><br/>
                <!-- 결제예정금액 테이블 -->
                <table class="calculation2">
                    <tr>
                        <th>총 상품금액</th>
                        <th>총 배송비</th>
                        <th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
                    </tr>
                    <tr style="background-color: #fff;">
                        <td style="padding: 22px 0;"><span id="summary-product-price" class="price">1000</span>원</td>
                        <td><span id="summary-shipping-price" class="price">2500</span>원</td>
                        <td><span id="summary-final-price" class="price">3500</span>원</td>
                    </tr>
                </table>
                <br/><br/>
                <div align="center">
                    <button class="btn default" id="allProduct">전체상품주문</button>
                    <button class="btn default backBtn" id="productClear">선택상품주문</button>
                    <button class="btn default footerbtn" id="footerbtn">쇼핑계속하기</button>
                    <span class="clearboth"></span>
                </div>
                <br/><br/><br/>
                <div style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color:white-space; padding-left: 10px;">
                    이용안내
                </div>
                <div style="border: solid 1px #e0e0eb; height: 350px; font-size: 12pt; padding-left: 10px;">
                    <br/>장바구니 이용안내
                    <ol>
                        <li class="lifont">해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
                        <li class="lifont">해외배송 가능한 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
                        <li class="lifont">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
                        <li class="lifont">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
                        <li class="lifont">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
                        <li class="lifont">파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
                    </ol>
                    무이자할부 이용안내
                    <ol>
                        <li class="lifont">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
                        <li class="lifont">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
                        <li class="lifont">단, 전체상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
                        <li class="lifont">무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 재시됩니다.<br/>
                            실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.</li>
                    </ol>
                </div>
            </div>
        </form>
    </div>
    <script>
        document.getElementById('check-all').addEventListener('click', function() {
            var checkboxes = document.querySelectorAll('.check-item');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = this.checked;
            }
        });

        document.querySelectorAll('.update-btn').forEach(function(button) {
            button.addEventListener('click', function() {
                var quantityInput = this.previousElementSibling;
                var newQuantity = quantityInput.value;
                var priceCell = this.closest('tr').querySelector('.total-price');
                var unitPrice = parseInt(this.closest('tr').querySelector('.unit-price').textContent.replace('원', ''));
                var newTotalPrice = newQuantity * unitPrice;
                
                priceCell.textContent = newTotalPrice + '원';
                
                updateSummary();
            });
        });

        function updateSummary() {
            var totalProductPrice = 0;
            document.querySelectorAll('.total-price').forEach(function(cell) {
                totalProductPrice += parseInt(cell.textContent.replace('원', ''));
            });

            var shippingCost = 2500; // 배송비
            var finalPrice = totalProductPrice + shippingCost;

            document.getElementById('total-product-price').textContent = totalProductPrice;
            document.getElementById('final-price').textContent = finalPrice;
            document.getElementById('summary-product-price').textContent = totalProductPrice;
            document.getElementById('summary-shipping-price').textContent = shippingCost;
            document.getElementById('summary-final-price').textContent = finalPrice;
        }

        document.getElementById('delete-selected').addEventListener('click', function() {
            var checkboxes = document.querySelectorAll('.check-item:checked');
            checkboxes.forEach(function(checkbox) {
                checkbox.closest('tr').remove();
            });
            updateSummary();
        });
    </script>
</body>
</html>
