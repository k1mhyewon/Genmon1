<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="/minsu/header.jsp" />

<style type="text/css">

	div.container {
   		width: 70%;
   	/*  border: solid 1px blue; */
    }
    
    div#loginFrm {
    /*  border: solid 1px red;  */
    	margin: 10% 50%;
    	width: 50%;
    }
    
    div#loginFrm > ul > label, p{
    	display: block;
    	font-size: 12px;
    
    }
    
    input {
    	width: 80%;
    	text-align: left;
    	line-height: 200%;
    }
    
    span > button {
    	cursor: pointer;
		font-size: 12px;
		text-decoration: underline;
		background-color: white;
		border: none;
    }


</style>

<script>

$(document).ready(function(){});

	// == 이메일찾기 팝업창 띄우기 === // 
	function emailFindPopup() { window.open("emailFind.jsp", "이메일찾기", "width=400, height=320, left=100, top=50" ); }

	// == 비밀번호찾기 팝업창 띄우기 === // 
	function pwdFindPopup() { window.open("pwdFindModal1.jsp", "이메일찾기", "width=400, height=320, left=100, top=50"); }





</script>

<!-- 인덱스 시작 -->
    <div class="container">
        <div id="loginFrm">
        	<span style="font-weight:bold; display:inline-block; margin: 0 0 3% 8%; ">로그인</span>
        	
        	<ul>
        		<label for="email">이메일</label>
        		<input type="email" name="email" id="email" required/>
        	</ul>
        	
        	<ul>
        		<label for="pwd">비밀번호</label>
        		<input type="password" name="pwd" id="pwd" required/>
        	</ul>
        	
        	
        	<span> 
        	   <button type='button' value="팝업창 호출" id="modal_btn" onclick="emailFindPopup();" style="margin-left: 7%;"> 이메일 찾기</button> 
               <button type='button' value="팝업창 호출" id="modal_btn" onclick="pwdFindPopup();"> 비밀번호 찾기</button> 
            </span> 
           
           												
        	
        	<button type="button" style="background-color: black; color: white; width: 74%;margin: 10% 0 0 8%; line-height: 250%;">로그인</button>
        	
        	
        	<span style="font-weight:bold; display:inline-block; margin: 10% 0 3% 8%; ">회원가입</span>
        	<p style="width: 72%; margin-left: 8%;">회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</p>
        	<button type="button" id="btn_gojoin" style="background-color: black; color: white; width: 74%;margin-left: 8%; line-height: 250%;">신규가입</button>
        	
        </div>
    </div>    	
        	
    <!-- 인덱스 끝 -->
<jsp:include page="/minsu/footer.jsp" />


	