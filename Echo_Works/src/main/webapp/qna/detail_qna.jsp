<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <button
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
              </div>
              <div
                class="d-flex flex-nowrap align-items-center text-nowrap gap-2 fs-6"
              >
                <input type="checkbox" name="" id="secretWrite" />
                <label for="secretWrite" class="">비밀글 제외</label>
                |
                <label for="my_qna" onclick="toggleChecked()"
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
                >
                  <option value="1" selected>답글상태</option>
                  <option value="2">미답변</option>
                  <option value="3">답변완료</option>
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
              <ul class="ps-0">
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