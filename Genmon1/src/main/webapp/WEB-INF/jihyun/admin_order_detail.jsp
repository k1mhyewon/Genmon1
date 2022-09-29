<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>주문 상세</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<style type="text/css">

	span.boldtxt{
		display: block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	span.boldtxt2{
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
		margin-left : 15px;
		background: black;
		color: white;
		font-weight: bold;
	}
	
	
	
</style>

<!-- Optional JavaScript -->
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script type="text/javascript">


</script>

</head>
<body>
	<div style="width: 80%; margin: 0 auto;">
		<span class="boldtxt my-4">주문상세</span>
		<span class="boldtxt2 mb-2">주문상품</span>
		<%-- 반복 시작 --%>
		<div class="border tbl_box mb-2" >
			<table>
				<tbody>
					<tr>
						<td rowspan="5" class="image"><img src="sun_img.png" class="image"></td>
						<td class="myright"></td>
						<td class="myleft"></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td class="myleft">젠몬01</td>
					</tr>
					<tr>
						<td>품명</td>
						<td class="myleft">00004</td>
						
					</tr>
					<tr>
						<td>출고수량</td>
						<td class="myleft">3</td>
					</tr>
					<tr>
						<td class="myright"></td>
						<td class="myleft"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr style="height: 30px;">
						<td colspan="3" style="vertical-align: bottom ;"><span class="tf_span border">재고 수량 : 30</span></td>
					</tr>
				</tfoot>
			</table>
		</div>
		<%-- 반복 끝 --%>
		<div class="border tbl_box mb-2">
			<table>
				<tbody>
					<tr>
						<td rowspan="5" class="image"><img src="sun_img.png" class="image"></td>
						<td class="myright"></td>
						<td class="myleft"></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td class="myleft">젠몬01</td>
					</tr>
					<tr>
						<td>품명</td>
						<td class="myleft">00004</td>
						
					</tr>
					<tr>
						<td>출고수량</td>
						<td class="myleft">3</td>
					</tr>
					<tr>
						<td class="myright"></td>
						<td class="myleft"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr style="height: 30px;">
						<td colspan="3" style="vertical-align: bottom ;"><span class="tf_span border">재고 수량 : 30</span></td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">주문 정보</span>
		<ul>
			<li><span class="list_span">결제일 </span> 2022-09-19 14:20:08</li>
			<li><span class="list_span">받는분 </span> 김지현</li>
			<li><span class="list_span">휴대폰번호 </span> 010-2345-6789</li>
			<li><span class="list_span">배송메모 </span> 빠른배송 해주세요</li>
			<li style="margin-bottom: 2px;"><span class="list_span">배송지 </span> 서울특별시 관악구 청림3마길 28-8</li>
			<li style="margin-bottom: 2px;"><span class="list_span"> </span> 101동 101호</li>
			<li><span class="list_span"> </span> 08732</li>
		</ul>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">배송등록</span>
		<span class="puretxt ml-3">운송장 등록</span>
		<select id="sort">
			<option value="cj" selected>CJ대한통운</option> 
	        <option value="lozen">로젠</option>
	        <option value="lotte">롯데</option>
	        <option value="hanjin">한진</option>
	        <option value="post_office">우체국택배</option>
		</select>
		<input type="text"  placeholder="송장번호를 입력하세요" />
		
		<div id="btn" class="mt-3 mb-4">
			<button type="button" id="btn_1">판매취소</button>
			<button type="button" id="btn_2">배송등록</button>
		</div>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">배송정보</span>
		<ul class="mb-5">
			<li>배송중 / 또는 배송완료</li>
			<li>CJ 대한통운 047648304569 / 또는 2022.09.17</li>
		</ul>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">주문완료</span>
		<ul class="mb-5">
			<li>주문확정</li>
			<li>2022.09.17</li>
		</ul>
		
		<%-- 구분선 --%>
		
		
	</div>
</body>
</html>