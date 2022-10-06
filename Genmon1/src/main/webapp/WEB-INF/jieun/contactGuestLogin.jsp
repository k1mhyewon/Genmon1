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
    	margin: 5% 15% ;
    	width:40%
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
	
	
</style>

<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		//////////////////////////////////////////////////////
		// === 로그인을 하지 않은 상태일 때
		// 로컬스토리지(localStorage)에 저장된 key 가 'saveid' 인 userid 값을 불러와서
		// input 태그 userid 에 넣어주기  ===
		if(${empty sessionScope.loginuser}){
			
			const loginUserid = localStorage.getItem('saveid');
			
			if(loginUserid != null){
				$("input#loginUserid").val(loginUserid);
				$("input:checkbox[id='saveid']").prop("checked",true);
			}
		}
		//////////////////////////////////////////////////////
		
		$("input#none_id").prop("checked",true);
		$("input#loginEmail").focus();
		
		
		$("input#loginPwd").bind("keyup",(e)=>{
			if(e.keyCode == 13){ // 검색어에서 엔터를 치면 검색하러 가도록 한다.
				goSearch();			
			}
		});
		
		
		// 회원 라디오체크박스 선택
		$("span.member [class='checkmark']").click(function() {
			$("input#has_id").prop("checked",true);	
			location.href="<%= ctxPath%>/customerCare/contact/memberGoContact.sun";				
		});
		
		
	});
	
	// 조회하기 버튼클릭 
	function goSearch() {
		alert("dasdas");
	}
	
	
</script>



<div class="box_content col-md-9">
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
	        		<label for="email">이메일</label>
	        		<input type="text" name="email" class="input_login" id="loginEmail" required/>
	        	</li></ul>
	        	
	        	<ul><li>
	        		<label for="pwd">비밀번호</label>
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