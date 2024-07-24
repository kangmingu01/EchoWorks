<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int productNo=Integer.parseInt(request.getParameter("productNo"));
	int secretCheck=Integer.parseInt(request.getParameter("secretCheck"));
	String replyStatus=request.getParameter("replyStatus");
	MemberDTO member=(MemberDTO)session.getAttribute("loginMember");
	int memberNo=member.getMemberNum();
	List<QnaDTO> QnaList=QnaDAO.getDAO().selectQnAList(productNo, secretCheck, replyStatus);
			
%>
<% if(QnaList.isEmpty()){%>
{"code":"empty","message":"질문이 없습니다".}
<%} else { %>
{"code":"success",
	"data":[
		<%for (int i=0;i<QnaList.size();i++){ %>
			<% if(i > 0 ) { %>,<% } %>
			{"QNA_NO":"<%=QnaList.get(i).getQnaNo()%>"
			,"QNA_MEMBER_NO":"<%=QnaList.get(i).getQnaMemberNo()%>"
			,"QNA_PRODUCT_NO":"<%=QnaList.get(i).getQnaProductNo()%>"
			,"QNA_TITLE":"<%=QnaList.get(i).getQnaTitle() %>"
			,"QNA_CONTENT":"<%=QnaList.get(i).getQnaContent() %>"
			,"QNA_DATE":"<%=QnaList.get(i).getQnaDate() %>"
			,"QNA_ANSWER":"<%=QnaList.get(i).getQnaAnswer() %>"
			,"QNA_ANSDATE":"<%=QnaList.get(i).getQnaAnsDate() %>"
			,"QNA_STATUS":"<%=QnaList.get(i).getQnaStatus() %>"}
		<% } %>	
			]
			}
<% } %>	