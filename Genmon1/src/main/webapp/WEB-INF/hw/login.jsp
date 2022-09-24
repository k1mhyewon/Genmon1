<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String ctxPath = request.getContextPath();
    //    /Genmon1
%>

    
<jsp:include page="../header.jsp" />

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


</style>

<script>


	$(document).ready(function(){ // --------------------------------------------------
		
		
		$("button#btnSubmit").click(function(){
			goLogin(); // 로그인 시도
			
		}); // end of $("button#btnSubmit").click() --------------
		
		
		
	} // end of $(document).ready() ----------------------------------------------------
	
	
	
	
	// === 로그인 처리 함수 === //
	function goLogin(){
	//	alert("로그인 시도함");
	
	    const frm = document.loginFrm; 
	    frm.action = "<%= ctxPath%>/index.sun";
	    frm.method = "post";
	    frm.submit();
		
	}// end of function goLogin()-----------------

	
	
	
</script>

<!-- 인덱스 시작 -->
    <div class="container">
        <div id="loginFrm">
        	<span style="font-weight:bold; display:inline-block; margin: 0 0 3% 8%; ">로그인</span>
        	
        	<div>
        		<label for="email">이메일</label>
        		<input type="email" name="email" id="email" required/>
        	</div>
        	
        	<div>
        		<label for="pwd">비밀번호</label>
        		<input type="password" name="pwd" id="pwd" required/>
        	</div>
        	
        	
        	<span>
               	<a style="cursor: pointer; font-size: 12px; margin-left: 8%; text-decoration: underline;" data-toggle="modal" data-target="#emailFind" data-dismiss="modal" data-backdrop="static">이메일 찾기</a>
               	<a style="cursor: pointer; font-size: 12px;margin-left: 2%;text-decoration: underline;" data-toggle="modal" data-target="#passwdFind" data-dismiss="modal" data-backdrop="static">비밀번호 찾기</a>
            </span> 
             																			
        	
        	<button id="btnSubmit" type="button" style="background-color: black; color: white; width: 74%; margin: 10% 0 0 8%; line-height: 250%;">로그인</button>
        	
        	
        	<span style="font-weight:bold; display:inline-block; margin: 10% 0 3% 8%; ">회원가입</span>
        	<p style="width: 72%; margin-left: 8%;">회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</p>
        	<button type="button" id="btn_gojoin" style="background-color: black; color: white; width: 74%;margin-left: 8%; line-height: 250%;">신규가입</button>
        	
        </div>
    </div>    	
        	
    <!-- 인덱스 끝 -->
<jsp:include page="/minsu/footer.jsp" />


 

	
<jsp:include page="../footer.jsp" />
	