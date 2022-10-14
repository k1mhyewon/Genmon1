<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% String ctxPath=request.getContextPath();%>    
<jsp:include page="../common/header.jsp" />

<%-- <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/css/productDetail.css"> --%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<!-- minji 아코디언 Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


<style>

	.whole-box { 
	/* 	border: solid 1px green; */
		position: static;
		width: 97%;
		margin-left: 2%;
	}
	
	.item-info-box {
	/* 	border: solid 1px blue; */
		position: relative;
		float: left;
		/* padding: 3% 0 0 0; */
		left: -1%;
		margin-top: 10%;
	}
	
	.item-info-cotent-box {
		clear:both;
		width: 100%;
		margin-bottom: 5%;
	}
	.item-info-cotent {
		width: 100%;
	}
	
	.item-name {
		box-sizing: border-box;
		float: left;
		font-size: 15pt;
		font-weight: bold;
		margin-right: 5%; 
		
	}
	
	.item-price {
		width: 50%;
		box-sizing: border-box;
		float: right;
		padding: 0;
	}
	
/* 	.item-info-color-box {
		 padding: 10% 0% 10% 0%;
	}
	 */
	.item-info-color {
		margin: 0%;
		padding: 0%;
	}
	
	.color-list {
		position: relative;
		float: left;
	/* 	border: 1px gray solid; */
		list-style-type: none;
		padding: 0;
		margin: 2px 2px 10px 0px;
	}
	
	.color-img {
		display: inline-block;
	}
	
	.admin-review {
		text-align: center;
	}
	
	.item-info-description-box {
		width: 100%;
	/* 	border: 1px gray solid; */
	}
	
	.item-info-description {
		font-size: 11pt;
		letter-spacing: 10%;
		word-spacing: 5%;
	}
	
	.add-option-btn {
	/* 	border: solid 1px gray; */
		width: 85%;
	}
	
	a:link,
	a:visited,
	a:hover,
	a:active {
		/* 클릭 후에도 색상 변경 없도록 함  */
		color: inherit;
		text-decoration-line : none;
	}
	
	input, button{
		border:none;
	  /*border-radius:4px 가능 */
	}
	
	input:active, 
	input:focus  {
		color: rgba(0,0,0,0) ; 
		background-color: rgba(0,0,0,0) ; 
		box-shadow: none;
		color: inherit;
	}
	
	.button:active, 
	.button:focus {
		color: rgba(0,0,0,0) ; 
		background-color: rgba(0,0,0,0) ; 
		box-shadow: none;
		color: inherit;
	}
	
	.collapse-whole {
	/* 	border: solid 1px gray; */
		width: 100%;
	}
	
	.btn btn-outline-dark btn-block {
		border: none;
		text-align: left;
	}

	.accordion-whole {
		width: 85%;
	}
	
	.accordion-item {
		text-align: left;
	}
	
	.accordion:hover {
		text-decoration: none;
		list-style: none;
		 list-style: none!important;
   		 list-style-type: none!important;
	}
	
	.accordion-button collapsed {
		padding: 0%;
	}
	
	.accordion>.card .card-header { 
		background:none;  
		padding : 0; 
		display : block; 
		text-decoration : none ;  
	}
	
	.img-row-box {
	/* 	border: solid 1px red; */
		width: 67%;
	}

	.img-row {
		position: relative;
	}
	
	.sun-row {
		margin: 0% 5% 5% 0%;
		display: inline-block;
	/* 	border: solid 1px yellow; */
		margin: 0% 15% 5% 0%;
		width: 30%;
		height: 30%;
	}
	
	.sunglasses-image {
	/* 	border: solid 1px pink; */
		object-fit: fill;
		width: 140%; 
		overflow: hidden;
		object-fit: cover;
	}
	
	.related-box {
		margin-top: 5%;
		clear: left;
	} 
	
	.related-title {
		font-size: 14pt;
		margin-bottom: 5%;
		font-weight: bold;
	}
	
	.related-item {
		padding: 0;
		display: inline-block;
		
	}
	
	.related-item-list {
		margin-right: 1%;
	}
	
	.related-go {
		display: inline-block;
		list-style: none;
		margin-top: 5%;
		padding: 0;
		
	}
	
	.sun-title {
		font-size: 11pt;
		font-weight: bold;
	}
	
	.sun-price {
		font-size: 11pt;
	}
	
	.sun-color {
		margin-top: 5%;
		font-size: 10pt;
	}
	
	.color-count {
		color: rgba(181, 41, 41, 0.78);
	}
	
	/* footer-navbar 하단메뉴바 */
	    
    .footer-navbar {
    	 width: 20%;
    	 height: auto;
    	 background: #fff;
	     border-top: 1px solid #a1a1a1;
	     border-left: 1px solid #a1a1a1;
    }
  	
    .container-fluid {
   		clear:both;
 	    border: 1px black green;
    	margin-top: 1%;
    	text-align: center; 
    	padding: 0;
    }
    
    .footer-bar__btn {
    	float: right; 
    	cursor: pointer;
    	margin-top: 4%;
    	margin-bottom: 4%; 
    	margin-right: 15%; 
    	font-size: 11pt;
    	font-weight: bold;

	    }

	span.boldtxt{
		display: block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	span.puretxt{
		display: block;
		font-size: 10pt;
		margin-bottom: 6px;
	}
	
	input[type="number"] {
	  -webkit-appearance: textfield;
	  -moz-appearance: textfield;
	  appearance: textfield;
	}
	
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
	  -webkit-appearance: none;
	}
	
	.number-input {
	  border: 1px solid #ddd;
	  display: inline-flex;
	}
	
	.number-input,
	.number-input * {
	  box-sizing: border-box;
	}
	
	.number-input button {
		
	  padding-top:14px;
	  outline:none;
	  -webkit-appearance: none;
	  background-color: transparent;
	  border: none;
	  align-items: center;
	  justify-content: center;
	  width: 1rem;
	  height: 1rem;
	  cursor: pointer;
	  margin: 0;
	  position: relative;
	}
	
	.number-input button:before,
	.number-input button:after {
	  display: inline-block;
	  position: absolute;
	  content: '';
	  width: 0.6rem;
	  height: 2px;
	  background-color: gray;
	  transform: translate(-50%, -50%);
	}
	/*
	.number-input button:before{
		padding-left: 
	}*/
	.number-input button.plus:after {
	  transform: translate(-50%, -50%) rotate(90deg);
	}
	
	.number-input input[type=number] {
	  max-width: 3.5rem;
	  padding: .5rem;
	  border-top: solid #ddd;
	  border-bottom: solid #ddd;
	  border-width: 0 2px;
	  font-size: 0.9rem;
	  height: 1.8rem;
	  text-align: center;
	  color: gray;
	}
	
	#cart_added_comment {
		font-size: 9pt;
		color: red;
		margin: 5px 0 0 40px;
	}
	
	<%--
	.wishModalBtn {
		width: 300px;
		font-size: 10pt;
		display: block;
	}
	--%>
	
	#wishModalBody {
		padding-top: 40px;
		padding-bottom: 40px;
		padding-left: 100px;
		
	}



	.whole-box { 
	/* 	border: solid 1px green; */
		position: static;
		width: 97%;
		margin-left: 2%;
	}
	
	.item-info-box {
	/* 	border: solid 1px blue; */
		position: relative;
		float: right;
		/* padding: 3% 0 0 0; */
		left: -1%;
		margin-top: 10%;
	}
	
	.item-info-cotent-box {
		width: 100%;
		margin-bottom: 5%;
	}
	.item-info-cotent {
		width: 100%;
	}
	
	.item-name {
		width: 45%;
		box-sizing: border-box;
		float: left;
		font-size: 15pt;
		font-weight: bold;
		margin-right: 5%; 
		
	}
	
	.item-price {
		width: 50%;
		box-sizing: border-box;
		float: right;
		text-align: center;
		padding: 0;
	}
	
	.item-info-color-box {
		padding: 10% 0% 10% 0%;
		width: 110%;
	}
	
	.item-info-color {
		clear: right;
		width: 50%;
		margin: 0%;
		padding: 0%;
	}
	
	.color-list {
	/* 	border: 1px gray solid; */
		list-style-type: none;
		padding: 0;
		margin: 0% 2% 10% 0%;
	}
	
	.color-img {
		display: inline;
	}
	
	.admin-review {
		text-align: center;
	}
	
	.item-info-description-box {
		width: 100%;
	/* 	border: 1px gray solid; */
	}
	
	.item-info-description {
		font-size: 11pt;
		letter-spacing: 10%;
		word-spacing: 5%;
	}
	
	.add-option-btn {
	/* 	border: solid 1px gray; */
		width: 85%;
	}
	
	a:link, a:visited, a:hover, a:active { /* 안 먹는 것 같은데요?? */
	  	color: inherit;
	  	text-decoration: none;
	}
	
	input, button{
		border:none;
	  /*border-radius:4px 가능 */
	}
	
	input:focus, input:active,
	button:focus, button:active {
		outline: none;
		box-shadow: none;
		color: inherit;
	}


