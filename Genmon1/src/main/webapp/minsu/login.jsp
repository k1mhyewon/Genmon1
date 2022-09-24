<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="header.jsp" />

<style type="text/css">

	div.container {
   		width: 70%;
   	/*  border: solid 1px blue; */
    }
    
    div#loginFrm {
    /*  border: solid 1px red;  */
    	margin: 10% auto;
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
    
    div > span {
     font-size: 12px;
     text-decoration: underline;
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
        	
        	<ul>
        		<label for="email">이메일</label>
        		<input type="email" name="email" id="email" required/>
        	</ul>
        	
        	<ul>
        		<label for="pwd">비밀번호</label>
        		<input type="password" name="pwd" id="pwd" required/>
        	</ul>
        	
        	
        	<div> 
	        	<span id="cancel" type="button" class="link_tag" data-toggle="modal" data-target="#emailFindModal" style="margin-left: 37px;">이메일찾기</span>
	        	<span id="cancel" type="button" class="link_tag" data-toggle="modal" data-target="#pwdFindModal">비밀번호 찾기</span>
            </div> 
           
           												
        	
        	<button type="button" style="background-color: black; color: white; width: 74%;margin: 10% 0 0 8%; line-height: 250%;">로그인</button>
        	
        	
        	<span style="font-weight:bold; display:inline-block; margin: 10% 0 3% 8%; ">회원가입</span>
        	<p style="width: 72%; margin-left: 8%;">회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</p>
        	<button type="button" id="btn_gojoin" style="background-color: black; color: white; width: 74%;margin-left: 8%; line-height: 250%;">신규가입</button>
        	
        </div>
    </div>    	
    
    <!--  이메일찾기 Modal -->
   <div class="modal fade" id="emailFindModal">
       	<div class="modal-dialog modals-fullsize_findEmail">

       		<div class="modal-content modals-fullsize">
       		
       		<!-- Modal header -->
	        <div class="modal-header">
	          <h4 class="modal-title" >이메일 찾기</h4>
	          <button type="button" class="close idFindClose" data-dismiss="modal">&times;</button> <%-- &times;은 닫기버튼 x표 --%>
	        </div>
               
               <!-- Modal body -->
                <div class="cancel_modal-body">
                	<iframe id="iframe_emailFind" style="border: none; width: 100%; height: 350px;" src="http://localhost:9090/Genmon/minsu/login/emailFind.jsp">
             		</iframe>
             		
              <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary idFindClose" data-dismiss="modal" style="margin: auto;">Close</button>
		        </div>
                </div>
       		</div>
       	</div>
   </div>
   
   
   
   <!--  비밀번호 Modal -->
   <div class="modal fade" id="pwdFindModal">
       	<div class="modal-dialog modals-fullsize_findEmail">

       		<div class="modal-content modals-fullsize">
       		
       		<!-- Modal header -->
	        <div class="modal-header">
	          <h4 class="modal-title" >이메일 찾기</h4>
	          <button type="button" class="close idFindClose" data-dismiss="modal">&times;</button> <%-- &times;은 닫기버튼 x표 --%>
	        </div>
               
               <!-- Modal body -->
                <div class="cancel_modal-body">
                	<iframe id="iframe_emailFind" style="border: none; width: 100%; height: 350px;" src="http://localhost:9090/Genmon/minsu/login/pwdFindModal1.jsp">
             		</iframe>
                </div>
       		</div>
       	</div>
   </div>

	
        	
    <!-- 인덱스 끝 -->
<jsp:include page="footer.jsp" />

