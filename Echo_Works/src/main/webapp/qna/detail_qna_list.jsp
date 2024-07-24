<%@page import="echoworks.dto.QnaDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="echoworks.dao.QnaDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="echoworks.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 세션에 있는 로그인 사용자의 객체를 받아옴
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

	// request.getRequestURI(): 요청 URL 주소에서 JSP 문서의 경로를 반환하는 메소드
	String requestURI=request.getRequestURI();
	// // requestURI = /Echo_Works/index.jsp
	System.out.println("requestURI = " + requestURI); 
	
	
	//request.getQueryString(): 요청 URL 주소에서 질의문자열(QueryString)을 반환하는 메소드
	String queryString=request.getQueryString();		
	// queryString = workgroup=qna&work=detail_qna_list
	System.out.println("queryString = " + queryString);
	
	//현재 실행중인 JSP 문서의 URL 주소를 생성하여 저장
	String url=requestURI;
	if(queryString != null) {
		url+="?"+queryString;
	}
	
	//URL 주소를 부호화 처리하여 저장
	url=URLEncoder.encode(url, "utf-8");
	// url = %2FEcho_Works%2Findex.jsp%3Fworkgroup%3Dqna%26work%3Ddetail_qna_list
	System.out.println("url = "+url);
	
	String contextPath = request.getContextPath();
	// request.getContextPath() = /Echo_Works
	System.out.println("request.getContextPath() = "+ request.getContextPath());
%>
<%--
- QNA 테이블에 저장된 행을 상품 번호에 따라 행을 검색하여 검색된 행을 HTML 태그에 포함하는 문서
- QNA 테이블에 저장된 행을 페이지 단위로 구분하여 검색해 응답 처리 - 페이징 처리
- [페이지번호] 태그를 클릭한 경우 [/qna/detail_qna_list.jsp] 문서를 요청하여 페이지 이동
- 페이지번호, 게시글 갯수, 조회대상(답글상태, 미답변, 답변완료), 조회상태(비밀글인지 아닌지) 필요

- [상품 Q&A 작성하기] -> [문의하기] 버튼을 클릭한 경우 [/qna/detail_qna_write.jsp]문서를 요청하여 페이지 이동
- => [상품 Q&A 작성하기] 버튼을 누르면 form 입력할 수 있는 부분이 나오는데 이 부분은 로그인 사용자만 가능
- => 로그인 하지 않은 사용자는 로그인 페이지로 이동했다가 로그인하면 로그인 요청했던 이전 페이지로 다시 이동 => RollBackPage

