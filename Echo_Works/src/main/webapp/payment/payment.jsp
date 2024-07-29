<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="echoworks.dao.CartDAO" %>
<%@ page import="echoworks.dao.ProductStockDAO" %>
<%@ page import="echoworks.dto.CartDTO" %>
<%@ page import="echoworks.dto.ProductStockDTO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="echoworks.dto.MemberDTO" %>
<%@ page import="echoworks.dao.ProductDAO" %>

<%
    // 로그인된 사용자 정보 가져오기
    HttpSession currentSession = request.getSession();
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    if (loginMember == null) {
        out.println("<script>alert('로그인이 필요합니다.');location.href='index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    String[] selectedCartNos = request.getParameterValues("cart_no");
    List<CartDTO> selectedCartList = new ArrayList<>();

    if (selectedCartNos != null) {
        for (String cartNo : selectedCartNos) {
            int cartNoInt = Integer.parseInt(cartNo);
            CartDTO cart = CartDAO.getDao().getCartByNo(cartNoInt);
            selectedCartList.add(cart);
        }
    } else if (session.getAttribute("cartList") != null) {
        selectedCartList = (List<CartDTO>) session.getAttribute("cartList");
        session.removeAttribute("cartList");
    } else {
        out.println("<script>alert('선택한 상품이 없습니다.');location.href='cart.jsp';</script>");
        return;
    }

    int totalProductPrice = 0;
    int shippingCost = 2500; // 고정 배송비
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제하기</title>
    <style>
        .card {
            margin-bottom: 20px;
        }
        .card-header {
            background-color: #fff;
            border-bottom: 2px solid #ddd;
        }
        .card-body {
            background-color: #fff;
        }
        .section-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .form-check-label {
            margin-left: 10px;
        }
        .form-check-input {
            margin-left: 10px;
        }
        .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 1.2rem;
            background-color: #000;
            color: #fff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #333;
        }
        .hidden {
            display: none;
        }
        .error {
            color: red;
            font-size: 0.875rem;
            margin-left: 10px;
            display: block;
            visibility: hidden;
            height: 1.2em;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="section-title text-center mt-3">결제하기</h2>
    <form id="paymentForm" name="paymentForm" method="post" action="<%=request.getContextPath() %>/payment/payment_action.jsp?action=pay">
        <% if (selectedCartNos != null) {
            for (String cartNo : selectedCartNos) { %>
                <input type="hidden" name="cart_no" value="<%= cartNo %>" />
        <% } } %>
        <div class="row">
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header">
                        주문 상품 정보
                    </div>
                    <div class="card-body">
                        <% for (CartDTO cart : selectedCartList) {
                            ProductStockDTO stock = ProductStockDAO.getDAO().selectProductStock(cart.getCart_psno());
                            if (stock != null) {
                                int unitPrice = stock.getpS_price(); // product_stock 테이블에서 가격 가져오기
                                int totalPrice = unitPrice * cart.getCart_num();
                                totalProductPrice += totalPrice;
                        %>
                        <div class="d-flex align-items-center">
                            <img src="assets/img/<%= ProductDAO.getDAO().selectProductByNo(stock.getpS_pNo()).getPRODUCT_IMG() %>.jpg" alt="상품 이미지" style="width: 100px; height: 100px; margin-right: 20px;">
                            <div>
                                <p><%= stock.getpS_Option() %></p>
                                <p><%= String.format("%,d", unitPrice) %>원</p>
                                <p>수량: <%= cart.getCart_num() %></p>
                                <p>총 가격: <%= String.format("%,d", totalPrice) %>원</p>
                                <input type="hidden" name="psno" value="<%= cart.getCart_psno() %>">
                                <input type="hidden" name="num" value="<%= cart.getCart_num() %>">
                            </div>
                        </div>
                        <hr>
                        <% } } %>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        주문자 정보
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="ordererName" class="form-label">주문자 이름</label>
                            <input type="text" class="form-control" id="ordererName" name="jname" value="<%= loginMember.getMemberName() %>" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="ordererContact" class="form-label">전화번호</label>
                            <input type="text" class="form-control phone-input" id="ordererContact" name="phone" value="<%= loginMember.getMemberMobile() %>" disabled>
                            <div id="ordererContactMsg" class="error">전화번호를 올바르게 입력해 주세요.</div>
                        </div>
                        <div class="mb-3">
                            <label for="ordererEmail" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="ordererEmail" name="email" value="<%= loginMember.getMemberEmail() %>" disabled>
                        </div>
                        <button type="button" class="btn btn-outline-secondary" id="editOrdererInfo">수정</button>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        배송 정보
                    </div>
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="deliveryTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="existing-address-tab" data-bs-toggle="tab" href="#existing-address" role="tab" aria-controls="existing-address" aria-selected="true">기존 배송지</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="new-address-tab" data-bs-toggle="tab" href="#new-address" role="tab" aria-controls="new-address" aria-selected="false">신규 배송지</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="deliveryTabContent">
                            <div class="tab-pane fade show active" id="existing-address" role="tabpanel" aria-labelledby="existing-address-tab">
                                <div class="mt-3">
                                    <div class="mb-3">
                                        <label for="recipientExisting" class="form-label">수령인</label>
                                        <input type="text" class="form-control" id="recipientExisting" placeholder="2글자 이상 입력해주세요" name="jnameExisting" value="<%= loginMember.getMemberName() %>" disabled>
                                        <input type="hidden" name="jname" value="<%= loginMember.getMemberName() %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="contactExisting" class="form-label">연락처</label>
                                        <input type="text" class="form-control phone-input" id="contactExisting" placeholder="전화번호를 입력하세요" name="phoneExisting" value="<%= loginMember.getMemberMobile() %>" disabled>
                                        <div id="contactExistingMsg" class="error">전화번호를 올바르게 입력해 주세요.</div>
                                        <input type="hidden" name="phone" value="<%= loginMember.getMemberMobile() %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="postcodeExisting" class="form-label">우편번호</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="postcodeExisting" placeholder="우편번호" name="zipcodeExisting" value="<%= loginMember.getMemberZipcode() %>" disabled>
                                            <input type="hidden" name="zipcode" value="<%= loginMember.getMemberZipcode() %>">
                                            <button class="btn btn-outline-secondary" type="button" id="findPostcodeExisting" disabled>주소찾기</button>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="addressExisting" class="form-label">주소</label>
                                        <input type="text" class="form-control" id="addressExisting" placeholder="주소" name="address1Existing" value="<%= loginMember.getMemberAddress1() %>" disabled>
                                        <input type="hidden" name="address1" value="<%= loginMember.getMemberAddress1() %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="detailedAddressExisting" class="form-label">상세주소</label>
                                        <input type="text" class="form-control" id="detailedAddressExisting" placeholder="상세주소" name="address2Existing" value="<%= loginMember.getMemberAddress2() %>" disabled>
                                        <input type="hidden" name="address2" value="<%= loginMember.getMemberAddress2() %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="deliveryMemoExisting" class="form-label">배송메모</label>
                                        <select class="form-select" id="deliveryMemoExisting" name="omesg">
                                            <option value=&nbsp;>배송메모를 선택해 주세요.</option>
                                            <option value="문 앞에 놔주세요">문 앞에 놔주세요</option>
                                            <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                                            <option value="직접 받아야 합니다">직접 받아야 합니다</option>
                                            <option value="직접입력">직접입력</option>
                                        </select>
                                        <input type="text" class="form-control mt-2 hidden" id="deliveryMemoInputExisting" placeholder="배송메모를 입력해 주세요" name="omesgInput">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="new-address" role="tabpanel" aria-labelledby="new-address-tab">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="sameAsOrderer">
                                    <label class="form-check-label" for="sameAsOrderer">
                                        주문자 정보와 동일
                                    </label>
                                </div>
                                <div class="mt-3">
                                    <div class="mb-3">
                                        <label for="recipient" class="form-label">수령인</label>
                                        <input type="text" class="form-control" id="recipient" placeholder="2글자 이상 입력해주세요" name="jname">
                                    </div>
                                    <div class="mb-3">
                                        <label for="contact" class="form-label">연락처</label>
                                        <input type="text" class="form-control phone-input" id="contact" placeholder="전화번호를 입력하세요" name="phone">
                                        <div id="contactMsg" class="error">전화번호를 올바르게 입력해 주세요.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="postcode" class="form-label">우편번호</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="postcode" placeholder="우편번호" name="zipcode">
                                            <button class="btn btn-outline-secondary" type="button" id="findPostcode">주소찾기</button>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="address" class="form-label">주소</label>
                                        <input type="text" class="form-control" id="address" placeholder="주소" name="address1">
                                    </div>
                                    <div class="mb-3">
                                        <label for="detailedAddress" class="form-label">상세주소</label>
                                        <input type="text" class="form-control" id="detailedAddress" placeholder="상세주소" name="address2">
                                    </div>
                                    <div class="mb-3">
                                        <label for="deliveryMemo" class="form-label">배송메모</label>
                                        <select class="form-select" id="deliveryMemo" name="omesg">
                                            <option value="">배송메모를 선택해 주세요.</option>
                                            <option value="문 앞에 놔주세요">문 앞에 놔주세요</option>
                                            <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                                            <option value="직접 받아야 합니다">직접 받아야 합니다</option>
                                            <option value="직접입력">직접입력</option>
                                        </select>
                                        <input type="text" class="form-control mt-2 hidden" id="deliveryMemoInput" placeholder="배송메모를 입력해 주세요" name="omesgInput">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="card">
                    <div class="card-header">
                        주문 요약
                    </div>
                    <div class="card-body">
                        <p>상품가격: <span id="totalProductPrice"><%= String.format("%,d", totalProductPrice) %></span></p>
                        <p>배송비: <span id="shippingCost"><%= String.format("%,d", shippingCost) %></span></p>
                        <p>총 주문금액: <span id="totalOrderAmount"><%= String.format("%,d", totalProductPrice + shippingCost) %></span></p>
                        <input type="hidden" name="total" value="<%= totalProductPrice + shippingCost %>">
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="agreeTerms" name="agreeTerms">
                            <label class="form-check-label" for="agreeTerms">
                                구매조건 확인 및 결제진행에 동의
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary mt-3" id="payButton">결제하기</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    document.getElementById('editOrdererInfo').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 동작(폼 제출) 방지
        var inputs = document.querySelectorAll('#ordererName, #ordererContact, #ordererEmail');
        inputs.forEach(function(input) {
            input.disabled = false;
        });
    });

    document.getElementById('sameAsOrderer').addEventListener('change', function() {
        if (this.checked) {
            document.getElementById('recipient').value = document.getElementById('ordererName').value;
            document.getElementById('contact').value = document.getElementById('ordererContact').value;
        } else {
            document.getElementById('recipient').value = '';
            document.getElementById('contact').value = '';
        }
    });

    document.getElementById('deliveryMemo').addEventListener('change', function() {
        var deliveryMemoInput = document.getElementById('deliveryMemoInput');
        if (this.value === '직접입력') {
            deliveryMemoInput.classList.remove('hidden');
        } else {
            deliveryMemoInput.classList.add('hidden');
        }
    });

    document.getElementById('deliveryMemoExisting').addEventListener('change', function() {
        var deliveryMemoInput = document.getElementById('deliveryMemoInputExisting');
        if (this.value === '직접입력') {
            deliveryMemoInput.classList.remove('hidden');
        } else {
            deliveryMemoInput.classList.add('hidden');
        }
    });

    document.getElementById('findPostcode').addEventListener('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address').value = data.address;
            }
        }).open();
    });

    document.getElementById('findPostcodeExisting').addEventListener('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postcodeExisting').value = data.zonecode;
                document.getElementById('addressExisting').value = data.address;
            }
        }).open();
    });

    // postcode와 address 필드 클릭 시 Daum Postcode Service 창이 뜨도록 설정하고 키보드 입력 방지
    document.getElementById('postcode').addEventListener('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address').value = data.address;
            }
        }).open();
    });

    document.getElementById('address').addEventListener('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address').value = data.address;
            }
        }).open();
    });

    // 키보드 입력 방지 설정
    document.getElementById('postcode').addEventListener('keydown', function(event) {
        event.preventDefault();
    });

    document.getElementById('address').addEventListener('keydown', function(event) {
        event.preventDefault();
    });

    document.getElementById('payButton').addEventListener('click', function(event) {
        if (!document.getElementById('agreeTerms').checked) {
            alert('구매조건 확인 및 결제진행에 동의해야 합니다.');
            event.preventDefault(); // 페이지 이동 막기
        } else {
            // 버튼 비활성화
            this.disabled = true;
            // 폼 제출
            document.getElementById('paymentForm').submit();
        }
    });

    // 숫자 포맷 함수
    function formatPrice(price) {
        return price.toLocaleString();
    }

    // 페이지 로드 시 가격 포맷팅
    document.addEventListener('DOMContentLoaded', function() {
        var totalProductPrice = document.getElementById('totalProductPrice');
        var shippingCost = document.getElementById('shippingCost');
        var totalOrderAmount = document.getElementById('totalOrderAmount');

        totalProductPrice.textContent = formatPrice(parseInt(totalProductPrice.textContent.replace(/[^0-9]/g, ''))) + '원';
        shippingCost.textContent = formatPrice(parseInt(shippingCost.textContent.replace(/[^0-9]/g, ''))) + '원';
        totalOrderAmount.textContent = formatPrice(parseInt(totalOrderAmount.textContent.replace(/[^0-9]/g, ''))) + '원';
    });

    // 전화번호 입력 시 숫자만 입력받도록 설정
    document.querySelectorAll('.phone-input').forEach(function(element) {
        element.addEventListener('input', function(event) {
            event.target.value = event.target.value.replace(/[^0-9]/g, '');
        });

        element.addEventListener('blur', function(event) {
            var phone = event.target.value;
            var errorMsg = document.getElementById(event.target.id + 'Msg');
            if (phone.length === 10) {
                event.target.value = phone.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
                errorMsg.style.visibility = 'hidden'; // 전화번호가 올바를 경우 오류 메시지 숨기기
            } else if (phone.length === 11) {
                event.target.value = phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
                errorMsg.style.visibility = 'hidden'; // 전화번호가 올바를 경우 오류 메시지 숨기기
            } else {
                errorMsg.style.visibility = 'visible'; // 전화번호가 잘못되었을 경우 오류 메시지 표시
            }
        });
    });
</script>
</body>
</html>
