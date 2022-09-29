<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../common/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />

<% String ctxPath = request.getContextPath(); %>

<style type="text/css">

	button.btn {
		background-color: black; 
		color: white;
		width: 70%;
		display: block;
		line-height: 200%;
		margin: 10% 0 -3% 10%;
	}
	
	form#menu_myinfoupdate {
		/*border: solid 1px orange;*/
		display: inline-block;
		width: 400px;
		height: 400px;
		padding: 3%;
	}
	
	ul > li {
		list-style: none;
		line-height: 30px;
		font-size: 13px;
	}
	
	 /* === 모달 CSS === */
    
    .modal-dialog.modals-fullsize_accountDropout {
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

<script type="text/javascript">

		$(document).ready(function(){
			
			$("span#info_detail").css("font-weight","bold");
			
			
			
			
			
			// 내정보수정하기에서 수정버튼을 누르면  
	        $("button#btn_update").click(function(){
	        	location.href="<%= ctxPath%>/myinfo/pwdInput.sun";
				
			}); // end of $("button#btn_logout").click() --------------
			
			
		});// end of $(document).ready(function() ------------------------------------------




</script>

	<form id="menu_myinfoupdate">
		<ul>
			<li id="gender" name="gender">성별&nbsp;&nbsp;: </li>
			<li id="name" name="name">성명&nbsp;&nbsp;: </li>
			<li id="birth" name="birth">생년월일&nbsp;&nbsp;: </li>
			<li id="email" name="email">이메일&nbsp;&nbsp;: </li>
		</ul>
		<div>
			<button type="button" id="btn_update" class="btn" >수정하기</button>
			<button type="button" id="btn_update" class="btn"  data-toggle="modal" data-target="#accountDropout">회원 탈퇴하기</button>
		</div>
	</form>




<%-- *** 회원탈퇴하기 찾기 Modal(부트스트랩기능) *** --%>
   <div class="modal fade" id="accountDropout">
       	<div class="modal-dialog modals-fullsize_accountDropout">

       		<div class="modal-content modals-fullsize">
     
               <!-- Modal body -->
                <div class="cancel_modal-body">
                	<iframe id="iframe_emailFind" style="border: none; width: 800px; height: 350px;" src="http://localhost:9090/Genmon/minsu/myinfo/accountDropout.jsp">
             		</iframe>
             		
                </div>
       		</div>
       	</div>
   </div>
   
   <jsp:include page="/minsu/footer.jsp" />