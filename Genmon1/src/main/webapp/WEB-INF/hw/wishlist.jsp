<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% String ctxPath = request.getContextPath(); %>
    
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myinfo_mainMenu.jsp" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

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
        width: 250px; 
        height: 30px;
        font-size: 9pt;
        margin-bottom: 5px;
    }

    div#productDesc {
        font-size: 10pt;
    }

    img.product_img {
        width: 250px;
        height: auto;
        margin-bottom: 10px;
    }

   .wish_container {
    	/* border: solid 1px green; */
    	width: 1400px;
    	margin: 0 auto;
    	
    }

    div.card_body {
        /* border: solid 1px pink; */
        margin: 20px 200px 20px 200px;
    }


    /* 추가 */

</style>
<script>

	$(document).ready(function(){ // ==========================================================
		
		
		
	}); // end of $(document).ready() =========================================================
	

</script>
    <!-- 인덱스 시작 -->
 
    <!-- 위시리스트 목록 -->


    <div id="wishlist">
        <div id="wishText">위시리스트(0)</div>
    </div>
	<div class="album">
		<div class="box">
			<div class="wish_container row row-cols-sm-1 row-cols-md-4">
				<div class="col">
					<div class="card_body mx-1 my-3">
						<img src="../images/le_iv1_1.jpg" class="product_img">
						<div id="productDesc">
							<p class="productName">르1</p>
							<p class="productPrice">280,000원</p>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-dark">장바구니에 추가</button>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-light">삭제</button>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card_body mx-1 my-3">
						<img src="../images/le_iv1_1.jpg" class="product_img">
						<div id="productDesc">
							<p class="productName">르1</p>
							<p class="productPrice">280,000원</p>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-dark">장바구니에 추가</button>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-light">삭제</button>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card_body mx-1 my-3">
						<img src="../images/le_iv1_1.jpg" class="product_img">
						<div id="productDesc">
							<p class="productName">르1</p>
							<p class="productPrice">280,000원</p>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-dark">장바구니에 추가</button>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-light">삭제</button>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card_body mx-1 my-3">
						<img src="../images/le_iv1_1.jpg" class="product_img">
						<div id="productDesc">
							<p class="productName">르1</p>
							<p class="productPrice">280,000원</p>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-dark">장바구니에 추가</button>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-light">삭제</button>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card_body mx-1 my-3">
						<img src="../images/le_iv1_1.jpg" class="product_img">
						<div id="productDesc">
							<p class="productName">르1</p>
							<p class="productPrice">280,000원</p>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-dark">장바구니에 추가</button>
						</div>
						<div>
							<button type="button" class="btnWish btn btn-light">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 50px;"></div>
<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />