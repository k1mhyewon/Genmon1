<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myinfo_mainMenu.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<% String ctxPath = request.getContextPath(); %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">



<style>
.ftco-section {
    padding: 7em 0;
}

@media (min-width: 992px)
.container {
    max-width: 960px;
}
@media (min-width: 768px)
.container {
    max-width: 720px;
}
@media (min-width: 576px)
.container {
    max-width: 540px;
}

.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}






/* Customize the label (the container) */
div.checkbox {
  font-size: 12px;
}
/* Hide the browser's default radio button */
.container input {
  position: relative;
  cursor: pointer;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
}


label.container{
	width: auto; 
	cursor: pointer;
	margin: 0 -10px;
}
.contents{
	margin-top: 10px;
	margin-left: 5%;
}
/* .panel-faq-answer{
	background-color: #f4f4f4;
} */




html,body {
  /* font-family: Helvetica, Arial, sans-serif; */
  margin: 0;
}
.panel-faq-container {
  margin-bottom: -16px;
}
.panel-faq-title {
  /* color: #00eaea; */
  cursor: pointer;
}
.panel-faq-answer {
  height: 0;
  overflow: hidden;
  /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
  왜? 닫기 버튼을 누를 때 변화가 티남 */
  transition: all 0.3s;
}
#btn-all-close {
  margin-bottom: 10px;
  background-color: #fff;
/*   border: 1px solid #979797; */
  border: none;
  color: #cecece;
  cursor: pointer;
  padding: 8px 20px;
  float: left;
}
#btn-all-close:hover {
  /* background-color: #cecece; */
  color:#545353;
  transition: all 0.3s;
}
.active {
  display: block;
  /* 높이를 정해줘야지만 transition이 적용됨 */
  height: 300px;
}
td:hover{
	background-color: #fff;
}
.hide{
	display:none;
}
.links{
	font-size:15pt;
	color: black;
	font-weight: bold;
}
.links:hover{
	color: black;
	text-decoration: underline;
	transition: all 0.3s;
}
</style>
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script>
	
	$(document).ready(function(){ 
		//alert("${cvo.contactfile_systemFileName}");
		 // panel-faq-container
		  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
		  
		  // panel-faq-answer
		  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

		  // btn-all-close
		  const btnAllClose = document.querySelector("#btn-all-close");
		  
		  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
		  for( let i=0; i < panelFaqContainer.length; i++ ) {
		    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
		      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
		      panelFaqAnswer[i].classList.toggle('active');
		    /*   if(panelFaqAnswer[i].classList.contains('active')){
		    	  const conatactid = $(this).parent().find('div#contactid').text()
		    	  displayDetailContact(contactid);
		      } */
		    });
		  };
		  
		  btnAllClose.addEventListener('click', function() {
		    // 버튼 클릭시 처리할 일  
		    for(let i=0; i < panelFaqAnswer.length; i++) {
		        panelFaqAnswer[i].classList.remove('active');
		    };
		  });
		  
	
		  
		  
		  $("button#delete").click(function(e){
			  const contactid = $(e.target).next().val();
			  const url = "<%= ctxPath%>/customerCare/contact/contactMyDelete.sun?contactid="+contactid;
				
			// 너비 800, 높이 600 인 팝업창을 화면 가운데 위치시키기
			const pop_width = 400;
			const pop_height = 400;
			const pop_left = Math.ceil((window.screen.width - pop_width)/2); /* 정수로만듦 */
			const pop_top = Math.ceil((window.screen.height - pop_height)/2);/* 정수로만듦 */
			
							// 팝업창이름(아무것도안써도상관없음)
			window.open(url, "goDeleteContact",
					    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
			window.close();
		  });
	});// end of $(document).ready(function(){ }------------------------------
	
	
	
	
	
	
	
</script>
<%-- 인덱스 시작 --%>
	<div class="container">
	<div class="row panel-group" id="accordion">
	
	<div class="container mb-5 mt-5">
    <h3 style="text-align: left; ">
      <small class="bld">1:1 문의내역</small>
    </h3><br>
      <p style="text-align: left; width:40%">
      	상담시간<br>
		평일(월 ~ 금) 10:00 ~ 17:00<br>
		(Off-time 12:30 ~ 13:30, 토/일/공휴일 휴무)<br><br></p>
		<p>
		한번 등록한 상담내용은 수정이 불가능합니다.
		향후 멤버쉽 단계별 혜택 및 선정기준은 사전공지 후 변경될 수 있습니다.</p>
     <br><br>
     <button id="btn-all-close" class="">ALL Close</button> &nbsp;
     <button id="" class="btn" style="background-color: none;border:none; color:#212529;float: right;" onclick="location.href='/Genmon1/customerCare/contact/memberGoContact.sun';">문의쓰기</button> &nbsp;
    <br>
    <table class="table myaccordion ">
      <%-- <caption>FAQ List of Articles</caption> --%>
      <thead class="text-center">
		<tr style="border-top: 3px solid #393939;">
			<!-- <th>#</th> --> 
			<th>상담구분</th>
			<th style="text-align:left">상담제목</th>
			<!-- <th>작성자</th> -->
			<th>작성일</th>
			<th>답변유무</th>
			<th>&nbsp;</th> 
		</tr>
	</thead>
				
						
      <tbody class="text-center " >
        <c:forEach var="cvo" items="${contactList}">
	       <tr style="border-bottom: 1px solid #dee2e6;">
	       
	          <td>
	          	${cvo.ctype}문의
	          </td>
	          
	          <td class="text-left" width="50%" >
	            <div class="panel-faq-container">
	            	 <c:set var="cont" value="${cvo.contents}" />
	              <p class="panel-faq-title" style="margin:auto;">${fn:substring(cont,0,10) }</p>
	              <input class="contactid" hidden="" value="${cvo.contactid}">
	              <div class="panel-faq-answer" >
		                <p style="font-size: 18pt; font-weight: bold"><br>Q. </p>
		                <p>${cvo.contents}</p>
						<c:if test="${cvo.contactfile_orginFileName != null}"> 
							<img src="/Genmon1/images/common/products/${cvo.contactfile_orginFileName}" class="img-fluid" style="width:20%;" />
						 </c:if> 
		                
		                <c:if test="${cvo.acontents != null}">
			                <p class="mt-5 " style="font-size: 18pt; font-weight: bold">A. </p>
							<p class="mb-5 ">${cvo.acontents}</p>
		                </c:if>
	              </div>
			     </div>
	          </td>
	          <td style="margin:auto;">${cvo.cregisterday}</td>
	          <td class="exist" style="margin:auto;">${cvo.replyExist}</td>
	          <td><button id="delete"type="button" class="btn button" style="border: 1px solid #dee2e6; color: #adadad">삭제</button>
	          <input hidden=""value="${cvo.contactid}">
	          </td>
	        </tr>
	        
	            
        </c:forEach>

      </tbody>
    </table>
  </div>
  
    </div>

    </div>


		<nav class="my-5">
		 	<div style="display:flex; ">
		 		<ul class="pagination " style="margin: auto;">${requestScope.pageBar}</ul>
				
				<!-- <select id="sizePerPage" name="sizePerPage">
			       <option value="10">10</option>
			       <option value="5">5</option>
			       <option value="3">3</option>
			    </select> -->
		 	</div>
 		</nav> 
</div>
</div>
</div>

<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />