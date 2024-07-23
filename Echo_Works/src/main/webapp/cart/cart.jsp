<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="echoworks.dao.CartDAO" %>
<%@ page import="echoworks.dto.CartDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
        .default { 
        background-color: #fff; border: solid 1px gray; color: black; }
        .default:hover {
         background: #ddd; }
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
</head>
<body class="sijunBody">
    <div id="frame">
        <form action="cart_action.jsp" method="post">
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
                        <%
                            int memberId = 1; // 로그인된 회원의 ID를 여기에 설정 (예: 1)
                            CartDAO dao = new CartDAO();
                            List<CartDTO> cartList = dao.getCartList(memberId);
                            int totalProductPrice = 0;
                            int shippingCost = 2500; // 고정 배송비

                            for (CartDTO cart : cartList) {
                                int unitPrice = 1000; // 예시 가격 설정 (DB에서 상품 가격을 가져와야 함)
                                int totalPrice = unitPrice * cart.getCart_num();
                                totalProductPrice += totalPrice;
                        %>
                        <tr style="height: 90px; background-color: #fff;">
                            <td><input type="checkbox" class="check-item" /></td>
                            <td><img style="width: 80%;" src=""/></td>
                            <td style="font-weight: bold;">상품 이름 입력하기</td>
                            <td class="unit-price"><%= unitPrice %>원</td> <!-- 예시 가격 1000원 설정 -->
                            <td>
                                <input type="number" class="quantity-input" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99" step="1" value="<%= cart.getCart_num() %>"/>
                                <button type="button" class="btn default update-btn" style="border-radius: 3px; size: 10px;">변경</button>
                            </td>
                            <td>기본배송</td>
                            <td>2,500원<br/>고정</td>
                            <td class="total-price"><%= totalPrice %>원</td> 
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr style="height: 60px;">
                            <td colspan="4" style="text-align: left; padding-left: 10px;"><span>[기본배송]</span></td>
                            <td colspan="4" style="text-align: right; padding-right: 10px;">
                                상품금액<span id="total-product-price"><%= totalProductPrice %></span> + <span>배송비 2,500</span> = 합계<span id="final-price" style="font-weight: bold; font-size: 15pt;"><%= totalProductPrice + shippingCost %></span>원
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
                        <td style="padding: 22px 0;"><span id="summary-product-price" class="price"><%= totalProductPrice %></span>원</td>
                        <td><span id="summary-shipping-price" class="price"><%= shippingCost %></span>원</td>
                        <td><span id="summary-final-price" class="price"><%= totalProductPrice + shippingCost %></span>원</td>
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

                // 수량 변경 후 서버로 요청 보내기
                var form = document.createElement("form");
                form.method = "post";
                form.action = "cart_action.jsp";

                var actionInput = document.createElement("input");
                actionInput.type = "hidden";
                actionInput.name = "action";
                actionInput.value = "update";
                form.appendChild(actionInput);

                var cartNoInput = document.createElement("input");
                cartNoInput.type = "hidden";
                cartNoInput.name = "cart_no";
                cartNoInput.value = this.closest('tr').getAttribute("data-cart-no");
                form.appendChild(cartNoInput);

                var quantityInputField = document.createElement("input");
                quantityInputField.type = "hidden";
                quantityInputField.name = "quantity";
                quantityInputField.value = newQuantity;
                form.appendChild(quantityInputField);

                document.body.appendChild(form);
                form.submit();
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
                var form = document.createElement("form");
                form.method = "post";
                form.action = "cart_action.jsp";

                var actionInput = document.createElement("input");
                actionInput.type = "hidden";
                actionInput.name = "action";
                actionInput.value = "delete";
                form.appendChild(actionInput);

                var cartNoInput = document.createElement("input");
                cartNoInput.type = "hidden";
                cartNoInput.name = "cart_no";
                cartNoInput.value = checkbox.closest('tr').getAttribute("data-cart-no");
                form.appendChild(cartNoInput);

                document.body.appendChild(form);
                form.submit();
            });
        });
    </script>
</body>
</html>
