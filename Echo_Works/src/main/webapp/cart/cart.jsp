<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>��ٱ���</title>
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
        <form>
            <div id="frame2">
                <span style="font-size: 16pt; font-weight: bold;">��ٱ���</span>
                <span class="home">Ȩ > ��ٱ���</span>
            </div>
            <br/>
            <div>
                <!-- ��ǰ���� ���̺� -->
                <table class="calculation1">
                    <thead>
                        <tr>
                            <th colspan="8" style="text-align: left; padding-left: 10px;">�Ϲݻ�ǰ(1)</th>
                        </tr>
                        <tr>
                            <th><input type="checkbox" id="check-all" /></th>
                            <th><span>�̹���</span></th>
                            <th style="width: 550px;"><span>��ǰ����</span></th>
                            <th>�ǸŰ�</th>
                            <th>����</th>
                            <th>��۱���</th>
                            <th>��ۺ�</th>
                            <th>�հ�</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="height: 90px; background-color: #fff;">
                            <td><input type="checkbox" class="check-item" /></td>
                            <td><img style="width: 80%;" src="��ǰ �̹��� ����ϱ�"/></td>
                            <td style="font-weight: bold;">��ǰ �̸� �Է��ϱ�</td>
                            <td class="unit-price">1000��</td> <!-- ���� ���� 1000�� ���� -->
                            <td>
                                <input type="number" class="quantity-input" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99" step="1" value="1"/>
                                <button type="button" class="btn default update-btn" style="border-radius: 3px; size: 10px;">����</button>
                            </td>
                            <td>�⺻���</td>
                            <td>2,500��<br/>����</td>
                            <td class="total-price">1000��</td> <!-- ���� ���� 1000�� ���� -->
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr style="height: 60px;">
                            <td colspan="4" style="text-align: left; padding-left: 10px;"><span>[�⺻���]</span></td>
                            <td colspan="4" style="text-align: right; padding-right: 10px;">
                                ��ǰ�ݾ�<span id="total-product-price">1000</span> + <span>��ۺ� 2,500</span> = �հ�<span id="final-price" style="font-weight: bold; font-size: 15pt;">3500</span>��
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <button type="button" class="btn default" id="delete-selected" style="margin-top: 10px;">�����ϱ�</button>
                <br/><br/><br/>
                <!-- ���������ݾ� ���̺� -->
                <table class="calculation2">
                    <tr>
                        <th>�� ��ǰ�ݾ�</th>
                        <th>�� ��ۺ�</th>
                        <th style="width: 750px; padding: 22px 0;"><span>���������ݾ�</span></th>
                    </tr>
                    <tr style="background-color: #fff;">
                        <td style="padding: 22px 0;"><span id="summary-product-price" class="price">1000</span>��</td>
                        <td><span id="summary-shipping-price" class="price">2500</span>��</td>
                        <td><span id="summary-final-price" class="price">3500</span>��</td>
                    </tr>
                </table>
                <br/><br/>
                <div align="center">
                    <button class="btn default" id="allProduct">��ü��ǰ�ֹ�</button>
                    <button class="btn default backBtn" id="productClear">���û�ǰ�ֹ�</button>
                    <button class="btn default footerbtn" id="footerbtn">���ΰ���ϱ�</button>
                    <span class="clearboth"></span>
                </div>
                <br/><br/><br/>
                <div style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color:white-space; padding-left: 10px;">
                    �̿�ȳ�
                </div>
                <div style="border: solid 1px #e0e0eb; height: 350px; font-size: 12pt; padding-left: 10px;">
                    <br/>��ٱ��� �̿�ȳ�
                    <ol>
                        <li class="lifont">�ؿܹ�� ��ǰ�� ������� ��ǰ�� �Բ� �����Ͻ� �� ������ ��ٱ��� ���� ���� ������ �ֽñ� �ٶ��ϴ�.</li>
                        <li class="lifont">�ؿܹ�� ������ ��ǰ�� ��� ������� ��ٱ��Ͽ� ��Ҵٰ� �ؿܹ�� ��ٱ��Ϸ� �̵��Ͽ� �����Ͻ� �� �ֽ��ϴ�.</li>
                        <li class="lifont">�����Ͻ� ��ǰ�� ������ �����Ͻ÷��� �������� �� [����] ��ư�� �����ø� �˴ϴ�.</li>
                        <li class="lifont">[���ΰ���ϱ�] ��ư�� �����ø� ������ ��� �Ͻ� �� �ֽ��ϴ�.</li>
                        <li class="lifont">��ٱ��Ͽ� ���ɻ�ǰ�� �̿��Ͽ� ���Ͻô� ��ǰ�� �ֹ��ϰų� ���ɻ�ǰ���� ����Ͻ� �� �ֽ��ϴ�.</li>
                        <li class="lifont">����÷�� �ɼ��� ���ϻ�ǰ�� ��ٱ��Ͽ� �߰��� ��� �������� ���ε� �� ���Ϸ� ��ü�˴ϴ�.</li>
                    </ol>
                    �������Һ� �̿�ȳ�
                    <ol>
                        <li class="lifont">��ǰ�� �������Һ� ������ �����÷��� �������Һ� ��ǰ�� �����Ͽ� [�ֹ��ϱ�] ��ư�� ���� �ֹ�/���� �Ͻø� �˴ϴ�.</li>
                        <li class="lifont">[��ü ��ǰ �ֹ�] ��ư�� �����ø� ��ٱ����� ���о��� ���õ� ��� ��ǰ�� ���� �ֹ�/������ �̷�����ϴ�.</li>
                        <li class="lifont">��, ��ü��ǰ�� �ֹ�/�����Ͻ� ���, ��ǰ�� �������Һ� ������ ������ �� �����ϴ�.</li>
                        <li class="lifont">�������Һ� ��ǰ�� ��ٱ��Ͽ��� ���� �������Һ� ��ǰ ������ ǥ�õǾ�, �������Һ� ��ǰ �������� ��ۺ� ��õ˴ϴ�.<br/>
                            ���� ��ۺ�� �Բ� �ֹ��ϴ� ��ǰ�� ���� ����ǿ��� �ֹ��� �ϴ��� ��ۺ� ������ �������ֽñ� �ٶ��ϴ�.</li>
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
                var unitPrice = parseInt(this.closest('tr').querySelector('.unit-price').textContent.replace('��', ''));
                var newTotalPrice = newQuantity * unitPrice;
                
                priceCell.textContent = newTotalPrice + '��';
                
                updateSummary();
            });
        });

        function updateSummary() {
            var totalProductPrice = 0;
            document.querySelectorAll('.total-price').forEach(function(cell) {
                totalProductPrice += parseInt(cell.textContent.replace('��', ''));
            });

            var shippingCost = 2500; // ��ۺ�
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
