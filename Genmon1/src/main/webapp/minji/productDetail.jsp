<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />

<link rel="stylesheet" type="text/css" href="productDetail.css">
<style type="text/css">
</style>


<%-- 인덱스 시작 --%>

	<%-- 전체 박스 사이즈 --%>
	<div class="whole-box">
		
		<%-- 제품 정보 --%>
     	<div class="item-info-box">
     		
     		<div class="item-info-cotent-box">
	      		<div class="item-info-cotent">
	      			<div class="item-name">릴리트01(BR)</div>
	    		    <div class="item-price">259,000원</div>
			 	</div>
		 	</div>
		 	
		 	<%-- 제품 색상 및 설명 --%>
		 	<div class="item-info-color-box">
			 	<div class="item-info-color">
			 		<ul class="color-list">
			 			<li class="color-img"><a href="#" class="color-link"><img class="color-real-img" alt="" src="images/릴리트01색1미니.jpg"></a></li>
			 			<li class="color-img"><a href="#" class="color-link"><img class="color-real-img" alt="" src="images/릴리트01색상2미니.jpg"></a></li>
			 			<li class="color-img"><a href="#" class="color-link"><img class="color-real-img" alt="" src="images/릴리트01색상3미니.jpg"></a></li>
			 			<li class="color-img"><a href="#" class="color-link"><img class="color-real-img" alt="" src="images/릴리트01색상4미니.jpg"></a></li>
			 			<li class="color-img"><a href="#" class="color-link"><img class="color-real-img" alt="" src="images/릴리트01색상4미니.jpg"></a></li>
			 			<li class="color-img"><a href="#" class="color-link"><img class="color-real-img" alt="" src="images/릴리트01색상4미니.jpg"></a></li>
			 		</ul>
		 		</div>
			</div>
				
				<div class="item-info-description-box">
		   	 		<div class="item-info-description">
		    	 	   "릴리트 01(BR)은 사각형태의 블랙 플랫바 선글라스입니다.<br>
		    	 		라운딩 처리된 프런트가 부드러운 분위기를 연출하며<br>
		    	 		템플의 유니크한 메탈 장식이 특징입니다.<br>
		    	 		99.9% UV 차단이 되는 브라운 렌즈를 사용하였습니다."
		   	 		</div>
	   	 		</div>
	      	 	<br>
      	 		
	 		<%-- 카트 및 관심 상품 버튼 --%>
	 		<div class="add-option-btn">
		 			<div class="cart-btn" >
		 				<button type="button" class="btn btn-dark btn-block" id="add-cart-btn" onclick="addtoCart()" style="background-color: #000000;">쇼핑백에 추가</button>
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
		   	   				<img alt="" src="images/포장.jpg">
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
			        <div class="sun-row"><img src="images/릴리트01정면.jpg" alt="" class="sunglasses-image"></div>
			        <div class="sun-row"><img src="images/릴리트착샥02.jpg" alt="" class="sunglasses-image"></div>
			        <div class="sun-row"><img src="images/릴리트01상세.jpg" alt="" class="sunglasses-image"></div>
			        <div class="sun-row"><img src="images/릴리트01착샷.jpg" alt="" class="sunglasses-image"></div>
			        <div class="sun-row"><img src="images/릴리트옆면.jpg" alt="" class="sunglasses-image" ></div>
			        <div class="sun-row"><img src="images/릴리트01옆.jpg" alt="" class="sunglasses-image" ></div>
			        <div class="sun-row"><img src="images/릴리트파우치.jpg" alt="" class="sunglasses-image" ></div>
			   </div> 
	 		</div>
	 
					     
 
	   <%-- 비슷한 상품 추천 --%>
       <div class="related-box">
         <div class="related-title">릴리트01과 비슷한 추천제품을 만나보세요</div>
       		<ul class="related-item">
       			<li class="related-item-list">
       			<div class="related-deep-box">
  					<div><a href="" class="related-img"><img alt="" src="images/related/디디온01(G)1.jpg"></a></div>
      				<div class="related-item-info-box">
   						<ul class="related-go">
      						<li class=""><a href="#" class="link">로셀 01</a></li>
      						<li class=""><a href="#" class="link" style="margin: 0;">259,000원</a></li>
      						<li class=""><a href="#" class="link">+5 Colors</a></li>
      					</ul>
   					</div>
   				</div>
       			</li>
        		<li class="related-item-list">
        		<div class="related-deep-box">
  					<div><a href="" class="related-img"><img alt="" src="images/related/로셀BC5(1).jpg"></a></div>
      				<div class="related-item-info-box">
   						<ul class="related-go">
      						<li class=""><a href="#" class="link">로셀 01</a></li>
      						<li class=""><a href="#" class="link" style="margin: 0;">259,000원</a></li>
      						<li class=""><a href="#" class="link">+5 Colors</a></li>
      					</ul>
       				</div>
       			</div>	
       			</li>
       			<li class="related-item-list">
       			<div class="related-deep-box">
  					<div><a href="" class="related-img"><img alt="" src="images/related/모마티01(OR)2.jpg"></a></div>
      				<div class="related-item-info-box">
   						<ul class="related-go">
      						<li class=""><a href="#" class="link">로셀 01</a></li>
      						<li class=""><a href="#" class="link" style="margin: 0;">259,000원</a></li>
      						<li class=""><a href="#" class="link">+5 Colors</a></li>
      					</ul>
       				</div>
       			</div >
       			</li>
       			<li class="related-item-list">
       			<div class="related-deep-box">
  					<div><a href="" class="related-img"><img alt="" src="images/related/밀01(K)1.jpg"></a></div>
      				<div class="related-item-info-box">
      					<ul class="related-go">
      						<li class=""><a href="#" class="link">로셀 01</a></li>
      						<li class=""><a href="#" class="link" style="margin: 0;">259,000원</a></li>
      						<li class=""><a href="#" class="link">+5 Colors</a></li>
      					</ul>
       				</div>
       			</div>
       			</li>
       			<li class="related-item-list">
       			<div class="related-deep-box">
  					<div><a href="" class="related-img"><img alt="" src="images/related/밀Y2(1).jpg"></a></div>
      				<div class="related-item-info-box">
      					<ul class="related-go">
      						<li class=""><a href="#" class="link">로셀 01</a></li>
      						<li class=""><a href="#" class="link" style="margin: 0;">259,000원</a></li>
      						<li class=""><a href="#" class="link">+5 Colors</a></li>
      					</ul>
       				</div>
       			</div>
       			</li>
        	</ul>
       	</div>
    </div>
	 
<%-- 인덱스 끝 --%>

<jsp:include page="footer.jsp" />