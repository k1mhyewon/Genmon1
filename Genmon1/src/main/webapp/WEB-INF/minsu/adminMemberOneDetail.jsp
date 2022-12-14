<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String ctxPath = request.getContextPath(); %>
<jsp:include page="../common/adminSidebar.jsp" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/modules/b4bca5d779777cff9d5c51553952a0a1.min.css" >
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
<!-- Style -->
  <link rel="stylesheet" href="<%= ctxPath%>/css/style.css">
<style>

@font-face {
		font-family: 'Noto Sans';
		font-style: normal;
		font-weight: 100;
		font-display: swap;
		src: local("NotoSansCjkKr-thin"), url("https://www.gentlemonster.com/kr/assets/fonts/notoSans/NotoSansKR-Thin.woff") format("woff"), url("https://www.gentlemonster.com/kr/assets/fonts/notoSans/NotoSansKR-Thin.woff2") format("woff2");
	}
	
.font--kr {
		font-family: "Unica77LLWeb","SDGothicNeo", sans-serif;
		word-break: keep-all;
	}

.form-outline {
    position: relative;
}
.form-outline .form-control~.form-label {
    /* position: absolute; */
    top: 0;
    max-width: 90%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    left: 0.75rem;
    padding-top: 0.37rem;
    pointer-events: none;
    transform-origin: 0 0;
    transition: all .2s ease-out;
    color: rgba(0,0,0,.6);
    margin-bottom: 0;
}
.form-outline .form-control~.form-notch {
    display: flex;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    max-width: 100%;
    height: 100%;
    text-align: left;
    pointer-events: none;
}
.btn-group-sm>.btn, .btn-sm {
	padding: -.3125rem 1rem -.3125rem;
    line-height: 1.5;
}


div#container {
	width: 70%;
	background-color: white;
}


div#div_btn > button {
	display: flex;
	margin: auto;
}

button.btn {
	display: inline-block;
}

div#mvoInfo {
	/* border: solid 1px gray; */
	width: 50%;
	margin: 5% 10%;
	color: #a6a6a6;
}

li {
	list-style: none;
	padding: 1%;
}

ol > li > span{
	font-size: 13pt;
	
}



</style>
<script src="<%= ctxPath%>/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script  type="text/javascript">
$(document).ready(function () {
	
	let goBackURL = "";
	
	/* ??????????????? */
	$("tr[scope='row']>td").hover(function() {
		/* $(this).addclass('thover'); */
		$(this).css('background-color','transparent');
		$(this).siblings().css('background-color','transparent');
	},function(){
		$(this).css('background-color','#fff');
		$(this).siblings().css('background-color','#fff');
		
	});
	
 	$("tr.addPrd").click(function() {
 		goAddProduct();
 	});

 	/* $("tr[scope='row']").click(function() {
 		if(!$(this).hasClass("addPrd")){
	 		goEditProduct();
 		}
	}); */
	

	
});// end of $(document).ready(function () {}--------------------------
		
	//>>> function Declaration<<< //
	
	// >>> ?????????????????? ???????????? ?????? ????????????(???????????????) <<< //
	function goMemberList() {
		location.href ="<%= request.getContextPath()%>"+goBackURL; 
	}
		
	
	
</script>
<%-- ????????? ?????? --%>



 <body style="background: #f4f4f4;">   
<section class="py-4 px-2 " style="width:85%; margin:0 auto; ">
 
 &nbsp;&nbsp; <h3 style="color:#404040; font-size: 16pt; font-weight: bolder; margin: 0 0 5% 10%;">Member Profile</h3> 
		
	<form name="memberDetailFrm">
	    <div class="table-responsive custom-table-responsive" style="width:80%; margin: auto;" >
		    <div id="container">
			    	
				<%-- ???????????? ???????????? ?????? --%>	    	
				<c:if test="${empty requestScope.mvo}">
					???????????? ?????? ???????????????.<br>
				</c:if>
				
				<c:if test="${not empty requestScope.mvo}">
					<c:set var="mobile" value="${requestScope.mvo.mobile}" />
					<c:set var="birthday" value="${requestScope.mvo.birthday}" />
					
					<div style="margin-left: 10%; padding-top:5%; font-size: 24px; font-weight: bold; color: #808080;">${requestScope.mvo.name} ??? ???????????? </div>
				
					<div id="mvoInfo" class='font--kr'>
					   <ol>
					       <li><span class="myli fw-bold">????????? : </span>${requestScope.mvo.userid}</li>
					       <li><span class="myli fw-bold">????????? : </span>${requestScope.mvo.name}</li>
					       <li><span class="myli fw-bold">????????? : </span>${requestScope.mvo.email}</li>
					       <li><span class="myli fw-bold">????????? : </span>${fn:substring(mobile, 0, 3)}-${fn:substring(mobile, 3, 7)}-${fn:substring(mobile, 7, 11)}</li> 
					       <li><span class="myli fw-bold">???????????? : </span>${requestScope.mvo.postcode}</li>
					       <li><span class="myli fw-bold">?????? : </span>${requestScope.mvo.address}&nbsp;${requestScope.mvo.detailaddress}&nbsp;${requestScope.mvo.extraaddress}</li>
					       <li><span class="myli fw-bold">?????? : </span><c:choose><c:when test="${requestScope.mvo.gender eq '1'}">??????</c:when><c:otherwise>???</c:otherwise></c:choose></li> 
					       <li><span class="myli fw-bold">???????????? : </span>${fn:substring(birthday, 0, 4)}.${fn:substring(birthday, 4, 6)}.${fn:substring(birthday, 6, 8)}</li>
					       <li><span class="myli fw-bold">????????? : </span><fmt:formatNumber value="${requestScope.mvo.coin}" pattern="###,###" /> ???</li>
					       <li><span class="myli fw-bold">????????? : </span><fmt:formatNumber value="${requestScope.mvo.point}" pattern="###,###" /> POINT</li>
					       <li><span class="myli fw-bold">???????????? : </span>${requestScope.mvo.registerday}</li>
					   </ol>
					</div> 
				</c:if>
				<%-- ???????????? ???????????? ??? --%>	   	    	
					    
					    
					    
				<%-- ???????????? ??????????????? ?????? --%>
				<div id="div_btn">
					<%-- ???????????? ??????.(????????? 1??????????????????. ?????? ????????? ???????????? ??????) --%>
					<button type="button" class="btn btn-secondary mt-5" onclick="javascript:location.href='adminMemberList.sun'">????????????</button> 
				</div>
			    	
		    	
		    </div>
	    
	    </div>
	  
	</form>
</section>
  
</body>


<%-- ????????? ??? --%>

