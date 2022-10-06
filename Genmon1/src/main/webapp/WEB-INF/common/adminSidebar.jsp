<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 사이드바</title>

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">

<link rel="stylesheet" href="<%= ctxPath%>/fonts/icomoon/style.css">

<link rel="stylesheet" href="<%= ctxPath%>/css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
<!-- Style -->
<link rel="stylesheet" href="<%= ctxPath%>/css/style.css">

<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function() {

	  $('.js-menu-toggle').click(function(e) {

	  	const $this = $(this);

	  	if ( $('body').hasClass('show-sidebar') ) {
	  		$('body').removeClass('show-sidebar');
	  		$this.removeClass('active');
	  		
	  	} else {
	  		$('body').addClass('show-sidebar');	
	  		$this.addClass('active');
	  	}

	  	e.preventDefault();

	  });

	  // click outisde offcanvas
		$(document).mouseup(function(e) {
	    var container = $(".sidebar");
	    if (!container.is(e.target) && container.has(e.target).length === 0) {
	      if ( $('body').hasClass('show-sidebar') ) {
					$('body').removeClass('show-sidebar');
					$('body').find('.js-menu-toggle').removeClass('active');
				}
	    }
		}); 
	
	   $("div.nav-menu>li").removeClass('active');
	   
	$('div.nav-menu > ul >li').click(function() {
		const $this = $(this);
		$this.addClass('active');
		$this.siblings().removeClass('active');
		
	});
});

</script>
</head>
 <body>
  
    <aside class="sidebar">
      <div class="side-inner">
      
      <div class="toggle">
        <a href="#" class="burger js-menu-toggle" data-toggle="collapse" data-target="#main-navbar">
               <span></span>
            </a>
      </div>

          
        <div class="search-form">
          <!-- <form action="#">
            <span class="wrap-icon">
              <span class="icon-search2"></span>
            </span>
            <input type="text" class="form-control" >
          </form> -->
        </div> 
        
        
        <div class="nav-menu">
          <ul>
            <li class="home"><a href="<%= ctxPath%>/" class="d-flex align-items-center"><span class="wrap-icon icon-home2 mr-3" style="color: #414141;"></span><span class="menu-text" style="color: #414141;">홈</span></a></li>
            <li class="member"><a href="#" class="d-flex align-items-center"><span class="wrap-icon icon-person mr-3"></span><span class="menu-text">회원관리</span></a></li>
            <li class="product"><a href="<%= ctxPath%>/admin/adminProduct.sun" class="d-flex align-items-center"><span class="wrap-icon icon-shopping_cart mr-3"></span><span class="menu-text">상품관리</span></a></li>
            <li class="order"><a href="#" class="d-flex align-items-center" ><span class="wrap-icon icon-envelope-open mr-3" style="font-size:12pt;"></span><span class="menu-text">주문관리</span></a></li>
            <li class="contact"><a href="<%= ctxPath%>/admin/adminContact.sun" class="d-flex align-items-center"><span class="wrap-icon icon-question_answer mr-3"></span><span class="menu-text">문의관리</span></a></li>
            <li class="review"><a href="#" class="d-flex align-items-center"><span class="wrap-icon icon-pencil mr-3"></span><span class="menu-text">리뷰관리</span></a></li>
            <li class="chart"><a href="#" class="d-flex align-items-center"><span class="wrap-icon icon-pie-chart mr-3"></span><span class="menu-text">판매현황</span></a></li>
          </ul>
        </div>
      </div>
      
    </aside>
    <main>
      <div class="site-section">
      
      </div>  
    </main>
    
    

    <script src="<%= ctxPath%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%= ctxPath%>/js/popper.min.js"></script>
    <script src="<%= ctxPath%>/js/bootstrap.min.js"></script>
  </body>
</html>