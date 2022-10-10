<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>
<!-- swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<jsp:include page="../common/header.jsp" />
<jsp:include page="customerService.jsp" />
<style>
.swiper-wrapper {
		height:auto;
	}
    div#login_container {
    	margin: 5% 5% ;
    	width: 50%;
    }
    
    div#login_container > div>ul > li > label, p{
    	display: block;
    	font-size: 9pt;
    }
    
    .input_login {
    	width: 100%;
    	text-align: left;
    	line-height: 200%;
    	padding: 0 11.4px;
    }
    
    .titles {
	     font-size: 12pt;
	     font-weight: bold;
	     margin-bottom: 28px;
    } 
    
    
    li { list-style : none; }
    
    .form_container {
    	width: 100%;
    	height: auto;
    	margin: auto;
    }
    
    .fontSize_small {
    	font-size: 9pt;
    }
    
    .find_result_content {
    	/* border: solid 1px red; */
    	text-decoration: none;
    }
    
    .search_btn {
    	background-color: black; 
    	color: white; 
    	width: 70%;
    	margin: 0 auto; 
    	line-height: 300%;
    	font-size: 10pt;
    }
    
    ul{
    	padding-left: 0 ; 
    }
	
	.checkbox_item {
	    display: inline-block;
	    position: relative;
	    cursor: pointer;
	}
	.checkbox_item> input {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 0;
	    height: 0;
	    overflow: hidden;
    
	}
	span.checkbox_item > label {
    	padding: 5px 25px 0 0;
	}
	span.checkmark {
	    left: initial;
	    right: 0;
	    top: 6px;
	}
	.checkmark {
	    display: block;
	    position: absolute;
	    z-index: 0;
	    top: 1px;
	    left: 0;
	    width: 15px;
	    height: 15px;
	    border: 1px solid #343434;
	}
	.checkbox_item > input:checked ~ .checkmark:after {
	    content: '';
	    display: block;
	    position: absolute;
	    z-index: 5;
	    top: 4px;
	    left: 2px;
	    margin-top: -2px;
	    width: 9px;
	    height: 9px;
	    border: 1px solid #000;
	    background: #000;
	}

	.box_content {
	    width: 100%;
	    margin-bottom: 200px;
	}
	
	.error{
		color: red;
		font-size: 7pt;
		padding-left: 10px;
		padding-bottom: 1px;
	}
</style>

<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("input#none_id").prop("checked",true);
		$("input#loginEmail").focus();
		$("input#loginPwd").bind("keyup",(e)=>{
			if(e.keyCode == 13){ // 검색어에서 엔터를 치면 검색하러 가도록 한다.
				goSearch();			
			}
		});
		$("span.error").hide();
		
		
		// 비밀번호란에 스페이스바 입력못하게 하기 
		$("input").keyup(function() {
			let keycode = event.keyCode;
			let val = $(this).val().trim()
			$(this).val(val);
			if(keycode == 32){
				alert("스페이스바는 사용하실 수 없습니다.");
			}
		});
		
		
		
		
		// 회원 라디오체크박스 선택
		$("span.member [class='checkmark']").click(function() {
			$("input#has_id").prop("checked",true);	
			location.href="<%= ctxPath%>/customerCare/contact/memberSearchContact.sun";				
		});
	});
	
	// 조회하기 버튼클릭 
	function goSearch() {
		
		// 이메일과 비밀번호 정규표현식 검사하고 맞으면 db에서 비밀번호랑 이메일을 가지고 찾아봄.
		const email = $("input#loginEmail");
		const regExp = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);  
        //  이메일 정규표현식 객체 생성 
        const bool = regExp.test(email.val());
        if(!bool){ // 위배된경우 
        	email.focus();
        	email.css('border','1px solid red');
        	email.parent().find("span.error").show() // 경고 표기
			
        	email.keydown(function(){
        		email.parent().find("span.error").hide();
        		email.css('border','1px solid #ccc');
				return;
			});
        }
        else{
        	// 이메일과 비밀번호 정규표현식 검사하고 맞으면 db에서 비밀번호랑 이메일을 가지고 찾아봄.
    		const pwd = $("input#loginPwd");
    		const regExp = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);  
            //  비밀번호 정규표현식 객체 생성 
            const bool = regExp.test(pwd.val());
            if(!bool){ // 위배된경우 
            	pwd.focus();
            	pwd.css('border','1px solid red');
            	pwd.parent().find("span.error").show() // 경고 표기
    			
            	pwd.keydown(function(){
            		pwd.parent().find("span.error").hide();
            		pwd.css('border','1px solid #ccc');
    				return;
    			});
            }
            else{
		        const frm = document.loginFrm;
		        frm.action = "<%= ctxPath%>/customerCare/contact/guestSearchContact.sun";
		        frm.method = "POST";
		        frm.submit();
            }
        }
		
	}
	
	
</script>



<div class="box_content col-md-6 mb-9" style="margin:auto;">
	<form name="loginFrm">
        <div id="login_container">
        	<div class="titles">문의 조회</div>
        	
        	<p class="checkbox">
				<span class="checkbox_item member">
					<input type="radio" name="memselect" id="has_id" value="T" onclick="">
					<label for="has_id" >회원</label>
					<span class="checkmark"></span>
				</span>
				<span class="checkbox_item guest" style="margin-left: 10px;">
					<input type="radio" name="memselect" id="none_id" value="F" onclick="">
					<label for="none_id" >비회원</label>
					<span class="checkmark"></span>
				</span>
			</p>
        	
        	<div id="inputLogin">
	        	<ul><li>
	        		<label for="email" style="display:inline-block;">이메일</label><span class="error">이메일을 제대로 입력해주세요</span>
	        		<input type="text" name="email" class="input_login" id="loginEmail" required/>
	        	</li></ul>
	        	
	        	<ul><li>
	        		<label for="pwd" style="display:inline-block;">비밀번호</label><span class="error">비밀번호를 제대로 입력해주세요</span>
	        		<input type="password" name="pwd" class="input_login" id="loginPwd" required/>
	        	</li></ul>
        	</div>
        	
        	<%-- <c:if test="${ not empty requestScope.isLogined && isLogined == 'false' }">
	           	<div id="loginFailed" style="font-size: 9pt; color: red; margin: 10px 0 0 80px;">
	           		잘못된 아이디 또는 비밀번호를 입력하셨습니다. 다시 입력해주세요.
	           	</div>
           	</c:if> --%>
           	
           	<div style="text-align: center; margin-top: 40px;">
        		<a id="btn_goSearch" class="search_btn" type="button" onclick="goSearch()">조회</a>
        	</div>
             
        </div>
    </form>    	
        </div>
    
    
    
        	
</div>


<jsp:include page="../common/footer.jsp" />