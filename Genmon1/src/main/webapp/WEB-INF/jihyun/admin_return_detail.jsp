<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>주문 상세</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<!-- 폰트 -->
<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">

<style type="text/css">

	* {font-family: 'Pretendard', sans-serif; !important}

	span.boldtxt{
		display: block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	.boldtxt2{
		display: block;
		font-weight: bold;
		font-size: 10pt;
		margin-bottom: 6px;
	}
	
	.puretxt{
		display: block;
		font-size: 10pt;
		margin-bottom: 6px;
	}
	
	div.tbl_box{
		width: 100%;
		height: 180px;
	}
	
	table {
		width: 90%;
		margin : 7px auto;
		/* border : 1px solid black; */
		font-size: 10pt;
		/* vertical-align: top; */
		text-align: center;
	}
	
	td {
		/* border-collapse:collapse;
		border : 1px solid black; */
	}
	
	tr{
		height: 20px;
	}
	
	.myleft{
		padding-left : 10px;
		text-align: left;
	}
	
	.myright{
		width : 25%;
		padding-right : 10px;
		text-align: right;
	}
	
	td.image{
		width: 40%;
		height: 130px;
	}
	
	span.tf_span {
		display:inline-block;
		width: 360px;
		height: 25px;
	}
	
	img.image{
		padding : auto 10px;
		width: 110px;
		height: 120px;
	}
	
	ul{padding-left: 15px;}
	
	li {
		font-size: 10pt;
		list-style-type: none;
		margin-bottom: 7px;
		/* border : 1px solid black; */
	}
	
	span.list_span{
		/* border : 1px solid black; */
		display: inline-block;
		width: 100px;
		font-weight: bold;
	}
	
	select#sort{
		margin-bottom: 5px;
		width: 120px;
		height: 35px;
		border: 1px solid black;
		font-size: 10pt;
		text-indent: 15px;
		margin-left :10px;
	}
	
	select#sort:hover{
		cursor: pointer;
	}
	
	
	input#tracking {
		display :inline-block;
		width: 300px;
		height: 35px;
		margin-left :10px;
		border: 1px solid black;
		font-size: 10pt;
		text-indent: 10px;
	}
	
	div#btn{	
		width: 90%;
		margin: auto;
	}
	
	/* button {
		margin-bottom: 30px;
		width: 45%;
		height: 35px;
		font-size: 10pt;
		border: 1px solid black;
		background: white;
		color: black;
	} */
	
	button {
		width: 50%;
		margin: 5px 20%;
		background: black;
		color: white;
		font-weight: bold;
	}
	
	div#txtbox{
		display: inline;
		width: 70%;
	}
	
	
</style>

