<%@page import="echoworks.util.Utility"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

	int productNo = Integer.parseInt(request.getParameter("productNo"));
	
	String secretCheckStr = request.getParameter("secretCheck");
	
	int secretCheck = 0;
	
	// 비밀글 제외가 false로 값이 넘어오면 1로 변경
    if ("false".equals(secretCheckStr)) {
        secretCheck = 1;
    }
			
	// 답변 상태
	String replyStatus = request.getParameter("replyStatus");
	
	// 내 Q&A 보기가 true이면
	int memberNum = 0;
    if ("true".equals(request.getParameter("myQnA"))) {
    	memberNum = Integer.parseInt(request.getParameter("memberNum"));
    }

    System.out.println(productNo);
    System.out.println(secretCheck);
    System.out.println(replyStatus);
    System.out.println(memberNum);
    
	// List<QnaDTO> qnaList = QnaDAO.getDAO().selectQnAList(productNo, secretCheck, replyStatus, memberNum);
%>
<%-- <% if(qnaList.isEmpty()) { %>
{"code":"empty", "message":"첫번째 댓글을 입력해 주세요."}
<% } else { %>
{
	"code": "success",
	"data": [
		<% for(int i = 0; i< qnaList.size(); i++) { %>
			<% if(i > 0) { %> , <% }  %>
			{
			"qnaNo": "<%=qnaList.get(i).getQnaNo() %>"
			,"qnaAnswer": "<%=qnaList.get(i).getQnaAnswer() %>"
			,"qnaTitle": "<%=qnaList.get(i).getQnaTitle() %>"
			,"qnaMemberNo": "<%=qnaList.get(i).getQnaMemberNo() %>"
			,"qnaDate": "<%=qnaList.get(i).getQnaDate() %>"
			}
		<% } %>
	]
}
<% } %> --%>