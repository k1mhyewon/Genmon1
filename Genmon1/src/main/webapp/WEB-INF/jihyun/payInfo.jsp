<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="orderHeader.jsp" />

<style>
	
    
    /* CSS 로딩화면 구현 시작 
		$("div.loader").css({'position': 'fixed'}, {'top':Math.ceil((window.screen.height)/2)},{'left':Math.ceil((window.screen.width)/2)}) */
   
   .loader {
   
   	position:fixed;
   	top:450px;
   	left:900px;
     border: 16px solid #f3f3f3;
     border-radius: 50%;
     border-top: 16px dotted gray;
     border-right: 16px dotted gray;
     border-bottom: 16px dotted gray;
     border-left: 16px dotted gray;
     width: 80px;
     height: 80px;
     -webkit-animation: spin 2s linear infinite;
     animation: spin 2s linear infinite;
   }
   
   @-webkit-keyframes spin {
     0% { -webkit-transform: rotate(0deg); }
     100% { -webkit-transform: rotate(360deg); }
   }
   
   @keyframes spin {
     0% { transform: rotate(0deg); }
     100% { transform: rotate(360deg); }
   }
   
   /* CSS 로딩화면 구현 끝 */
   
   
   
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
	
	span.error{
		display: block;
		font-size: 10pt;
		margin-bottom: 15px;
		color:red;
	}
	
	
	.link_tag{
		font-size: 11pt;
		color: black;
		text-decoration: underline;
	}
	
	
	input.input_style, select{
		margin-bottom: 20px;
		width: 100%;
		height: 40px;
		border: 1px solid black;
		font-size: 10pt;
		text-indent: 10px;
	}
	
	button.button1{
		cursor: pointer;
		width: 110px;
		height: 40px;
		margin-left: 5px;
		background-color: black;
		color: white;
		font-size: 10pt;
	}
	
	button.button2{
		cursor: pointer;
		width: 245px;
		height: 40px;
		border: 1px solid black;
		background-color: white;
		color: black;
		font-size: 10pt;
	}
	
	div#box1{
		display:inline-block;
		width: 500px;
		margin-left: 37%;
	}
	
	div#box2{
		display:inline-block;
		width: 350px;
		margin-left: 10%;
		position: fixed;
		top: 250px;
		overflow: auto;
	}
	
	/* 반응형 */
    @media (max-width: 1659px) {
    	div#box1{
    		display:block;
    		margin-left: auto;
    		margin-right: auto;
    	}
        div#box2{
        	position: static;
        	display:block;
        	width: 500px;
        	margin: 100px auto 150px auto;
        }
    }
    
    table {
		width: 100%;
		font-size: 10pt;
	}
	
	.myleft{
		text-align: left;
	}
	
	.myright{
		text-align: right;
	}
	
	tr > td:first-child {
		width: 90px;
	}
	
	img{
		width: 80px;
		height: 100px;
	}
	
	tr.empty_tr{
		height: 70px;
	}
	
	tr.height_tr{
		height: 30px;
	}
	
	tr.top_line{
		border-top: 1px solid gray;
	}
	
	label.labelst, a.labelst{
		font-size: 10pt; 
		padding-left: 10px;
	}
	
	/* a:link    : 방문 전 링크 상태이다.
       a:visited : 방문 후 링크 상태이다.
      a:hover   : 마우스 오버 했을 때 링크 상태이다.
      a:active  : 클릭 했을 때 링크 상태이다.
    */
	
	label.labelst:hover, span.link_tag{
		cursor: pointer;
	}
	
	/* 주문상세 테이블 */
	table#tbl_pay tr{
		height: 30px;
	}
	
	select:hover {
		cursor: pointer;
	}
	
</style>
<!-- Optional JavaScript -->

