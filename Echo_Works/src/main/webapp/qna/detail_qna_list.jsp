<%@page import="echoworks.util.Utility"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");

    if(loginMember != null){
        System.out.println("나 로그인 했어!!");
    }

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
	<% if(loginMember != null){ %>
		"loginMemberNum": "<%= loginMember.getMemberNum()%>",
    	"loginMemberAuth": "<%= loginMember.getMemberAuth() %>",
	<% } else {%>
    	"loginMemberNum": 0,
    	"loginMemberAuth": 1,
    <% } %>
    "data":[
		<%for (int i=0;i<qnaList.size();i++){ %>
			<% if(i > 0 ) { %>,<% } %>
			{"qnaNo":"<%=qnaList.get(i).getQnaNo()%>"
			,"qnaMemberNo":"<%=qnaList.get(i).getQnaMemberNo()%>"
			,"qnaProductNo":"<%=qnaList.get(i).getQnaProductNo()%>"
			,"qnaTitle":"<%=Utility.toJSON(qnaList.get(i).getQnaTitle()) %>"
			,"qnaContent":"<%=Utility.toJSON(qnaList.get(i).getQnaContent()) %>"
			,"qnaDate":"<%=qnaList.get(i).getQnaDate() %>"
			,"qnaAnswer":
				<% if(qnaList.get(i).getQnaAnswer() != null) { %>
					"<%=Utility.toJSON(qnaList.get(i).getQnaAnswer()) %>"
				<% } else { %>
					""
				<% } %>	
				<% if(qnaList.get(i).getQnaAnsDate() != null) {%>
					,"qnaAnsdate":"<%=qnaList.get(i).getQnaAnsDate() %>"
				<% } else { %>
					,"qnaAnsdate":""
				<% } %>	
				,"qnaStatus":"<%=qnaList.get(i).getQnaStatus() %>"}
		<% } %>	
			]
		}
<% } %>