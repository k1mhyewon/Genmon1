<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <jsp:include page="header.jsp" /> 


<style type="text/css">


  	/* 내가 만든거 */
  	div.container {
  		/* border: solid 1px red; */
  		width: 95%;
  		left:5%;
  		position: relative; 
  		margin-top: 5% ;
  	}
  
  	section#menu_bar {
  	  /*border: solid 1px orange;*/
  		width: 60%;
  		margin:  2% auto;
  	}
  	section#menu_bar > span > button { 
  		  border: none;
  		  padding-left: 8%;
	  	  background-color: white;
	  	  margin-right: 5%;
	  	  font-size: 16px;
		  display:inline-block; 
		  text-transform:uppercase; 
		  text-decoration: none;
	  }
	section#menu_bar > span > button:after {
		  display:block;
		  content: '';
		  margin-top:2px;
		  border-bottom: solid 1px black;  
		  transform: scaleX(0);  
		  transition: transform 250ms ease-in-out;
	}
	section#menu_bar > span > button:hover:after { 
		transform: scaleX(1); 
	}
	
  	
  	button:hover {
  		cursor: pointer;
  	}
  	.btn:hover {
  		cursor: pointer;
  	}
  	
 	.btn {
 		color: gray;
 	}
 	
  	div#memberInfo, div#point {
  		border-top: solid 1px gray;
  		display:inline-block;
  		width: 40%;
  		margin-right: 3%;
  		padding-top: 2%;
  		
  	}
  	
  	div#order, div#query {
  		border-top: solid 1px gray;
  		display:inline-block;
  		width: 40%;
  		margin-right: 3%;
  		padding-top: 2%;
  		top: -120px;
  		position: relative;
  	} 
  
  	div#point {
  		top: -45px;
  		position: relative;
  	}
	.info {
		margin: 10%
	}
	.info > span {
		margin-right: 15%;
	}
  	
</style>

   <div class="container">
        <div id="mypageFrm">
        	<section id="menu_bar">
        		<span><button type="button" id="btn_info">회원정보</button></span>
        		<span><button type="button" id="btn_order">주문/배송</button></span>
        		<span><button type="button" id="btn_wishlist">위시리스트</button></span>
        		<span><button type="button" id="btn_query">상품 문의</button></span>
        	</section>
        	
        	<div id="memberInfo">
	       		<span style="font-size: 16px; font-weight: bold;">회원정보</span>
	       		<a href="#"><span id="btn_myinfoupdate" type="button" class="btn" style="text-decoration: underline; margin-left: 80%; font-size: 12px;" >수정</span></a>
				<div style="margin-top: 5%;">
					<ul id="gender" name="gender">성별&nbsp;&nbsp;: </ul>
					<ul id="name" name="name">이름&nbsp;&nbsp;: </ul>
					<ul id="birth" name="birth">생년월일&nbsp;&nbsp;: </ul>
					<ul id="email" name="email">이메일&nbsp;&nbsp;: </ul>
					<ul id="gender" name="gender">주소&nbsp;&nbsp;:
						<%-- <c:if test="">
			    				<div>저장된 주소가 없습니다</div>
			    				<button id="btn_adradd">새로운 주소 추가</button>
			   				</c:if>
			   			--%>	
					</ul>
					 
				</div>
        	</div>
        	
        	<div id="order">
	        	<span style="font-size: 16px; font-weight: bold; margin-bottom: 100%; ">주문</span>
	        	<a href=""><span id="btn_myinfoupdate" class="btn" type="button" style="text-decoration: underline; margin-left: 80%;font-size: 12px; ">모두보기</span></a>
        		<div class="info">
	        		<span>주문번호</span>
	        		<span>주문날짜</span>
	        		<span>가격</span>
	        		<%-- <c:if test="">
			    				<div>주문내역이 존재하지 않습니다.</div>
			    				<button id="btn_adradd">쇼핑하기</button>
			   				</c:if>
			   			--%>	
        		</div>
        	</div>
        	
        	 
          	<div id="money"style="display: inline-block;">
	        	<div id="point" >
	        		<span style="font-size: 16px; font-weight: bold; display: inline-block;">포인트</span>
	        		<div style="margin: 5% 0;">포인트</div>
	        	</div>
	        	
	        	<div id="coin" >
	        		<span style="font-size: 16px; font-weight: bold; display: inline-block;">코인</span>
	        		<div style="margin: 5% 0">코인</div>
	        	</div>
        	</div>
        	
        	
        	<div id="query" style="display: inline-block; border: solid 1px red; ">
        		<span style="font-size: 16px; font-weight: bold;">문의</span>
        		<span id="btn_query" class="btn" type="button" style="text-decoration: underline; margin-left: 80%;font-size: 12px; ">모두보기</span>
        		<div class="info">
	        		<span>문의번호</span>
	        		<span>문의날짜</span>
	        		<span>답변상태</span>
	        		<%-- <c:if test="">
			    				<div>요청하신 문의사항이 없습니다.</div>
			    				<button id="btn_adradd">새로운 주소 추가</button>
			   				</c:if>
			   			--%>	
        		</div>
        	</div>
     
       
       </div>
   </div>



<jsp:include page="footer.jsp" />