- 게시글의 조회상태[답글상태, 미답변, 답변완료]에 따라 [/qna/detail_qna_list.jsp] 문서를 요청하여 페이지 이동
 --%>
 
 <%--
 	// 게시글의 조회기능에 필요한 전달값(조회대상[답글상태, 미답변, 답변완료], 조회상태[일반글, 비밀글])을 반환받아 저장
 	String reply = request.getParameter("reply");
 	if(reply == null) {
 		// 전달값이 없으면
 		reply = "";
 	}
 
 	// 체크되지 않으면 일반글, 체크되면 비밀글 => 체크되면 1, 체크 풀리면 0으로 할지
 	int secretCheck = 1; // 전달값이 없으면
 	if(request.getParameter("secretCheck") != null) {
 		scretCheck = Integer.parseInt(request.getParameter("secretCheck"));
 	}
 	
 	// 페이징 처리에 필요한 전달값(페이지번호와 게시글갯수)을 반환받아 저장
 	int pageNum = 1; // 페이지번호 => 전달값이 없는 경우 사용할 기본값 저장
	if(request.getParameter("pageNum") != null) { // 전달값이 있는 경우
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
 	int pageSize = 10;  // 게시글 갯수 => 기본값 
 			
 	// 조회정보(조회대상, 조회상태)를 전달받아 Q&A 테이블에 저장된 행에서 조회정보가 포함된
 	// 행의 갯수를 검색하여 반환하는 QnADAO 클래스의 메소드 호출
 	int totalQnA = QnaDAO.getDAO().selectTotalQnA(reply, secretCheck); // Q&A 게시글 총갯수
 	
 	// 페이지의 총갯수를 계산하여 저장
 	// Math.ceil => 소숫점 강제 올림
 	int totalPage = (int)Math.ceil((double)totalQnA/pageSize);
 	
 	// 전달받은 페이지번호가 비정상적인 경우 첫번째 페이지를 요청할 수 있는 기본값 저장
 	if(pageNum <= 0 || pageNum > totalPage) {
 		pageNum = 1;
 	}
 	
 	// 페이지번호에 대한 게시글의 시작 행번호를 계산하여 저장
 	int startRow = (pageNum - 1) * pageSize + 1;
 	
 	// 페이지번호에 대한 게시글의 종료 행번호를 계산하여 저장
 	int endRow = pageNum * pageSize;
 	
 	// 마지막 페이지의 게시글의 종료 행번호가 게시글의 총갯수보다 많은 경우 종료 행번호 변경
 	if(endRow > totalQnA) {
 		endRow = totalQnA;
 	}
 	
 	// 페이징 관련 정보(시작행번호, 종료행번호)와 게시글 조회기능 관련 정보(조회대상과 조회단어)를
 	// 전달받아 Q&A 테이블에 저장된 행에서 조회정보가 포함된 행을 페이징 처리로 검색하여
 	// List 객체를 반환하는 QnADAO 클래스의 메소드를 호출
 	List<QnaDTO> qnaList = QnaDAO.getDAO().selectQnAList(startRow, endRow, reply, secretCheck);


	// 게시글의 작성날짜
	String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
 	
	// 게시글의 출력될 일련번호 시작값을 계산하여 저장
	int displayNum = totalQnA - (pageNum - 1) * pageSize;
 --%>
    <style>
          .toggle.android {
            border-radius: 30px;
            border: 1px solid gray;
          }
          .toggle.android .toggle-handle {
            background-color: white;
            color: white;
            border: 1px solid white;
            border-radius: 5px;
          }
          /* .qnaRows:hover {
            background-color: rgb(230, 230, 230);
          } */
        </style>
       <!-- 리뷰 -->
        <section>
          <div class="container col-md-10 mt-3">
            <span class="fw-normal fs-5">
              상품문의<span class="text-danger fs-6 ms-1">(66)</span>
            </span>
            <!-- <button
                type="button"
                class="btn btn-outline-dark"
                style="
                  --bs-btn-padding-y: 0.25rem;
                  --bs-btn-padding-x: 0.5rem;
                  --bs-btn-font-size: 0.75rem;
                "
              >
                글쓰기
              </button> -->
            <hr />
            <ul>
              <li>
                <small
                  >상품문의에서는 상품과 무관한 요청은 처리되지 않습니다.</small
                >
              </li>
              <li>
                <small>
                  배송문의·취소·환불 등은 1:1상담게시판을 통해 문의남겨주시기
                  바랍니다.</small
                >
              </li>
              <li>
                <small>
                  미구매,비방이나 양도 광고성, 욕설, 도배글, 개인정보가 포함된
                  글은 예고없이 삭제되거나 노출이 제한될 수 있습니다.</small
                >
              </li>
            </ul>
            <div class="table-responsive">
              <table class="table"></table>
            </div>

            <div class="d-flex justify-content-between mt-3 align-items-center">
              <div>

				<% if(loginMember != null) { %>
			    <button
			        id="writeQnA"
			        type="button"
			        class="btn btn-dark"
			        style="
			            --bs-btn-padding-y: 0.25rem;
			            --bs-btn-padding-x: 0.5rem;
			            --bs-btn-font-size: 0.75rem;
			        "
			        data-bs-toggle="collapse" 
			        data-bs-target="#writeToggle"
			    >
			        상품 Q&A 작성하기
			    </button>
				<% } else { %>
				    <button
				        id="writeQnA"
				        type="button"
				        class="btn btn-dark"
				        style="--bs-btn-padding-y: 0.25rem; --bs-btn-padding-x: 0.5rem; --bs-btn-font-size: 0.75rem;"
				        onclick="checkLogin()"
				    >
				        상품 Q&A 작성하기
				    </button>
				<% } %>
              </div>
              <div
                class="d-flex flex-nowrap align-items-center text-nowrap gap-2 fs-6"
              >
              	<!-- scretWrite -->
                <input type="checkbox" name="" id="secretCheck" />
                <label for="secretCheck" class="">비밀글 제외</label>
                |
                <label  for="my_qna" onclick="toggleChecked()"
                  >내 Q&A 보기</label
                >
                <input
                  id="my_qna"
                  type="checkbox"
                  data-toggle="toggle"
                  data-style="android"
                  data-onstyle="success"
                  data-offstyle="danger"
                  data-size="small"
                />

                <select
                  class="form-select form-select-sm d-sm-none d-md-block"
                  aria-label="Default select example form-select-sm"
                  name="reply";
                >
                  <option value="reply_status">답글상태</option>
                  <option value="unanswered_answer">미답변</option>
                  <option value="answer_completed">답변완료</option>
                </select>
              </div>
            </div>
            <!-- 
            글쓰기 버튼 눌렀을 때 로그인된 사용자면 보여지고, 로그인된 사용자가 아닐경우
            로그인 confirm으로 보내기
            class="collapse bg-body-secondary pt-4 pe-4 ps-4 pb-3 mt-3 border border-opacity-25 border-black"
            -->
			
            <div id="writeToggle" class="collapse mt-3">
              <!-- action에 경로 추가 아마도 ajax로 작업할 듯 -->
              <form action="" method="post" class="card card-body">
                <div>
                  <div class="d-flex justify-content-between">
                    <label for="qnaTitle" class="form-label">문의사항</label>
                    <div class="form-check form-check-inline">
                      <input
                        class="form-check-input"
                        type="checkbox"
                        id="inlineCheckbox1"
                        value="option1"
                      />
                      <label class="form-check-label" for="inlineCheckbox1"
                        >비밀글</label
                      >
                    </div>
                  </div>

                  <input
                    type="text"
                    class="form-control"
                    id="qnaTitle"
                    placeholder="제목을 작성해 주세요."
                  />
                </div>
                <div class="form-floating mt-3">
                  <label for=""></label>
                  <textarea
                    class="form-control"
                    placeholder="Leave a comment here"
                    id="floatingTextarea2"
                    style="height: 100px"
                  ></textarea>
                  <label for="floatingTextarea2"
                    >문의 내용을 작성해주세요</label
                  >
                </div>
                <div class="d-flex justify-content-center mt-3 gap-4">
                  <button type="button" class="btn btn-outline-primary">
                    문의하기
                  </button>
                  <button type="reset" class="btn btn-outline-secondary">
                    다시작성
                  </button>
                </div>
              </form>
            </div>
            <!-- 테이블 -->
            <div class="mt-4 mb-5">
              <div
                class="d-flex fw-bold text-center border border-2 border-start-0 border-end-0 border-black pt-1 pb-1"
              >
                <div style="width: 15%">
                  <span class="">답변상태</span>
                </div>
                <div style="width: 65%">
                  <span>제목</span>
                </div>
                <div style="width: 10%">
                  <span>작성자</span>
                </div>
                <div style="width: 10%">
                  <span>작성일</span>
                </div>
              </div>
              <!-- 상품 QnA -->
              <ul id="qna_list" class="ps-0">
                <li class="list-unstyled border-top qnaRows">
                  <div class="d-flex pt-2 pb-2 border-bottom">
                    <div style="width: 15%" class="text-center">
                      <span>미답변</span>
                    </div>
                    <div style="width: 65%">
                      <span
                        ><a href="" class="text-decoration-none text-black"
                          >상품에 하자가 있어요</a
                        ></span
                      >
                    </div>
                    <div style="width: 10%" class="text-center">
                      <span>작성자</span>
                    </div>
                    <div style="width: 10%" class="text-center">
                      <span>작성일</span>
                    </div>
                  </div>
                  <div class="d-flex pt-2 pb-2 border-bottom">
                    <!-- Q&A 제목 누르면 바로 밑에 뜰 수 있게  -->
                    <div style="width: 15%" class="text-center"></div>
                    <div style="width: 85%">
                      <span
                        ><a href="" class="text-decoration-none text-black"
                          >상품에 하자가 있어요</a
                        ></span
                      >
                      <div>
                        <a
                          href=""
                          class="text-decoration-none fs-6 text-black-50"
                          >수정</a
                        >
                        <a
                          href=""
                          class="text-decoration-none fs-6 text-black-50 ps-2"
                          >삭제</a
                        >
                        <a
                          href=""
                          class="text-decoration-none fs-6 text-black-50 ps-2"
                          >답변(관리자)</a
                        >
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
            <!-- <div>
              <table class="table table-hover table-sm">
                <thead class="border border-top-1">
                  <tr>
                    <th
                      scope="col"
                      style="width: 15%"
                      class="text-center flex-wrap text-nowrap"
                    >
                      답변상태
                    </th>
                    <th scope="col" style="width: 65%" class="text-center">
                      제목
                    </th>
                    <th scope="col" style="width: 10%" class="text-center">
                      작성자
                    </th>
                    <th scope="col" style="width: 10%" class="text-center">
                      작성일
                    </th>
                  </tr>
                </thead>
                <tbody class="table-group-divider">
                  <tr>
                    <th scope="row" class="text-center">미답변</th>
                    <td>
                      <a href="" class="text-decoration-none text-black"
                        >상품에 하자가 있어요</a
                      >
                    </td>
                    <td>Otto</td>
                    <td class="text-center">2024.07.22</td>
                  </tr>
                  <tr>
                    <th scope="row" class="text-center">답변완료</th>
                    <td>
                      <a href="" class="text-decoration-none text-black"
                        >이거 워블이 마음에 안들어요</a
                      >
                    </td>
                    <td>Thornton</td>
                    <td class="text-center">2024.07.21</td>
                  </tr>
                  <tr>
                    <th scope="row" class="text-center">답변완료</th>
                    <td>
                      <a href="" class="text-decoration-none text-black"
                        >비밀글입니다.
                        <i
                          class="fa-solid fa-lock fa-shake fa-flip-horizontal"
                          style="color: #000000"
                        ></i
                      ></a>
                    </td>
                    <td>Thornton</td>
                    <td class="text-center">2024.07.21</td>
                  </tr>
                </tbody>
              </table>
            </div> -->
          </div>
        </section>
<script type="text/javascript">
function checkLogin() {
    loginConfirm = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
    
    if(loginConfirm) {
		window.location.href = "<%=contextPath%>" + "/index.jsp?workgroup=member&work=member_login&url=" + "<%=url%>";
		console.log("<%=contextPath%>" + "/index.jsp?workgroup=member&work=member_login&url=" + "<%=url%>");
    }
	
// detail 페이지 완성되면 경로 수정해야됨 => 문제는 상태가 변하면서 새로고침되는데 이게 header로 올라감
<%-- $("#secretCheck").change(function() {
	console.log("<%=secretCheck%>");
	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=qna&work=detail_qna_list"
		+"&pageNum=<%=pageNum%>&pageSize="+$("#pageSize").val()+"&search=<%=search%>&keyword=<%=keyword%>";
}) --%>



function toggleChecked() {
	
}
</script>