<script>
	$(document).ready(function(){
		
		
		// css 로딩화면 감춰주기
		   $("div.loader").hide();
		
		// 무통장 감추기
		$("div#account").hide();
		$("span.error").hide();
	
		$("a#3_pay").css('color','black');
	    
	    // 배송지 수정 클릭이벤트(뒤로가기)
	    $("a#goDeliInfo").click(function(){
	    	history.back();
	    });
	    // 뒤로가기 클릭 이벤트 
	    $("button#prev").click(function(){
	    	history.back();
	    });
	    
	    

	    // 장바구니 금액 계산
	    const price = $("span.price").text();
	    const arr_price = price.split(" ");
	    // console.log(arr_price);
	    let sum_price = 0;
	    
	    arr_price.forEach(element => {
	    	if(element.trim() !=""){
	    		sum_price += Number(element);
	    	}
	    });
	    
	    if($("input[name='usePoint']").val().trim() != null){
	    	sum_price -= Number($("input[name='usePoint']").val());
	    }
	    $("span#sum_price").text(sum_price.toLocaleString('en')+"원");
	    // 나중에 식계산 바꿔야해!!
	    $("span#result").text(sum_price.toLocaleString('en')+"원");
	 	// end of 장바구니 금액 계산
	 	
	 	
	 	// 총수량 구하기 qty_sum
	 	const qty = $("span.qty").text();
	    const arr_qty = qty.split(" ");
	    // console.log(arr_price);
	    let sum_qty = 0;
	    
	    arr_qty.forEach(element => {
	    	if(element.trim() !=""){
	    		sum_qty += Number(element);
	    	}
	    });
	    $("span#qty_sum").text(sum_qty);
	 	// end of 총수량 구하기 qty_sum
	 	
	 	
	    
	    // 결제방법 클릭 이벤트
	    $("input:radio[name='payment']").click(function(e){
	    	$("div#account").hide();
	    	
	    	//console.log($("input:radio[name='payment']:checked").val());
	    	if($("input:radio[name='payment']:checked").val()=="account"){
	    		$("div#account").show();
	    	}
	    }); // end of 결제방법 클릭 이벤트
	    
	    
	    
	    // 비회원 주문이라면! 적립금 결제 숨겨주기
	    const lguser ="${sessionScope.loginuser.userid}";
	    if(lguser==""){
	    	$("div#guestHidden").hide();
	    } else {
	    	$("div#guestHidden").show();
	    }
	    
	    // 적립금 클릭이벤트 
	    $("a#all_point").click(function(e){
	    	$("span#error1").text('');
	    	const all_point = $(e.target).html();
	    	// console.log(all_point);
	    	$("input[name='usePoint']").val(all_point);
	    	$("span#usePoint").text('-'+all_point.toLocaleString('en')+"원");
	    	
	    	let n = 0;
	    	
	    	// 전체금액 구하기
	    	if($("input[name='usePoint']").val().trim() != null){
	    		n  =Number($("span#sum_price").text().slice(0,-1).split(",").join(""))- Number($("input[name='usePoint']").val());
		    }
		    // 나중에 식계산 바꿔야해!!
		    $("span#result").text(n.toLocaleString('en')+"원");                   // 할인 넣어줘야해
	    	
	    });//end of 적립금 클릭이벤트 
	    
	    
	    // 적립금 입력 키업 이벤트
	    $("input[name='usePoint']").keyup(function(){
	    	
	    	const this_point = $("input[name='usePoint']").val();
	    	$("span#error1").text('');
	    	
	    	if (isNaN(this_point)) {
	    	    //alert('숫자만 입력 가능합니다');
	    	    $("span#error1").text('숫자만 입력 가능합니다');
	    		$("input[name='usePoint']").val('');
	    	} else if(Number(this_point)>$("a#all_point").html()) {
	    		//alert("입력하신 금액이 사용 가능한 금액보다 큽니다@@@@");
	    		$("span#error1").text('입력하신 금액이 사용 가능한 금액보다 큽니다');
	    		$("input[name='usePoint']").val('');
	    	} 
	    }); // end of 적립금 입력 키업 이벤트
	    
	    
	    // 적립금 변동 있을때마다 테이블쪽에 금액도 바꿔주기
	    $("input[name='usePoint']").change(function(){
	    	const val = $("input[name='usePoint']").val().trim();
	    	if(val!=""){
	    		$("span#usePoint").text('-'+val.toLocaleString('en')+"원");
	    	} else {
	    		$("span#usePoint").text(0);
	    	}
	    	let n = 0;
	    	// 전체금액 구하기
	    	if($("input[name='usePoint']").val().trim() != null){
	    		n =Number($("span#sum_price").text().slice(0,-1).split(",").join(""))- Number($("input[name='usePoint']").val());
		    }
		    // 나중에 식계산 바꿔야해!!
		    $("span#result").text(n.toLocaleString('en')+"원");                     // 할인 넣어줘야해
	    	
	    });// end of 적립금 변동 있을때마다 테이블쪽에 금액도 바꿔주기
	    
	    
	    // 체크박스 전체선택 이벤트
	    $("input#agree_all").click(function(){
	    	if($("input#agree_all").prop("checked")){ // 전체체크
	    		$("input:checkbox").prop("checked",true);
	    	} else { //전체 해제
	    		$("input:checkbox").prop("checked",false);
	    	}
	    });// end of 체크박스 전체선택 이벤트
	    
	    
	    // 체크 박스 1나 해제 하면 전체선택도 해제되는 이벤트
	    $("input:checkbox").click(function(){
	    	if($("input:checkbox:checked").length == 6){
	    		$("input#agree_all").prop("checked",true);
	    	} else {
	    		$("input#agree_all").prop("checked",false);
	    	}
	    });// end of 체크 박스 1나 해제 하면 전체선택도 해제되는 이벤트
	    
	    
	    
	    // 은행선택 체인지 이벤트
	    $("select[name='refundbank']").change(function(e){
	    	$("span.error").hide();
	    	
	    	if($("select[name='refundbank']").val() == 0){
	    		$(e.target).next().show();
    			return;
    		}
	    }); // end of 은행선택
	    
	    
	    
	 // 계좌번호 작성 이벤트
		$("input[name='refundacc']").blur((e)=>{
			const $target = $(e.target);
			
			// 정규표현식으로 한번 걸러줄거임
			// const reqExp = /^[1-9][0-9]{2,3}$/g;
			// 또는
			const regExp = new RegExp(/^[0-9]{10,18}$/g);
			// 숫자 10~18자리만 들어오도록 검사해주는 정규표현식
			
			const bool = regExp.test($target.val()); // 정규 표현식에 값을 집어넣음
			
			if(!bool){ // 전화번호가 정규표현식에 위배된 경우 나머지 블락은 전부 못쓰게 막을거임
				// 이 테이블 태그에 있는 모든 input 태그
				$target.val('');
				$target.next().show();
				return;
				
			} else { // 계좌번호가 정규표현식에 맞는 한경우 
				$target.next().hide();
			}
		}); // end of 계좌번호 작성 blur 이벤트
		
		
		// 계좌주명 작성이벤트
		$("input[name='accname']").blur((e)=>{
			const $target = $(e.target);
			
			if($target.val().trim() ==""){ // 비어있다면
				$target.val('');
				$target.next().show();
				return;
				
			} else { 
				$target.next().hide();
			}
		}); // end of 계좌주명 작성이벤트
	    
	    
		
		
	    
	     
	    // 결제하기 버튼 클릭이벤트 // 결제방법 선택 안했으면 안넘어가게 만들어야... // 체크박스 필수사항 조회하기
	    $("button#purchase").click(function(){
	    	
	    	// 결제방법 선택 했는지
	    	if($("input:radio:checked").length!=1){
	    		alert("결제 방법을 선택하세요");
	    		return;
	    	}
	    	
	    	// 체크박스 필수 사항 체크했는지
	    	if($("input:checkbox[class='reqired']:checked").length<3){
	    		alert("필수동의 사항에 모두 체크하셔야 주문 가능합니다");
	    		return;
	    	}
	    	
	    	// 카드 결제일때
	    	if($("input:radio[name='payment']:checked").val()=="card"){
	    		
	    		goPurchase();
	    		
	    		
	    	// 무통장일때	
	    	} else if ($("input:radio[name='payment']:checked").val()=="account"){ 
	    		
	    		
	    		// 환불 입력했는지 확인해줘야함
	    		if($("select[name='refundbank']").val() == 0){
	    			$("select[name='refundbank']").next().show();
	    			$("select[name='refundbank']").focus();
	    			return;
	    		}
	    		
	    		// 계좌번호 입력했는지
	    		if($("input[name='refundacc']").val().trim() == ""){
	    			$("input[name='refundacc']").next().show();
	    			$("input[name='refundacc']").focus();
	    			return;
				}
	    		
	    		
	    		// 계좌주명 입력했는지
	    		if($("input[name='accname']").val().trim() == ""){
	    			$("input[name='accname']").next().show();
	    			$("input[name='accname']").focus();
	    			return;
				}
	    		
	    		// css 로딩화면 보여주기
	    		$("div.loader").show();
	    		
	    		// 총결제 금액 넘겨줘여함
	    		// 총결제 금액 넘겨줘여함
				let result = $("span#result").text().slice(0,-1).split(",").join("");
				result = Number(result);
				$("input[name='result']").val(result);
	    		
	    		const frm = document.frmPayInfo;
	    	
	    		frm.method = "POST";
	    		frm.action ="<%=ctxPath %>/order/CashpurchaseEnd.sun";
	    		frm.submit();
	    		
	    	}
	    });// end of 결제하기 버튼 클릭이벤트
	    
	}); // end of ready
	
	
	// 서비스 가입사실 클릭 이벤트 (나중에 모달로 바꾸장)
	function click_service(){
		
		const pop_width = 1015;
		const pop_height = 560;
		const pop_left = Math.ceil((window.screen.width-pop_width)/2);
		const pop_top = Math.ceil((window.screen.height-pop_height)/2);
		
		window.open("<%=ctxPath %>/images/money_service.png", "MyPopup" // 팝업창 안에 들어갈 내용물 // 직접쓰던가 파일네임
                , "left="+pop_left+"px, top="+pop_top+"px, width="+pop_width+"px, height="+pop_height+"px"); 
	} // end of 서비스 가입사실 클릭 이벤트
	
	
	// 카드 결제 함수
	function goPurchase(){
		
		// 총결제 금액 넘겨줘여함
		let result = $("span#result").text().slice(0,-1).split(",").join("");
		result = Number(result);
		$("input[name='result']").val(result);
		
		
		const frm = document.frmPayInfo;
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		const pop_width = 845;
		const pop_height = 625;
		const pop_left = Math.ceil((window.screen.width-pop_width)/2);
		const pop_top = Math.ceil((window.screen.height-pop_height)/2);
		
		//window.open(url, "Purchase",
		//			"left="+pop_left+"px, top="+pop_top+"px, width="+pop_width+"px, height="+pop_height+"px");
		
		var pop = window.open;
		pop("", "Purchase","left="+pop_left+"px, top="+pop_top+"px, width="+pop_width+"px, height="+pop_height+"px");
		
		frm.action = "<%=ctxPath %>/order/purchase.sun";
		frm.target = "Purchase";
		frm.method = "post";
		frm.submit();
	}
	
	
	// 카드결제 완료시 페이지 이동함수
	function goPurchaseEnd(){
		
		
		// css 로딩화면 보여주기
		$("div.loader").show();
		
		const usePoint = $("input[name='usePoint']").val();
		
		const frm = document.frm_usePoint;
    	
		frm_usePoint.usePoint.value = usePoint;
		
		frm.method = "POST";
		frm.action = "<%=ctxPath %>/order/CardpurchaseEnd.sun";
		frm.submit();
		
	}
	
	
