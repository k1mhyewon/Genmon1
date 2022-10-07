<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../common/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />

<% String ctxPath = request.getContextPath(); %>

<style type="text/css">
	form#menu_myinfoupdate {
		/*border: solid 1px orange;*/
		display: flex;
		font-size: 14px;
		width: 400px;
		height: 300px;
		margin: 2% auto 3% auto;
	}
	
	
	button#btn_pwdcheck {
		background-color: black;
		color: white;
		width: 300px;
		display: block;
		margin: 10% 0 0 40px;
		line-height:30px;
	}
	
	input {
		width: 300px;
		height : 30px; 
	}
	
	li {
		list-style: none;
	}
	
	.chk {
    	display: inline-block;
    	color: red;
    }
    
	.error_msg {
    	font-size: 10pt;
    	margin: 10px 0 20px 0;
    }
	

</style>


<script type="text/javascript">

		$(document).ready(function(){
			
			// 클릭한 메인메뉴 글씨 굵게
	    	$("span#info_detail").css("font-weight","bold");
			
	    	$(".error_msg").hide();
			
			$("input.passwd").on("propertychange change keyon paste input", function() {
				
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
			
			
		// === 비밀번호 확인버튼을 누르면===
		$("button#btn_pwdcheck").click(function(){ 
			
				const frm = document.menu_myinfoupdate;
				frm.action = "<%= ctxPath%>/myinfo/pwdCheck.sun";
				frm.method = "POST"; // post 방식이어야 함
				frm.submit();
		});	// end of $("button#btn_pwdcheck").click(function() ---------------------
				
	});// end of $(document).ready(function() ------------------------------------------
			
			
			
	
</script>


<form name="menu_myinfoupdate" id="menu_myinfoupdate">
		<div>
			<ul>
				<li>
					<label for="pwd" style="font-size: 16px; font-weight: bold;">비밀번호</label>
					<input type="password" name="pwd" class="passwd" size="20" placeholder="비밀번호를 입력해주세요" autofocus required style="display: block;"/>
				<li>
			<div class="error_msg"><div id="notPassed">비밀번호는 해당 조건을 모두 충족해야 합니다.</div>
	        	<div class="chk" id="size">✔</div>&nbsp;최소 8자 이상 15글자 이하<br>
	        	<div class="chk" id="upper">✔</div>&nbsp;최소 1개의 대문자 사용<br>
	        	<div class="chk" id="lower">✔</div>&nbsp;최소 1개의 소문자 사용<br>
	        	<div class="chk" id="num">✔</div>&nbsp;최소 1개의 숫자 사용<br>
	        	<div class="chk" id="special">✔</div>&nbsp;최소 1개의 특수문자 사용
	        </div>
	        
			</ul>
		<button type="button" id="btn_pwdcheck">비밀번호 확인</button>
		<input type="hidden" name="userid" value="${requestScope.userid}"/>
		</div>
</form>



<jsp:include page="../common/footer.jsp" />