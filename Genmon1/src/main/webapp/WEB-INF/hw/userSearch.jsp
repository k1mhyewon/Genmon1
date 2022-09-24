<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../header.jsp" />
<style>

	* {font-family: 'Noto Sans KR', sans-serif; !important}

    b.nav-link{
        /* 추가 */
        color: black;
        font-size: 13pt;
        font-weight: bold;
        margin-left: 130px;
    }

    div#myPageNav{
        
        /* border: solid 1px gray; */
        padding-top: 100px;
        padding-bottom: 100px;
    }

    div#userSearchTitle {
        /* border: solid 1px pink; */
        font-weight: bold;
        padding: 0 30px 0 35px;
    }

    div#userSearchContentBox {
        /* border: solid 1px gray; */
        /* padding: 6% 0 3% 10%; */
        font-size: 15pt;
        width: 60%;
        margin: auto;
        margin-top: 100px;
    }

    div#searchBox {
        /* border: solid 1px green; */
        margin-top: 50px;
        padding: 0 30px 0 35px;
    }

    select#mbrCategory {
        width: 20%;
        height: 33px;
        font-size: 10pt;
    }

    input#search {
    	border: solid 1px gray;
        width: 60%;
        height: 34px;
        font-size: 10pt;
    }
    button#search_btn {
        width: 18%;
        font-size: 10pt;
    }

    div#view_box {
        /* border: solid 1px orange; */
        margin: auto;
        padding: 50px 0 50px 0;
    }

    th {
        font-size: 11pt;
    }

    td {
        font-size: 10pt;
    }

    nav {
        /* border: solid 1px purple; */
        font-size: 10pt;
        font-weight: bold;
        margin-top: 40px;
    }

    

</style>

<%-- 인덱스 시작 --%>
    <div>
        <nav class="navbar navbar-expand-md" >
            <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
              <span class="navbar-toggler-icon"><i class="fab fa-windows fa-lg"></i></span>
            </button>
            <div class="collapse navbar-collapse" id="myPageNav">
              <ul class="navbar-nav" style="margin: 0 auto;">
                <li class="nav-item">
                  <b class="nav-link" href="#">회원관리</b>
                </li>
                <li class="nav-item">
                  <b class="nav-link" href="#">주문관리</b>
                </li>
                <li class="nav-item">
                  <b class="nav-link" href="#">문의관리</b>
                </li>
                <li class="nav-item">
                    <b class="nav-link" href="#">리뷰관리</b>
                </li>     
              </ul>
            </div>  
        </nav>
    </div>

    <div id="userSearchContentBox">
        <div id="userSearchTitle">회원 조회</div>
        <div id="searchBox">
            <select id="mbrCategory" name="mbrCategory">
                <option value ="all">전체</option>
                <option value ="name">이름</option>
                <option value ="email">이메일</option>
                <option value ="phoneNum">휴대폰번호</option>
                <option value ="email">주소</option>
            </select>
            <input type="text" name="search" id="search" placeholder="이름, 연락처, 이메일, 주소 등으로 검색 가능합니다." />
            <button type="button" id="search_btn" class="btn btn-secondary">검색</button>
        </div>
        <div class="col-md-11" id="view_box">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>휴대폰번호</th>
                            <th>이메일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td onClick="location.href='userSearch_detail.jsp'">김젠몬</td>
                            <td>kimjm</td>
                            <td>010-1234-5678</td>
                            <td>kimjm@gmail.com</td>
                        </tr>
                        <tr>
                            <td>김젠몬</td>
                            <td>kimjm</td>
                            <td>010-1234-5678</td>
                            <td>kimjm@gmail.com</td>
                        </tr>
                        <tr>
                            <td>김젠몬</td>
                            <td>kimjm</td>
                            <td>010-1234-5678</td>
                            <td>kimjm@gmail.com</td>
                        </tr>
                        <tr>
                            <td>김젠몬</td>
                            <td>kimjm</td>
                            <td>010-1234-5678</td>
                            <td>kimjm@gmail.com</td>
                        </tr>
                        <tr>
                            <td>김젠몬</td>
                            <td>kimjm</td>
                            <td>010-1234-5678</td>
                            <td>kimjm@gmail.com</td>
                        </tr>
                        <tr>
                            <td>김젠몬</td>
                            <td>kimjm</td>
                            <td>010-1234-5678</td>
                            <td>kimjm@gmail.com</td>
                        </tr>
                        <tr>
                            <td>김젠몬</td>
                            <td>kimjm</td>
                            <td>010-1234-5678</td>
                            <td>kimjm@gmail.com</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 페이지네이션 -->
			<nav>
                <ul id="num" class="pagination justify-content-center">
                  <li class="page-item"><a class="page-link" href="#"><<</a></li>
                  <li class="page-item"><a class="page-link" href="#"><</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">6</a></li>
                  <li class="page-item"><a class="page-link" href="#">7</a></li>
                  <li class="page-item"><a class="page-link" href="#">8</a></li>
                  <li class="page-item"><a class="page-link" href="#">9</a></li>
                  <li class="page-item"><a class="page-link" href="#">10</a></li>
                  <li class="page-item"><a class="page-link" href="#">></a></li>
                  <li class="page-item"><a class="page-link" href="#">>></a></li>
                </ul>
              </nav>
        </div>
    </div>

    

<%-- 인덱스 끝 --%>

<jsp:include page="../footer.jsp" />