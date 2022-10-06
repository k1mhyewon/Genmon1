<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% String ctxPath = request.getContextPath(); %>
    
<jsp:include page="../common/header.jsp" />

<style type="text/css">
	
    
    div#login_container {
      /* border: solid 1px red;  */ 
    	margin: 8% auto;
    	width: 35%;
    	padding-left: 25px;
    }
    
    div#login_container > ul > li > label, p{
    	display: block;
    	font-size: 10pt;
    	
    }
    
    .input_login {
    	width: 80%;
    	text-align: left;
    	line-height: 200%;
    }
    
    .find_btn {
    	cursor: pointer;
		font-size: 10pt;
		text-decoration: underline;
		border: none;
    }
    
    .titles {
     font-size: 11pt;
     text-decoration: underline;
     font-weight: bold;
    } 
    
    /* === 모달 CSS === */
    
    .modals-fullsize {
    	width: 500px;
    	height: 550px;
    }
    
    li { list-style : none; }
    
    .form_container {
    	/* border: solid 1px red; */
    	width: 80%;
    	height: auto;
    	margin: auto;
    }
    
    .fontSize_small {
    	font-size: 10pt;
    }
    
    .find_result_content {
    	/* border: solid 1px red; */
    	text-decoration: none;
    }
    
    .login_btn {
    	background-color: black; 
    	color: white; 
    	width: 74%;
    	margin: 3% 0 1% 7%; 
    	line-height: 250%;
    	font-size: 10pt;
    }
    
    #btn_goCart {
    	background-color: white; 
    	width: 74%;
    	margin: 0% 0 3% 7%; 
    	line-height: 250%;
    	font-size: 10pt;
    	border: solid 1px black;
    }
    
    .save_box {
    	/* border: solid 1px pink; */
    	width: 80%;
    	font-size: 10pt;
    	padding-left: 40px;
    }
    
</style>

<script>
	$(document).ready(function(){ // --------------------------------------------------
		
		
		$("button#btn_goLogin").click(function(){
			// 로그인 버튼을 클릭하면
			goLogin(); // 로그인 시도 함수 호출
			
		}); // end of $("button#btnSubmit").click() --------------
		
		
		$("#find_userid").click(function(){
			// 아이디찾기를 클릭하면 모달창 초기화
			const iframe_idFind = document.getElementById("iframe_idFind");  /* 대상 아이프레임을 선택한다. */
			const iframe_window = iframe_idFind.contentWindow; /* contentWindow 는 iframe 의 window(전체)를 의미한다. */
			iframe_window.func_form_reset_empty();
			
		});
		
		// === 로그인이 안되어있는 상태일 때
		// === 로컬 스토리지에 저장된 key가 "saveid" 인 userid 값을 불러와서 input 태그 userid 에 넣어주기
		if(${empty sessionScope.loginuser}){ // 로그인이 안된 상태라면
			// alert("loginuser 없음");
		
			const loginUserid = localStorage.getItem("saveid");
			
			if(loginUserid != null){ // 로컬에 저장된 userid 가 있는 경우
				$("input#loginUserid").val(loginUserid);
				$("input:checkbox[id='saveid']").prop("checked", true);
			}
		}
		
		
		$("input#loginPwd").bind("keydown", function(event){
			
			if( event.keyCode == 13 ) { // 암호 입력란에 엔터를 했을 경우
				goLogin(); // 로그인 시도
			}
		}); // end of $("input#loginPwd").bind("keydown") ----------------
		
		
		$("button#btn_close").click(function(){ // -------------------
			$('#findPwdFrm').modal('hide');
			
		}); // end of $("button#codeConfirm_btn").click() ------------------
		
		
		// 로그인화면에서 비회원 주문조회 버튼을 누르면
		$("button#btn_goCart").click(function(){
			// 로그인 버튼을 클릭하면
			 // 비회원 주문조회 모달 호출
			
		}); // end of $("button#btnSubmit").click() --------------
		
		
		// 로그인화면에서 신규가입 버튼을 누르면
        $("button#btn_gojoin").click(function(){
        	location.href="<%= ctxPath%>/join.sun";
			
		}); // end of $("button#btn_logout").click() --------------
        
		
		// 모달창 닫으면 초기화
        $('#pwdFindModal').on('hidden.bs.modal', function (e) {
        	$(this).find('div#find_msg').hide();
        });
		
		
	
		
	}); // end of $(document).ready() ----------------------------------------------------
	
	
	
	
	// === 로그인 처리 함수 === // --------------------------------------------------------
	function goLogin(){
	//	alert("로그인 시도함");
	
			
	
		const loginUserid = $("input#loginUserid").val().trim();
	    const loginPwd = $("input#loginPwd").val().trim();
	    
	    if(loginUserid == "") {
	    	alert("아이디를 입력하세요!!");
	    	$("input#loginUserid").val("");
	    	$("input#loginUserid").focus();
	    	return; // goLogin() 함수 종료
	    }
	    
	    if(loginPwd == "") {
	    	alert("암호를 입력하세요!!");
	    	$("input#loginPwd").val("");
	    	$("input#loginPwd").focus();
	    	return; // goLogin() 함수 종료
	    }
	    
	    if($("input:checkbox[id='saveid']").prop("checked")){
	    	
	    	// local storage에 아이디 정보를 저장해줘야함
	         localStorage.setItem('saveid', $("input#loginUserid").val() );
	    	
	    }
		else { // 아이디 저장 체크 안했다면
	    	localStorage.removeItem('saveid');    // 삭제
	    }
	    
	    const frm = document.loginFrm; 
	    frm.action = "<%= ctxPath%>/login.sun";
	    frm.method = "post";
	    frm.submit();
		
	}// end of function goLogin()--------------------------------------------------------
	
	
	
