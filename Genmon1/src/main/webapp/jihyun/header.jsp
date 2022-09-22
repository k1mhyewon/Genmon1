<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>GENTLE MONSTER Officail Site</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>
<style>

    /* 폰트 적용(헬베티카) */
    @import url(//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica);
    #logo, #footer_logo {font-family: "Helvetica" !important; src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot"); src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff") format("woff"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.svg#Helvetica") format("svg"); }
    
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
        font-size: 10pt;
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

</style>

<!-- Optional JavaScript -->
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
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
        
    </nav>
    <%-- 상단바 끝 --%>