<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>�����ϱ�</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
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
<nav class="navbar navbar-expand-lg bg-transparent w-100">
      <div class="container mt-2 align-items-center">
        <!-- Logo -->
        <a class="navbar-brand fs-4 m-0 p-0 d-flex align-items-center text-white" href="#">
          <img src="../assets/img/logo_dark.svg" style="width: auto; height: 55px" alt="Logo"/>
        </a>
        <!-- Toggle -->
        <button class="navbar-toggler shadow-none border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcavasNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- SideBar -->
        <div class="sidebar offcanvas offcanvas-end bg-white" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
          <!-- SideBar Header -->
          <div class="offcanvas-header border-dark border-bottom border-2">
            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">EchoWorks</h5>
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
                  <li><a href="#" class="dropdown-item">���Ͼ�</a></li>
                  <li><a href="#" class="dropdown-item">��Ÿ��</a></li>
                  <li><a href="#" class="dropdown-item">������</a></li>
                  <li><a href="#" class="dropdown-item">���׳�ƽ</a></li>
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
<div class="container">
    <h2 class="section-title text-center">�����ϱ�</h2>
    <div class="row">
        <div class="col-md-7">
            <div class="card">
                <div class="card-header">
                    �ֹ� ��ǰ ����
                </div>
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <img src="��ǰ �̹��� ���" alt="��ǰ �̹���" style="width: 100px; height: 100px; margin-right: 20px;">
                        <div>
                            <p>������Ű SW La Vie en Rose R2 ���߻��� Űĸ ��Ʈ, 1��</p>
                            <p>77,000��</p>
                            <p>��ۺ� 2,500��</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    �ֹ��� ����
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <input type="text" class="form-control" id="ordererName" value="������" disabled>
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" id="ordererContact" value="01040773346" disabled>
                    </div>
                    <div class="mb-3">
                        <input type="email" class="form-control" id="ordererEmail" value="tosmreo@naver.com" disabled>
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
                            <p><input type="radio" name="address" checked> ������, ��� ������ �߿��� �ݺ���42���� 7 (�ݱ���, �帲������Ǽ�) 501ȣ, 13183</p>
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
                    <p>��ǰ����: 77,000��</p>
                    <p>��ۺ�: 2,500��</p>
                    <p>�� �ֹ��ݾ�: 79,500��</p>
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
                    <button class="btn btn-primary mt-3">�����ϱ�</button>
                </div>
            </div>
        </div>
    </div>
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
</script>
</body>
</html>


