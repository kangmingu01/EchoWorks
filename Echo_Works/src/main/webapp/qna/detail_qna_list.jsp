<%@page import="echoworks.util.Utility"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int secretCheck = Integer.parseInt(request.getParameter("secretCheck"));
	String replyStatus = request.getParameter("replyStatus");
	int memberNum = Integer.parseInt(request.getParameter("memberNum"));
    
	List<QnaDTO> qnaList = QnaDAO.getDAO().selectQnAList(productNo, secretCheck, replyStatus, memberNum);
%>
<% if(qnaList.isEmpty()){%>
{"code":"empty","message":"질문이 없습니다."}
<%} else { %>
{"code":"success",
	"data":[
		<%for (int i=0;i<qnaList.size();i++){ %>
			<% if(i > 0 ) { %>,<% } %>
			{"qnaNO":"<%=qnaList.get(i).getQnaNo()%>"
			,"qnaMemberNo":"<%=qnaList.get(i).getQnaMemberNo()%>"
			,"qnaProductNo":"<%=qnaList.get(i).getQnaProductNo()%>"
			,"qnaTitle":"<%=qnaList.get(i).getQnaTitle() %>"
			,"qnaContent":"<%=qnaList.get(i).getQnaContent() %>"
			,"qnaDate":"<%=qnaList.get(i).getQnaDate() %>"
			,"qnaAnswer":"<%=qnaList.get(i).getQnaAnswer() %>"
			,"qnaAnsdate":"<%=qnaList.get(i).getQnaAnsDate() %>"
			,"qnaStatus":"<%=qnaList.get(i).getQnaStatus() %>"}
		<% } %>	
			]
		}
<% } %>