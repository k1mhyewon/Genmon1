<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>교환 상세</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<style type="text/css">

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
		padding: 15px;
		width: 100%;
		height: 190px;
	}
	
	table {
		display : inline-block;
		width: 45%;
		/* border : 1px solid black; */
		font-size: 10pt;
		/* vertical-align: top; */
		text-align: center;
	}
	
	td {
		/* border-collapse:collapse;
		border : 1px solid black;  */
	}
	
	tr{
		height: 20px;
	}
	
	.myleft{
		padding-left : 17px;
		text-align: left;
	}
	
	.myright{
		width : 25%;
		padding-right : 10px;
		text-align: right;
	}
	
	td.image{
		width: 40%;
		height: 100px;
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
		margin: 5px 25%;
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
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script type="text/javascript">


</script>

</head>
<body>
	<div style="width: 80%; margin: 0 auto;">
		<span class="boldtxt my-4">교환상세</span>
		<a class="boldtxt2">주문 번호 47386543973</a>
		<%-- 반복 시작 --%>
		<div class="border tbl_box mb-3" >
			<div style="width: 100%; padding: 3px;"><span class="puretxt">주문 상세번호 32469236592</span></div>
			<table>
				<tbody>
					<tr>
						<td rowspan="4" class="image"><img src="<%=ctxPath %>/images/sun_img.png" class="image"></td>
						<td class="myleft">젠몬01</td>
					</tr>
					<tr>
						<td class="myleft">핑크</td>
					</tr>
					<tr>
						<td rowspan="2" class="myleft "><span>재고 수량 <br>30</span></td>
					</tr>
				</tbody>
			</table>
			<span> >> </span>
			<table>
				<tbody>
					<tr>
						<td rowspan="4" class="image"><img src="<%=ctxPath %>/images/sun_img.png" class="image"></td>
						<td class="myleft">젠몬01</td>
					</tr>
					<tr>
						<td class="myleft">핑크</td>
					</tr>
					<tr>
						<td rowspan="2" class="myleft "><span>재고 수량 <br>30</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<%-- 반복 끝 --%>
		<div class="border tbl_box mb-3" >
			<div style="width: 100%; padding: 3px;"><span class="puretxt">주문 상세번호 32469236592</span></div>
			<table>
				<tbody>
					<tr>
						<td rowspan="4" class="image"><img src="<%=ctxPath %>/images/sun_img.png" class="image"></td>
						<td class="myleft">젠몬01</td>
					</tr>
					<tr>
						<td class="myleft">핑크</td>
					</tr>
					<tr>
						<td rowspan="2" class="myleft "><span>재고 수량 <br>30</span></td>
					</tr>
				</tbody>
			</table>
			<span> >> </span>
			<table>
				<tbody>
					<tr>
						<td rowspan="4" class="image"><img src="<%=ctxPath %>/images/sun_img.png" class="image"></td>
						<td class="myleft">젠몬01</td>
					</tr>
					<tr>
						<td class="myleft">핑크</td>
					</tr>
					<tr>
						<td rowspan="2" class="myleft "><span>재고 수량 <br>30</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-4">주문 정보</span>
		<ul>
			<li><span class="list_span">결제일 </span> 2022-09-19 14:20:08</li>
			<li><span class="list_span">받는분 </span> 김지현</li>
			<li><span class="list_span">휴대폰번호 </span> 010-2345-6789</li>
			<li><span class="list_span">배송메모 </span> 빠른배송 해주세요</li>
			<li style="margin-bottom: 2px;"><span class="list_span">배송지 </span> 서울특별시 관악구 청림3마길 28-8</li>
			<li style="margin-bottom: 2px;"><span class="list_span"> </span> 101동 101호</li>
			<li><span class="list_span"> </span> 08732</li>
		</ul>
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 mt-4">교환사유</span>
		<span class="puretxt border" style="display: inline-block; width: 80%; margin: 5px 10%; padding: 15px;">
		저는 쿨톤인데 선글라스는 웜톤이에오 상품 사진을 개같이 찍었네 ㅡㅡ 아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아아아아아아
		</span>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">교환 수거 운송장 등록</span>
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
		<span class="boldtxt2 my-3">교환 수거 정보</span>
		<ul class="mb-5">
			<li>배송중 / 또는 배송완료</li>
			<li>CJ 대한통운 047648304569 / 또는 2022.09.17</li>
		</ul>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">교환품 발송 운송장 등록</span>
		<select id="sort">
			<option value="cj" selected>CJ대한통운</option> 
	        <option value="lozen">로젠</option>
	        <option value="lotte">롯데</option>
	        <option value="hanjin">한진</option>
	        <option value="post_office">우체국택배</option>
		</select>
		<input type="text" id="tracking" placeholder="송장번호를 입력하세요" />
		
		<button type="button" id="btn_2" class="my-3">운송장 등록</button>
		
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">교환 배송 정보</span>
		<ul class="mb-5">
			<li>배송중 / 또는 배송완료</li>
			<li>CJ 대한통운 047648304569 / 또는 2022.09.17</li>
		</ul>
		
		
	</div>
</body>
</html>