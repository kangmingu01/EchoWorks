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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        #container12 { display: flex; }
        .sidebar { width: 200px; }
        .main-content { flex-grow: 1; padding: 20px; }
        .content-section { display: none; }
        .content-section.active { display: block; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #000; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
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
    <div class="container" id="container12">
        <div class="sidebar">
            <nav>
                <ul>
                    <li><a href="#myinfo" onclick="showSection('account-info')">내 정보</a></li>
                    <li><a href="#paymentreocord" onclick="showSection('payment-history')">결제 내역</a></li>
                    <li><a href="#QnA" onclick="showSection('qna')">QnA</a></li>
                </ul>
            </nav>
        </div>
        <div class="main-content">
            <div id="account-info" class="content-section active">
                <h2>내 정보</h2>
                <p>이름: <%= loginMember.getMemberName() %></p>
                <p>이메일: <%= loginMember.getMemberEmail() %></p>
                <p>전화번호: <%= loginMember.getMemberMobile() %></p>
                <p>주소: [<%= loginMember.getMemberZipcode() %>] <%= loginMember.getMemberAddress1() %> <%= loginMember.getMemberAddress2() %></p>
                <p>회원가입날짜: <%= loginMember.getMemberRegisterDate() %></p>
                <p>마지막 로그인 날짜: <%= loginMember.getMemberLastLogin() %></p>	
                
                <div>
                <a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=password_confirm&action=modify">[회원정보변경]</a>&nbsp;&nbsp;
                <a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=password_confirm&action=remove">[회원탈퇴]</a>
                </div>
            </div>
            <div id="payment-history" class="content-section">
                <h2>결제 내역</h2>
                <table>
                    <thead>
                        <tr>
                            <th>결제 번호</th>
                            <th>결제 날짜</th>
                            <th>결제 상태</th>
                            <th>결제 총액</th>
                            <th>결제 수량</th>
                            <th>배송지 이름</th>
                            <th>주문자 전화번호</th>
                            <th>배송지 주소</th>
                            <th>배송 메시지</th>
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
                                    <td><%= payment.getPaymentStatus() %></td>
                                    <td><%= payment.getPaymentTotal() %></td>
                                    <td><%= payment.getPaymentNum() %></td>
                                    <td><%= payment.getPaymentJname() %></td>
                                    <td><%= payment.getPaymentPhone() %></td>
                                    <td><%= payment.getPaymentAddress1() %> <%= payment.getPaymentAddress2() %></td>
                                    <td><%= payment.getPaymentOmesg() %></td>
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
                                </tr>
                            <% } %>
                     <%  } %> 
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
