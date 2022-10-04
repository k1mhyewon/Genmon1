<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <% String ctxPath = request.getContextPath(); %>
 
 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myinfo_mainMenu.jsp" />

<style type="text/css">

  		/* 내가 만든거 */
  	form.frm_mypage {
  		/* border: solid 1px red; */
  		left:5%;
  		position: relative; 
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
	
	section#main1, section#main2 {
		/* border: solid 1px red; */
		width: 47%;
		display: inline-block;
		margin: 0 auto 10% auto;
		vertical-align: top;
	}
	
	section#main2 > div{
		border-top: solid 1px #cccccc; 
		padding: 30px;
		margin-left: 20px;
		
	}
	
	span#money > div > button{
		margin: 20% 30%;
		background-color: #808080;
		border:none; 
		color: white; 
		width: 40%;
		line-height: 200%;
	}	
	
	button#btn_adradd {
		border: none; 
		width: 140px; 
		margin: 10px auto; 
		cursor: pointer; 
		font-style: 13px;
		 background-color: #666666; 
		color: white;
	}
	
	div#frm_my {
		height: 
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
  	
 
	.info {
		margin: 20px;
		font-size: 12px;
		text-align: center;
	}
	.info > span {
		margin-right: 15%;
	}
	
	.btn_money {
		background-color: #cccccc;
		border: none;
		width: 100px;
		margin: 30px 130px;
		font-size: 13px;
		line-height: 25px;
	}
	
	a {
		cursor: pointer;
		color:black;
	}
	
	a#update {
		text-decoration: underline; 
		margin-left: 85%;
		font-size: 13px;
		color: gray;
	}
	
	li > span {
		margin-left: 10px;
	} 
	
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		//////////////////////////////////////
		// == 로그인을 안한 상태일때 로콜스토리지(localStorage)에 저장ehls key가 "saveid"인 userid값을 불러와서
		// input태그 userid에 넣어주기 == 
		if(${empty sessionScope.loginuser}) {
			
			// 	alert("헤헤헤");  로그인을 하지 않은 상태에서 나온다.
			
			const loginUserid = localStorage.getItem("saveid");
			
			if(loginUserid != null) { // loginuser가 있는지 알아보자
				$("input#loginUserid").val(loginUserid);
				$("input:checkbox[id='saveid']").prop("checked", true);
			}
		}
		
		//////////////////////////////////////////
		
		// 클릭한 메인메뉴 글씨 굵게
    	$("span#info_detail").css("font-weight","bold");
		
		
		
	
		// 마이페이지에서 수정으로 누르면 내정보수정으로 넘가는 버튼
        $("span#btn_myinfoupdate").click(function(){
        	location.href="<%= request.getContextPath()%>/myinfo/adrAdd.sun?userid="+userid;
			
		}); // end of $("button#btn_logout").click() 
		//////////////////////////////////////////
		
		
		
		
		
		
		
		
		
		
		
	}); // end of $(document).ready(function()
			
			
	// >>> 내정보수정하기 페이지로 이동하는 함수 <<<  //
	function goEditPersonal(userid) {
		
		location.href="<%= request.getContextPath()%>/myinfo/infoUpdate.sun?userid="+userid;
		
	}// end of function goCoinPurchaseTypeChoice(userid) --------------------------
	
	
	// >>> 새로운 주소추가 페이지로 이동하는 함수 <<<  //
	function goAdrAdd(userid) {
		
		location.href="<%= request.getContextPath()%>/myinfo/adrAdd.sun?userid="+userid;
		
	}// end of function goCoinPurchaseTypeChoice(userid) --------------------------
	
	
	// >>> 코인충전 보여주는 함수 <<<  //
	function goCoinPurchaseTypeChoice(userid) {
		
		location.href="<%= request.getContextPath()%>/myinfo/coinPurchaseTypeChoice.up?userid="+userid;
		
	}// end of function goCoinPurchaseTypeChoice(userid) --------------------------

	
	
	// 결제선택창을 닫으면 금액을 결제하는 새로운 결제창이 떠야함으로 부모클래스에 있는 로그인 유무를 가져와 함수를 생성한다.
	// === 아임포트 결제를 해주는 함수 === //
	function goCoinPurchaseEnd(coinmoney) {
	//	alert('확인용  부모창의 함수 호출람. 결제금액 : ' + coinmoney);
		
		const userid = "${sessionScope.loginuser.userid}";
	//	 alert("확인용 결제할 사용자 아이디 : " + userid);
		
	//	아임포트 결제 팝업창 띄우기	
		const url = "<%= request.getContextPath()%>/member/coinPurchaseEnd.up?userid="+userid + "&coinmoney=" +coinmoney;
		
		window.open(url,"coinPurchaseEnd",
					"left=350px, top=100px, width=1000px, height=600px"); // 팝업창 크기설정
	}
	

