<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String ctxPath = request.getContextPath();
    //    /Genmon1
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>GENTLE MONSTER Official Site</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>
<style>

    /* 폰트 적용(헬베티카) */
    @import url(//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica);
    #logo, #footer_logo {font-family: "Helvetica"; src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot"); src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff") format("woff"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.svg#Helvetica") format("svg"); }
    
    div.toast { 
        max-width: 100%; 
        text-align: center;
    }

    nav.navbar{
        height: 73px;
        background-color: white;
    }

    #logo{
        font-size: 19pt;
        font-weight: bold;
        color: black;
    }

    /* 반응형 */
    @media (max-width: 768px) {
        nav.navbar { height: 60px; }
        #logo{font-size: 14pt;}
    }

    a.nav-link{
        color: black;
        font-size: 9pt;
        font-weight: bold;
        margin: auto 11px;
    }

    a.nav-link:hover{
        color: rgb(63, 63, 63);
    }

    footer{
        background-color: rgb(243, 243, 243);
    }

    .small_font{
        font-size: 9pt;
    }

    span.span_click:hover{
        color: rgb(117, 117, 117);
        cursor: pointer;
    }
    
    /* 모달 */
    
    #search {
        border: solid 1px pink;
        font-size: 10pt;
    }

    .modal-dialog.modal-fullsize {
    width: 100%;
    max-width:100%;
    height: 40%;
    margin-top: 44px;
    padding: 0;
    }

    .modal-content.modal-fullsize {
    height: auto;
    min-height: 100%;
    border-radius: 0;
    }

    #search_input {
        width: 40%;
        height: 30px;
        margin-left: 30%;
        font-size: 10pt;
        border-radius: 15px 15px 15px 15px;
        padding-left: 20px;
    }

    .navbar-popular {
        font-weight: bold;
        font-size: 10pt;
        list-style: none;
        padding-left: 0;
    }

    .popular-link {
        color: black;
    }
    .popular-link:hover {
        text-decoration: none;
        color:gray;
    }

    #popular_title {
        margin-bottom: 20px;
        color: gray;
    }

    #popular_box {
        /* border: solid 1px pink; */
        width: 10%;
        margin: 35px 0 0 30%;
        float: left;
    }

    #collection_box {
        /* border: solid 1px gray; */
        float: left;
        width: 30%;
        margin-top: 35px;
        font-size: 10pt;
        color: gray;
        font-weight: bold;
    }

    .collections {
        /* border: solid 1px pink; */
        float: left;
        width: 100px;
        height: 100px;
        font-size: 9pt;
        color: black;
        margin-top: 20px;
    }
    
    /* 모달 */

</style>

<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript" ></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript" ></script>
<script>



    $(document).ready(function(){

        // toast(광고창)
        $('.toast.fade').toast('show');
        
        $('#liveToastBtn').click(function(){
            $('.toast.hide').toast('show');
        });

        // 하단 토글
        $("div.hid").hide();
        $("span.span_click").click(function(){
            if($(this).text()=="법적고지+"){
                $("div#toggle_list").toggle();
            } else if($(this).text()=="소셜미디어+"){
                $("div#toggle_list2").toggle();
            }
        });
        
        // 홈화면 헤더에서 로그인 버튼을 누르면
        $("button#btn_login").click(function(){
        	location.href="<%= ctxPath%>/login.sun";
			
		}); // end of $("button#btn_login").click() --------------
		
		
		// 홈화면 헤더에서 로그아웃 버튼을 누르면
        $("button#btn_logout").click(function(){
        	location.href="<%= ctxPath%>/logout.sun";
			
		}); // end of $("button#btn_logout").click() --------------
        
    });
    
    


</script>

</head>
<body>
	
	<%-- 광고창 시작 --%>
    <div>
		<div class="toast fade" data-autohide="false" role="alert" aria-live="assertive" aria-atomic="true">
		  <div class="toast-header">
		    <div class="mx-auto" style="padding: 6px 0;"><span style="font-size: 9pt; font-weight: bold;">광고 할라는데 캐러셀 넣을 수 있나? 암튼 더 해봐야 할듯</span></div>
		    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
		      <span aria-hidden="true">&times;</span>
		    </button>
		  </div>
		</div>
    </div>
    <%-- 광고창 끝 --%>
    


    <%-- 상단바 시작 --%>
    <nav class="navbar navbar-expand-md" >
        <a class="navbar-brand" href="#"><span id="logo">GENTLE MONSTER</span></a>
        <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
          <span class="navbar-toggler-icon"><i class="fab fa-windows fa-lg"></i></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
          <ul class="navbar-nav" style="margin: auto 2% auto 25%;">
            <li class="nav-item">
              <a class="nav-link" href="#">브랜드</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">선글라스</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">스타일</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">고객서비스</a>
              </li>     
          </ul>
        </div>  
        
        
        <!-- Modal 버튼 -->
        <button id="search" type="button" class="btn btn-light" data-toggle="modal" data-target="#search_modal"> 
            검색
        </button>
        <!-- Modal 버튼 끝 -->  

          <!-- Modal -->
          <!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
          <div class="modal fade" id="search_modal">
            <div class="modal-dialog modal-fullsize">
            <!-- .modal-dialog 클래스를 사용하여 <div> 요소에 크기 클래스를 추가합니다. -->
              <div class="modal-content modal-fullsize">
                
                <!-- Modal header -->
                
                <!-- Modal body -->
                
                <div class="modal-body">
                    <input type="text" id="search_input" name="search_input" placeholder="검색어를 입력하세요."  />
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <div id="popular_box">
                    <ul class="navbar-popular" >
                        <div id="popular_title">인기검색어</div>
                        <li>
                          <a class="popular-link" href="#">릴리트 01</a>
                        </li>
                        <li>
                          <a class="popular-link" href="#">로지 01</a>
                        </li>
                        <li>
                          <a class="popular-link" href="#">르 01</a>
                        </li>
                        <li>
                            <a class="popular-link" href="#">로셀 01</a>
                        </li> 
                      </ul>
                  </div>
                  <div id="collection_box">
                    <div>다양한 컬렉션을 만나보세요</div>
                    <div>
                        <div class="collections">
                            <a href="#">
                            	<!-- <img src="le_iv1_1.jpg" style="width:70px; height:70px; border-radius: 50%;"> -->
                            </a>
                            <div style="margin-top: 10px;">베스트셀러</div>
                        </div>
                        <div class="collections">
                        	<a href="#">
                            	<!-- <img src="le_01.jpg" style="width:70px; height:70px; border-radius: 50%;"> -->
                            </a>
                            <div style="margin-top: 10px;">캣아이프레임</div>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                  </div>
                  <div style="clear:both;"></div>
                </div>
                
              </div>
            </div>
          </div>
        <!-- Modal 끝 -->
        
        <c:if test="${ empty sessionScope.loginuser }">
	        <button type="button" id="btn_login"> 
	            로그인
	        </button>
        </c:if>
        <c:if test="${ not empty sessionScope.loginuser }">
	        <button type="button" id="btn_logout" > 
	            로그아웃
	        </button>
        </c:if>
    </nav>
    <%-- 상단바 끝 --%>