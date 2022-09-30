<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<% String ctxPath = request.getContextPath(); %>
    
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myinfo_mainMenu.jsp" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">

<style>

/* 추가 */
	* {font-family: 'Noto Sans KR', sans-serif; !important}

    div#myPageNav{
        
        /* border: solid 1px gray; */
        padding-top: 100px;
        padding-bottom: 100px;
    }


    div#wishText{
        /* border: solid 1px green; */
        padding: 6% 0 3% 10%;
        font-size: 14pt;
        font-weight: bold;
    }
    
    #checkbox_choice {
     	/* border: solid 1px gray; */
     	padding: 0 20% 3% 0;
    	text-align: right;
        margin: auto;
    }

    button.btnWish{
        width: 250px; 
        height: 30px;
        font-size: 9pt;
        margin-bottom: 5px;
    }

    div#productDesc {
        font-size: 10pt;
        display: inline-block;
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
    
    .btn_chkbox{
    	font-size: 10pt;
    	width: 120px; 
        height: 30px;
    }
    
    
    
    .cntbox {
    	/* border: solid 1px gray; */
    	width: 120px; 
        height: 40px;
        margin-left: 60px;
        margin-bottom: 10px;
        display: inline-block;
    }


    /* 추가 */

</style>
<script>

	$(document).ready(function(){ // ==========================================================
		
		
		
	}); // end of $(document).ready() =========================================================
	
		
	// #### Function Declaration #### //
	<%--
	function showWishlist(){ // ------------------------
		
		$.ajax({
			url:"<%= request.getContextPath()%>/member/wishlist.sun",
			type: "GET",
			dataType:"JSON",
		    success:function(json) {
		    	
		    	console.log(json);
		    	
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
			
		});
	
	} // end of function showWishlist() ----------------
	--%>
	
	

</script>
    <!-- 인덱스 시작 -->
 
    <!-- 위시리스트 목록 -->


    <div id="wishText">장바구니(0)</div>
    <div id="checkbox_choice">
        <button type="button" class="btn btn-light btn_chkbox">전체선택/해제</button>
        <button type="button" class="btn btn-dark btn_chkbox">선택삭제</button>
    </div>
	<div class="album">
		<div class="box">
			<div class="wish_container row row-cols-sm-1 row-cols-md-4">
			
				<c:forEach var="wishvo" items="${requestScope.wishList}">
					<div class="col">
						<input type="checkbox" class="chk_wishprod" />
						<div class="card_body mx-1 my-3">
							<img src="../images/${wishvo.pimage1}" class="product_img">
							<div id="productDesc">
								<p class="productName" style="font-weight: bold;">${wishvo.pname}</p>
								<p class="productPrice"><fmt:formatNumber value="${wishvo.price}" pattern="#,###" /> 원</p>
							</div>
							<div class="cntbox">
								<select style="height: 30px;" name="month" id="month" title="월" class="custom-select" ></select>
							</div>
							<button type="button" class="btnWish btn btn-dark">장바구니에 추가</button>
							<button type="button" class="btnWish btn btn-light">삭제</button>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
	<div style="height: 50px;"></div>
<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />