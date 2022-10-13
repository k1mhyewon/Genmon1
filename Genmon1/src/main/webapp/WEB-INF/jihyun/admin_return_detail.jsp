<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


</script>

</head>
<body>
	<div style="width: 80%; margin: 0 auto;">
		<span class="boldtxt my-4">반품상세</span>
		<a class="boldtxt2 mb-2">주문번호 47386543973</a>
		<%-- 반복 시작 --%>
		<div class="border tbl_box mb-2" >
			<table>
				<tbody>
					<tr>
						<td rowspan="6" class="image"><img src="sun_img.png" class="image"></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>주문 상세번호</td>
						<td class="myleft">32469236592</td>
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
						<td>가격</td>
						<td class="myleft">235,000원</td>
					</tr>
					<tr></tr>
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
						<td rowspan="6" class="image"><img src="sun_img.png" class="image"></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>주문 상세번호</td>
						<td class="myleft">32469236592</td>
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
						<td>가격</td>
						<td class="myleft">235,000원</td>
					</tr>
					<tr></tr>
				</tbody>
				<tfoot>
					<tr style="height: 30px;">
						<td colspan="3" style="vertical-align: bottom ;"><span class="tf_span border">재고 수량 : 30</span></td>
					</tr>
				</tfoot>
			</table>
		</div>
		
		<span class="boldtxt2 mt-4">반품사유</span>
		<span class="puretxt border" style="display: inline-block; width: 80%; margin: 5px 10%; padding: 15px;">
		저는 쿨톤인데 선글라스는 웜톤이에오 상품 사진을 개같이 찍었네 ㅡㅡ 아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아아아아아아
		</span>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">배송등록</span>
		<select id="sort">
			<option value="cj" selected>CJ대한통운</option> 
	        <option value="lozen">로젠</option>
	        <option value="lotte">롯데</option>
	        <option value="hanjin">한진</option>
	        <option value="post_office">우체국택배</option>
		</select>
		<input type="text" id="tracking" placeholder="송장번호를 입력하세요" />
		
		<label class="puretxt ml-3 my-3"><input type="checkbox" /> 배송비 고객부담</label>
		
		<button type="button" id="btn_2">운송장 등록</button>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">배송정보</span>
		<ul class="mb-5">
			<li>배송중 / 또는 배송완료</li>
			<li>CJ 대한통운 047648304569 / 또는 2022.09.17</li>
		</ul>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-4">환불 정보</span>
		<ul class="mb-3">
			<li>우리은행 1002-950-797783</li>
			<li>김지현</li>
		</ul>
		<button type="button" id="btn_2" class="mb-3">환불 완료</button>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-4">주문 취소 정보</span>
		<ul class="mb-5">
			<li>주문취소 완료</li>
			<li>2022.09.17</li>
		</ul>
		
		<%-- 구분선 --%>
		
		
	</div>
</body>
</html>