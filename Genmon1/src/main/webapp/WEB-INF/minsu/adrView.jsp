<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% String ctxPath = request.getContextPath(); %>
 
 <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<jsp:include page="../common/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />


<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#delete").click(function(){
			alert("이 주소를 삭제하시겠습니까?");
		});
		
		
		
	});
</script>

<style>
	
	form#frm_address {
		/* border: solid 1px orange; */
		margin: 40px auto;
		width: 380px;
		height: 480px;
		font-size: 12px;
	}
	
	form#frm_address > div {
		display: inline-block;
		width:400px;
	}
	
	button#btn_update,
	button#btn_delete {
		margin: 3% 0 5% 0%;
		width: 144px;
	}
	ul {
		list-style: none;
		text-align:left;
		font-size: 13px;
		line-height: 30px;
		margin: 30px 0;
	}
	
	button:hover {
		cursor: pointer;
	}
	button {
		line-height:30px;
	}
	
	 /* === 모달 CSS === */
    
    .modal-dialog.modals-fullsize_accountDropout {
    width: 350px;
    height: 50%;
    }
    
    .modals-fullsize {
    	width: 300px;
    	height: 1000px;
    }
    
    
    .modal-content.modals-fullsize {
	    height: auto;
	    min-height:50%;
	    border-radius: 0;
    }

</style>

<script type="text/javascript">

	$(document).ready(function(){

		// 주소 수정버튼을 누르면  
	    $("button#btn_update").click(function(){
	    	location.href="<%= ctxPath%>/myinfo/adrAdd.sun";
			
		}); // end of $("button#btn_logout").click() --------------
		
		// 주소 추가버튼을 누르면  
	    $("button#btn_delete").click(function(){
	    	location.href="<%= ctxPath%>/myinfo/adrDelete.sun";
		}); // end of $("button#btn_logout").click() --------------
		
	
		// 주소 추가버튼을 누르면  
	    $("button#adrAdd").click(function(){
	    	location.href="<%= ctxPath%>/myinfo/adrAdd.sun";
		}); // end of $("button#btn_logout").click() --------------
		
		

	}); // end of $(document).ready(function() ------------------------------------------

	

</script>




	
	<form id="frm_address" >
		<div>
	
		<span style="font-size: 16px; font-weight: bold; margin-bottom: 30px; margin-left: 30px;">기본배송지</span>
				<%-- 자동으로 들어오게 나중에 requestScope로 바꾸기 --%>
				<c:forEach items="${loginuser.address}">
					<c:if test="${not empty loginuser.address}">
						<ul >
							<li id="name" name="name">${loginuser.name}&nbsp;</li>
							<li id="postcode" name="postcode">${loginuser.postcode} </li>
							<li id="address" name="address">${loginuser.address}</li>
							<li id="detailaddress" name="detailaddress" style="display: inline-block;">${loginuser.detailaddress}</li>
							<li id="extraaddress" name="extraaddress" style="display: inline-block;">${loginuser.extraaddress}</li>
						</ul>
						
						<button type="button" id="btn_update" style="background-color: black; color: white; margin-left: 10%;">수정</button>
						<button type="button" style="background-color: white;" id="btn_delete" data-toggle="modal" data-target="#addDelete">삭제</button>
					</c:if>
				</c:forEach>
				<c:if test="${empty loginuser.address}">
					<div align="center" >
	    				<div style="margin: 10% 0 10% 0;">등록된 배송지가 없습니다.</div>
	    				<button type="button" id="adrAdd" style="background-color: black; color: white;width: 72%; margin: 0 0 30% 10%; line-height: 200%;">주소추가하기</button>
	    			</div>
	   			</c:if>
		   			
		   	</div>
	</form>
	

<%--*** 주소 삭제하기 Modal(부트스트랩기능) *** --%>
<%-- 
   <div class="modal fade" id="addDelete">
       	<div class="modal-dialog modals-fullsize_accountDropout">

       		<div class="modal-content modals-fullsize">
     
               <!-- Modal body -->
                <div class="cancel_modal-body">
                	<iframe id="iframe_addDelete" style="border: none; width: 300px; height: 300px;" src="<%= ctxPath%>/myinfo/adrDelete.sun">
             		</iframe>
                </div>
       		</div>
       	</div>
   </div>
 --%>


<jsp:include page="/minsu/footer.jsp" />