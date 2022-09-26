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
    	margin-top: 70px;
    }
    
    .fontSize_small { font-size: 9pt; }
    
    #pwdFind_result {
    	/* border: solid 1px pink; */
    	text-align: center;
    	background-color: #f2f2f2;
    	width: 80%;
    	padding: 2%;
    	margin: auto;
    	
    }
    
    #input_confirmCode {
    	margin: 15px 0;
    	width: 180px;
    	height: 25px;
    }
    
    #find_pwd { margin-bottom: 25px; }

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


    
<form name="pwdFindFrm" class="form_container">
	<div style="font-size: 15pt; font-weight: bold;  margin-bottom: 20px;">비밀번호 찾기</div>
	<div class="fontSize_small">아이디와 이메일을 입력해주세요.</div>
	<hr>
	<ul style="list-style-type: none; margin-top: 30px;" class="fontSize_small">
		<li style="margin: 25px 0">
			<label for="name" style="display: inline-block; width: 90px">아이디</label>
			<input type="text" name="name" id="name" size="25" placeholder="김젠몬" autocomplete="off" required />
		</li>
		<li style="margin: 25px 0">
			<label for="email" style="display: inline-block; width: 90px">이메일</label>
			<input type="text" name="email" id="email" size="25" placeholder="gentle@gentlemonster.com" autocomplete="off" required />
		</li>
	</ul>
	<div style="text-align: center; margin-top: 30px;">
		<button type="button" class="btn btn-dark" id="find_pwd" style="font-size: 9pt;">찾기</button>
	</div>
	
	<div id="pwdFind_result" >
		<div style="font-size: 9pt;">인증코드가 회원님의 이메일</div>
		<div style="font-size: 9pt; font-weight: bold;">"${requestScope.email}"</div>
		<div style="font-size: 9pt;">로 발송되었습니다.</div>
		<div style="font-size: 9pt;">인증코드를 입력해주세요.</div>
		<input type="text" name="input_confirmCode" id="input_confirmCode" required /><br>
		<button type="button" class="btn btn-light" id="btnConfirmCode" style="font-size: 9pt;">인증하기</button>
	</div>
</form>