</style>

<script>

	$(document).ready(function(){ // =============================================================
		
		$("#cart_added_comment").hide(); <%-- 장바구니에 상품이 추가되면 뜨는 메시지 숨기기--%>
		
		
		$("#addStayPage").click(function(){ // ------------------
			
			addStayPage();
			
		}); // end of $("#addStayPage").click() -----------------
		
		
		
		$("#addGoCart").click(function(){ // ------------------
			
			addGoCart(); 
			
		}); // end of $("#addGoCart").click() -----------------
		
		
		const pnumrv = '${pvo.pnum}';
		
		console.log("pnum: "+ pnumrv);
		
		
		$.ajax({
			url : "<%= ctxPath%>/product/reviewCount.sun?pnum="+pnumrv , 
			type: "GET",  
		    dataType:"JSON",
		    success:function(json) {
		    	
		    	const revcnt = json.cnt;
		    	
		    	$("a#review_cnt").text("리뷰보기 ("+json.cnt+")");
		    	
		    },
		    error: function(request, status, error){
				//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
		
	}); // end of $(document).ready() ==============================================================

	
	function addStayPage(){
		// ajax 사용 상품이름이랑 수량 같이 넘겨줘야함
		
		const pnum = '${pvo.pnum}';
		const qty = $("input[name='quantity']").val();
		
		const loginuser = '${sessionScope.loginuser.userid}' ;
		
		if(loginuser == ''){ // 로그인 안 한 경우
			
			if(sessionStorage.getItem("Key"+pnum)){ // 이미 장바구니에 있다면 개수 업데이트
				var qty2 = sessionStorage.getItem('Qty'+pnum);
				sessionStorage.removeItem('Qty'+pnum);
				sessionStorage.setItem('Qty'+pnum,Number(qty)+Number(qty2));
			} else {
				sessionStorage.setItem("Key"+pnum,pnum);
				sessionStorage.setItem('Qty'+pnum,qty);
			}
			
			$("#cart_added_comment").show();  <%--장바구니에 상품이 추가되면 뜨는 메시지 보여주기 --%>
	    	$('#addCart').modal('hide');      <%--장바구니 모달 숨기기 --%>
	    		location.reload();
	    		
		} else { // 로그인 한 경우
			$.ajax({
				url : "<%= ctxPath%>/order/addCart.sun?pnum="+pnum+"&qty="+qty , 
				type: "GET",  
			    dataType:"TEXT",
			    success:function(json) {
			    	
			    	$("#cart_added_comment").show();  <%--장바구니에 상품이 추가되면 뜨는 메시지 보여주기 --%>
			    	$('#addCart').modal('hide');      <%--장바구니 모달 숨기기 --%>
			    		location.reload();
			    },
			    error: function(request, status, error){
					//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		}
	}
	
	function addGoCart(){
		
		const pnum = '${pvo.pnum}';
		const qty = $("input[name='quantity']").val();
		
		const loginuser = '${sessionScope.loginuser.userid}' ;
		
		if(loginuser == ''){ // 로그인 안 한 경우
			
			if(sessionStorage.getItem("Key"+pnum)){ // 이미 장바구니에 있다면 개수 업데이트
				var qty2 = sessionStorage.getItem('Qty'+pnum);
				sessionStorage.removeItem('Qty'+pnum);
				sessionStorage.setItem('Qty'+pnum,Number(qty)+Number(qty2));
			} else {
				sessionStorage.setItem("Key"+pnum,pnum);
				sessionStorage.setItem('Qty'+pnum,qty);
			}
		
			$("#cart_added_comment").show();  <%--장바구니에 상품이 추가되면 뜨는 메시지 보여주기 --%>
	    	$('#addCart').modal('hide');      <%--장바구니 모달 숨기기 --%>
	    	
			location.href="<%= ctxPath%>/order/cart.sun";
			
		} else { // 로그인 한 경우
			$.ajax({
				url : "<%= ctxPath%>/order/addCart.sun?pnum="+pnum+"&qty="+qty , 
				type: "GET",  
			    dataType:"TEXT",
			    success:function(json) {
			    	
			    	$("#cart_added_comment").show();  <%--장바구니에 상품이 추가되면 뜨는 메시지 보여주기 --%>
			    	$('#addCart').modal('hide');      <%--장바구니 모달 숨기기 --%>
			    	location.href="<%= ctxPath%>/order/cart.sun";
			    },
			    error: function(request, status, error){
					//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		}
		
	}
	
	// 관심상품 추가 이벤트
	function addtoWish(){
		
		const pnum = ${pvo.pnum};
		
		$.ajax({
			url : "<%= ctxPath%>/member/addToWish.sun?pnum="+pnum , 
			type: "GET",  
		    dataType:"JSON",
		    success:function(json) {
		    	
		    	// alert("is: " + json.isExist);
		    	if(json.isExist){ // 이미 위시리스트에 있는 상품일때
		    		$("#modalComment").html("이미 장바구니에 존재하는 상품입니다.");
		    	}
		    	else if(!json.isExist){ // 이미 위시리스트에 있는 상품일때
		    		$("#modalComment").html("선택하신 상품이 위시리스트에 추가되었습니다.");
		    	}
		    	
		    	$("#addWish").modal('show');
		    },
		    error: function(request, status, error){
				//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}


</script>

	<%-- 전체 박스 사이즈 // 노트북 해상도 달라서 전체 한번 div로 감쌈 --%>
	<div class="whole-box">
		
		<%-- 제품 정보 --%>
     	<div class="item-info-box" style="width: 400px;">
     		<div class="item-info-cotent-box">
	      		<div class="item-info-cotent">
	      			<c:if test="${not empty requestScope.proList}">
		      			<div class="item-name" style="width: 40%;">${pvo.parentProvo.pname } ${pvo.colorName }</div>
				      		  <c:choose >
				      				<c:when test="${pvo.salePcnt > 0}">
				    		   			 <div style="text-decoration: line-through; font-style: italic; font-size: 11pt; color: gray; text-align: left;" class="item-price"><fmt:formatNumber value="${ pvo.parentProvo.price}" pattern="#,###"></fmt:formatNumber> 원</div>
				    		    	</c:when>
				    		    	
				    		    	<c:otherwise>
				    		   			 <div class="item-price" style="text-align: left;"><fmt:formatNumber value="${ pvo.parentProvo.price}" pattern="#,###"></fmt:formatNumber> 원</div>
				    		    	</c:otherwise>
				    		    </c:choose>
				    		    
				    		    <c:choose>
				      				<c:when test="${pvo.salePcnt > 0}">
				    			 		 <div  style="font-size: 11pt;  text-align: left;" class="item-price"><fmt:formatNumber value="${pvo.parentProvo.price - (((pvo.parentProvo.price) * pvo.salePcnt)/100) }" pattern="#,###"></fmt:formatNumber> 원</div>
				    		    	</c:when>
				    		    	
				    		    	<c:otherwise>
				    		   			 <div class="item-price">&nbsp;</div>
				    		    	</c:otherwise>
				    		   </c:choose>
				    	</c:if> 
				    	
				    	<c:if test="${pvo.pqty == 0}">
				    		<div id="zerostock"  style="color: #449ce8;"><i>out of stock</i></div>
				    	</c:if>
				 </div>
			 </div>
		 	
		 	<%-- 제품 색상 및 설명 --%>
		 	<div class="item-info-color-box" style="max-width: 250%; height: 350px;">
			 	<div class="item-info-color" style="width: 100%;">
			 		<ul class="color-list" style="width: 400px; height: 150px; display: inline-block; margin: 0px 0px 10px 0px;">
			 			<c:if test="${not empty requestScope.proList}">
			 				<c:forEach var="pvo" items="${requestScope.proList}" varStatus="status" >
			 					<li class="color-img" style="height:100px;" ><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${pvo.pnum}" class="color-link"><img style="width:80px; height: 70px;  padding:0;  margin-bottom: 10px;  object-fit: cover;" class="color-real-img"  src="<%= ctxPath %>/images/common/products/${pvo.pimage1}"></a></li>
			 				</c:forEach>
		 				</c:if>
			 		</ul>
		 		</div>
			
				
			<div class="item-info-description-box" style=" clear:both; position: relative;">
	   	 		<div class="item-info-description" style="width: 250px;">
	    	 	   ${pvo.parentProvo.pcontent}
	   	 		</div>
   	 		</div>
   	 	</div>	
      	<br>
	      	 	
	      	 	
	      	<%-- 리뷰 --%> 	
	      	<div class="review">
		 		<span id="review" data-toggle="modal" data-target="#goReview" style="text-decoration: underline;" ><a id="review_cnt" href="<%= ctxPath%>/member/memberReview.sun?pnum=${pvo.pnum}"></a></span>
		 	</div>
	      	<br><br>
	      	 	
	      	 	
	      	 	
	 		<%-- 카트 및 관심 상품 버튼 --%>
	 		<div class="add-option-btn">
	 			<div class="cart-btn" >
					<c:if test="${pvo.pqty == 0}">
	 					<%-- onclick="addtoCart()" --%>
	 					<button type="button" class="btn btn-dark btn-block" style="background-color: #000000;" disabled="disabled">일시품절</button>
	 				</c:if>
	 				<c:if test="${pvo.pqty != 0}">
	 					<button type="button" class="btn btn-dark btn-block" id="add-cart-btn" data-toggle="modal" data-target="#addCart" style="background-color: #000000;">장바구니에 추가</button>
		 				<div id="cart_added_comment">해당 상품이 장바구니에 추가되었습니다.</div>
		 			</c:if>
	 			</div>
	 			<br>
		 		<c:if test="${ not empty sessionScope.loginuser && sessionScope.loginuser.userid != 'admin' }">	
		 			<div class="wish-btn" >
		 				<button type="button" class="btn btn-dark btn-block" onclick="addtoWish()" id="wish-cart-btn" style="background-color: #000000;">관심상품에 추가</button>
		 			</div>
	 			</c:if>
	 	   </div>
 	       <br>
 	    	
 	    	
	 	   <%-- 서비스 설명 --%>
	 	   <div class="service-info">무료배송 및 무료 반품 서비스, <a href="#"  class=" payment-info" id="installement">무이자 할부 서비스</a>
	 	   </div>
       	   <br>
       	   
      	 
   	  	   <%-- 제품 서비스 아코디언 --%>
   	  	   <div class="accordion-whole"> 
   	  	   <div class="accordion" id="accordionExample" style="text-align: left;">
   	  	   
		   <div class="card" style="border-left: none; border-right: none;">
		      <div class="card-header" id="headingOne">
		        <h2 class="mb-0">
		          <button class="accordion-button collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne" style="outline: none;">
		             제품 세부 정보
		          </button>
		        </h2>
		      </div>
		
		      <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
		         <!-- .collapse show 는 맨 처음에는 내용물을 보여주도록 하는 것임. -->
		         <div class="card-body">
		         	• 스퀘어 형태의 플랫바<br>
     	   			• 템플 메탈 장식 디테일<br>
      	   			• 프레임 정면: 145mm,템플 길이: 149.1mm<br>
      	     		  &nbsp; &nbsp; 렌즈 가로: 62.7mm, 렌즈 높이: 46.8mm<br>
      	   			  &nbsp; &nbsp; 브릿지: 17mm• <br>
      	   			  &nbsp; &nbsp; 제조국: 중국<br>
      	   			• 제조자 및 수입자: IICOMBINED CO.,LTD.
		         </div>
		      </div>
		   </div>
		   
		   <div class="card" style="border-left: none; border-right: none;">
		      <div class="card-header" id="headingTwo">
		        <h2 class="mb-0">
		          <button class="accordion-button collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		            무료 선물 포장 서비스
		          </button>
		        </h2>
		      </div>
		      
		      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
		         <div class="card-body">
		         	• 스퀘어 형태의 플랫바<br>
     	   			• 템플 메탈 장식 디테일<br>
     	   			• 틴트 렌즈<br>
      	   			• 프레임 정면: 145mm,템플 길이: 149.1mm<br>
      	     		  &nbsp; &nbsp; 렌즈 가로: 62.7mm, 렌즈 높이: 46.8mm<br>
      	   			  &nbsp; &nbsp; 브릿지: 17mm• <br>
      	   			  &nbsp; &nbsp; 제조국: 중국<br>
      	   			• 제조자 및 수입자: IICOMBINED CO.,LTD.
		         </div>
		      </div>
		   </div>
		  
		   <div class="card" style="border-left: none; border-right: none;">
		      <div class="card-header" id="headingThree">
		        <h2 class="mb-0">
		          <button class="accordion-button collapsed " type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		            기본 피팅 서비스
		          </button>
		        </h2>
		      </div>
		      	
		      <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
		         <div class="card-body">
		         	• 온라인에서 주문하시는 젠틀몬스터의<br>
		   	   		모든 제품은 기본 피팅 후 발송됩니다.
		         </div>
		      </div>
		   </div>
		   
		   <div class="card" style="border-left: none; border-right: none;">
		      <div class="card-header" id="headingFour">
		        <h2 class="mb-0">
		          <button class="accordion-button collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
		            배송•반품 서비스
		          </button>
		        </h2>
		      </div>
		      	
		      <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
		         <div class="card-body">
		         	• 무료 배송<br>
					&nbsp;오늘 주문한 상품을 영업일 기준 1-3일내에 받아보세요.<br>
					<br>
					• 무료 반품<br>
					무료 반품 서비스를 이용하세요.<br>
				 	구매하신 제품은 수령하신 날로부터 7일 이내에 접수해<br>
				 	주셔야 합니다.<br>
				 	&nbsp;제품은 사용되지 않은 상태를 유지해야 하며,<br>
				 	&nbsp;모든 구성품을 포함하고 있어야 합니다.
		         </div>
		      </div>
		   </div>
		   
		   <div class="card" style="border-left: none; border-right: none;">
		      <div class="card-header" id="headingFive">
		        <h2 class="mb-0">
		          <button class="accordion-button collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseThree">
		            문의 서비스
		          </button>
		        </h2>
		      </div>
		      	
		      <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
		         <div class="card-body">
		         	전문 어드바이저가 도와드리겠습니다.<br>
					• 라이브챗: 문의하기<br>
					• 전화 문의: 전화하기 1600-2126<br>
					• 이메일 문의: 문의하기<br>
					<br>
					* 라이브챗, 고객센터 운영 시간<br>
					월요일-금요일, 09:30-17:00(공휴일 제외)
		         </div>
		      </div>
		   </div>
		</div>
   	  </div>  	   
    </div>
	  
	  
	
	  <%-- 제품 상세 이미지 박스 --%>
	  <div class="img-row-box"> 
	    <div class="img-row">
	       <div class="sun-row"><img src="<%= ctxPath %>/images/common/products/${pvo.pimage1}" class="sunglasses-image"></div>
	       <c:if test="${not empty requestScope.imgList}">
	       	<c:forEach var="ivo" items="${requestScope.imgList}">
	       		<div class="sun-row"><img src="<%= ctxPath %>/images/common/products/${ivo.imgfilename}" class="sunglasses-image"></div>		
	       	</c:forEach>
	       </c:if>
	    </div> 
	 </div>

					     
 
	   <%-- 비슷한 상품 추천 --%>
       <div class="related-box">
         <div class="related-title"><span style="color: gray;">${pvo.parentProvo.pname} ${pvo.colorName}</span>과 비슷한 추천제품을 만나보세요</div>
   			<c:if test="${not empty requestScope.recommendList}"> 
				<c:forEach var="recomvo" items="${requestScope.recommendList}">
   					<ul class="related-item" style="margin-right: 5px;">
						<li class="related-item-list" style="list-style: none;">
							<div class="related-deep-box">
							<div><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${recomvo.pnum}"><img style="width: 270px; height:350px;" src="<%= ctxPath %>/images/common/products/${recomvo.pimage1}"></a></div>
							<div class="related-item-info-box">
								<ul class="related-go">
								<li class="sun-title"><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${recomvo.pnum}" class="link">${recomvo.parentProvo.pname} ${recomvo.colorName }</a></li>
								<li class="sun-price"><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${recomvo.pnum}" class="link" style="margin: 0;"><fmt:formatNumber value="${recomvo.parentProvo.price}" pattern="#,###"></fmt:formatNumber> 원</a></li>
								<li class="sun-color"><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${recomvo.pnum}" class="link"><span class="color-count">+</span> Colors</a></li>
								</ul>
							</div>
							</div>
						</li>
		   			</ul>	
				</c:forEach> 
			</c:if>
		  </div>
		</div>
       		
	 
	 
	<%-- footer 하단bar 고정 
	
	<nav class="footer-navbar fixed-bottom navbar-light bg-light ml-auto ">
	  <div class="container-fluid">
	    <span class="footer-bar__btn" data-target-slide="recent-list" data-category="footer" data-action="footer_click" data-label="최근 본 상품">
			최근 본 상품 <span class="recent-count font--md">(3)</span>
		</span> 
		<span class="footer-bar__btn" data-target-slide="wish-list" data-category="footer" data-action="footer_click" data-label="관심상품">
			관심상품 <span class="wish-count font--md">(0)</span>
		</span>
	  </div>
	</nav>
	--%>
	 
<%-- //////////////////////////////////////////////////////////////////////////////////////////// --%>


<%-- 장바구니 모달 시작 --%>
    <div class="modal fade" id="addCart">
	  <div class="modal-dialog  modal-dialog-centered">
	    <div class="modal-content">
	      
	      <div class="modal-body">
	      	 <button type="button" class="close" data-dismiss="modal">&times;</button>
	      	 <br>
	      	 <span class="boltxt ml-5">선택상품</span>
	      	 <div class="row mt-4">
	      	 	<div class="col-sm-4 offset-sm-1">
	      	 		<img src="<%= ctxPath %>/images/common/products/${pvo.pimage1}" style="width: 150px; height: 150px; border-radius: 50%;" >
	      	 	</div>
	      	 	<div class="col-sm-4 offset-sm-1">
	      	 		<span class="boltxt mt-5">${pvo.parentProvo.pname } ${pvo.colorName }</span>
	      	 		<%-- +- 따라서 바뀌는거 만들어야함 --%>
	      	 		<span class="puretxt mt-2"><fmt:formatNumber value="${ pvo.parentProvo.price}" pattern="#,###"></fmt:formatNumber> 원</span>
	      	 		<div class="number-input mt-3">
					  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" ></button>
					  <input  class="quantity" min="1" max="10"  name="quantity" value="1" type="number">
					  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
					</div>
	      	 		
	      	 	</div>
	      	 </div>
	      	 <button id="addStayPage" style="border:1px solid black; background-color: white; font-size: 13px; width:70%; height: 40px;margin: 40px 15% 10px 15%; border-radius: 0.4rem;" >장바구니에 추가하고 쇼핑 계속하기</button>
	       	 <button onclick="addGoCart()" id="addGoCart" style="background-color: black; color:white; font-size: 13px; width:70%; height: 40px;  margin: 0 15% 30px 15%; border-radius: 0.4rem;">장바구니에 추가하고 장바구니 가기</button><br>
	      	 
	      </div>
	    </div>
	  </div>
	</div>
 <%-- 장바구니 모달 끝 --%>
 
 <%-- 위시 모달 시작 --%>
	<div class="modal fade" id="addWish">
		<div class="modal-dialog  modal-dialog-centered">
			<div class="modal-content" style="background-color: #f2f2f2;">
			<div id="modalComment" style="font-size: 12pt; margin: 0 auto; padding-top: 50px;"></div>
				<div class="modal-body" id="wishModalBody">
	      			<button class="wishModalBtn" style="border:1px solid black; background-color: white; font-size: 10pt; width:300px;  height: 35px; border-radius: 0.4rem;" data-dismiss="modal">계속 쇼핑하기</button>
	      			<button class="wishModalBtn" style="background-color: black; color:white; font-size: 10pt; width:300px; height: 35px;  margin-top: 10px; border-radius: 0.4rem;" onclick = "location.href = '<%= ctxPath%>/member/wishlist.sun' ">위시리스트로 가기</button>
				</div>
			</div>
		</div>
	</div>
 <%-- 위시 모달 끝 --%>


<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />