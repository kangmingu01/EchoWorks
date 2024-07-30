<%@page import="echoworks.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="echoworks.dao.CartDAO" %>
<%@ page import="echoworks.dao.ProductStockDAO" %>
<%@ page import="echoworks.dto.CartDTO" %>
<%@ page import="echoworks.dto.ProductStockDTO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="echoworks.dto.MemberDTO" %>

<%
    // 로그인된 사용자 정보 가져오기
    HttpSession currentSession = request.getSession(); // 현재 세션 가져오기
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember"); // 로그인된 사용자 정보 가져오기

    if (loginMember == null) { // 로그인되지 않은 경우
        out.println("<script>alert('로그인이 필요합니다.');location.href='index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    int memberId = loginMember.getMemberNum(); // 회원 번호 가져오기
    List<CartDTO> cartList = CartDAO.getDao().getCartList(memberId); // 회원의 장바구니 리스트 가져오기
    int totalProductPrice = 0; // 총 상품 가격 초기화
    int shippingCost = 2500; // 고정 배송비 설정
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <style>
        table th, table td {
            text-align: center; /* 테이블 셀 내 텍스트 중앙 정렬 */
            vertical-align: middle; /* 행의 수직 정렬 추가 */
        }
        .sijunBody {
            background-color: #fff; /* 배경색 흰색 */
            font-size: 13pt; /* 기본 폰트 크기 */
            padding: 50px 0; /* 상하 패딩 */
        }
        .price {
            font-size: 20pt; /* 가격 텍스트 크기 */
            font-weight: bold; /* 가격 텍스트 굵게 */
        }
        .btn-custom {
            border: none; /* 버튼 외곽선 없음 */
            color: white; /* 텍스트 색상 흰색 */
            padding: 5px 10px; /* 버튼 패딩 */
            font-size: 13px; /* 버튼 텍스트 크기 */
            cursor: pointer; /* 마우스 커서 포인터 */
            border-radius: 5px; /* 버튼 모서리 둥글게 */
        }
        .btn-default {
            background-color: #fff; /* 기본 버튼 배경색 흰색 */
            border: solid 1px gray; /* 회색 외곽선 */
            color: black; /* 텍스트 색상 검정색 */
        }
        .btn-default:hover {
            background: #ddd; /* 마우스 오버 시 배경색 회색 */
        }
        .cart-image {
            width: 80px; /* 장바구니 상품 이미지 너비 */
        }
    </style>
</head>
<body class="sijunBody">
    <div class="container">
        <form id="cartForm" name="cartForm" method="post" action="<%=request.getContextPath()%>/cart/cart_action.jsp">
            <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-4">
                <span style="font-size: 16pt; font-weight: bold;">장바구니</span> <%-- 페이지 제목 --%>
                <span class="home">홈 > 장바구니</span> <%-- 위치 표시 --%>
            </div>
            <div>
                <!-- 상품정보 테이블 -->
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 5%"><input type="checkbox" id="check-all" /></th> <%-- 전체 선택 체크박스 --%>
                                <th style="width: 55%">상품정보</th> <%-- 상품 정보 헤더 --%>
                                <th style="width: 15%">수량</th> <%-- 수량 헤더 --%>
                                <th style="width: 15%" class="text-nowrap">가격</th> <%-- 가격 헤더 --%>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (CartDTO cart : cartList) { // 장바구니 리스트 반복
                                    ProductStockDTO stock = ProductStockDAO.getDAO().selectProductStock(cart.getCart_psno()); // 상품 재고 정보 가져오기
                                    
                                    if (stock != null) {
                                        int unitPrice = stock.getpS_price(); // 상품의 단위 가격, product_stock 테이블에서 가격 가져오기
                                        int totalPrice = unitPrice * cart.getCart_num(); // 총 가격 계산
                                        totalProductPrice += totalPrice; // 총 상품 가격에 추가
                            %>
                            <tr data-cart-no="<%=cart.getCart_no() %>" data-max-quantity="<%= stock.getpS_Stock() %>" style="height: 90px;">
                                <td><input type="checkbox" class="check-item" name="cart_no" value="<%= cart.getCart_no() %>" /></td> <%-- 개별 선택 체크박스 --%>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img class="cart-image" src="assets/img/<%= ProductDAO.getDAO().selectProductByNo(stock.getpS_pNo()).getPRODUCT_IMG() %>.jpg"/> <%-- 상품 이미지 --%>
                                        <span style="margin-left: 10px; font-weight: bold;"><%= stock.getpS_Option() %></span> <%-- 상품 옵션 --%>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-group mb-3">
                                        <button class="btn btn-outline-secondary quantity-decrease" type="button"><i class="fa-solid fa-minus" style="color: #000000;"></i></button> <%-- 수량 감소 버튼 --%>
                                        <input type="text" class="quantity form-control quantity-input text-center" min="1" max="10000" value="<%= cart.getCart_num() %>"> <%-- 수량 입력 --%>
                                        <button class="btn btn-outline-secondary quantity-increase" type="button"><i class="fa-solid fa-plus" style="color: #000000;"></i></button> <%-- 수량 증가 버튼 --%>
                                    </div>
                                </td>
                                <td class="total-price text-nowrap" data-unit-price="<%= unitPrice %>"><%= String.format("%,d", totalPrice) %>원</td>  <%-- 총 가격 --%>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                        <tfoot>
                            <tr style="height: 60px;">
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <button type="button" class="btn btn-default" id="delete-selected">삭제하기</button> <%-- 선택된 상품 삭제 버튼 --%>
                <br/><br/>
                <!-- 결제예정금액 테이블 -->
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th style="width: 40%">총 상품금액</th> <%-- 총 상품금액 헤더 --%>
                            <th style="width: 20%">총 배송비</th> <%-- 총 배송비 헤더 --%>
                            <th style="width: 40%"><span>결제예정금액</span></th> <%-- 결제예정금액 헤더 --%>
                        </tr>
                        <tr>
                            <td><span id="summary-product-price" class="price"><%= String.format("%,d", totalProductPrice) %></span>원</td> <%-- 총 상품금액 --%>
                            <td><span id="summary-shipping-price" class="price"><%= String.format("%,d", shippingCost) %></span>원</td> <%-- 총 배송비 --%>
                            <td><span id="summary-final-price" class="price"><%= String.format("%,d", totalProductPrice + shippingCost) %></span>원</td> <%-- 결제예정금액 --%>
                        </tr>
                    </table>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-default" name="action" value="checkout" id="checkout-button">선택상품주문</button> <%-- 선택상품 주문 버튼 --%>
                    <button type="button" class="btn btn-default" id="productClear">쇼핑계속하기</button> <%-- 쇼핑계속하기 버튼 --%>
                </div>
                <br/><br/>
                <div class="border p-3 mb-3">
                    이용안내
                </div>
                <div class="border p-3">
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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <%-- jQuery 라이브러리 추가 --%>
    <script>
        function formatPrice(price) {
            return price.toLocaleString(); // 가격을 3자리마다 콤마로 구분
        }

        function updatePrice(button, newQuantity) {
            var cartRow = button.closest('tr');
            var unitPrice = parseInt(cartRow.querySelector('.total-price').dataset.unitPrice); // 단위 가격 가져오기
            var newTotalPrice = newQuantity * unitPrice; // 새로운 총 가격 계산
            cartRow.querySelector('.total-price').textContent = formatPrice(newTotalPrice) + '원'; // 총 가격 업데이트
            updateSummary(); // 요약 정보 업데이트

            // 서버에 AJAX 요청으로 업데이트된 수량을 반영
            var cartNo = cartRow.dataset.cartNo;
            $.ajax({
                url: '<%=request.getContextPath()%>/cart/cart_action.jsp',
                method: 'POST',
                data: {
                    action: 'update',
                    cart_no: cartNo,
                    quantity: newQuantity,
                    returnUrl: '<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart'
                },
                success: function(response) {
                    // 필요시 응답 처리
                }
            });
        }

        document.querySelectorAll('.quantity-increase').forEach(function(button) {
            button.addEventListener('click', function() {
                var quantityInput = this.previousElementSibling;
                var newQuantity = parseInt(quantityInput.value) + 1; // 수량 증가
                var maxQuantity = parseInt(this.closest('tr').dataset.maxQuantity); // 최대 수량 가져오기
                if (newQuantity <= maxQuantity) { // 최대 수량보다 작거나 같은 경우
                    quantityInput.value = newQuantity;
                    updatePrice(this, newQuantity); // 가격 업데이트
                } else {
                    alert("남은 재고수량: " + maxQuantity + "개"); // 재고 부족 알림
                }
            });
        });

        document.querySelectorAll('.quantity-decrease').forEach(function(button) {
            button.addEventListener('click', function() {
                var quantityInput = this.nextElementSibling;
                var newQuantity = parseInt(quantityInput.value) - 1; // 수량 감소
                if (newQuantity >= 1) { // 최소 수량 1 이상
                    quantityInput.value = newQuantity;
                    updatePrice(this, newQuantity); // 가격 업데이트
                }
            });
        });

        document.querySelectorAll('.quantity-input').forEach(function(input) {
            input.addEventListener('input', function() {
                var newQuantity = this.value === "" ? 1 : parseInt(this.value);  // 빈 값일 경우 1로 설정
                var maxQuantity = parseInt(this.closest('tr').dataset.maxQuantity);
                if (newQuantity >= 1 && newQuantity <= maxQuantity) { // 유효한 수량 범위 내
                    updatePrice(this, newQuantity);
                } else if (newQuantity > maxQuantity) { // 최대 수량 초과
                    this.value = maxQuantity;
                    updatePrice(this, maxQuantity);
                    alert("남은 재고수량: " + maxQuantity + "개");
                } else { // 최소 수량 미만
                    this.value = 1;
                    updatePrice(this, 1);
                }
            });

            input.addEventListener('blur', function() {
                if (this.value === "") {
                    this.value = 1;  // 빈 값일 경우 1로 설정
                    updatePrice(this, 1);
                }
            });
        });

        function updateSummary() {
            var totalProductPrice = 0;
            document.querySelectorAll('.check-item:checked').forEach(function(checkbox) {
                var row = checkbox.closest('tr');
                var price = parseInt(row.querySelector('.total-price').textContent.replace(/[^0-9]/g, ''));
                totalProductPrice += price;
            });
            var shippingCost = 2500; // 배송비
            var finalPrice = totalProductPrice + shippingCost;

            document.getElementById('summary-product-price').textContent = formatPrice(totalProductPrice); // 총 상품금액 업데이트
            document.getElementById('summary-shipping-price').textContent = formatPrice(shippingCost); // 총 배송비 업데이트
            document.getElementById('summary-final-price').textContent = formatPrice(finalPrice); // 결제예정금액 업데이트
        }

        document.getElementById('check-all').addEventListener('click', function() {
            var checkboxes = document.querySelectorAll('.check-item');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = this.checked; // 전체 선택 또는 해제
            }
            updateSummary(); // 요약 정보 업데이트
        });

        document.querySelectorAll('.check-item').forEach(function(checkbox) {
            checkbox.addEventListener('change', updateSummary); // 체크 상태 변경 시 요약 정보 업데이트
        });

        document.getElementById('delete-selected').addEventListener('click', function() {
            var checkboxes = document.querySelectorAll('.check-item:checked');
            if (checkboxes.length > 0) {
                var form = document.createElement("form");
                form.method = "post";
                form.action = "<%=request.getContextPath()%>/cart/cart_action.jsp";
                var returnUrlInput = document.createElement("input");
                returnUrlInput.type = "hidden";
                returnUrlInput.name = "returnUrl";
                returnUrlInput.value = "<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart";
                form.appendChild(returnUrlInput);

                var actionInput = document.createElement("input");
                actionInput.type = "hidden";
                actionInput.name = "action";
                actionInput.value = "delete";
                form.appendChild(actionInput);

                checkboxes.forEach(function(checkbox) {
                    var cartNoInput = document.createElement("input");
                    cartNoInput.type = "hidden";
                    cartNoInput.name = "cart_no";
                    cartNoInput.value = checkbox.value;
                    form.appendChild(cartNoInput);
                });

                document.body.appendChild(form);
                form.submit(); // 선택된 항목 삭제 요청 제출
            }
        });

        document.getElementById('productClear').addEventListener('click', function() {
            window.location.href = "<%=request.getContextPath()%>/index.jsp"; // 쇼핑계속하기 버튼 클릭 시 메인 페이지로 이동
        });

        // 페이지 로드 시 요약 업데이트
        document.addEventListener('DOMContentLoaded', updateSummary); // 페이지 로드 시 요약 정보 업데이트
    </script>
</body>
</html>