</script>

	<div class="container-fluid" style="margin-top:120px; margin-bottom:120px;">
	
	<%-- 결제구역 시작 --%>
	<div id="box1" >
		<form name="frmPayInfo" >
			<span class="boldtxt mb-4">결제 방법</span>
			<div class="border-bottom"></div><br>
			<span class="puretxt my-4">원하시는 결제 방법을 선택해주세요.</span>
			
			<%-- 라디오 시작 --%>
			<input type="radio" name="payment" id="card" value="card"><label class="labelst" for="card">신용카드</label><br>
			<input type="radio" name="payment" id="account" value="account"><label class="labelst" for="account">무통장 입금</label><br>
			<%-- 라디오 끝 --%>
			
			<%-- 적립금 사용 --%>
			<%-- <c:if test="${not empty sessionScope.loginuser }"> --%>
			<div id ='guestHidden'>
				<span class="puretxt my-4">적립금 및 포인트 사용</span>
				<span class="puretxt my-2">사용 가능한 적립금 + 포인트 : <a class="link_tag" id="all_point">${loginuser.coin + loginuser.point }</a> 원</span>
				<input type="text" name="usePoint" class="input_style" placeholder="사용하실 금액을 입력하세요"/>
				<span class="error" id="error1"></span>
			</div>
			<%--</c:if> --%>
			<%-- 무통장 입급 등장메뉴 --%>
			<div id="account">
				<br><div class="border-bottom my-3"></div><br>
				
				<span class="puretxt mb-3">잔액환불 원하는 계좌 정보를 입력해주세요</span>
				<span class="puretxt">환불 계좌 은행명</span>
				<select  class="myselect" name="refundbank" >
					<option value="0" selected>은행명선택</option> 
                    <option>카카오뱅크</option>
                    <option>농협</option>
                    <option>우리</option>
                    <option>신한</option>
                    <option>하나</option>
	            </select>
				<span class="error">환불계좌 은행을 선택해주세요</span>
				
				<span class="puretxt">환불 계좌번호</span>
				<input type="text" name="refundacc" class="input_style" placeholder="환불 계좌번호"/>
				<span class="error">환불 계좌번호는 '-' 없이 숫자로만 입력해주세요</span>
				
				<span class="puretxt">계좌주명</span>
				<input type="text" name="accname" class="input_style" placeholder="계좌주명"/>
				<span class="error">계좌주명을 입력하세요</span>
				
				<input type="hidden" name="result" />
				
			</div>
			<%-- 무통장 입금 등장메뉴 끝 --%>
			
			<br>
			<span class="puretxt by-5" style="color: gray;">채무지급보증안내 - 고객님의 안전한 현금자산 거래를 위하여 하나은행과 채무지급보증계약을 체결하여 보장해드리고 있습니다.</span>
			<span class="link_tag" onclick="click_service()">서비스 가입사실 확인</span><br><br><br><br>
		

			<%-- 주문상세 시작 --%>
			<span class="boldtxt mb-4">주문상세</span>
			<span class="puretxt mb-3">이메일</span>
			<span class="puretxt">${sessionScope.ovo.email }</span>
			
			<table class="my-4" id="tbl_pay">
				<thead>
					<tr style="height: 40px;">
						<td style="font-weight: bold; font-size: 11pt;">배송</td>
						<td class="myright"><strong><a class="link_tag" id="goDeliInfo">수정</a></strong></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 250px;">배송주소</td>
						<td>전화번호</td>
					</tr>
					<tr>
						<td style="width: 250px;">${sessionScope.ovo.name }</td>
						<td>${sessionScope.ovo.mobile }</td>
					</tr>
					<tr>
						<td colspan="2">${sessionScope.ovo.address }</td>
					</tr>
					<tr>
						<td colspan="2">${sessionScope.ovo.detailaddress }</td>
					</tr>
					<tr>
						<td colspan="2">${sessionScope.ovo.postcode }</td>
					</tr>
					<tr>
						<td colspan="2"> </td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">배송사</td>
					</tr>
					<tr>
						<td colspan="2">CJ대한통운</td>
					</tr>
				</tfoot>
			</table> <br>
			<%-- 주문상세 끝 --%>
			
			
			<%-- 체크박스 시작 --%>
			<div class="my-3">
				<input id="agree_all" type="checkbox" /><label for="agree_all" class="labelst">전체동의</label><br>
				<input type="checkbox" class="reqired" /><label for="agree_1" class="labelst">[필수]만14세이상입니다</label><br>
				<input type="checkbox" class="reqired" /><label><a href="https://www.gentlemonster.com/kr/legal/terms" class="link_tag labelst">[필수]이용약관동의</a></label><br>
				<input type="checkbox" class="reqired" /><label><a href="https://www.gentlemonster.com/kr/legal/privacy_collect?case=shipping_address_nonmemeber" class="link_tag labelst">[필수]개인정보 수집 및 이용동의</a></label><br>
				<input type="checkbox" /><label><a href="https://www.gentlemonster.com/kr/legal/privacy_collect_marketing?case=shipping_address_nonmemeber" class="link_tag labelst">[선택]마켓팅목적 개인정보 수집 및 이용동의</a></label><br>
				<input type="checkbox" /><label><a href="https://www.gentlemonster.com/kr/legal/marketing_consent" class="link_tag labelst">[선택]마켓팅정보수신 및 활용동의</a></label><br>
			</div>
			<%-- 체크박스 끝 --%>
			
			<br><br>
			<button type="button" class="button2" id="prev">이전 단계로</button>
			<button type="button" class="button1" id="purchase" style="width: 245px;">결제</button>
		</form>
	</div>
	<%-- 결제구역 끝 --%>
	
	
	<%-- 장바구니 시작 --%>
	<div id="box2">
		<table>
			<thead>
				<tr>
					<td style="font-weight: bold; font-size: 11pt;">주문내역</td>
					<td colspan="2" class="myright"><strong><a href="<%=ctxPath %>/order/cart.sun" class="link_tag">수정</a></strong></td>
				</tr>
				<tr style="height: 50px;">
					<td> 상품</td>
					<td colspan="2" class="myright">가격</td>
				</tr>
			</thead>
			<tbody>
				<%-- 반복시작 --%>
				<c:if test="${ not empty ordertList }">
					<c:forEach items="${ordertList }" var="order">
						<tr>
							<td rowspan="3" style="vertical-align: top; text-align: center;"><img src="<%= ctxPath %>/images/common/products/${order.allProdvo.pimage1}"></td>
							<td style="font-weight: bold;">${order.allProdvo.parentProvo.pname} ${order.allProdvo.colorName}</td>
							<td class="myright">상품가격</td>
						</tr>
						<tr>
							<td>수량:<span class="qty"> ${order.qty}</span></td>
							<td class="myright"><span class="price"> ${order.allProdvo.parentProvo.price * order.qty}</span>원</td>
						</tr>
						<tr class="empty_tr">
							<td colspan="3" class="empty_td"></td>
						</tr>
					</c:forEach>
				</c:if>
				<%-- 반복끝 --%>
				
			</tbody>
			<tfoot>
				<tr class="height_tr top_line">
					<td>상품합계</td>
					<td colspan="2" class="myright"><span id="sum_price"></span></td>
				</tr>
				<tr class="height_tr"  id="guestHidden">
					<td>적립금 사용</td>
					<td colspan="2" class="myright"><span id="usePoint">0원</span></td>
				</tr>
				<tr class="height_tr">
					<td>할인금액</td>
					<td colspan="2" class="myright">0원</td>
				</tr>
				<tr class="height_tr">
					<td>배송비</td>
					<td colspan="2" class="myright">0원</td>
				</tr>
				<tr style="height: 50px;" class="top_line">
					<td>총합계</td>
					<td>수량: <span id="qty_sum"></span></td>
					<td class="myright"><span id="result"></span></td>
				</tr>
			</tfoot>
		</table>
	</div>
	<%-- 장바구니 끝 --%>
</div>

<div class="loader"></div>


<%-- ================== --%>
<form name="frm_usePoint">
   <input type="text" name="usePoint" value="" style="display: none;" />
   <input type="text" style="display: none;" />
</form>
	
<jsp:include page="../common/footer.jsp" />