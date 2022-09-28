<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="header.jsp" />

<%-- 한글 폰트 --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<%-- 한글 폰트 --%>

<style type="text/css">

	/* 한글폰트 */
	*{ font-family: 'Noto Sans KR', sans-serif; }

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
    
    /* === 모달 CSS === */
    
    .modal-dialog.modals-fullsize_findEmail {
    width: 50%;
    height: 80%;
    }
    
    .modal-dialog.modals-fullsize {
    width: 50%;
    height: 90%;
    }
    
    
    .modal-content.modals-fullsize {
	    height: auto;
	    min-height: 100%;
	    border-radius: 0;
    }


</style>

<script>

$(document).ready(function(){});

	




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
        	
        	
        	<div> 
	        	<span id="cancel" type="button" class="link_tag" data-toggle="modal" data-target="#emailFindModal">이메일찾기</span>
	        	<span id="cancel" type="button" class="link_tag" data-toggle="modal" data-target="#emailFindModal">비밀번호 찾기</span>
            </div> 
           
           												
        	
        	<button type="button" style="background-color: black; color: white; width: 74%;margin: 10% 0 0 8%; line-height: 250%;">로그인</button>
        	
        	
        	<span style="font-weight:bold; display:inline-block; margin: 10% 0 3% 8%; ">회원가입</span>
        	<p style="width: 72%; margin-left: 8%;">회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</p>
        	<button type="button" id="btn_gojoin" style="background-color: black; color: white; width: 74%;margin-left: 8%; line-height: 250%;">신규가입</button>
        	
        </div>
    </div>    	
    
    
   <div class="modal fade" id="emailFindModal">
       	<div class="modal-dialog modals-fullsize_findEmail">

       		<div class="modal-content modals-fullsize">
               
               <!-- Modal body -->
                <div class="cancel_modal-body">
                <div>fdfsdfsdfsf</div>
                  	
                </div>
       		</div>
       	</div>
   </div>

	
        	
    <!-- 인덱스 끝 -->
<jsp:include page="footer.jsp" />

