<%@page import="echoworks.dao.ProductDAO"%>
<%@page import="echoworks.dto.ProductDTO"%>
<%@page import="echoworks.dto.ProductStockDTO"%>
<%@page import="echoworks.dao.ProductStockDAO"%>
<%@page import="echoworks.dao.MemberDAO"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="echoworks.dto.PaymentDTO"%>
<%@page import="java.util.List"%>
<%@page import="echoworks.dao.PaymentDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %> 
<%
    // 모든 회원정보 불러오기
    List<MemberDTO> memberList = MemberDAO.getDAO().selectAllMembers();

    // 모든 결제내역 불러오기
    List<PaymentDTO> paymentList = PaymentDAO.getDAO().selectAllPayments();

    // 모든 QnA내역 불러오기
    List<QnaDTO> qnaList = QnaDAO.getDAO().selectAllQnAList();
    
  	// 모든 상품정보 불러오기
  	 List<ProductDTO> productList = ProductDAO.getDAO().selectProductAll();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <style>

         #container12 { 
            display: flex; 
            height: 100vh; 
        }
        .sidebar { 
            width: 200px; 
            background-color: #2c3e50;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: white;
            display: block;
            padding: 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .sidebar ul li a:hover {
            background-color: #34495e;
        }
        .main-content { 
            flex-grow: 1; 
            padding: 20px; 
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin: 20px;
            border-radius: 8px;
            overflow-y: auto;
        }
        .content-section { 
            display: none; 
        }
        .content-section.active { 
            display: block; 
        }
        h2 {
            color: #333;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px;
        }
        th, td { 
            border: 1px solid #ddd; 
            padding: 8px; 
            text-align: center; 
        }
        th { 
            background-color: #f2f2f2; 
        }
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tbody tr:hover {
            background-color: #f1f1f1;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], input[type="number"] {
            width: calc(100% - 12px);
            padding: 5px;
            margin-top: 5px;
        }
        button {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #2c3e50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #34495e;
        }
    </style>
    <script>
    function showSection(sectionId) {
        var sections = document.getElementsByClassName('content-section');
        for (var i = 0; i < sections.length; i++) {
            sections[i].classList.remove('active');
        }
        document.getElementById(sectionId).classList.add('active');
    }

    function confirmCancel(memberId) {
        return confirm(memberId + "의 주문을 취소하시겠습니까?");
    }

    function confirmDelete(productId) {
        return confirm("상품 번호 " + productId + "을(를) 삭제하시겠습니까?");
    }

    </script>
</head>
<body>
    <div class="" id="container12">
        <div class="sidebar">
            <nav>
                <ul>
                    <li><a href="#admin_member" onclick="showSection('admin-member')">회원 관리</a></li>
                    <li><a href="#admin_payment" onclick="showSection('admin-payment')">주문 관리</a></li>
                    <li><a href="#admin_qna" onclick="showSection('admin-qna')">QnA 관리</a></li>
                    <li><a href="#admin_product" onclick="showSection('admin-product')">상품 관리</a></li>
                     <li><a href="#admin_product_add" onclick="showSection('admin-product-add')">상품 추가</a></li>
                </ul>
            </nav>
        </div>
        <div class="main-content">
            <div id="admin-member" class="content-section active">
                <h2>회원 목록</h2>
                <table>
                    <thead>
                        <tr>
                            <th class="text-nowrap">회원번호</th>
                            <th class="text-nowrap">아이디</th>
                            <th class="text-nowrap">이름</th>
                            <th class="text-nowrap">전화번호</th>
                            <th class="text-nowrap">이메일</th>
                            <th class="text-nowrap">주소</th>
                            <th class="text-nowrap">회원가입일</th>
                            <th class="text-nowrap">마지막 로그인</th>
                            <th class="text-nowrap">회원 상태</th>
                            <th class="text-nowrap">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (memberList.isEmpty()) { %>
                            <tr>
                                <td colspan="8">회원이 없습니다.</td>
                            </tr>
                        <% } else { %>
                            <% for (MemberDTO member : memberList) { %>
                                <tr>
                                    <td><%= member.getMemberNum() %></td>
                                    <td><%= member.getMemberId() %></td>
                                    <td><%= member.getMemberName() %></td>
                                    <td><%= member.getMemberMobile() %></td>
                                    <td><%= member.getMemberEmail() %></td>
                                    <td>[<%=member.getMemberZipcode() %>] <%= member.getMemberAddress1() %> <%= member.getMemberAddress2() %></td>
                                    <td><%= member.getMemberRegisterDate() %></td>
                                    <td><%= member.getMemberLastLogin() %></td>
									<%  if (member.getMemberAuth() == 0) { %>
									    <td>탈퇴 회원</td>
									<%   } else if (member.getMemberAuth() == 1) { %> 
										<td>일반 회원</td>
									<%   } else if (member.getMemberAuth() == 9) { %>
									    <td>관리자</td>
									    <% }%>
											
                                    <td><a href="<%=request.getContextPath() %>/index.jsp?workgroup=admin&work=admin_remove_member_action&action=remove&memberNum=<%= member.getMemberNum() %>">탈퇴</a></td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div id="admin-payment" class="content-section">
                <h2>주문 내역</h2>
                <table>
                    <thead>
                        <tr>
                            <th>결제번호</th>
                            <th>결제날짜</th>
                            <th>주문자아이디</th>
                            <th>결제상태</th>
                            <th>결제총액</th>
                            <th>결제수량</th>
                            <th>배송지이름</th>
                            <th>주문자전화번호</th>
                            <th>배송지주소</th>
                            <th>배송 메시지</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (paymentList.isEmpty()) { %>
                            <tr>
                                <td colspan="9">결제 내역이 없습니다.</td>
                            </tr>
                        <% } else { %>
                            <% for (PaymentDTO payment : paymentList) { %>
                                <tr>
                                    <td><%= payment.getPaymentNo() %></td>
                                    <td><%= payment.getPaymentDate() %></td>
                                     <% int num=payment.getPaymentHno();
										MemberDTO member=MemberDAO.getDAO().selectMemberByNum(num);%>  
									<td><%=member.getMemberId() %></td>
                                    <% if(payment.getPaymentStatus() == 0) { %>
                                    <td>결제취소</td>
                                    <% } else if(payment.getPaymentStatus() == 1) { %>
                                    <td>결제완료</td>
                                   <% } else if(payment.getPaymentStatus() == 2) { %>
                                    <td>배송중</td>
                                    <% } else if(payment.getPaymentStatus() == 3) { %>
                                    <td>배송완료</td>
                                    <%} %>
                                    <td><%= payment.getPaymentTotal() %></td>
                                    <td><%= payment.getPaymentNum() %></td>
                                    <td><%= payment.getPaymentJname() %></td>
                                    <td><%= payment.getPaymentPhone() %></td>
                                    <td><%= payment.getPaymentAddress1() %> <%= payment.getPaymentAddress2() %></td>
                                    <td><%= payment.getPaymentOmesg() %></td>
                                    <!-- 결제내역 테이블의 일부 -->
									<td>
									    <form action="<%=request.getContextPath() %>/admin/admin_adminpage_payment_cancel_action.jsp" method="post" onsubmit="return confirmCancel('<%= member.getMemberId() %>');">
									        <input type="hidden" name="paymentNo" value="<%=payment.getPaymentNo() %>" />
									        <button type="submit">결제취소</button>
									    </form>
									</td>
                                    
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div id="admin-qna" class="content-section">
                <h2>QnA 내역</h2>
                <table>
                    <thead>
                        <tr>
                        	<th>글번호</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>작성자아이디</th>
                            <th>작성자</th>
                            <th>날짜</th>
                            <th>답변유무</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (qnaList.isEmpty()) { %>
                            <tr>
                                <td colspan="4">문의 내역이 없습니다.</td>
                            </tr>
                        <% } else { %>
                            <% for (QnaDTO qna : qnaList) { %>
                                <tr>
                                	<td><%= qna.getQnaNo() %></td>
                                    <td><%= qna.getQnaTitle() %></td>
                                    <td><%= qna.getQnaContent() %></td>
                                     <% int num=qna.getQnaMemberNo();
										MemberDTO member=MemberDAO.getDAO().selectMemberByNum(num);%>                                
                                    <td><%= member.getMemberId() %> </td>
                                    <td><%= member.getMemberName() %> </td>
                                   <td><%= qna.getQnaDate() %></td>
									<%  if (qna.getQnaStatus() == 0) { %>
									    <td>삭제된 글</td>
									<%   } else if (qna.getQnaAnswer() == null || qna.getQnaStatus() == 1)     { %> 
										<td>답변 대기 중(일반글)</td>
									<%     } else if (qna.getQnaAnswer() != null || qna.getQnaStatus() == 1)     {   %>
									    <td>답변완료(일반글)</td>
									<%    } else if (qna.getQnaAnswer() == null || qna.getQnaStatus() == 2)     {  %>
									    <td>답변 대기 중(비밀글)</td>
									<%    } else if (qna.getQnaAnswer() != null || qna.getQnaStatus() == 2)     {  %>
										<td>답변 완료(비밀글)</td>
									    <% }%>
									    <td>
                                        <a href="<%=request.getContextPath() %>/index.jsp?workgroup=admin&work=admin_reply_qna_action&qnaNum=<%= qna.getQnaNo() %>">답변</a>
                                        <a href="<%=request.getContextPath() %>/index.jsp?workgroup=admin&work=admin_remove_qna_action&qnaNum=<%= qna.getQnaNo() %>">삭제</a>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <!-- 상품 관리 섹션 -->
            <div id="admin-product" class="content-section">
                <h2>상품 관리</h2>
                <table>
                    <thead>
                        <tr>
                            <th>상품 번호</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>재고</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (productList.isEmpty()) { %>
                            <tr>
                                <td colspan="5">등록된 상품이 없습니다.</td>
                            </tr>
                        <% } else { %>
                            <% for (ProductDTO product : productList) { %>
                                <tr>
                                    <td><%= product.getPRODUCT_NO() %></td>
                                    <td><%= product.getPRODUCT_NAME() %></td>
                                    <td><%= product.getPRODUCT_PRICE() %></td>
                                    <td><%= product.getPRODUCT_CATEGORY_MAIN() %></td>
                                    <td><%= product.getPRODUCT_CATEGORY_SUB() %></td>
                                   <td>
								    <%
								        List<ProductStockDTO> stockList = ProductStockDAO.getDAO().selectProductStockList(product.getPRODUCT_NO());
								        int totalStock = 0;
								        for (ProductStockDTO stock : stockList) {
								            totalStock += stock.getpS_Stock();
								        }%>
								        <%= totalStock %></td>
                                    <td>
                                        <a href="<%=request.getContextPath() %>/index.jsp?workgroup=admin&work=admin_edit_product_form&productNo=<%= product.getPRODUCT_NO() %>">수정</a>
                                        <a href="<%=request.getContextPath() %>/index.jsp?workgroup=admin&work=admin_delete_product_action&productNo=<%= product.getPRODUCT_NO() %>" onclick="return confirmDelete('<%= product.getPRODUCT_NO() %>')">삭제</a>
                                    </td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <!-- 상품 추가 섹션 -->
            <div id="admin-product-add" class="content-section">
                <h2>상품 추가</h2>
                <form action="<%=request.getContextPath() %>/index.jsp" method="post">
                    <input type="hidden" name="workgroup" value="admin">
                    <input type="hidden" name="work" value="admin_add_product_action">
                    <label for="productName">상품명:</label>
                    <input type="text" id="productName" name="productName" required>
                    <label for="productPrice">가격:</label>
                    <input type="number" id="productPrice" name="productPrice" required>
                    <label for="productStock">재고:</label>
                    <input type="number" id="productStock" name="productStock" required>
                    <button type="submit">상품 추가</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>