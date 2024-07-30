<%@page import="java.util.ArrayList"%>
<%@page import="echoworks.util.Utility"%>
<%@page import="echoworks.dao.ReviewDAO"%>
<%@page import="echoworks.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 페이지 파라미터 받기 --%>
<%


    int currentPage = 1;
    int itemsPerPage = 10;
    int product_no = 0;
    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
    if (request.getParameter("itemsPerPage") != null) {
        itemsPerPage = Integer.parseInt(request.getParameter("itemsPerPage"));
    }
    if (request.getParameter("productNo") != null) {
        product_no = Integer.parseInt(request.getParameter("productNo"));
    }

    List<ReviewDTO> rList = ReviewDAO.getDAO().selectReviewList();

    List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
    
    for(int i=0;i<rList.size();i++) {
    	if(rList.get(i).getReview_state() == 1 && ReviewDAO.getDAO().selectPreductNo(rList.get(i).getReview_pyNo()) == product_no)
    		reviewList.add(rList.get(i));
    }
    
    int totalItems = reviewList.size();
    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

    int startItem = (currentPage - 1) * itemsPerPage;
    int endItem = Math.min(startItem + itemsPerPage, totalItems);

    List<ReviewDTO> paginatedList = Collections.emptyList();
    if (totalItems > 0) {
        paginatedList = reviewList.subList(startItem, endItem);
    }
%>

<% if(paginatedList.isEmpty()) { %>
    {"code":"empty", "message":"첫번째 댓글을 입력해 주세요."}	
<% } else { %>
{
    "code":"success",
    "totalPages": <%= totalPages %>,
    "currentPage": <%= currentPage %>,
    "data":[
    <% for(int i=0; i<paginatedList.size(); i++) { %>
        <% if(i > 0 ) { %>,<% } %>
        {
            "num": <%= paginatedList.get(i).getReview_No() %>,
            "writer": "<%= ReviewDAO.getDAO().selectMember(paginatedList.get(i).getReview_pyNo()) %>",
            "content": "<%= Utility.toJSON(paginatedList.get(i).getReview_Content()) %>",
            "regdate": "<%= paginatedList.get(i).getReview_Date() %>",
            "state": "<%= paginatedList.get(i).getReview_state() %>",
            "product_no": "<%= ReviewDAO.getDAO().selectPreductNo(paginatedList.get(i).getReview_pyNo()) %>"
        }
    <% } %>	
    ]
}
<% } %>
