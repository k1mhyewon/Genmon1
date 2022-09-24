<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../header.jsp" />

<style>



    b.nav-link{
        /* 추가 */
        color: black;
        font-size: 15pt;
        font-weight: bold;
        margin-left: 130px;
    }

    div#myPageNav{
        
        /* border: solid 1px gray; */
        padding-top: 100px;
        padding-bottom: 100px;
    }

    div#userSearchTitle {
        /* border: solid 1px purple; */
        font-weight: bold;
    }

    div#userSearchContentBox {
        /* border: solid 1px gray; */
        /* padding: 6% 0 3% 10%; */
        font-size: 15pt;
        width: 60%;
        margin: auto;
        margin-top: 100px;
    }

    div#view_box {
        /* border: solid 1px pink; */
        margin: auto;
        padding: 50px 0 50px 0;
    }

    th {
        font-size: 12pt;
    }

    td {
        font-size: 10pt;
    }

    nav {
        font-size: 10pt;
        font-weight: bold;
    }
    
    #empty {
        height: 50px;
    }
    
    .btn_point {
        cursor: pointer;
        font-size: 9pt;
        height: 30px;
        margin-left: 20px;
    }    
    
    .titles {
    	width: 23%;
    	font-weight: bold;
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
        
        <div class="col-md-11" id="view_box">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>김젠몬 회원</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="titles">이름</td>
                            <td>김젠몬</td>
                        </tr>
                        <tr>
                            <td class="titles" >생년월일</td>
                            <td>2000.01.01 (23세)</td>
                        </tr>
                        <tr>
                            <td class="titles" >아이디</td>
                            <td>kimjm</td>
                        </tr>
                        <tr>
                            <td class="titles" >연락처</td>
                            <td>010-1234-5678</td>
                        </tr>
                        <tr>
                            <td class="titles" >이메일</td>
                            <td>gentle@gmail.com</td>
                        </tr>
                        <tr>
                            <td class="titles" >주소</td>
                            <td>(04001) 서울특별시 마포구 월드컵북로 21 풍성빌딩 3층</td>
                        </tr>
                        <tr>
                            <td class="titles" >계정상태</td>
                            <td>탈퇴여부&nbsp;:&nbsp;X&nbsp;/&nbsp;휴면여부&nbsp;:&nbsp;X</td>
                        </tr>
                        <tr>
                            <td class="titles" >적립금</td>
                            <td >10,000원<span class="btn btn-light btn_point" >수정하기</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table class="table table-hover">
                    <tbody>
                        <tr>
                            <td class="titles" >구매내역</td>
                            <td style="cursor: pointer; text-decoration: underline;">바로가기</td>
                        </tr>
                        <tr>
                            <td class="titles" >문의내역</td>
                            <td style="cursor: pointer; text-decoration: underline;">바로가기</td>
                        </tr>
                        <tr>
                            <td class="titles" >리뷰내역</td>
                            <td style="cursor: pointer; text-decoration: underline;">바로가기</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <hr>
        <div id="empty"></div>
        
    </div>
<%-- 인덱스 끝 --%>

<jsp:include page="../footer.jsp" />