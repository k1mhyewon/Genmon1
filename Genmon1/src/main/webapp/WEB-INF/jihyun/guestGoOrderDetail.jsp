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
    	margin-top: 100px;
    }
    
    .fontSize_small {
    	font-size: 10pt;
    }
    
    .find_result_content {
    	/* border: solid 1px red; */
    	text-decoration: none;
    }
    
    #error_msg {
    	font-size: 10pt;
    	color: red;
    	margin: 10px 0 0 60px;
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

	$(document).ready(function(){ // ==================================================
		
		$("#error_msg").hide();
		
		let name_bool = false; 
		let email_bool = false; 
		
		// === 주문번호 유효성 검사 === //
		$("input#name").blur((e) => {
	   	
	   		const $target = $(e.target);
	   		
	   		const regExp = new RegExp(/^[0-9]{10,15}$/g);
	   		
			const bool = regExp.test($target.val()); //암호의 값을 정규표현식에 넣어 테스트해보기
	        
	        if($target.val() == "") {
	        	// 주문번호 입력칸이 공백인 경우
	        	email_bool = false;
	        }
	        else {
	        	// 입력칸에 글이 들어온경우
	        	
	        	if(!bool) {
	   				// 주문번호가 정규표현식에 위배된 경우  
	   			 	name_bool = false;
	   				
	   			}
	   			else {
	   				// 주문번호가 정규표현식에 맞는 경우 
	   				name_bool = true; 
	   			}
	        }
	        
	        if(name_bool) {
	        	$("#error_msg").hide();
	        }
	        else{
	        	$("#error_msg").show();
	        	$target.focus();
	            
	        }
	        
	   	}); // end of  $("input#name").blur((e) => {} --------------------------------
	
		// === 이메일주소 유효성 검사 === //
		$("input#email").blur((e) => {
	   	
	   		const $target = $(e.target);
	   		
			const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;   //  이메일 정규표현식 객체 생성 
	            
	        const bool = regExp.test($target.val()); //암호의 값을 정규표현식에 넣어 테스트해보기
	        
	        if($target.val() == "") {
	        	// 이메일 입력칸이 공백인 경우
	        	email_bool = false;
	        }
	        else {
	        	// 입력칸에 글이 들어온경우
	        	
	        	if(!bool) {
	   				// 이메일이 정규표현식에 위배된 경우  
	   			 	email_bool = false;
	   				
	   			}
	   			else {
	   				// 이메일이 정규표현식에 맞는 경우 
	   				email_bool = true; 
	   			}
	        }
	        
	        if(email_bool) {
	        	$("#error_msg").hide();
	        }
	        else{
	        	$("#error_msg").show();
	        	
	        }
	    }); // end of  $("input#name").blur((e) => {} --------------------------------
	   			   
	   	
		$("button#btn_find").click(function(){
			
			const name = $("input#name").val();
			if(name.length > 1 ){
				name_bool == true;
			}
			
			if(name_bool == true && email_bool == true ){
				const frm = document.useridFindFrm;
				frm.action = "<%= ctxPath%>/guest/goOrderDetail.sun";
				frm.method = "post";
				frm.submit();
			}
			else {
				$("#error_msg").show();
				return;
			}
			
		}); // end of $("button#btnFind").click() ------------------
		
		
		
		const method = "${requestScope.method}";
		
		const orderid = "${orderid}";
		
		// console.log("method : " + method);
		
		 if(method == "POST") {
			 
			 if(orderid==""){
				 alert("존재하지 않는 비회원 주문번호 입니다 다시 확인하고 시도해주세요");
				 self.close();
			 } else {
				 window.opener.goGuestOrder(orderid);
				 self.close();
			 }
			 
	    }
		
		
		$("input#email").change((e) => {
	   		$(".find_msg").hide();
	   	});
	   	   
	   	$("input#name").change((e) => {
	   		$(".find_msg").hide();
	   	});
		
		
	}); // end of $(document).ready() ==================================================
		
	// 아이디 찾기 모달창에 입력한 input 태그 value 값 초기화 하기 
	function func_form_reset_empty(){
		
		document.querySelector("form[name='useridFindFrm']").reset(); // querySelector 는 css
		$("#idFind_result").empty(); // empty 는 내용물을 비우는 것
		
	}

</script>

    
<form name="useridFindFrm" class="form_container">
	<div style="font-size: 15pt; font-weight: bold;  margin-bottom: 20px;">비회원주문 조회하기</div>
	<div class="fontSize_small">주문번호와 이메일을 입력하세요.</div>
	<hr>
	<ul style="list-style-type: none; margin-top: 30px;" class="fontSize_small">
		<li style="margin: 25px 0">
			<label for="name" style="display: inline-block; width: 90px">주문번호</label>
			<input type="text" name="name" id="name" size="25" placeholder="2211111111" autocomplete="off" required />
		</li>
		<li style="margin: 25px 0">
			<label for="email" style="display: inline-block; width: 90px">이메일</label>
			<input type="text" name="email" id="email" size="25" placeholder="gentle@gentlemonster.com" autocomplete="off" required />
			<div id="error_msg">주문번호 또는 이메일을 올바르게 입력해주세요.</div>
		</li>
	</ul>
	<div style="text-align: center; margin-top: 20px;">
		<button type="button" class="btn btn-dark fontSize_small" id="btn_find" style="margin-right: 20px;">조회하기</button>
	</div>
	<div id="idFind_result" style="text-align: center; margin: 30px 20px 0 0;">
	<%--
		<c:if test="${ empty requestScope.userid }">
			<span class="find_msg" style="color: red; font-size: 10pt; ">존재하지 않는 비회원 주문정보 입니다. <br>다시 확인하시고 입력해주세요.</span>
		</c:if>
	 --%>
	</div>
</form>