</script>

<c:if test="${not empty sessionScope.loginuser}">
   <form name="frm_mypage" id="frm_mypage">
        <div>
        	<div id="frm_my">
        	<section id="main1">
	        	<div id="memberInfo" style="border-top: solid 1px #cccccc; padding: 20px;">
		       		<span style="font-size: 16px; font-weight: bold;">회원정보</span>
		       		<a href="javascript:goEditPersonal('${(sessionScope.loginuser).userid}');" id="update">수정</a>
					<div style="padding: 5%; font-size: 13px;">
						<ul style="list-style: none; line-height: 30px;">
							<li id="gender" name="gender">성별&nbsp;&nbsp;: <span>${sessionScope.loginuser.userid}</span></li> 
							<li id="name" name="name">이름&nbsp;&nbsp;: <span>${sessionScope.loginuser.name}</span></li>
							<li id="birth" name="birth">생년월일&nbsp;&nbsp;: <span>${sessionScope.loginuser.birthday}</span></li>
							<li id="email" name="email">이메일&nbsp;&nbsp;: <span>${sessionScope.loginuser.email}</span></li>
							
							<c:if test="${not empty sessionScope.loginuser.address} ">
								<div style="margin: 20px 0;">
									<ul style="list-style: none;">
										<li id="address" name="address">주소&nbsp;&nbsp;: <span>${sessionScope.loginuser.address}</span></li>
									</ul>
								</div>
							</c:if>
							
							<c:if test="${empty sessionScope.loginuser.address}">
								<div style="display: felx; margin: 80px auto; width: 200px;">
			    					<div style="font-size: 15px; font-weight: bold;">저장된 주소가 없습니다.</div>
			    					<button id="btn_adradd"><a  href="javascript:goAdrAdd('${(sessionScope.loginuser).userid}');" >새로운 주소 추가</a></button>
			    				</div>
					   		</c:if>
							
						</ul> 
					</div>
	        	</div>
	        	 
        	</section>
        	
        	<section id="main2">
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
	        	
	        	<div id="query">
	        		<span style="font-size: 16px; font-weight: bold; margin-bottom: 100%; ">문의</span>
	        		<a href=""><span id="btn_query" class="btn" type="button" style="text-decoration: underline; margin-left: 80%;font-size: 12px; ">모두보기</span></a>
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
	        	
	        	<div id="point" style="width: 400px; display: inline-block;" >
	        		<span style="font-size: 16px; font-weight: bold; margin-bottom: 100%;">포인트</span>
	        		<div style="text-align: center;margin: 3%;font-size: 13px;">포인트</div>
	        		<button type="button" id="btn_point" class="btn_money"><a href="javascript:goCoinPurchaseTypeChoice('${(sessionScope.loginuser).userid}');">적립내역</a></button>
	        	</div>
	        	
	        	<div id="coin" style="width: 400px;margin-left:50px;display: inline-block;">
	        		<span style="font-size: 16px; font-weight: bold; margin-bottom: 100%; ">코인</span>
	        		<div style="text-align: center;margin: 3%; font-size: 13px;">코인</div>
	        		<button type="button" id="btn_coin" class="btn_money"><a href="javascript:goCoinPurchaseTypeChoice('${(sessionScope.loginuser).userid}');">충전하기</a></button>
	        	</div>
     		</section>
     		
     		</div>
       </div>
   </form>
</c:if>   
       
    <%-- form을 만든후 post방식으로 넘긴다 --%>
   <%-- PG(Payment Gateway 결제대행)에 코인금액을 카드(카카오페이 등)로 결제후 DB상에 사용자의 코인액을 update 를 해주는 폼이다. --%>
    <form name="coinUpdateFrm">
        <input type="hidden" name="userid" />
        <input type="hidden" name="coinmoney" />
    </form>



<jsp:include page="../common/footer.jsp" />