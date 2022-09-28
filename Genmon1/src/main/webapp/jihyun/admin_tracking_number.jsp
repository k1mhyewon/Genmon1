<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />

<style>

	div#order_nav{
		width: 40%;
		margin: auto;
	}
	
	nav > ul {
	    /* border: solid 1px blue; */
	
	    display: flex;
	    list-style-type: none;
	    padding: 0;
	    height: 90px;
	    position: relative;
	    top: 9px;
	}
	
	nav > ul > li {
	    /* border: solid 1px red; */
	    width: 15%;
	    
	    /* text-align: center; */
	
	    /* 안먹어 그니까 테이블셋이나 플렉스를 조야댐 */
	    /* vertical-align: middle;  */
	    margin: auto;
	}
	
	nav > ul > li > a {
	    /* border: solid 1px green; */
	
	    text-decoration: none;
	    color: black;
	    font-size: 13pt;
	    font-weight: bold;
	    padding: 3%;
	}
	
	nav > ul > li > a:hover{
	    color: gray;
	}
	
	/* 상단바 끝 */
	
	div#container{
		width: 50%;
		margin: 40px auto;
	}
	
	span.boldtxt{
		display: inline-block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	span.puretxt{
		display: block;
		font-size: 10pt;
	}
	
	ul{
		padding-bottom :15px;
		font-size: 10pt;
		list-style-type: none;
	}
	
	label.li_lb{
		width: 100px;
		margin-left: 25px;
	}
	
	label.click:hover{
		cursor: pointer;
		color: gray;
	}
	
	.link_tag{
		font-size: 10pt;
		color: gray;
		text-decoration: underline;
		cursor: pointer;
	}
	
	select#sort{
		margin-bottom: 20px;
		width: 120px;
		height: 35px;
		border: 1px solid black;
		font-size: 10pt;
		text-indent: 12px;
	}
	
	select#sort:hover{
		cursor: pointer;
	}
	
	input.input_style{
		display :inline-block;
		width: 60%;
		margin-left: 8px;
		height: 35px;
		border: 1px solid black;
		font-size: 10pt;
		text-indent: 30px;
	}
	
	button#btn_tracking_num{
		width: 25%;
		height: 40px;
		font-size: 10pt;
		background: black;
		color: white;
		margin : 40px 35% ;
	}
	
</style>


<script>

</script>

<%-- 상단네비 시작 --%>
<div class="border-top"></div>
<div id="order_nav">
	<nav>
	    <ul>
	    	<li><a href="#">상품관리</a></li>
	    	<li><a href="#">주문관리</a></li>
	    	<li><a href="#">문의관리</a></li>
	    	<li><a href="#">리뷰관리</a></li>
	    </ul>
	</nav>
</div>
<%-- 상단네비 끝 --%>

