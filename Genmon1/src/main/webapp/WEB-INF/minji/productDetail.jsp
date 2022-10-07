<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% String ctxPath=request.getContextPath();%>    
<jsp:include page="../common/header.jsp" />

<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/css/productDetail.css">

<!-- minji 아코디언 Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style>
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
		
		} else { // 로그인 한 경우
			$.ajax({
				url : "<%= ctxPath%>/order/addCart.sun?pnum="+pnum+"&qty="+qty , 
				type: "GET",  
			    dataType:"TEXT",
			    success:function(json) {
			    	
			    	$("#cart_added_comment").show();  <%--장바구니에 상품이 추가되면 뜨는 메시지 보여주기 --%>
			    	$('#addCart').modal('hide');      <%--장바구니 모달 숨기기 --%>
					
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
		
		location.href="<%=ctxPath%>/member/wishlist.sun?pnum=${pvo.pnum}";
	}


</script>

	<%-- 전체 박스 사이즈 // 노트북 해상도 달라서 전체 한번 div로 감쌈 --%>
	<div class="whole-box">
		
		<%-- 제품 정보 --%>
     	<div class="item-info-box">
     		<div class="item-info-cotent-box">
	      		<div class="item-info-cotent">
	      			<c:if test="${not empty requestScope.proList}">
		      			<div class="item-name">${pvo.parentProvo.pname } ${pvo.colorName }</div>
				      		  <c:choose >
				      				<c:when test="${pvo.salePcnt > 0}">
				    		   			 <div style="text-decoration: line-through; font-style: italic; font-size: 11pt; color: gray;"  class="item-price"><fmt:formatNumber value="${ pvo.parentProvo.price}" pattern="#,###"></fmt:formatNumber> 원</div>
				    		    	</c:when>
				    		    	
				    		    	<c:otherwise>
				    		   			 <div class="item-price"><fmt:formatNumber value="${ pvo.parentProvo.price}" pattern="#,###"></fmt:formatNumber> 원</div>
				    		    	</c:otherwise>
				    		    </c:choose>
				    		    
				    		    <c:choose>
				      				<c:when test="${pvo.salePcnt > 0}">
				    			 		 <div  style="font-size: 11pt;" class="item-price"><fmt:formatNumber value="${pvo.parentProvo.price - (((pvo.parentProvo.price) * pvo.salePcnt)/100) }" pattern="#,###"></fmt:formatNumber> 원</div>
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
		 	<div class="item-info-color-box">
			 	<div class="item-info-color">
			 		<ul class="color-list">
			 			<c:if test="${not empty requestScope.proList}">
			 				<c:forEach var="pvo" items="${requestScope.proList}" varStatus="status" >
			 					<li class="color-img" ><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${pvo.pnum}" class="color-link"><img style="width:80px; height: 70px; object-fit: cover;" class="color-real-img"  src="<%= ctxPath %>/images/common/products/${pvo.pimage1}"></a></li>
			 				</c:forEach>
		 				</c:if>
			 		</ul>
		 		</div>
			</div>
				
			<div class="item-info-description-box">
	   	 		<div class="item-info-description" style="width: 300px;">
	    	 	   ${pvo.parentProvo.pcontent}
	   	 		</div>
   	 		</div>
      	 	<br>
	      	 	
	      	 	
	      	<%-- 리뷰 --%> 	
	      	<div class="review">
		 		<span id="review" data-toggle="modal" data-target="#goReview" style="text-decoration: underline;" ><a href="<%= ctxPath%>/member/memberReview.sun?pnum=${pvo.pnum}">리뷰보기 (5) </a></span>
		 	</div>
	      	<br><br>
	      	 	
	      	 	
	      	 	
	 		<%-- 카트 및 관심 상품 버튼 --%>
	 		<div class="add-option-btn">
	 			<div class="cart-btn" >
					<c:if test="${pvo.pqty == 0}">
	 					<%-- onclick="addtoCart()" --%>
	 					<button type="button" class="btn btn-dark btn-block" style="background-color: #000000;">일시품절</button>
	 				</c:if>
	 				<c:if test="${pvo.pqty != 0}">
	 					<button type="button" class="btn btn-dark btn-block" id="add-cart-btn" data-toggle="modal" data-target="#addCart" style="background-color: #000000;">장바구니에 추가</button>
		 				<div id="cart_added_comment">해당 상품이 장바구니에 추가되었습니다.</div>
		 			</c:if>
	 			</div>
	 			<br>
		 			
	 			<div class="wish-btn" >
	 				<button type="button" class="btn btn-dark btn-block"  id="wish-cart-btn" onclick="addtoWish()" style="background-color: #000000;">관심상품에 추가</button>
	 			</div>
	 	   </div>
 	       <br>
 	    	
 	    	
	 	   <%-- 서비스 설명 --%>
	 	   <div class="service-info">무료배송 및 무료 반품 서비스, <a href="#"  class=" payment-info" id="installement">무이자 할부 서비스</a>
	 	   </div>
       	   <br>
       	   
      	 
   	  	   <%-- 제품 서비스 토글바 --%>
   	  	   <div class="accordion-whole"> 
		   <div class="accordion accordion-flush" id="accordionFlushExample">
			   	  <%-- 제품 정보 --%>
				  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingOne">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
					        제품 세부 정보
					      </button>
					    </h2>
					    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
						      <div class="accordion-body">
			     	   			• 스퀘어 형태의 플랫바<br>
			     	   			• 템플 메탈 장식 디테일<br>
			     	   			• 브라운 틴트 렌즈<br>
			      	   			• 프레임 정면: 145mm,템플 길이: 149.1mm<br>
			      	     		  &nbsp; &nbsp; 렌즈 가로: 62.7mm, 렌즈 높이: 46.8mm<br>
			      	   			  &nbsp; &nbsp; 브릿지: 17mm• <br>
			      	   			  &nbsp; &nbsp; 제조국: 중국<br>
			      	   			• 제조자 및 수입자: IICOMBINED CO.,LTD.
						      </div>
					    </div>
				  </div>
				  
				  <%-- 무료 선물 포장 서비스 --%>
				  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
					        무료 선물 포장 서비스
					      </button>
					    </h2>
					    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
					    	<div class="accordion-body">
		   	   				• 젠틀몬스터 공식 온라인 스토어에서 구매하는<br>
		   	   				모든 분들께 선물 포장 서비스를 제공해 드립니다.<br>
		   	   				<br>
		   	   				<img alt="" src="<%= ctxPath %>/images/minji/포장.jpg">
					   		</div>
					   </div>
				  </div>
				  
				  <%-- 기본 피팅 서비스 --%>
				  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
					        기본 피팅 서비스
					      </button>
					    </h2>
					    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
		   	   				• 온라인에서 주문하시는 젠틀몬스터의<br>
		   	   				모든 제품은 기본 피팅 후 발송됩니다.
					      </div>
					    </div>
				  </div>
				  
				  <%-- 배송&반품 서비스 --%>
				  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingFour">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
					        배송•반품 서비스
					      </button>
					    </h2>
					    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
						      <div class="accordion-body">
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
				  
				  <%-- 문의 서비스 --%>
				  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingFive">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
					        문의 서비스
					      </button>
					    </h2>
					    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
				         	<br>
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
         <div class="related-title"><span style="color: gray;">${pvo.parentProvo.pname} ${pvo.colorName }</span>과 비슷한 추천제품을 만나보세요</div>
   			<c:if test="${not empty requestScope.recommendList}"> 
				<c:forEach var="recomvo" items="${requestScope.recommendList}">
   					<ul class="related-item" style="margin-right: 5px;">
						<li class="related-item-list" style="list-style: none;">
							<div class="related-deep-box">
							<div><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${recomvo.pnum}"><img style="width: 270px; height:350px;" src="<%= ctxPath %>/images/common/products/${recomvo.pimage1}"></a></div>
							<div class="related-item-info-box">
								<ul class="related-go">
								<li class="sun-title"><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${recomvo.pnum}" class="link">${recomvo.parentProvo.pname}</a></li>
								<li class="sun-price"><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${recomvo.pnum}" class="link" style="margin: 0;">${recomvo.parentProvo.price}</a></li>
								<li class="sun-color"><a href="<%= ctxPath%>/product/productDetail.sun?pnum=${recomvo.pnum}" class="link">+<span class="color-count">5</span> Colors</a></li>
								</ul>
							</div>
							</div>
						</li>
		   			</ul>	
				</c:forEach> 
			</c:if>
		  </div>
		</div>
       		
	 
	 
	<%-- footer 하단bar 고정 --%>
	
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


<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />