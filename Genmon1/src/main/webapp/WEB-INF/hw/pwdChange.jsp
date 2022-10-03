<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% String ctxPath = request.getContextPath(); %>
    
<jsp:include page="../common/header.jsp" />

<style type="text/css">

	
    
    div#pwdChange_container {
    /*  border: solid 1px red;  */
    	margin: 10% auto;
    	width: 35%;
    }
    
    
    label {
    	font-size: 10pt;
    	display: block;
    }
    
    input {
    	width: 75%;
    	text-align: left;
    	line-height: 200%;
    }
    
    #btn_pwdUpdate {
    	cursor: pointer;
		font-size: 10pt;
		background-color: black;
		color: white;
		border: none;
		width: 70%;
		height: 40px;
		margin-left: 40px;
		margin-top: 20px;
    }
    
    div > span {
     font-size: 12pt;
     text-decoration: underline;
     font-weight:bold; 
     display:inline-block; 
     margin: 0 0 3% 3%;
    } 
    
    li { list-style : none; }
    
    .chk {
    	display: inline-block;
    	color: red;
    }
    
    .error_msg {
    	font-size: 10pt;
    	margin-left: 40px;
    	margin-bottom: 20px;
    }
    
    #notSame_msg {
    	color: red;
    	
    }
    
    #existPwd_msg {
    	color: red;
    	margin: 20px 0 0 55px;
    	font-size: 11pt;
    	font-weight: bold;
    }

</style>

<script>


	$(document).ready(function(){ // --------------------------------------------------
		
		$("#notSame_msg").hide();
		$("#existPwd_msg").hide();
		
		let chk_bool = false;
		// #pwd1 값이 변할때마다 체크
		$("#pwd1").on("propertychange change keyon paste input", function(){ 
			
			$("#notSame_msg").hide();
			
			const pwd1 = $(this).val();
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
			
			if(pwd1.length > 7 && pwd1.length < 16){
				$("div#size").css({"color":"green"});
				size_bool = true;
			}
			if( num.test(pwd1) ){
				$("div#num").css({"color":"green"});
				num_bool = true;
			}
			if( lower.test(pwd1) ){
				$("div#lower").css({"color":"green"});
				lower_bool = true;
			}
			if( upper.test(pwd1) ){
				$("div#upper").css({"color":"green"});
				upper_bool = true;
			}
			if( spe.test(pwd1) ){
				$("div#special").css({"color":"green"});
				spe_bool = true;
			}
			if(size_bool && num_bool && lower_bool && upper_bool && spe_bool){
				chk_bool = true;
			}
			
			
		});
	
		let same_bool = false; // #pwd1 과 #pwd2 값이 같은지 확인
		
		
		
		// #pwd2 값이 변할때마다 체크
		$("#pwd2").on("propertychange change keyon paste input", function(){
			
			const pwd1 = $("input#pwd1").val();
			const pwd2 = $("input#pwd2").val();
			
			if(pwd1 != pwd2){ // 암호와 암호확인 값이 서로 다른 경우
				same_bool = false;
				$("#notSame_msg").show();
				return; // 종료
			}
			else {
				same_bool = true;
				$("#notSame_msg").hide();
			}
		});
		
		
		$("button#btn_pwdUpdate").click(function(){ // ----------------
			
			const pwd1 = $("input#pwd1").val();
			const pwd2 = $("input#pwd2").val();
			
			const userid = "${requestScope.userid}";
			if(same_bool && chk_bool) {
				
				$.ajax({
					url : "<%= ctxPath%>/login/pwdExist.sun", 
					data: { "userid":userid, "pwd":pwd1 },
					type: "POST",  
				    dataType:"TEXT",
				    success:function(json) {
				    	
				    	const result = "${requestScope.result}";
				    	
				    	console.log("result => "+ result);
				    	
				    	if(!result){ // 이미 사용중인 비밀번호가 아니라면(변경해줌)
				    	
				    		const frm = document.pwdChangeFrm;
							frm.action = "<%= ctxPath%>/login/pwdChangeEnd.sun";
							frm.method = "POST"; // post 방식이어야 함
							frm.submit();
							
				    	}
				    	else{
				    		$("#existPwd_msg").show();
				    	}
				    },
				    error: function(request, status, error){
						//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
				
				
			}
			else if(!same_bool) {
				$("#notSame_msg").show();
				$("input#pwd1").val("");  // 입력받은 칸을 비워버림
				$("input#pwd2").val(""); // 입력받은 칸을 비워버림
			}
			else if(!chk_bool) {
				
			}
			
			
			
		}); // end of $("button#btn_pwdUpdate").click() ----------------
		
		
	}); // end of $(document).ready() ----------------------------------------------------
	
	
	
	
	
</script>


<!-- 인덱스 시작 -->
    <form name="pwdChangeFrm">
        <div id="pwdChange_container">
        	<span>비밀번호 변경</span>
        	
        	<ul><li>
        		<label for="pwd1">비밀번호</label>
        		<input type="password" name="pwd1" id="pwd1" required/>
        	</li></ul>
        	<div class="error_msg">비밀번호는 해당 조건을 모두 충족해야 합니다.<br>
	        	<div class="chk" id="size">✔</div>&nbsp;최소 8자 이상 15글자 이하<br>
	        	<div class="chk" id="upper">✔</div>&nbsp;최소 1개의 대문자 사용<br>
	        	<div class="chk" id="lower">✔</div>&nbsp;최소 1개의 소문자 사용<br>
	        	<div class="chk" id="num">✔</div>&nbsp;최소 1개의 숫자 사용<br>
	        	<div class="chk" id="special">✔</div>&nbsp;최소 1개의 특수문자 사용
	        </div>
        	<ul><li>
        		<label for="pwd2">비밀번호 확인</label>
        		<input type="password" name="pwd2" id="pwd2" required/>
        	</li></ul>
        	<div class="error_msg" id="notSame_msg">비밀번호를 동일하게 입력해주세요.</div>
        	
        	
        	<button type="button" id="btn_pwdUpdate">비밀번호 변경</button>
        	<div class="error_msg" id="existPwd_msg">동일한 비밀번호로는 변경하실 수 없습니다. 다른 비밀번호를 입력해주세요.</div>
        	
        	<c:if test="${requestScope.method == 'POST' && requestScope.n == 1 }">
				<div id="div_updateResult" align="center">
					${requestScope.userid}님의 암호가 변경되었습니다.<br> <%-- post 방식일때 && n이 1일 때만 보여야 함 --%>
				</div>
			</c:if>
        	<input type="hidden" name="userid" value="${requestScope.userid}"/>
        </div>
    </form>  
<!-- 인덱스 끝 -->
<jsp:include page="../common/footer.jsp" />

