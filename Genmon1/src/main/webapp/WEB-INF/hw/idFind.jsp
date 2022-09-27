<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<style type="text/css">

	* {font-family: 'Noto Sans KR', sans-serif;}
	
	li { list-style : none; }
    
    .form_container {
    	/* border: solid 1px red; */
    	width: 80%;
    	height: auto;
    	margin: auto;
    	margin-top: 100px;
    }
    
    .fontSize_small {
    	font-size: 9pt;
    }
    
    .find_result_content {
    	/* border: solid 1px red; */
    	text-decoration: none;
    }

</style>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">


<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<script>

	$(document).ready(function(){ // ==================================================
		
		
		$("button#btn_find").click(function(){
			
			// 성명 및 e메일에 대한 유효성 검사(정규표현식)는 생략하겠습니다.
			const frm = document.useridFindFrm;
			frm.action = "<%= ctxPath%>/idFind.sun";
			frm.method = "post";
			frm.submit();
		}); // end of $("button#btnFind").click() ------------------
		
		const method = "${requestScope.method}";
		
		// console.log("method : " + method);
		
		if(method == "GET") {
	    	$("#idFind_result").hide();	// 겟방식에서는 감춤
	    }
	    else if(method == "POST") {
	    	$("input#name").val("${requestScope.name}"); // 문자열 "" 로 넣어줘야 함
	    	$("input#email").val("${requestScope.email}");
	    }
		
	}); // end of $(document).ready() ==================================================
		
	// 아이디 찾기 모달창에 입력한 input 태그 value 값 초기화 하기
	function func_form_reset_empty(){
		
		document.querySelector("form[name='useridFindFrm']").reset(); // querySelector 는 css
		$("#idFind_result").empty(); // empty 는 내용물을 비우는 것
		
	}

</script>

    
<form name="useridFindFrm" class="form_container">
	<div style="font-size: 15pt; font-weight: bold;  margin-bottom: 20px;">아이디 찾기</div>
	<div class="fontSize_small">성명과 이메일을 입력해주세요.</div>
	<hr>
	<ul style="list-style-type: none; margin-top: 30px;" class="fontSize_small">
		<li style="margin: 25px 0">
			<label for="name" style="display: inline-block; width: 90px">성명</label>
			<input type="text" name="name" id="name" size="25" placeholder="김젠몬" autocomplete="off" required />
		</li>
		<li style="margin: 25px 0">
			<label for="email" style="display: inline-block; width: 90px">이메일</label>
			<input type="text" name="email" id="email" size="25" placeholder="gentle@gentlemonster.com" autocomplete="off" required />
		</li>
	</ul>
	<div style="text-align: center; margin-top: 50px;">
		<button type="button" class="btn btn-dark fontSize_small" id="btn_find" style="margin-right: 20px;">찾기</button>
	</div>
	<div id="idFind_result" style="text-align: center; margin: 30px 20px 0 0;">
		<c:if test="${ not empty requestScope.userid }">
			<span class="fontSize_small find_result_content">회원님의 아이디는
				<span style="color: gray; font-weight: bold; font-size: 16pt; ">${requestScope.userid}</span>&nbsp;입니다.
			</span>
		</c:if>
		<c:if test="${ empty requestScope.userid }">
			<span style="color: red; font-size: 10pt; ">존재하지 않는 회원정보 입니다. <br>다시 입력해주세요.</span>
		</c:if>
	</div>
</form>