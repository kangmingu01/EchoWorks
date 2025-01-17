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
    HttpSession currentSession = request.getSession();
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    if (loginMember == null) {
        out.println("<script>alert('로그인이 필요합니다.');location.href='index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    int memberId = loginMember.getMemberNum(); // 회원 번호 가져오기
    List<CartDTO> cartList = CartDAO.getDao().getCartList(memberId);
    int totalProductPrice = 0;
    int shippingCost = 2500; // 고정 배송비
%>
    <style>
        table th, table td {
            text-align: center;
            vertical-align: middle; /* 행의 수직 정렬 추가 */
        }

        .price {
            font-size: 20pt;
            font-weight: bold;
        }
        .btn-custom {
            border: none;
            color: white;
            padding: 5px 10px;
            font-size: 13px;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn-default {
            background-color: #fff;
            border: solid 1px gray;
            color: black;
        }
        .btn-default:hover {
            background: #ddd;
        }
        .cart-image {
            width: 80px;
        }
    </style>

    <div class="container mt-3 mb-3">
        <form id="cartForm" name="cartForm" method="post" action="<%=request.getContextPath()%>/cart/cart_action.jsp">
            <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-4">
                <span style="font-size: 16pt; font-weight: bold;">장바구니</span>
                <span class="home">홈 > 장바구니</span>
            </div>
            <div>
                <!-- 상품정보 테이블 -->
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 5%"><input type="checkbox" id="check-all" /></th>
                                <th style="width: 55%">상품정보</th>
                                <th style="width: 15%">수량</th>
                                <th style="width: 15%" class="text-nowrap">가격</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (CartDTO cart : cartList) {
                                    ProductStockDTO stock = ProductStockDAO.getDAO().selectProductStock(cart.getCart_psno());
                                    
                                    if (stock != null) {
                                        int unitPrice = stock.getpS_price(); // product_stock 테이블에서 가격 가져오기
                                        int totalPrice = unitPrice * cart.getCart_num();
                                        totalProductPrice += totalPrice;
                            %>
                            <tr data-cart-no="<%=cart.getCart_no() %>" data-max-quantity="<%= stock.getpS_Stock() %>" style="height: 90px;">
                                <td><input type="checkbox" class="check-item" name="cart_no" value="<%= cart.getCart_no() %>" /></td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img class="cart-image" src="assets/img/<%= ProductDAO.getDAO().selectProductByNo(stock.getpS_pNo()).getPRODUCT_IMG() %>.jpg"/>
                                        <span style="margin-left: 10px; font-weight: bold;"><%= stock.getpS_Option() %></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-group mb-3">
                                        <button class="btn btn-outline-secondary quantity-decrease" type="button"><i class="fa-solid fa-minus" style="color: #000000;"></i></button>
                                        <input type="text" class="quantity form-control quantity-input text-center" min="1" max="10000" value="<%= cart.getCart_num() %>">
                                        <button class="btn btn-outline-secondary quantity-increase" type="button"><i class="fa-solid fa-plus" style="color: #000000;"></i></button>
                                    </div>
                                </td>
                                <td class="total-price text-nowrap" data-unit-price="<%= unitPrice %>"><%= String.format("%,d", totalPrice) %>원</td> 
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
                <button type="button" class="btn btn-default mb-3" id="delete-selected">삭제하기</button>
                <!-- 결제예정금액 테이블 -->
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th style="width: 40%">총 상품금액</th>
                            <th style="width: 20%">총 배송비</th>
                            <th style="width: 40%"><span>결제예정금액</span></th>
                        </tr>
                        <tr>
                            <td><span id="summary-product-price" class="price"><%= String.format("%,d", totalProductPrice) %></span>원</td>
                            <td><span id="summary-shipping-price" class="price"><%= String.format("%,d", shippingCost) %></span>원</td>
                            <td><span id="summary-final-price" class="price"><%= String.format("%,d", totalProductPrice + shippingCost) %></span>원</td>
                        </tr>
                    </table>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-default" name="action" value="checkout" id="checkout-button">선택상품주문</button>
                    <button type="button" class="btn btn-default" id="productClear">쇼핑계속하기</button>
                </div>
                <div class="border p-3 mb-3 mt-3">
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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        function formatPrice(price) {
            return price.toLocaleString();
        }

        function updatePrice(button, newQuantity) {
            var cartRow = button.closest('tr');
            var unitPrice = parseInt(cartRow.querySelector('.total-price').dataset.unitPrice);
            var newTotalPrice = newQuantity * unitPrice;
            cartRow.querySelector('.total-price').textContent = formatPrice(newTotalPrice) + '원';
            updateSummary();

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
                var newQuantity = parseInt(quantityInput.value) + 1;
                var maxQuantity = parseInt(this.closest('tr').dataset.maxQuantity);
                if (newQuantity <= maxQuantity) {
                    quantityInput.value = newQuantity;
                    updatePrice(this, newQuantity);
                } else {
                    alert("남은 재고수량: " + maxQuantity + "개");
                }
            });
        });

        document.querySelectorAll('.quantity-decrease').forEach(function(button) {
            button.addEventListener('click', function() {
                var quantityInput = this.nextElementSibling;
                var newQuantity = parseInt(quantityInput.value) - 1;
                if (newQuantity >= 1) {
                    quantityInput.value = newQuantity;
                    updatePrice(this, newQuantity);
                }
            });
        });

        document.querySelectorAll('.quantity-input').forEach(function(input) {
            input.addEventListener('input', function() {
                var newQuantity = this.value === "" ? 1 : parseInt(this.value);  // 빈 값일 경우 1로 설정
                var maxQuantity = parseInt(this.closest('tr').dataset.maxQuantity);
                if (newQuantity >= 1 && newQuantity <= maxQuantity) {
                    updatePrice(this, newQuantity);
                } else if (newQuantity > maxQuantity) {
                    this.value = maxQuantity;
                    updatePrice(this, maxQuantity);
                    alert("남은 재고수량: " + maxQuantity + "개");
                } else {
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

            document.getElementById('summary-product-price').textContent = formatPrice(totalProductPrice);
            document.getElementById('summary-shipping-price').textContent = formatPrice(shippingCost);
            document.getElementById('summary-final-price').textContent = formatPrice(finalPrice);
        }

        document.getElementById('check-all').addEventListener('click', function() {
            var checkboxes = document.querySelectorAll('.check-item');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = this.checked; 
            }
            updateSummary();
        });

        document.querySelectorAll('.check-item').forEach(function(checkbox) {
            checkbox.addEventListener('change', updateSummary);
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
                form.submit();
            }
        });

        document.getElementById('productClear').addEventListener('click', function() {
            window.location.href = "<%=request.getContextPath()%>/index.jsp";
        });

        // 페이지 로드 시 요약 업데이트
        document.addEventListener('DOMContentLoaded', updateSummary);
    </script>
