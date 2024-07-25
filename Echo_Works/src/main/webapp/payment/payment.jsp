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

    // 장바구니에서 선택한 상품 번호 목록을 가져옴
    String[] selectedCartNos = request.getParameterValues("cart_no");

    if (selectedCartNos == null || selectedCartNos.length == 0) {
        out.println("<script>alert('선택한 상품이 없습니다.');location.href='cart.jsp';</script>");
        return;
    }

    List<CartDTO> selectedCartList = new ArrayList<>();
    for (String cartNo : selectedCartNos) {
        int cartNoInt = Integer.parseInt(cartNo);
        CartDTO cart = CartDAO.getDao().getCartByNo(cartNoInt);
        selectedCartList.add(cart);
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
    </style>
</head>
<body>
<div class="container">
    <h2 class="section-title text-center mt-3">결제하기</h2>
    <form id="paymentForm" name="paymentForm" method="post" action="<%=request.getContextPath() %>/payment/payment_action.jsp?action=pay" >
        <div class="row">
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header">
                        주문 상품 정보
                    </div>
                    <div class="card-body">
                        <%
                            for (CartDTO cart : selectedCartList) {
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
                                <p><%= unitPrice %>원</p>
                                <p>수량: <%= cart.getCart_num() %></p>
                                <p>총 가격: <%= totalPrice %>원</p>
                                <input type="hidden" name="psno" value="<%= cart.getCart_psno() %>">
                                <input type="hidden" name="num" value="<%= cart.getCart_num() %>">
                            </div>
                        </div>
                        <hr>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        주문자 정보
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <input type="text" class="form-control" id="ordererName" value="<%= loginMember.getMemberName() %>" disabled>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="ordererContact" value="<%= loginMember.getMemberMobile() %>" disabled>
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" id="ordererEmail" value="<%= loginMember.getMemberEmail() %>" disabled>
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
                                <a class="nav-link active" id="existing-address-tab" data-bs-toggle="tab" href="#existing-address" role="tab" aria-controls="existing-address" aria-selected="true">배송지 선택</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="new-address-tab" data-bs-toggle="tab" href="#new-address" role="tab" aria-controls="new-address" aria-selected="false">신규 입력</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="deliveryTabContent">
                            <div class="tab-pane fade show active" id="existing-address" role="tabpanel" aria-labelledby="existing-address-tab">
                                <p><input type="radio" name="address" checked> <%= loginMember.getMemberName() %>, <%= loginMember.getMemberAddress1() %>, <%= loginMember.getMemberAddress2() %>, <%= loginMember.getMemberZipcode() %></p>
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
                                        <input type="text" class="form-control" id="recipient" placeholder="2글자 이상 입력해주세요">
                                    </div>
                                    <div class="mb-3">
                                        <label for="contact" class="form-label">연락처</label>
                                        <input type="text" class="form-control" id="contact" placeholder="전화번호를 입력하세요">
                                    </div>
                                    <div class="mb-3">
                                        <label for="postcode" class="form-label">우편번호</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="postcode" placeholder="우편번호">
                                            <button class="btn btn-outline-secondary" type="button" id="findPostcode">주소찾기</button>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="address" class="form-label">주소</label>
                                        <input type="text" class="form-control" id="address" placeholder="주소">
                                    </div>
                                    <div class="mb-3">
                                        <label for="detailedAddress" class="form-label">상세주소</label>
                                        <input type="text" class="form-control" id="detailedAddress" placeholder="상세주소">
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="addToAddressBook">
                                        <label class="form-check-label" for="addToAddressBook">
                                            배송지 목록에 추가
                                        </label>
                                    </div>
                                    <div class="mb-3">
                                        <label for="deliveryMemo" class="form-label">배송메모</label>
                                        <select class="form-select" id="deliveryMemo">
                                            <option value="">배송메모를 선택해 주세요.</option>
                                            <option value="문 앞에 놔주세요">문 앞에 놔주세요</option>
                                            <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                                            <option value="직접 받아야 합니다">직접 받아야 합니다</option>
                                            <option value="직접입력">직접입력</option>
                                        </select>
                                        <input type="text" class="form-control mt-2 hidden" id="deliveryMemoInput" placeholder="배송메모를 입력해 주세요">
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
                        <p>상품가격: <%= totalProductPrice %>원</p>
                        <p>배송비: <%= shippingCost %>원</p>
                        <p>총 주문금액: <%= totalProductPrice + shippingCost %>원</p>
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
                        <button type="submit" class="btn btn-primary mt-3" id="payButton" formaction="<%=request.getContextPath() %>/index.jsp?workgroup=payment&work=payment_complete">결제하기</button>

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

    document.getElementById('findPostcode').addEventListener('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address').value = data.address;
            }
        }).open();
    });

    document.getElementById('new-address-tab').addEventListener('click', function() {
        document.getElementById('new-address').classList.add('show', 'active');
        document.getElementById('existing-address').classList.remove('show', 'active');
    });

    document.getElementById('existing-address-tab').addEventListener('click', function() {
        document.getElementById('existing-address').classList.add('show', 'active');
        document.getElementById('new-address').classList.remove('show', 'active');
    });

    document.getElementById('payButton').addEventListener('click', function(event) {
        if (!document.getElementById('agreeTerms').checked) {
            alert('구매조건 확인 및 결제진행에 동의해야 합니다.');
            event.preventDefault(); // 페이지 이동 막기
        } else {
            document.getElementById('paymentForm').submit();
        }
    });
</script>
</body>
</html>