<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">

<style type="text/css">

	* {font-family: 'Pretendard', sans-serif; !important}
	
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
    	margin-top: 50px;
    	
    }
    
    #input_confirmCode {
    	margin: 15px 0;
    	width: 180px;
    	height: 25px;
    }
    
    #find_pwd { margin-bottom: 25px; }
    
    #error_msg {
    	font-size: 10pt;
    	color: red;
    	margin: 10px 0 0 60px;
    }
    
    #find_msg {
    	color: red; font-size: 11pt;
    	text-align: center;
    	margin-top: 10px;
    }
    
    #timer {
    	color: red; font-size: 17pt;
    	font-weight: bold;
    	margin-top: 10px;
    }
    
    

</style>



<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
<script>

	
	
	

	$(document).ready(function(){
		
		$("#timer_end").hide();
		
		$("div#pwdFind_result").hide();
		
		$("#error_msg").hide();
		$("#find_msg").hide();
		
		let id_bool = false; 
		let email_bool = false; 
		
		// === 아이디 유효성 검사 === //
		$("input#userid").blur((e) => {
	   	
	   		const $target = $(e.target);
	            
	        if($target.val() == "") { // 아이디 입력칸이 공백인 경우
	        	$("#error_msg").show();
	        	$target.focus();
	        	id_bool = false;
	        }
	        else if($target.val().length < 4){ // 입력칸에 네글자 이하로 들어온 경우
	        	$("#error_msg").show();
	        	$target.focus();
	        	id_bool = false;
	        }
	        else { // 입력칸에 네글자 이상의 글자가 들어온경우
	        	 $("#error_msg").hide();
	        	 id_bool = true; 
	          }
	   	}); // end of  $("input#userid").blur((e) => {} --------------------------------
		
	   	

		// === 이메일주소 유효성 검사 === //
		$("input#email").blur((e) => {
	   	
	   		const $target = $(e.target);
			const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;   //  이메일 정규표현식 객체 생성 
	            
	        const bool = regExp.test($target.val()); //암호의 값을 정규표현식에 넣어 테스트해보기
	        
	        if($target.val() == "") {
	        	// 이메일 입력칸이 공백인 경우
	        	$("#error_msg").show();
	        	email_bool = false;
	        }
	        else {
	        	// 입력칸에 글이 들어온경우
	        	$("#error_msg").hide();
	        	
	        	if(!bool) {
	   				// 이메일이 정규표현식에 위배된 경우  
	   			    $("#error_msg").show();
	   			 	email_bool = false;
	   				$target.focus();
	   			}
	   			else {
	   				// 이메일이 정규표현식에 맞는 경우 
	   				$("#error_msg").hide();
	   				email_bool = true; 
	   			}
	          }
		}); // end of  $("input#email").blur((e) => {} --------------------------------
	   			
		
		$("input#email").change((e) => {
	   		$("#error_msg").hide();
	   	});
	   	   
	   	$("input#name").change((e) => {
	   		$("#error_msg").hide();
	   	});
		
		
		
		// 찾기 버튼 클릭
		$("button#link_btn").click(function(){
			$("#find_msg").hide();
			
			const useridVal = $("input#userid").val().trim();
			const emailVal = $("input#email").val().trim();
			// console.log("userid: "+useridVal + "email: "+emailVal);
			
			// 아이디 및 이메일에 대한 정규표현식을 사용한 유효성 검사는 생략한다.
			
			if( id_bool && email_bool ) {
				const frm = document.findPwdFrm;
				frm.action = "<%= ctxPath%>/pwdFind.sun";
				frm.method = "POST"; // 대소문자 구분 안함
				frm.submit();
			}
			else{
				$("#error_msg").show();
				return;
			}
			
		}); // end of $("button#btnFind").click() ---------------------
		
		const method = "${requestScope.method}"; // requestScope. 은 생략 가능 / "" 넣어줘야 함
		
		const isUserExists = "${requestScope.isUserExists}";
		const sendMailSuccess = "${requestScope.sendMailSuccess}";
		
		// console.log("isUserExists : "+isUserExists);
		// console.log("sendMailSuccess : "+sendMailSuccess);
		
		if(method == "POST" ){ // 메일 전송 버튼을 클릭하여 컨트롤러에 갔다왔을 때  
			if(isUserExists == "true" && sendMailSuccess == "true"){
				// 유저가 존재하고, 메일전송이 성공했을 때
				
				// setInterval(function(){timer();}, 1000); // 1초마다 주기적으로 타이머 함수를 호출하도록 지정
				// ============================================================================================ //
				// [타이머 시작]
				
				let time = 60;// 타이머 시간을 10분으로 지정
				
				let minute = "";
			    let second = "";
				
				// 타이머 함수 만들기    
				const timer = setInterval(function(){
					
					minute = parseInt(time / 60); // 소수부는 없애버리고 정수만 가져오는 것이다. 
			        if(minute < 10) {
			            minute = "0" + minute;
			        }
			
			        second = time % 60;
			        if(second < 10) {
			            second = "0" + second;
			        }
			
			        document.getElementById("timer").innerHTML = minute + ":" + second;
			        time --;
			        
			        if(time < 0){
			        	clearInterval(timer);
			        	$("#timer_end").show();
			        }
					
				}, 1000);
				
				// [타이머 종료]
				// ============================================================================================ //
				
				$("div#pwdFind_result").show();
				$("input#userid").val("${requestScope.userid}");
				$("input#email").val("${requestScope.email}");
				
				$("#link_btn").hide(); // 찾기버튼 감춤
				$("#find_msg").hide();
			}
			else { 
				// 유저가 존재하지 않는다면 결과물을 보여주면 안됨
				$("div#pwdFind_result").hide();
				$("#find_msg").show();
			}
		}
		else { // get 방식이면 결과물을 보여주면 안됨
			$("div#pwdFind_result").hide();
			$("#find_msg").hide();
		}
		
		
		
		
	}); // end of $(document).ready() -------------------------------
