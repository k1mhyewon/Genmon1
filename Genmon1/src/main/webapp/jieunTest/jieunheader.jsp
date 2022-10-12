<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>GENTLE MONSTER Official Site</title>
<!-- <link rel="icon" type="image/x-icon" href="/images/favicon.ico"> -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

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
top: 50%;
right: 20px;
width: 5px;
height: 5px;
font-size: 0;
cursor: pointer;
margin-top: -0.5px;
}
.notice-popup .btn-popup-close::before, .notice-popup .btn-popup-close::after {
content: '';
display: block;
width: 19px;
height: 1px;
background: #000;
transform: rotate(45deg);
position: absolute;
top: 0;
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
    }

    nav.navbar{
        height: 73px;
        background-color: white;
    }
    
/* 광고창끝 */




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
        color: black;
        font-size: 10.5pt;
        font-weight: bold;
        padding-right: 10px;
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
	a.nav-link{
		margin: 0 auto;
		width: 100%;
	}
	
	.divider {
    border-bottom: #e0e0e0 1px solid;
    width: 180%;
}
	
</style>
<!-- swiper jquery -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Optional JavaScript -->
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
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
        
    });

</script>

</head>
<body>
	<section class="">
		<div class="wrap">
	<%-- 광고창 시작 --%>
   <div class="toast fade swiper mySwiper notice-popup" data-autohide="false" role="alert" aria-live="assertive" aria-atomic="true">
	      <div class="notice swiper-wrapper">
	        <div class=" swiper-slide" style="font-size: 11pt; " >추석 연휴 택배 운영 안내</div>
	        <div class=" swiper-slide" style="font-size: 11pt; ">폭우 관련 배송 지연 안내</div>
	        <div class=" swiper-slide" style="font-size: 11pt; ">젠틀 몬스터 서버 & 호스팅 이전 공지</div>
	        <div class=" swiper-slide" style="font-size: 11pt; ">젠틀몬스터의 선물 서비스를 만나보세요.</div>
	      </div>
      <!-- <div class="swiper-button-next" style="right:10px;"></div>
      <div class="swiper-button-prev" style="right:10px;"></div> -->
      <!-- <i class="fa fa-arrow-left"></i>
      <i class="fa fa-arrow-right right"></i> -->
      <div class="notice-slide__nav notice-slide__nav--next jsNoticeNext" tabindex="0" role="button" aria-label="Next slide"></div>
      <div class="notice-slide__nav notice-slide__nav--prev jsNoticePrev" tabindex="0" role="button" aria-label="Previous slide"></div>
		<!-- <div class="close" style="width: 10px;height:10px;"> -->
		<button type="button" class="close" data-dismiss="toast" aria-label="Close" >
 	      <span class="btn closebtn btn-popup-close" aria-hidden="true"치>::before
						   "close"
						  ::after
			</span>
	    </button>
	    
    </div>
    <%-- 광고창 끝 --%>
    
		</div>
		<nav class="navbar navbar-expand-lg  ftco_navbar ftco-navbar-light" id="ftco-navbar">
			<div class="container">
				<a  href="#"><img src="Gentle_monster_logo.png" style="width: 20%; max-width: 200px; min-width: 175px;"/></a>
					<form action="#" class="searchform order-sm-start order-lg-last" >
						<div class="form-group d-flex" style="padding-top:11px; padding-left: 0px;">
							
					<!-- Modal 검색 버튼 -->
			            <button id="search" type="button" class="form-control search" data-toggle="modal" data-target="#search_modal" style="border: 0px;"><span class="fa fa-search"></span></button>
			        <!-- Modal 검색 버튼 끝 -->  
			
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
			                               <img src="le_iv1_1.jpg" style="width:70px; height:70px; border-radius: 50%;">
			                            </a>
			                            <div style="margin-top: 10px;">베스트셀러</div>
			                        </div>
			                        <div class="collections">
			                           <a href="#">
			                               <img src="le_01.jpg" style="width:70px; height:70px; border-radius: 50%;">
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
        
        
        
							<button type="submit" class="form-control login" style="border: 0px;"><span style="font-size: 7pt;  margin: 0 -100px">로그인</span></button>
							<button type="submit" placeholder="" class="form-control cart" style="border: 0px;"><span class="fa fa-shopping-cart"></span></button>
						</div>
					</form>
					<button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			          <span class="navbar-toggler-icon"><i class="fa fa-bars"></i></span>
			        </button>
					<div class="collapse navbar-collapse" id="ftco-nav">
						<ul class="navbar-nav m-auto">
							<li class="nav-item active"><a href="#" class="nav-link">브랜드</a></li>
							<li class="nav-item"><a href="#" class="nav-link">선글라스</a></li>
							<li class="nav-item"><a href="#" class="nav-link">스타일</a></li>
							<li class="nav-item"><a href="#" class="nav-link">고객서비스</a></li>
<!--<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Page</a>
 <div class="dropdown-menu" aria-labelledby="dropdown04">
<a class="dropdown-item" href="#">Page 1</a>
<a class="dropdown-item" href="#">Page 2</a>
<a class="dropdown-item" href="#">Page 3</a>
<a class="dropdown-item" href="#">Page 4</a>
</div> 
</li>-->
						</ul>
					</div>
				</div>
			</nav>
    <div class="divider "></div>
	</section>	
    <%-- 상단바 끝 --%>