<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="../common/header.jsp" />

<script>

	window.onload=function(){
		
		// 꽃가루 이벤트
		$("#startButton").trigger("click");
	  	setTimeout(function(){
	  		$("#stopButton").trigger("click");
	  	}, 6000);
		
	}

	
	$(document).ready(function(){
		
		//비회원 주문이라면! 장바구니 비워주기
		const lguser ="${sessionScope.loginuser.userid}";
		
		if(lguser==""){
			
			<c:forEach var="cvo" items="${requestScope.ordertList}">
			   	var pnum = ${cvo.fk_pnum};
				if(sessionStorage.getItem("Key"+pnum)){
					sessionStorage.removeItem('Key'+pnum);
					sessionStorage.removeItem('Qty'+pnum);
				}
			</c:forEach>			
			
		}// end of 비회원 장바구니 비우기

	});// end of reday
	
	
	
	  

</script>


<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>

<style>
	canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
</style>




주문 완료 <br><br>

주문번호 ${orderid }의 주문이 완료 되었습니다 <br><br>

우리은행 1002-950-797783 (예:김지현) 으로 

가격 입금해주셔야 주문이 완료됩니다.

결제 상품 ( 테이블로 보여주기 )<br><br>



비회원 조회를 원하면 결제상품과 입력하신 이메일을 사용하여 조회해주세요<br><br>

글고 비회원이면 세션 스토리지 비워주기


<jsp:include page="../common/footer.jsp" />

<div class="buttonContainer" style="display:hidden;">
	<button class="canvasBtn" id="stopButton" style="display:none;">Stop Confetti</button>
	<button class="canvasBtn" id="startButton" style="display:none;" >Drop Confetti</button>	
</div>

<canvas id="canvas"></canvas>
