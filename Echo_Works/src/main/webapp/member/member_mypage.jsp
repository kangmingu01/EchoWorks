<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="echoworks.dto.PaymentDTO"%>
<%@page import="echoworks.dto.PaymentDTO"%>
<%@page import="java.util.List"%>
<%@page import="echoworks.dao.PaymentDAO"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
     MemberDTO memberId = (MemberDTO) session.getAttribute("loginMember");
	
    if (memberId == null) {
        response.sendRedirect("member_login.jsp");
        return; 
    }
  
    // 사용자 정보 조회
   // MemberDAO memberDAO = MemberDAO.getDAO();
   /// MemberDTO loginMember = memberDAO.selectMemberById(memberId);
    MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

    // 결제 내역 조회
 //	int memberNo=loginMember.getMemberNum();
    List<PaymentDTO> paymentList = PaymentDAO.getDAO().selectPaymentByMemberNo(loginMember.getMemberNum());

    // QnA 내역 조회
   // QnaDAO qnaDAO = QnaDAO.getDAO();
   List<QnaDTO> qnaList = QnaDAO.getDAO().selectQnaByMemberNo(loginMember.getMemberNum());
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        body, html {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #f9f9f9;
        }
        #container12 { display: flex; }
        .sidebar { 
            width: 200px; 
            background-color: #2c3e50;
            padding-top: 20px;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
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
           
        }
        .content-section { display: none; }
        .content-section.active { display: block; }
        h2 {
            color: #333;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .info-item {
            margin-bottom: 10px;
        }
        .info-item label {
            display: inline-block;
            width: 150px;
            font-weight: bold;
        }
        .info-item span {
            color: #555;
        }
        .button-group a {
            display: inline-block;
            margin: 10px 5px 0 0;
            padding: 10px 20px;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            background-color: #3498db;
            transition: background-color 0.3s;
        }
        .button-group a:hover {
            background-color: #2980b9;
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px;
        }
        th, td { 
            border: 1px solid #ddd; 
            padding: 8px; 
            text-align: left; 
        }
        th { 
            background-color: #f2f2f2; 
        }
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
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
    </script>
</head>
<body>
    <div class="" id="container12">
        <div class="sidebar">
            <nav>
                <ul>
                    <li><a href="#myinfo" onclick="showSection('account-info')">내 정보</a></li>
                    <li><a href="#paymentrecord" onclick="showSection('payment-history')">결제 내역</a></li>
                    <li><a href="#QnA" onclick="showSection('qna')">QnA</a></li>
                </ul>
            </nav>
        </div>
        <div class="main-content">
            <div id="account-info" class="content-section active">
                <h2>내 정보</h2>
                <div class="info-item">
                    <label>이름:</label>
                    <span><%= loginMember.getMemberName() %></span>
                </div>
                <div class="info-item">
                    <label>이메일:</label>
                    <span><%= loginMember.getMemberEmail() %></span>
                </div>
                <div class="info-item">
                    <label>전화번호:</label>
                    <span><%= loginMember.getMemberMobile() %></span>
                </div>
                <div class="info-item">
                    <label>주소:</label>
                    <span>[<%= loginMember.getMemberZipcode() %>] <%= loginMember.getMemberAddress1() %> <%= loginMember.getMemberAddress2() %></span>
                </div>
                <div class="info-item">
                    <label>회원가입날짜:</label>
                    <span><%= loginMember.getMemberRegisterDate() %></span>
                </div>
                <div class="info-item">
                    <label>마지막 로그인 날짜:</label>
                    <span><%= loginMember.getMemberLastLogin() %></span>
                </div>
                
                <div class="button-group">
                    <a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=password_confirm&action=modify">회원정보변경</a>
                    <a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=password_confirm&action=remove">회원탈퇴</a>
                </div>
            </div>
            <div id="payment-history" class="content-section">
                <h2>결제 내역</h2>
                <table>
                    <thead>
                        <tr>
                            <th>결제 번호</th>
                            <th>결제 날짜</th>
                            <th>결제 총액</th>
                            <th>결제 수량</th>
                            <th>배송지 이름</th>
                            <th>주문자 전화번호</th>
                            <th>배송지 주소</th>
                            <th>배송 메시지</th>
                            <th>결제 상태</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (paymentList.isEmpty()) { %>
                            <tr>
                                <td colspan="10">결제 내역이 없습니다.</td>
                            </tr>
                        <% } else { %>
                           <% for (PaymentDTO payment : paymentList) { %>
                                <tr>
                                    <td><%= payment.getPaymentNo() %></td>
                                    <td><%= payment.getPaymentDate() %></td>
                                    <td><%= payment.getPaymentTotal() %></td>
                                    <td><%= payment.getPaymentNum() %></td>
                                    <td><%= payment.getPaymentJname() %></td>
                                    <td><%= payment.getPaymentPhone() %></td>
                                    <td><%= payment.getPaymentAddress1() %> <%= payment.getPaymentAddress2() %></td>
                                     <% if(payment.getPaymentStatus() == 0) { %>
                                    <td>결제취소</td>
                                    <% } else if(payment.getPaymentStatus() == 1) { %>
                                    <td>결제완료</td>
                                    <% } else if(payment.getPaymentStatus() == 2) { %>
                                    <td>배송중</td>
                                    <% } else if(payment.getPaymentStatus() == 3) { %>
                                    <td>배송완료</td>
                                    <%} %>
                                    <td><%= payment.getPaymentOmesg() %></td>
                                   <td><form action="<%=request.getContextPath() %>/member/member_mypage_payment_cancel_action.jsp" method="post"><button type="submit" name="paymentNo" value="<%=payment.getPaymentNo() %>" id="CantcelBtn">결제취소</button></td></form>
                                  
                                    
                                    
                                </tr>
                            <% }%>
                     <%    } %>
                    </tbody>
                </table>
            </div>
            <div id="qna" class="content-section">
                <h2>QnA</h2>
                <table>
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>내용</th>
                            <th>날짜</th>
                            <th>답변유무</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (qnaList.isEmpty()) { %>
                            <tr>
                                <td colspan="3">문의 내역이 없습니다.</td>
                            </tr>
                        <% } else { %>
                           <%  for (QnaDTO qna : qnaList) { %>
                                <tr>
                                    <td><%= qna.getQnaTitle() %></td>
                                    <td><%= qna.getQnaContent() %></td>
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
                                </tr>
                            <% } %>
                     <%  } %> 
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    </script>
</body>
</html>