<div class="border-top"></div>
<div class="my-5" id="container">
	<span class="boldtxt">주문목록</span>
	<span class="link_tag" style="margin-left:15px;">업데이트 09-19 14:20 ㉿</span>
	
	
	<%-- 반복시작 --%>
	<div class="row mt-4 border">
		<div  class="col-md-6">
			<label class="click"><input type="checkbox" name="tracking_num" class="m-4">
			<span class="boldtxt">주문 배송 &nbsp;&nbsp;&nbsp;&nbsp;(2022.09.20)</span></label>
			<ul>
				<li><label class="li_lb">받는분 :</label>김민수</li>
				<li><label class="li_lb">연락처 :</label>010-1234-5678 </li>
				<li><label class="li_lb">배송메모 :</label> X</li>
				<li><label class="li_lb">배송주소 :</label>서울특별시 관악구 청림3마길 28-8</li>
				<li><label class="li_lb"></label>101동 101호 (우: 08732 )</li>
			</ul>
		</div>
		<div class="col-md-6">
			<ul style="margin: 45px 0 0 0; padding-left: 0;">
				<li><span class="boldtxt mb-2">주문번호 26498472692</span></li>
				<li>젠몬01(3), 멋쟁이 선글라스(1)</li>
			</ul>
			<span class="puretxt my-1">운송장 입력</span>
			<select id="sort" class="mb-3">
				<option value="cj" selected>CJ대한통운</option> 
		        <option value="lozen">로젠</option>
		        <option value="lotte">롯데</option>
		        <option value="hanjin">한진</option>
		        <option value="post_office">우체국택배</option>
			</select>
		<input type="text" class="input_style"  placeholder="운송장번호를 입력하세요" />
		</div>
	</div>
	<%-- 반복끝 --%>
	<div class="row mt-4 border">
		<div  class="col-md-6">
			<label class="click"><input type="checkbox" name="tracking_num" class="m-4">
			<span class="boldtxt">교환 배송 &nbsp;&nbsp;&nbsp;&nbsp;(2022.09.20)</span></label>
			<ul>
				<li><label class="li_lb">받는분 :</label>김민수</li>
				<li><label class="li_lb">연락처 :</label>010-1234-5678 </li>
				<li><label class="li_lb">배송메모 :</label> X</li>
				<li><label class="li_lb">배송주소 :</label>서울특별시 관악구 청림3마길 28-8</li>
				<li><label class="li_lb"></label>101동 101호 (우: 08732 )</li>
			</ul>
		</div>
		<div class="col-md-6">
			<ul style="margin: 45px 0 0 0; padding-left: 0;">
				<li><span class="boldtxt mb-2">주문번호 26498472692</span></li>
				<li>시리얼넘버 32468256387</li>
				<li>젠몬01(3), 멋쟁이 선글라스(1)</li>
			</ul>
			<span class="puretxt my-1">운송장 입력</span>
			<select id="sort" class="mb-3">
				<option value="cj" selected>CJ대한통운</option> 
		        <option value="lozen">로젠</option>
		        <option value="lotte">롯데</option>
		        <option value="hanjin">한진</option>
		        <option value="post_office">우체국택배</option>
			</select>
		<input type="text" class="input_style"  placeholder="운송장번호를 입력하세요" />
		</div>
	</div>
	<div class="row mt-4 border">
		<div  class="col-md-6">
			<label class="click"><input type="checkbox" name="tracking_num" class="m-4">
			<span class="boldtxt">교환 수거 &nbsp;&nbsp;&nbsp;&nbsp;(2022.09.20)</span></label>
			<ul>
				<li><label class="li_lb">보내는 분 :</label>김민수</li>
				<li><label class="li_lb">연락처 :</label>010-1234-5678 </li>
				<li><label class="li_lb">배송메모 :</label> X</li>
				<li><label class="li_lb">배송주소 :</label>서울특별시 관악구 청림3마길 28-8</li>
				<li><label class="li_lb"></label>101동 101호 (우: 08732 )</li>
			</ul>
		</div>
		<div class="col-md-6">
			<ul style="margin: 45px 0 0 0; padding-left: 0;">
				<li><span class="boldtxt mb-2">주문번호 26498472692</span></li>
				<li>시리얼넘버 32468256387</li>
				<li>젠몬01(3), 멋쟁이 선글라스(1)</li>
			</ul>
			<span class="puretxt my-1">운송장 입력</span>
			<select id="sort" class="mb-3">
				<option value="cj" selected>CJ대한통운</option> 
		        <option value="lozen">로젠</option>
		        <option value="lotte">롯데</option>
		        <option value="hanjin">한진</option>
		        <option value="post_office">우체국택배</option>
			</select>
		<input type="text" class="input_style"  placeholder="운송장번호를 입력하세요" />
		</div>
	</div>
	<div class="row mt-4 border">
		<div  class="col-md-6">
			<label class="click"><input type="checkbox" name="tracking_num" class="m-4">
			<span class="boldtxt">반품 수거 &nbsp;&nbsp;&nbsp;&nbsp;(2022.09.20)</span></label>
			<ul>
				<li><label class="li_lb">보내는 분 :</label>김민수</li>
				<li><label class="li_lb">연락처 :</label>010-1234-5678 </li>
				<li><label class="li_lb">배송메모 :</label> X</li>
				<li><label class="li_lb">배송주소 :</label>서울특별시 관악구 청림3마길 28-8</li>
				<li><label class="li_lb"></label>101동 101호 (우: 08732 )</li>
			</ul>
		</div>
		<div class="col-md-6">
			<ul style="margin: 45px 0 0 0; padding-left: 0;">
				<li><span class="boldtxt mb-2">주문번호 26498472692</span></li>
				<li>시리얼넘버 32468256387</li>
				<li>젠몬01(3), 멋쟁이 선글라스(1)</li>
			</ul>
			<span class="puretxt my-1">운송장 입력</span>
			<select id="sort" class="mb-3">
				<option value="cj" selected>CJ대한통운</option> 
		        <option value="lozen">로젠</option>
		        <option value="lotte">롯데</option>
		        <option value="hanjin">한진</option>
		        <option value="post_office">우체국택배</option>
			</select>
		<input type="text" class="input_style"  placeholder="운송장번호를 입력하세요" />
		</div>
	</div>
	
	<%-- 버튼 --%>
	<button id="btn_tracking_num" type="button">운송장 일괄등록</button>
</div>

<jsp:include page="footer.jsp" />