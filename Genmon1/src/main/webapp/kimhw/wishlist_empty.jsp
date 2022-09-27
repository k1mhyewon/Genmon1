<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />
<style>

/* 추가 */
	* {font-family: 'Noto Sans KR', sans-serif; !important}

    div#myPageNav{
        
        /* border: solid 1px gray; */
        padding-top: 100px;
        padding-bottom: 100px;
    }

    div#wishlist{
        /* border: solid 1px gray; */
        width: 100%;
        margin: auto;
    }

    div#wishText{
        /* border: solid 1px green; */
        padding: 6% 0 3% 10%;
        font-size: 14pt;
        font-weight: bold;
    }

    button.btnWish{
        width: 220px; 
        height: 30px;
        font-size: 9pt;
        margin-bottom: 5px;
    }

    div#productDesc {
        font-size: 10pt;
    }

    img.product_img {
        width: 220px;
        height: auto;
        margin-bottom: 10px;
    }

   

    div.card_body {
        /* border: solid 1px pink; */
        margin: 20px 200px 20px 200px;
    }

	b.nav-link{
        /* 추가 */
        color: black;
        font-size: 15pt;
        font-weight: bold;
        margin-left: 130px;
    }
    
    #empty_wishlist {
    	/* border: solid 1px pink; */
    	width: 70%;
    	height: 300px;
    	padding-top: 100px;
    	margin: auto;
    }
    
    #go_shopping {
		font-size: 10pt;
		margin: 50px 0 0 10px;
		width: 200px
	}

    /* 추가 */

</style>
    <!-- 인덱스 시작 -->
    <div>
        <nav class="navbar navbar-expand-md" >
            <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
              <span class="navbar-toggler-icon"><i class="fab fa-windows fa-lg"></i></span>
            </button>
            <div class="collapse navbar-collapse" id="myPageNav">
              <ul class="navbar-nav" style="margin: 0 auto;">
                <li class="nav-item">
                  <b class="nav-link" href="#">회원정보</b>
                </li>
                <li class="nav-item">
                  <b class="nav-link" href="#">주문/배송</b>
                </li>
                <li class="nav-item">
                  <b class="nav-link" href="#">위시리스트</b>
                </li>
                <li class="nav-item">
                    <b class="nav-link" href="#">상품문의</b>
                </li>     
              </ul>
            </div>  
            
        </nav>
    </div>
    
    <!-- 위시리스트 목록 -->


	<div id="wishlist">
		<div id="wishText">위시리스트(0)</div>
	</div>
	
	<div id="empty_wishlist">
		<div>위시리스트에 담긴 상품이 없습니다.</div>
		<button type="button" class="btn btn-dark" id="go_shopping">쇼핑하러가기</button>
	</div>
 
 
 
	<div style="height: 50px;"></div>
<%-- 인덱스 끝 --%>

<jsp:include page="footer.jsp" />