</script>


<!-- 인덱스 시작 -->
    <form name="loginFrm">
        <div id="login_container">
        	<div style="margin: 0 0 3% 8%;" class="titles">로그인</div>
        	
        	<ul><li>
        		<label for="userid">아이디</label>
        		<input type="text" name="userid" class="input_login" id="loginUserid" required/>
        	</li></ul>
        	
        	<ul><li>
        		<label for="pwd">비밀번호</label>
        		<input type="password" name="pwd" class="input_login" id="loginPwd" required/>
        	</li></ul>
        	
        	<div class="save_box">
        		<input type="checkbox" id="saveid" name="saveid" /><label for="saveid">아이디저장</label>
        	</div>
        	<c:if test="${ not empty requestScope.isLogined && isLogined == 'false' }">
	           	<div id="loginFailed" style="font-size: 10pt; color: red; margin: 10px 0 0 80px;">
	           		잘못된 아이디 또는 비밀번호를 입력하셨습니다. 다시 입력해주세요.
	           	</div>
           	</c:if>
           	
        	<button id="btn_goLogin" class="login_btn" type="button">로그인</button>
        	<button id="btn_goCart" type="button">비회원 주문조회</button>
        	
        	<div> 
	        	<span class="find_btn" id="find_userid" type="button" data-toggle="modal" data-target="#useridFindModal" style="margin-left: 37px;">아이디찾기</span>
	        	<span class="find_btn" type="button" data-toggle="modal" data-target="#pwdFindModal">비밀번호 찾기</span>
            </div> 
        	
        	<div class="titles" style="margin: 10% 0 3% 8%;">회원가입</div>
        	<div style="width: 72%; margin-left: 8%;" class="fontSize_small">회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</div>
        	<button class="login_btn" type="button" id="btn_gojoin" style="margin-top: 15px;">신규가입</button>
        	
        </div>
    </form>    	
    
    
    
    

	<!--  이메일찾기 Modal -->
	<div class="modal fade" id="useridFindModal">
		<div class="modal-dialog">
			<div class="modal-content modals-fullsize">
				<iframe id="iframe_idFind" style="border: none; width: 100%; height: 100%;" src="<%= ctxPath%>/idFind.sun">
	            </iframe>
			</div>
		</div>
	</div>
   
   
   
   <!--  비밀번호 Modal -->
   <div class="modal fade" id="pwdFindModal">
		<div class="modal-dialog">
			<div class="modal-content modals-fullsize">
				<iframe id="iframe_pwdFind" style="border: none; width: 100%; height: 100%;" src="<%= ctxPath%>/pwdFind.sun">
	            </iframe>
			</div>
		</div>
	</div>

	
        	
    <!-- 인덱스 끝 -->
<jsp:include page="../common/footer.jsp" />