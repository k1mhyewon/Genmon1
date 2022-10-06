<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
       
 <% String ctxPath = request.getContextPath(); %>
  
    
<style>

	div#content{
		margin: 20% 0;
	}
	
	span#button > button{
		margin:10% 2%;
		background: white;
		width: 40%;
		line-height: 250%;
		vertical-align: bottom;
	}
	button:hover {
		cursor: pointer;
	}
	
	

</style>



<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 


<script type="text/javascript">

	$(document).ready(function(){
		/* 
		// 취소버튼을 누르면
		 $("#btn_cancle").click(function() {
		        self.close();
		    });
		
		 */
		 
		 
		 
		// 주소 삭제버튼을 누르면  
	    $("button#btn_submit").click(function(){
	    	location.href="<%= ctxPath%>/myinfo/adrDelete.sun";
		}); // end of $("button#btn_logout").click() --------------
		
		
		
	});

</script>


<form name="iframe_addDelete" id="iframe_addDelete" style="padding: 2%; height: 0;">

	<div id="content" align="center">
		주소를 삭제하시겠습니까?
	</div>
	
	<span id="button">
		<button id="btn_cancle" type="button"  style="margin-left: 20px;" value="창닫기" onClick="window.close()" >취소</button>
		<button id="btn_submit" type="button">확인</button>
	</span>
</form>