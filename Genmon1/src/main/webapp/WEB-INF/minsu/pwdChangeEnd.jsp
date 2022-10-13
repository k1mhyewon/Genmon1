<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<jsp:include page="../common/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />
    
<style type="text/css">

	
	form#frm_pwdupdate {
	/* 	border: solid 1px orange; */
		font-size: 14px;
		width: 400px;
		margin: 1% 0 7% 40%;
	}
	
	button#btn_pwdUpdate {
		background-color: black;
		color: white;
		line-height: 200%;
		margin: 3% 0% 10% 0;
		width: 99%;
		font-size: 13px;
	}
	
	div#pwd_update {
		display: inline-block;
		font-size: 14px;
		left: 15%;
    	position: flex;
    	width: 300px;
    	font-size: 12px;
	}
	
	div.error_msg {
		padding-bottom: 5%;
	}
	
	ul {
		list-style: none;
		margin-left: -13%; 
		margin-top: 5%;
	}
	
	
	input {
		width:99%;
		display: block;
		line-height: 200%;
	}
	
	.first_error, .error {
  		font-size: 11px;
  		color:red;
  		
  	}
  	
  	.chk {
    	display: inline-block;
    	color: red;
    }
    

</style>



<script type="text/javascript">

	$(document).ready(function(){
			
			// 클릭한 메인메뉴 글씨 굵게
	    	$("span#info_detail").css("font-weight","bold");
			
	    	
			let chk_bool = false;
			let same_bool = false;
		
			$("#notSame_msg").hide();
			
			$("input#pwd").on("propertychange change keyon paste input", function() {
				
				const pwd = $(this).val();
				$(".chk").css({"color":"red"});
				
				const num = /[0-9]/g;  
				const lower = /[a-z]/g;
				const upper = /[A-Z]/g;
				const spe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;
				
				let size_bool = false;
				let num_bool = false;
				let lower_bool = false;
				let upper_bool = false;
				let spe_bool = false;
				
				
				if(pwd.length > 7 && pwd.length < 16){
					$("div#size").css({"color":"green"});
					size_bool = true;
				}
				else {
					size_bool = false;
				}
				
				if( num.test(pwd) ){
					$("div#num").css({"color":"green"});
					num_bool = true;
				}
				else {
					num_bool = false;
				}
				
				if( lower.test(pwd) ){
					$("div#lower").css({"color":"green"});
					lower_bool = true;
				}
				else{
					lower_bool = false;
				}
				
				if( upper.test(pwd) ){
					$("div#upper").css({"color":"green"});
					upper_bool = true;
				}
				else{
					upper_bool = false;
				}
				
				if( spe.test(pwd) ){
					$("div#special").css({"color":"green"});
					spe_bool = true;
				}
				else{
					spe_bool = false;
				}
				
				if(size_bool && num_bool && lower_bool && upper_bool && spe_bool){
					chk_bool = true;
				}
				else{
					chk_bool = false;
				}
				$(".error_msg").show();
				
				
				$("#notPassed").css({"color": "", "font-weight": ""});
				
				console.log(pwd)
			}); // end of $("#pwd1").on() ----------------------------------------
		
			
			
			$("#pwd2").blur(function(e){
				const pwd = $("input#pwd").val();
				const pwd2 = $("input#pwd2").val();
				
				if(pwd != pwd2){ // 암호와 암호확인 값이 서로 다른 경우
					$("#notSame_msg").show();
					same_bool = false;
				}
				else{
					$("#notSame_msg").hide();
					same_bool = true;
				}
				
				$("#notPassed").css({"color": "", "font-weight": ""});
				
			}); // end of $("#pwd2").on() ----------------------------------------
			

			// 엔터로 넘어가는 메소드 //
			$("input[name='pwd2']").keydown(function(e){
				     
				if(e.keyCode == 13) {
					submit_frm();
				}
			}); // end of $("input[name='pwd2']").keyup(function(e)

	/* 
		// 비밀번호 변경하기 버튼을 누르면
	    $("button#btn_pwdUpdate").click(function(){
	    	 alert("하하하");
	    	 submit_frm();
    	 
		}); // end of $("button#btn_logout").click() --------------
		 */


	}); // end of $(document).ready(function() ------------------------------------------
			
	
	function submit_frm(){
		const requiredInfo_list =  document.querySelectorAll("input.requiredInfo"); // 배열과 유사하게 나옴
  	     for(let i=0; i<requiredInfo_list.length; i++) { // 일반 for문 사용.of는 끝까지간다. break를 못씀
  	     	const val = requiredInfo_list[i].value.trim();
  	     	if(val == "") { // 필수입력사항이 한개라도 비었을 경우
  	     		alert(" 필수입력사항은 모두 입력하셔야 합니다.");
  	 			b_Flag_requiredInfo = true;
  	 			return false;//break
  	     	}
  	     }// end of for
	    	 
	    	const frm = document.frm_pwdupdate;
	    	frm.action = "<%= ctxPath%>/myinfo/pwdRechangeEnd.sun";
	    	frm.method="POST";
	    	frm.submit();
	}

</script>

    
   
<form id="frm_pwdupdate" name="frm_pwdupdate">
<div id="pwd_update">

		<span style="font-weight: bold; font-size:15px; margin-bottom: 10%;">비밀번호 변경</span>
        	
        	<ul><li>
        		<label for="pwd">비밀번호</label>
        		<input type="password" name="pwd" id="pwd" class="requiredInfo" required/>
        	</li></ul>
        	<div class="error_msg"><div id="notPassed">비밀번호는 해당 조건을 모두 충족해야 합니다.</div>
	        	<div class="chk" id="size">✔</div>&nbsp;최소 8자 이상 15글자 이하<br>
	        	<div class="chk" id="upper">✔</div>&nbsp;최소 1개의 대문자 사용<br>
	        	<div class="chk" id="lower">✔</div>&nbsp;최소 1개의 소문자 사용<br>
	        	<div class="chk" id="num">✔</div>&nbsp;최소 1개의 숫자 사용<br>
	        	<div class="chk" id="special">✔</div>&nbsp;최소 1개의 특수문자 사용
	        </div>
        	<ul><li>
        		<label for="pwd2">비밀번호 확인</label>
        		<input type="password" name="pwd2" id="pwd2" class="requiredInfo" OnSubmit ="return submit_frm()"  required/>
        	</li></ul>
        	<div class="error_msg" id="notSame_msg" style="color: red;">비밀번호를 동일하게 입력해주세요.</div>
        	
        	<button type="button" id="btn_pwdUpdate">비밀번호 변경</button>
	      
	  </div>    
 </form>    
 
 <jsp:include page="../common/footer.jsp" />