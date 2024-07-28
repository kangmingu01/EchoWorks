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
/* 
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int secretCheck = Integer.parseInt(request.getParameter("secretCheck"));
	String replyStatus = request.getParameter("replyStatus");
	int memberNum = Integer.parseInt(request.getParameter("memberNum"));
	List<QnaDTO> qnaList = QnaDAO.getDAO().selectQnAList(productNo, secretCheck, replyStatus, memberNum);
	
	 */
	
	
	
	//페이징 처리
    //사전 값 처리
   	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int secretCheck = Integer.parseInt(request.getParameter("secretCheck"));
	String replyStatus = request.getParameter("replyStatus");
	int memberNum = Integer.parseInt(request.getParameter("memberNum"));
   		
	int pageNum=1;
	String pageNumString = request.getParameter("pageNum");
	if (pageNumString != null && !pageNumString.trim().isEmpty()) {//공백인식
		try {
	  	 pageNum = Integer.parseInt(pageNumString.trim());
		} catch (NumberFormatException e) {
		            pageNum = 1;
		}
	}
		int pageSize=12;//출력 글 수
		int totalRow=QnaDAO.getDAO().selectTotalQnaRows(productNo, secretCheck, replyStatus, memberNum);
		int totalPage=(int)Math.ceil((double)totalRow/pageSize);
		if(pageNum <= 0 || pageNum > totalPage) {
			pageNum=1;
		}
		int startRow=(pageNum-1)*pageSize+1;
		int endRow=pageNum*pageSize;
		if(endRow > totalRow) {
			endRow=totalRow;
		}
		
		int displayNum=totalRow-(pageNum-1)*pageSize;
		//리스트 받아와서 저장
		
		//List<ProductDTO> productList = ProductDAO.getDAO().selectProductAsList(startRow, endRow, keyword);
		List<QnaDTO> qnaList=QnaDAO.getDAO().selectQnaList(startRow, endRow, productNo, secretCheck, replyStatus, memberNum);
		
		//페이지번호
		int blockSize=5;
		int startPage=(pageNum-1)/blockSize*blockSize+1; 
		int endPage=startPage+blockSize-1;
		if(endPage > totalPage) {
			endPage=totalPage;
		}
%>
 <%-- <% if(qnaList.isEmpty()){%>
{"code":"empty","message":"질문이 없습니다."}
<%} else { %>
{"code":"success",
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
<% } %>   --%>
<% if(qnaList.isEmpty()){%>
{"code":"empty","message":"질문이 없습니다."}
<%} else { %>
{"code":"success",
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
			],"startPage":"<%=startPage %>","blockSize":"<%=blockSize %>","endPage":"<%=endPage %>" ,"totalPage":"<%=totalPage %>","pageNum":"<%=pageNum %>"
		}
<% } %> 