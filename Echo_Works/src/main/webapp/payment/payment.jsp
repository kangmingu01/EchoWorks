<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    // �α��ε� ����� ���� ��������
    HttpSession currentSession = request.getSession();
    MemberDTO loginMember = (MemberDTO) currentSession.getAttribute("loginMember");

    if (loginMember == null) {
        out.println("<script>alert('�α����� �ʿ��մϴ�.');location.href='index.jsp?workgroup=member&work=member_login';</script>");
        return;
    }

    // ��ٱ��Ͽ��� ������ ��ǰ ��ȣ ����� ������
    String[] selectedCartNos = request.getParameterValues("cart_no");

    if (selectedCartNos == null || selectedCartNos.length == 0) {
        out.println("<script>alert('������ ��ǰ�� �����ϴ�.');location.href='cart.jsp';</script>");
        return;
    }

    List<CartDTO> selectedCartList = new ArrayList<>();
    for (String cartNo : selectedCartNos) {
        int cartNoInt = Integer.parseInt(cartNo);
        CartDTO cart = CartDAO.getDao().getCartByNo(cartNoInt);
        selectedCartList.add(cart);
    }

    int totalProductPrice = 0;
    int shippingCost = 2500; // ���� ��ۺ�
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>�����ϱ�</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: white;
            overflow-y: scroll; /* Always show vertical scrollbar */
        }
        .container {
            margin-top: 30px;
        }
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
    <h2 class="section-title text-center">�����ϱ�</h2>
    <form id="paymentForm" name="paymentForm" method="post" action="<%=request.getContextPath() %>/index.jsp?workgroup=payment&work=payment_complete" >
   
    <div class="row">
        <div class="col-md-7">
            <div class="card">
                <div class="card-header">
                    �ֹ� ��ǰ ����
                </div>
                <div class="card-body">
                    <%
                        for (CartDTO cart : selectedCartList) {
                            ProductStockDTO stock = ProductStockDAO.getDAO().selectProductStock(cart.getCart_psno());
                            
                            if (stock != null) {
                                int unitPrice = stock.getpS_price(); // product_stock ���̺��� ���� ��������
                                int totalPrice = unitPrice * cart.getCart_num();
                                totalProductPrice += totalPrice;
                    %>
                    <div class="d-flex align-items-center">
                        <img src="../assets/img/<%= ProductDAO.getDAO().selectProductByNo(stock.getpS_pNo()).getPRODUCT_IMG() %>.jpg" alt="��ǰ �̹���" style="width: 100px; height: 100px; margin-right: 20px;">
                        <div>
                            <p><%= stock.getpS_Option() %></p>
                            <p><%= unitPrice %>��</p>
                            <p>����: <%= cart.getCart_num() %></p>
                            <p>�� ����: <%= totalPrice %>��</p>
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
                    �ֹ��� ����
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
                    <button class="btn btn-outline-secondary" id="editOrdererInfo">����</button>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    ��� ����
                </div>
                <div class="card-body">
                    <ul class="nav nav-tabs" id="deliveryTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="existing-address-tab" data-bs-toggle="tab" href="#existing-address" role="tab" aria-controls="existing-address" aria-selected="true">����� ����</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="new-address-tab" data-bs-toggle="tab" href="#new-address" role="tab" aria-controls="new-address" aria-selected="false">�ű� �Է�</a>
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
                                    �ֹ��� ������ ����
                                </label>
                            </div>
                            <div class="mt-3">
                                <div class="mb-3">
                                    <label for="recipient" class="form-label">������</label>
                                    <input type="text" class="form-control" id="recipient" placeholder="2���� �̻� �Է����ּ���">
                                </div>
                                <div class="mb-3">
                                    <label for="contact" class="form-label">����ó</label>
                                    <input type="text" class="form-control" id="contact" placeholder="��ȭ��ȣ�� �Է��ϼ���">
                                </div>
                                <div class="mb-3">
                                    <label for="postcode" class="form-label">�����ȣ</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="postcode" placeholder="�����ȣ">
                                        <button class="btn btn-outline-secondary" type="button" id="findPostcode">�ּ�ã��</button>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">�ּ�</label>
                                    <input type="text" class="form-control" id="address" placeholder="�ּ�">
                                </div>
                                <div class="mb-3">
                                    <label for="detailedAddress" class="form-label">���ּ�</label>
                                    <input type="text" class="form-control" id="detailedAddress" placeholder="���ּ�">
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="addToAddressBook">
                                    <label class="form-check-label" for="addToAddressBook">
                                        ����� ��Ͽ� �߰�
                                    </label>
                                </div>
                                <div class="mb-3">
                                    <label for="deliveryMemo" class="form-label">��۸޸�</label>
                                    <select class="form-select" id="deliveryMemo">
                                        <option value="">��۸޸� ������ �ּ���.</option>
                                        <option value="�� �տ� ���ּ���">�� �տ� ���ּ���</option>
                                        <option value="���ǿ� �ð��ּ���">���ǿ� �ð��ּ���</option>
                                        <option value="���� �޾ƾ� �մϴ�">���� �޾ƾ� �մϴ�</option>
                                        <option value="�����Է�">�����Է�</option>
                                    </select>
                                    <input type="text" class="form-control mt-2 hidden" id="deliveryMemoInput" placeholder="��۸޸� �Է��� �ּ���">
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
                    �ֹ� ���
                </div>
                <div class="card-body">
                    <p>��ǰ����: <%= totalProductPrice %>��</p>
                    <p>��ۺ�: <%= shippingCost %>��</p>
                    <p>�� �ֹ��ݾ�: <%= totalProductPrice + shippingCost %>��</p>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="agreeTerms">
                        <label class="form-check-label" for="agreeTerms">
                            �������� Ȯ�� �� �������࿡ ����
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3" id="payButton">�����ϱ�</button>
                </div>
          
            </div>
           
        </div>
        
    </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-WdcW8+3k9d0WCFQz2O+p44+gd+YoDZlD5oBLfQn3NE6vcegM2KUkc4gF3uH19ajp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-5IBV6dU1g8kDcHj/YnuP4WTDq0fFhZcLwE4E2LP+ulUGjUxr4/dRSu9moAhxJfDm" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    document.getElementById('editOrdererInfo').addEventListener('click', function() {
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
        if (this.value === '�����Է�') {
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

    document.getElementById('payButton').addEventListener('click', function() {
        if (!document.getElementById('agreeTerms').checked) {
            alert('�������� Ȯ�� �� �������࿡ �����ؾ� �մϴ�.');
            return;
        }
        // ���� �Ϸ� �������� �̵�
        document.getElementById('paymentForm').submit();
    });
</script>
</body>
</html>
