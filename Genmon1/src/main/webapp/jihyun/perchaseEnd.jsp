  <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<% String ctxPath = request.getContextPath(); %>

 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

 <!-- Font Awesome 5 Icons !!이걸써줘야 아이콘웹에서 아이콘 쓸 수 있다!!-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<jsp:include page="header.jsp" />

<style type="text/css">

	div#container {
		/* border: solid 1px #d9d9d9; */
		width:800px;
		height:350px;
		display: flex;
		margin: 2% auto 7% auto;
	}
	
	img{
		width: 150px;
		height: 150px;
		display: inline-block;
		margin-top: -150%;
	}
	section {
		width: 600px;
	    margin-top: 3% 0 3% 3%;
	    padding-left: 4%;
	}
	
	section > div {
		font-size: 14px;
		padding: 1%;
	}
	
	div#message {
		display: inline-block;
	}
	
	<font-awesome-icon icon="fa-light fa-circle-check" />



</style>

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



<div id="container">
	<div id="message">

		<div style="display: inline-block;"><img src="image/checkimg.png"></img></div>
		
		<section style="display: inline-block;">
			<h5 style="font-weight: bold; margin-bottom: 2%;">주문 완료</h5>
			<div>${orderid }의 주문이 완료 되었습니다.</div>
			<br>
			<div>주문내역 및 배송에 관한 안내는 <a style="color:red; font-variant: inherit;" href="#">주문조회</a>를 통하여 확인 가능합니다.</div>
			<div>주문번호 : 210391203 - 2343787274 <%--  ${requestScope.} --%> </div>
			<div>주문일자 : 2022-10-11 22:54:32 </div>
			
			<div>우리은행 1002-950-797783 (예:김지현) </div>
			<div style="color: red;">*가격 입금해주셔야 주문이 완료됩니다*</div>
		</section>
	</div>
	
</div>



<jsp:include page="footer.jsp" />

<div class="buttonContainer" style="display:hidden;">
	<button class="canvasBtn" id="stopButton" style="display:none;">Stop Confetti</button>
	<button class="canvasBtn" id="startButton" style="display:none;" >Drop Confetti</button>	
</div>

<canvas id="canvas"></canvas>
