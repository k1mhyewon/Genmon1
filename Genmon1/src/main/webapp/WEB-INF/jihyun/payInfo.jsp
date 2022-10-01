<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="orderHeader.jsp" />

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
		
		// 무통장 감추기
		$("div#account").hide();
	
		$("a#3_pay").css('color','black');
	    
	    // 배송지 수정 클릭이벤트(뒤로가기)
	    $("a#goDeliInfo").click(function(){
	    	history.back();
	    });
	    // 뒤로가기 클릭 이벤트 
	    $("button#prev").click(function(){
	    	history.back();
	    });
	    
	    
	    // 결제방법 클릭 이벤트
	    $("input:radio[name='payment']").click(function(e){
	    	$("div#account").hide();
	    	
	    	//console.log($("input:radio[name='payment']:checked").val());
	    	if($("input:radio[name='payment']:checked").val()=="account"){
	    		$("div#account").show();
	    	}
	    }); // end of 결제방법 클릭 이벤트
	    
	    
	    
	    // 적립금 클릭이벤트 
	    $("a#all_point").click(function(e){
	    	$("span#error1").text('');
	    	const all_point = $(e.target).html();
	    	// console.log(all_point);
	    	$("input[name='usePoint']").val(all_point);
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
	    	
	    });
	    
	    
	    
	    // 결제하기 버튼 클릭이벤트
	    $("button#purchase").click(function(){
	    	
	    	// 카드 결제일때
	    	if($("input:radio[name='payment']:checked").val()=="card"){
	    		goPurchase();
	    	} else if ($("input:radio[name='payment']:checked").val()=="account"){ // 무통장일때
	    		
	    	}
	    	
	    	
	    });// end of 결제하기 버튼 클릭이벤트
	    
	}); // end of ready
	
	
	// 서비스 가입사실 클릭 이벤트 (나중에 모달로 바꾸장)
	function click_service(){
		window.open("<%=ctxPath %>/images/money_service.png", "MyPopup" // 팝업창 안에 들어갈 내용물 // 직접쓰던가 파일네임
                , "left=300px, top=100px, width=1015px, height=560px"); 
	} // end of 서비스 가입사실 클릭 이벤트
	
	
	// 카드 결제 함수
	function goPurchase(){
		const url = "<%=request.getContextPath()%>/order/purchase.sun";
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		const pop_width = 845;
		const pop_height = 625;
		const pop_left = Math.ceil((window.screen.width-pop_width)/2);
		const pop_top = Math.ceil((window.screen.height-pop_height)/2);
		
		window.open(url, "Purchase",
					"left="+pop_left+"px, top="+pop_top+"px, width="+pop_width+"px, height="+pop_height+"px");
		
		window.open(url, "Purchase",
					"left=350px, top=100px, width=845px, height=625px");
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
			<input type="radio" name="payment" id="kakao" value="kakao"><label class="labelst" for="kakao">카카오페이</label><br>
			<input type="radio" name="payment" id="account" value="account"><label class="labelst" for="account">무통장 입금</label><br>
			<%-- 라디오 끝 --%>
			
			<%-- 적립금 사용 --%>
			<c:if test="${not empty sessionScope.loginuser }">
				<span class="puretxt my-4">적립금 및 포인트 사용</span>
				<span class="puretxt my-2">사용 가능한 적립금 + 포인트 : <a class="link_tag" id="all_point">${loginuser.coin + loginuser.point }</a></span>
				<input type="text" name="usePoint" class="input_style" placeholder="사용하실 금액을 입력하세요"/>
				<span class="error" id="error1"></span>
			</c:if>
			<%-- 무통장 입급 등장메뉴 --%>
			<div id="account">
				<br><div class="border-bottom my-3"></div><br>
				
				<span class="puretxt mb-3">잔액환불 원하는 계좌 정보를 입력해주세요</span>
				<span class="puretxt">환불 계좌 은행명</span>
				<select  class="myselect">
					<option value="0" selected>은행명선택</option> 
                    <option value="kakao">카카오뱅크</option>
                    <option value="nong">농협</option>
                    <option value="woori">우리</option>
                    <option value="shinhan">신한</option>
                    <option value="hana">하나</option>
	            </select>
				
				<span class="puretxt">환불 계좌번호</span>
				<input type="text" name="" class="input_style" placeholder="환불 계좌번호"/>
				<span></span>
				
				<span class="puretxt">계좌주명</span>
				<input type="text" name="" class="input_style" placeholder="계좌주명"/>
				<span></span>
			</div>
			<%-- 무통장 입금 등장메뉴 끝 --%>
			
			<br>
			<span class="puretxt by-5" style="color: gray;">채무지급보증안내 - 고객님의 안전한 현금자산 거래를 위하여 하나은행과 채무지급보증계약을 체결하여 보장해드리고 있습니다.</span>
			<span class="link_tag" onclick="click_service()">서비스 가입사실 확인</span><br><br><br><br>
		

			<%-- 주문상세 시작 --%>
			<span class="boldtxt mb-4">주문상세</span>
			<span class="puretxt mb-3">이메일</span>
			<span class="puretxt">${requestScope.ovo.email }</span>
			
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
						<td style="width: 250px;">${requestScope.ovo.name }</td>
						<td>${requestScope.ovo.mobile }</td>
					</tr>
					<tr>
						<td colspan="2">${requestScope.ovo.address }</td>
					</tr>
					<tr>
						<td colspan="2">${requestScope.ovo.detailaddress }</td>
					</tr>
					<tr>
						<td colspan="2">${requestScope.ovo.postcode }</td>
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
				<input id="agree_1" type="checkbox" /><label for="agree_1" class="labelst">[필수]만14세이상입니다</label><br>
				<input id="agree_2" type="checkbox" /><label><a href="#" class="link_tag labelst">[필수]이용약관동의</a></label><br>
				<input id="agree_3" type="checkbox" /><label><a href="#" class="link_tag labelst">[필수]개인정보 수집 및 이용동의</a></label><br>
				<input id="agree_4" type="checkbox" /><label><a href="#" class="link_tag labelst">[선택]마켓팅목적 개인정보 수집 및 이용동의</a></label><br>
				<input id="agree_5" type="checkbox" /><label><a href="#" class="link_tag labelst">[선택]마켓팅정보수신 및 활용동의</a></label><br>
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
				<tr>
					<td rowspan="3" style="vertical-align: top; text-align: center;"><img src="<%=ctxPath %>/images/sun_img.png"></td>
					<td style="font-weight: bold;">상품명</td>
					<td class="myright">상품가격</td>
				</tr>
				<tr>
					<td>수량:1</td>
					<td class="myright">37826원</td>
				</tr>
				<tr class="empty_tr">
					<td colspan="3" class="empty_td"></td>
				</tr>
				<%-- 반복끝 --%>
				<tr>
					<td rowspan="3" style="vertical-align: top; text-align: center;"><img src="<%=ctxPath %>/images/sun_img.png"></td>
					<td style="font-weight: bold;">상품명</td>
					<td class="myright">상품가격</td>
				</tr>
				<tr>
					<td>수량:1</td>
					<td class="myright">37826원</td>
				</tr>
				<tr class="empty_tr">
					<td colspan="3" class="empty_td"></td>
				</tr>
				<tr>
					<td rowspan="3" style="vertical-align: top; text-align: center;"><img src="<%=ctxPath %>/images/sun_img.png"></td>
					<td style="font-weight: bold;">상품명</td>
					<td class="myright">상품가격</td>
				</tr>
				<tr>
					<td>수량:1</td>
					<td class="myright">37826원</td>
				</tr>
				<tr class="empty_tr">
					<td colspan="3"></td>
				</tr>
				<%-- 반복끝 --%>
			</tbody>
			<tfoot>
				<tr class="height_tr top_line">
					<td>상품합계</td>
					<td colspan="2" class="myright">37826원</td>
				</tr>
				<tr class="height_tr">
					<td>적립금 사용</td>
					<td colspan="2" class="myright" id="usePoint"></td>
				</tr>
				<tr class="height_tr">
					<td>배송비</td>
					<td colspan="2" class="myright">0원</td>
				</tr>
				<tr style="height: 50px;" class="top_line">
					<td>총 결제금액</td>
					<td>수량:10</td>
					<td class="myright">37826원</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<%-- 장바구니 끝 --%>
</div>
	
<jsp:include page="../common/footer.jsp" />