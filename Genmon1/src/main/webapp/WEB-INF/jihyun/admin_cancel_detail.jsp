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
	
	span.puretxt{
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
		margin-bottom: 20px;
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
	
	
	input {
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
	
	button {
		margin-bottom: 30px;
		width: 45%;
		height: 35px;
		font-size: 10pt;
		border: 1px solid black;
		background: white;
		color: black;
	}
	
	button#btn_2 {
		width: 60%;
		margin: 5px 20%;
		background: black;
		color: white;
		font-weight: bold;
	}
	
	
	
</style>

<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script type="text/javascript">


	// 주문 환불 완료 버튼 클릭이벤트
	function cancelOrder() {
		var orderid = "${odervo.pk_orderid }" ;
		
		let arr = [];
		
		$("td.pnum").each(function () {
			
			arr.push($(this).text());
		});
		
		const arrjoin = arr.join(",");
		
		console.log(arrjoin);
		
		$.ajax({
			url : "<%= ctxPath%>/admin/adminCheckCanecelOrder.sun" , 
			type: "POST",  
			data: {"orderid":orderid,
				"pnumjoin":arrjoin},
		    dataType:"JSON",
		    success:function(json) {
		    	
		    	if(json.result!=0){
		    		alert('주문취소 환불을 완료했습니다.');
			    	window.location.reload(true);
		    	}
		    	
		    },
		    error: function(request, status, error){
				//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});  
	} // 주문 환불 완료 버튼 클릭이벤트
	
</script>

</head>
<body>
	<div style="width: 80%; margin: 0 auto;">
		<span class="boldtxt my-3">주문취소상세 ${odervo.pk_orderid }</span>
		<span class="boldtxt2 mb-2">주문상품 (${totalqty })</span>
		<%-- 반복 시작 --%>
		<c:forEach var="orddtailvo" items="${orddtailList }">
		<div class="border tbl_box mb-2" >
			<table>
				<tbody>
					<tr>
						<td rowspan="6" class="image"><img src="<%=ctxPath %>/images/common/products/${orddtailvo.cpvo.pimage1 }" class="image"></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td class="myleft">${orddtailvo.cpvo.parentProvo.pname } ${orddtailvo.cpvo.colorName }</td>
					</tr>
					<tr>
						<td>품번</td>
						<td class="myleft pnum">${orddtailvo.fk_pnum }</td>
					</tr>
				</tbody>
			</table>
		</div>
		</c:forEach>
		
		<%-- 반복 끝 --%>
		
		<c:if test="${total_status eq 0}">
			<div class="border-bottom mt-4"></div>
			<span class="boldtxt2 my-4">결제정보</span>
			<ul>
				<li><span class="list_span">총금액 </span><fmt:formatNumber value="${purvomap.purvo.paymentAmount}"></fmt:formatNumber>원</li>
				<li><span class="list_span">적립금 사용 </span><fmt:formatNumber value="${purvomap.purvo.usedCoin + purvomap.purvo.usedPoint }"></fmt:formatNumber>원</li>
				<li style="text-decoration: underline;"><span class="list_span">환불금액 </span><fmt:formatNumber value="${purvomap.purvo.paymentAmount -(purvomap.purvo.usedCoin + purvomap.purvo.usedPoint) }"></fmt:formatNumber>원</li>
				
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
			<button type="button" id="btn_2" onclick="cancelOrder()" class="mb-3">환불 완료</button>
		</c:if>
		<%-- 구분선 --%>
		
		<c:if test="${total_status eq 7 or total_status eq 9}">
			<div class="border-bottom mt-4"></div>
			<span class="boldtxt2 my-4">주문 취소 정보</span>
			<ul class="mb-5">
				<li>주문취소 완료 </li>
			</ul>
		</c:if>
		<%-- 구분선 --%>
		
		
	</div>
</body>
</html>