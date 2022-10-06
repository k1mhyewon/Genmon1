<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>



<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>
<!-- swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>

 .sidebar {
 margin-left: 5%;
 margin-bottom: 22px;
   display: inline-block;
  z-index: 1;
  top: 0;
  left: 0;
  /* padding-top: 79px; */
  width: auto;
  padding: 0 24px 0 0;
  
}
/* Style sidebar links */
.sidebar a {
  text-decoration: none;
  font-size: 15px;
  color: #1c1c1c;
  display: inline-block;
  width:auto;
  float: left;
  margin: 0 30px 20px 0;
}
.sidebar a:hover {
	cursor: pointer;
}

div.body{
    margin: 40px 0;
}

li.menu {
    display: list-item;
	list-style: none;
}

.container-wrap {
	padding-top: 5%;
	margin-bottom: 200px;
    flex-direction: row;
    justify-content: space-between;
    width: 100%;
    color: #343434;
    border: 0;
    background: transparent;
    max-width: 5000px;
    margin: auto;
}
.pagelink{
	display: flex;
    flex-direction: row;
   	border: none;
   	
}
.box_sidebar .menu-nav .menu-nav-item a {
    margin-bottom: 22px;
}
a.nav-link2{
	text-align: left;
}

/* 메뉴바링크시밑줄 */
a.link{
	text-decoration: underline;
}
menu-nav{
	text-align: left;
}
h2.nav_title{
	font-size: 15pt; font-weight:550;line-height: 3.2;display: inline-block;
}
.container-wrap {
    
}

/* 작아질때 */
 @media screen and (max-width: 767px) { .menu-nav-items {display: none;} .container-wrap {display: block; width: 100%;margin: 0 auto;}.box_sidebar .menu-nav .nav_title {margin-bottom: 7px;}}
 
/* 커질때 */
  /* @media screen and (max-width: 1440px){.container-wrap {width: 80%;margin: auto}} */ 
 @media screen and (min-width: 767px) { .menu-nav-items-mb {display: none;} .container-wrap {display: flex;}}
 
</style>
<!-- swiper jquery -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Optional JavaScript -->
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<%-- 사이드바 --%>
<div class="row container-wrap">
     <div class="sidebar col-md-3" >
     <div class=" menu-nav">
     	<div>
			<h2 class="nav_title mb-3" >고객 서비스</h2> 
     	</div>
     	<div class="pagelink">
		<ul class="menu-nav-items nav flex-column" >
			<li class="menu-nav-item menu nav-item">
				<a id="contact" class="nav-link2 link" href="<%=ctxPath %>/customerCare/contact.sun">문의</a>
			</li>
			<li class="menu-nav-item menu nav-item">
				<a id="shipping"  class="nav-link2" href="<%=ctxPath %>/customerCare/contact/shipping.sun">배송</a>
			</li>
			<li class="menu-nav-item menu nav-item">
				<a id="return" class="nav-link2" href="<%=ctxPath %>/customerCare/contact/return.sun">교환 및 반품</a>
			</li>
			<li class="menu-nav-item menu nav-item">
				<a id="orderCancel" class="nav-link2 active" href="<%=ctxPath %>/customerCare/contact/ordercancel.sun">주문취소</a>
			</li>
			<li class="menu-nav-item menu nav-item">
				<a id="order" class="nav-link2" href="<%=ctxPath %>/customerCare/contact/order.sun">주문조회</a>
			</li>
			<li class="menu-nav-item menu nav-item">
				<a id="productcare" class="nav-link2" href="<%=ctxPath %>/customerCare/contact/productcare.sun">제품 사용 가이드</a>
			</li>
			<li class="menu-nav-item menu nav-item">
				<a id="pickcard" class="nav-link2" href="#">시리얼 넘버 조회</a>
			</li>
		</ul>

		</div>
		
</div>
	</div>
	
	