</script>


    
<form name="findPwdFrm" class="form_container" id="findPwdFrm">
	<div style="font-size: 15pt; font-weight: bold;  margin-bottom: 20px;">비밀번호 찾기</div>
	<div class="fontSize_small">아이디와 이메일을 입력해주세요.</div>
	<hr>
	<ul style="list-style-type: none; margin-top: 30px;" class="fontSize_small">
		<li style="margin: 25px 0">
			<label for="name" style="display: inline-block; width: 90px">아이디</label>
			<input type="text" name="userid" id="userid" size="25" placeholder="genmon" autocomplete="off" required />
		</li>
		<li style="margin: 25px 0">
			<label for="email" style="display: inline-block; width: 90px">이메일</label>
			<input type="text" name="email" id="email" size="25" placeholder="gentle@gentlemonster.com" autocomplete="off" required />
			<div id="error_msg">아이디 또는 이메일을 올바르게 입력해주세요.</div>
		</li>
	</ul>
	<div style="text-align: center; margin-top: 15px;">
		<button type="button" class="btn btn-dark" id="link_btn" style="font-size: 9pt;">비밀번호 변경 링크 전송</button>
	</div>
	<div id="find_msg">존재하지 않는 회원 입니다. <br>올바른 정보를 입력해주세요.</div>
	
	<div id="pwdFind_result" >
		<div style="font-size: 9pt;">비밀번호 변경 링크가 회원님의 이메일</div>
		<div style="font-size: 9pt; font-weight: bold;">"${requestScope.email}"</div>
		<div style="font-size: 9pt;">로 발송되었습니다.</div>
		<div style="font-size: 9pt;">이메일을 확인해주세요.</div>
		<div id="timer"></div>
		<div id="timer_end" style="font-size: 9pt; color: red;">비밀번호 리셋시간이 종료되었습니다. 다시 시도해주세요.</div>
	</div>
</form>

