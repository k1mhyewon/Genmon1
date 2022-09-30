<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>GENTLE MONSTER Official Site</title>
<!-- <link rel="icon" type="image/x-icon" href="/images/favicon.ico"> -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>

<!-- swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>

    /* 폰트 적용(헬베티카) */
    @import url(//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica);
    #logo, #footer_logo {font-family: "Helvetica"; src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot"); src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff") format("woff"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.svg#Helvetica") format("svg"); }
    
    	
	/* 광고창시작 */
	.notice-slide__nav--prev {
    left: 200px;
    border-width: 0px 0px 1px 1px;
    -webkit-transform: rotate(135deg);
    -ms-transform: rotate(135deg);
    transform: rotate(135deg);
	}
		
	.notice-slide__nav--next {
    right: 200px;
    -webkit-transform: rotate(-45deg);
    -ms-transform: rotate(-45deg);
    transform: rotate(-45deg);
	}
	.notice-slide__nav {
    display: block;
    width: 0;
    height: 0;
    border: solid #000;
    border-width: 0px 1px 1px 0;
    padding: 5px;
    position: absolute;
    top: 50%;
    margin-top: -6px;
    cursor: pointer;
    z-index: 3;
	}


	
	.notice-popup .btn-popup-close {
	display: block;
	position: absolute;
	top: 35%;
	right: 20px;
	width: 5px;
	height: 5px;
	font-size: 0;
	cursor: pointer;
	margin-top: -0.5px;
	padding:10px;
	}
	.notice-popup .btn-popup-close::before, .notice-popup .btn-popup-close::after {
	content: '';
	display: block;
	width: 19px;
	height: 1px;
	background: #000;
	transform: rotate(45deg);
	position: absolute;
	top: 7px;
	right: 0;
	}
	.notice-popup .btn-popup-close::after {
	transform: rotate(-45deg);
	}
	
	span.closebtn {
		width: 30px;
		height: 30px;
	}
	span.closebtn:hover, .btn-popup-close::before:hover, .btn-popup-close::after:hover,  {
		cursor: pointer;
	}
	div.notice{
		padding: 15px 0;
	}
    div.toast { 
        max-width: 100%; 
        text-align: center;
        width:100%
    }

    nav.navbar{
        height: 73px;
        background-color: white;
    }
    .toast:not(:last-child) {
     	margin-bottom: 0;
	}
	/* 광고창끝 */


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
    	
    	
    @media (min-width: 992px){
	.navbar-expand-lg .navbar-nav .nav-link {
	    padding-right: 2rem;
	    padding-left: 2rem;
	}}
    #logo{
        font-size: 19pt;
        font-weight: bold;
        color: black;
        background-color: white;
    }
    /* 반응형 */
    @media (max-width: 767px) {
        nav.navbar { height: 60px; }
        #logo{font-size: 14pt;}
    }

    a.nav-link{
        color: gray;
        font-size: 12pt;
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
	.nav-item{
		text-align: center;
	}
	
	.divider {
	    border-bottom: #e0e0e0 1px solid;
	    width: 100%;
	}
	
	.form-control{
		padding: 0;
		padding-right: 10px;
	}
	
	.form-control:focus {
	    box-shadow: none;
	    transition: all .1s linear;
	    border-color: none;
	    box-shadow: none;
	}
	.link-secondary {
    	color: #656566;
	}
	.navbar-light .navbar-nav .nav-link {
    	color: #393939;
	}
	.navbar-light .navbar-nav .nav-link:hover {
		opacity:0.8;
	}
	
    	
  	.link-danger, .link-dark, .link-info, .link-light, .link-primary, .link-secondary, .link-success, .link-warning {
    	transition: color .15s;
	}
	    .me-3 {
	    margin-right: 1rem!important;
	}
	@media (min-width: 992px)
	.navbar-expand-lg .navbar-collapse {
	    display: flex!important;
	    flex-basis: auto;
	}
	.navbar-collapse {
	    flex-basis: 100%;
	    flex-grow: 1;
	    align-items: center;
	}
	.navbar-brand {
	    display: flex;
	    align-items: center;
	}
	@media (min-width: 992px)
	.mt-lg-0 {
	    margin-top: 0!important;
	}
	.navbar-brand {
	    padding-top: 0.3rem;
	    padding-bottom: 0.3rem;
	    margin-right: 1rem;
	    font-size: 1.25rem;
	    text-decoration: none;
	    white-space: nowrap;
	}
	@media (min-width: 992px)
	.navbar-expand-lg .navbar-nav {
	    flex-direction: row;
	}
	.navbar-nav {
	    display: -ms-flexbox;
	    display: flex;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    padding-left: 0;
	    margin-bottom: 0;
	    list-style: none;
    }
    .nav-item {
	    text-align: center;
	}
	#search {
	    font-size: 10pt;
	}
	.form-control {
	    padding: 0;
	    padding-right: 10px;
	}
	.form-control {
	    min-height: auto;
	    padding-top: 4px;
	    padding-bottom: 3.28px;
	    transition: all .1s linear;
	    display: block;
	    width: 100%;
	    padding: 0.375rem 0.75rem;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.6;
	    color: #4f4f4f;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #bdbdbd; 
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    appearance: none;
	    border-radius: 0.25rem;
	    transition: all .2s linear;
	}
	.badge-notification {
	    position: absolute;
	    font-size: .6rem;
		margin-top: -0.2rem;
	    margin-left: -0.2rem;
	    padding: 0.2em 0.45em;
	}
	.rounded-pill {
	    border-radius: 50rem!important;
	}
	.bg-danger {
	    --mdb-bg-opacity: 1;
	    background-color: red;
	}
	.badge {
		color:white;
	}
	div.d-flex > button>span:hover, div.d-flex > a >i:hover, div.d-flex > button:hover{
		opacity:0.7;
		color: #656566;
	}
	
	.link_tag{
		font-size: 10pt;
		color: black;
		text-decoration: underline;
	}
	
	.link_tag:hover{
		cursor: pointer;
	}