<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	// 환불 금액알아오기
	let total_price = 0;
	$("td.price").each(function () {
			
		total_price+=Number($(this).text());
	});
	$("span#refundTotal").text(total_price.toLocaleString('en'));
	
	// 배송완료만 배송정보 조회해오기
	var  refund_status = "${refundOrderInfo.refund_status}" ;
	
	if(refund_status!=1){
		
		var orderid = "${refundOrderInfo.pk_orderid }" ;
		
		$.ajax({
			url : "<%= ctxPath%>/myinfo/deliInfo.sun" , 
			type: "POST",  
			data: {"orderid":orderid,
				"deliv_class":2},
		    dataType:"JSON",
		    success:function(json) {
		    	// alert(json.deliv_company);
		    	html ='<li>배송완료 ('+json.deliv_date+')</li><li>'+json.deliv_company+' '+json.tracking_number+' </li>';
		    	$("ul#tracking").html(html);
		    },
		    error: function(request, status, error){
				//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); 
	}
	
	//console.log('ㅎㅎ');
	// 운송장 입력 유효성 검사
	$("input:text.input_style").blur(function(e){
		const $target = $(e.target);
		const regExp = new RegExp(/^[0-9]{10,13}$/g);
		
		const bool = regExp.test($target.val()); // 정규 표현식에 값을 집어넣음
		
		if(!bool){ 
			$target.val('');
			$target.css('border', '1px solid red');
			return;
			
		} else { // 제대로 입력했다면
			// 자동으로 체크
			$target.css('border', '1px solid gray');
		}
	}); //end of  운송장 입력 유효성 검사
	
	
	
	// 운송장 일괄등록 버튼 클릭이벤트
	$("button#btn_tracking_num").click(function(){
		
		let arr = [];
		let arr2 = [];
		let arr3 = [];
		let arr4 = [];
		
		if( $("input:text.input_style").val()!= "") { 

			const track = $("input:text.input_style").val();
			const company = $("select").val();
			const orderstatus = "3";
			var ck_val = "${refundOrderInfo.pk_orderid }";
			
			arr.push(ck_val);
			arr2.push(track);
			arr3.push(company);
			arr4.push(orderstatus);
				
			const arrjoin = arr.join(",");
			const arrjoin2 = arr2.join(",");
			const arrjoin3 = arr3.join(",");
			const arrjoin4 = arr4.join(",");
			
			console.log(arrjoin);
			console.log(arrjoin2);
			console.log(arrjoin3);
			console.log(arrjoin4);
			
			$.ajax({
				url : "<%= ctxPath%>/admin/adminRegisterTracking.sun" , 
				type: "POST",  
				data: {"orderidjoin":arrjoin,
						"trackjoin":arrjoin2,
						"companyjoin":arrjoin3,
						"orderstatusjoin":arrjoin4},
						
			    dataType:"text",
			    success:function(json) {
			    	
			    	alert('운송장이 등록되었습니다');
			    	window.location.reload(true);
			    },
			    error: function(request, status, error){
					//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			}); 
			
		} else { // 체크박스 선택 안한 경우
			alert('운송장번호를 비워둘 수 없습니다');
			return;
		}
	}); // end of 운송장 일괄등록 버튼 클릭이벤트
	
	
	
	// 주문환불 클릭 이벤트 
	$("button#btn_check_refund").click(function(){
		
		var orderid = "${refundOrderInfo.pk_orderid }" ;
		
		let arr = [];
		
		$("td.pnum").each(function () {
			
			arr.push($(this).text());
		});
		
		const arrjoin = arr.join(",");
		
		
		$.ajax({
			url : "<%= ctxPath%>/admin/adminCheckRefund.sun" , 
			type: "POST",  
			data: {"orderid":orderid,
				"pnumjoin":arrjoin},
		    dataType:"JSON",
		    success:function(json) {
		    	
		    	if(json.result!=0){
		    		alert('주문 환불을 완료했습니다.');
			    	window.location.reload(true);
		    	}
		    	
		    },
		    error: function(request, status, error){
				//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); 
		
		
	});// end of 입급확인 클릭 이벤트 
	
	
}); // end of ready 

</script>

</head>
<body>
	<div style="width: 80%; margin: 0 auto;">
		<span class="boldtxt my-4">반품상세</span>
		<span class="boldtxt2 mb-2">주문번호 ${refundOrderInfo.pk_orderid }</span>
		<%-- 반복 시작 --%>
		<c:forEach var="orderRefundmap" items="${orderRefundMapList }">
		<div class="border tbl_box mb-2" >
			<table>
				<tbody>
					<tr>
						<td rowspan="6" class="image"><img src="<%=ctxPath %>/images/common/products/${orderRefundmap.pimage1 }" class="image"></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>주문 상세번호</td>
						<td class="myleft">${orderRefundmap.pk_order_detail_id }</td>
					</tr>
					<tr>
						<td>상품명</td>
						<td class="myleft">${orderRefundmap.pname } ${orderRefundmap.pcolor }</td>
					</tr>
					<tr>
						<td>품번</td>
						<td class="myleft pnum">${orderRefundmap.pnum }</td>
					</tr>
					<tr>
						<td>가격</td>
						<td class="myleft price">${orderRefundmap.order_price }</td>
					</tr>
					<tr></tr>
				</tbody>
			</table>
		</div>
		</c:forEach>
		<%-- 반복 끝 --%>
		
		
		<span class="boldtxt2 mt-4">반품사유</span>
		<span class="puretxt border" style="display: inline-block; width: 80%; margin: 5px 10%; padding: 15px;">
		${refundOrderInfo.reason }
		</span>
		<span class="boldtxt2 my-3">환불 정보</span>
		<ul>
			<li><span class="list_span">환불신청일 </span> ${refundOrderInfo.start_day }</li>
			<li><span class="list_span">환불금 </span><span id="refundTotal"></span>원</li>
			<li><span class="list_span">받는분 </span> ${refundOrderInfo.name }</li>
			<li><span class="list_span">휴대폰번호 </span> ${refundOrderInfo.mobile }</li>
			<li style="margin-bottom: 2px;"><span class="list_span">배송지 </span> ${refundOrderInfo.address }</li>
			<li style="margin-bottom: 2px;"><span class="list_span"> </span> ${refundOrderInfo.detailaddress }</li>
			<li><span class="list_span"> </span> ${refundOrderInfo.extraaddress } ${refundOrderInfo.postcode }</li>
		</ul>
		
		<%-- 구분선 --%>
		<c:if test="${refundOrderInfo.refund_status eq 1}">
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">배송등록</span>
		<select id="sort">
			<option value="cj" selected>CJ대한통운</option> 
	        <option value="lozen">로젠</option>
	        <option value="lotte">롯데</option>
	        <option value="hanjin">한진</option>
	        <option value="post_office">우체국택배</option>
		</select>
		<input type="text" id="tracking" class="input_style" placeholder="송장번호를 입력하세요" />
		
		<label class="puretxt ml-3 my-3"><input type="checkbox" /> 배송비 고객부담</label>
		
		<button type="button" id="btn_tracking_num">운송장 등록</button>
		</c:if>
		<%-- 구분선 --%>
		<c:if test="${refundOrderInfo.refund_status eq 2}">
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">배송정보</span>
		<ul class="mb-5" id="tracking">
		</ul>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-4">환불 정보</span>
		<c:if test="${ empty purvomap.bank}">
				<ul class="mb-3">
					<li>카드사 환불</li>
				</ul>
			</c:if>
			<c:if test="${ not empty purvomap.bank}">
				<ul class="mb-3">
					<li>${purvomap.bank} ${purvomap.accnum}</li>
					<li>${purvomap.accname}</li>
				</ul>
			</c:if>
		<button type="button" id="btn_check_refund" class="mb-3">환불 완료</button>
		</c:if>
		<%-- 구분선 --%>
		<c:if test="${refundOrderInfo.refund_status eq 3}">
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-4">주문환불 정보</span>
		<ul class="mb-5">
			<li>환불완료일</li>
			<li>${refundOrderInfo.end_day }</li>
		</ul>
		</c:if>
		<%-- 구분선 --%>
		
		
	</div>
</body>
</html>