</style>
<!-- swiper jquery -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script>

    $(document).ready(function(){

    	/* 광고창시작 */
    	var swiper = new Swiper(".mySwiper", {
    	        navigation: {
    	          nextEl: ".jsNoticeNext",
    	          prevEl: ".jsNoticePrev",
    	        },
    	        autoplay: {
    	            delay: 3000
    	          },
	    	        speed : 3000,
	    	        loop: true
    	 });

    	$("span.closebtn").click(function() {
			$("div.toast").hide();
		});
        
    	// toast(광고창)
        $('.toast.fade').toast('show');
        
        $('#liveToastBtn').click(function(){
            $('.toast.hide').toast('show');
        });
        /* 광고창끝 */
        
        
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
		
		// 홈화면 헤더에서 마이페이지 버튼을 누르면
        $("button#btn_myPage").click(function(){
        	location.href="<%= ctxPath%>/myinfo/myinfoDetail.sun";
			
		}); // end of $("button#btn_logout").click() --------------
        
        
    });

</script>

</head>
<body>
	<section class="">
	<%-- 광고창 시작 --%>
      <div class="toast fade swiper mySwiper notice-popup" data-autohide="false" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="notice swiper-wrapper">
	        <div class=" swiper-slide" style="font-size: 11pt; " >추석 연휴 택배 운영 안내</div>
	        <div class=" swiper-slide" style="font-size: 11pt; ">폭우 관련 배송 지연 안내</div>
	        <div class=" swiper-slide" style="font-size: 11pt; ">젠틀 몬스터 서버 & 호스팅 이전 공지</div>
	        <div class=" swiper-slide" style="font-size: 11pt; ">젠틀몬스터의 선물 서비스를 만나보세요.</div>
	      </div>
      <div class="notice-slide__nav notice-slide__nav--next jsNoticeNext" tabindex="0" role="button" aria-label="Next slide"></div>
      <div class="notice-slide__nav notice-slide__nav--prev jsNoticePrev" tabindex="0" role="button" aria-label="Previous slide"></div>
	    <button type="button" class="close" data-dismiss="toast" aria-label="Close" >
 	      <span class="btn closebtn btn-popup-close" aria-hidden="true">
			</span>
	    </button>
    </div>
    <%-- 광고창 끝 --%>
	</section>	
	
	
	 <%-- 상단바 시작 --%>
    <nav class="navbar navbar-expand-md border-bottom" >
        <a class="navbar-brand" href="<%= ctxPath%>/index.sun"><img src="<%= ctxPath%>/images/Gentle_monster_logo.png" style="max-width: 200px; min-width: 175px; height:15px;"/></a>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
          <span style="font-weight: bold; font-size: 11pt;">결제</span>
          <ul class="navbar-nav" style="margin: auto 0 auto 30%;">
            <li class="nav-item">
              <a class="nav-link" id="1_login" style="color: gray;">①로그인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="2_add" style="color: gray;">②배송주소</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="3_pay" style="color: gray;">③결제방법</a>
            </li>
          </ul>
          <a class="link_tag ml-5" href="#">쇼핑계속하기</a>
        </div>  
        
    </nav>
    <%-- 상단바 끝 --%>