<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myinfo_mainMenu.jsp" />

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
.panel-faq-answer{
	background-color: #f4f4f4;
}




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
  background-color: #726996;
  border: none;
  color: #fff;
  cursor: pointer;
  padding: 10px 25px;
  float: right;
}
#btn-all-close:hover {
  background-color: white;
  color: #000;
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
</style>
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script>
	
	$(document).ready(function(){
		
		/* $("tr").click(function(){
			const tr = $(this).nextSibling;
			alert( tr.val );
			if( tr.hasClass("show")){
				alert("DSA");
			}
		}) */
		
		
		const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
		  
		  // panel-faq-answer
		  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

		  // btn-all-close
		  const btnAllClose = document.querySelector("#btn-all-close");
		  
		  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
		  for( let i=0; i < panelFaqContainer.length; i++ ) {
		      panelFaqAnswer[i].classList.remove('active');
		    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 
		      panelFaqAnswer[i].classList.toggle('active'); // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
		    });
		  };
		  
		  
		  /* panelFaqContainer.addEventListener('click', function() {
			  panelFaqAnswer.classList.remove('active');
			  $(this).querySelector(".panel-faq-answer").classList.toggle('active');;
		  }); */
		  
		  btnAllClose.addEventListener('click', function() {
		    // 버튼 클릭시 처리할 일  
		    for(let i=0; i < panelFaqAnswer.length; i++) {
		        panelFaqAnswer[i].classList.remove('active');
		    };
		  });
	});

</script>
<%-- 인덱스 시작 --%>
<div class="container">
	<!-- <div class="row justify-content-center">
		<div class="col-md-6 text-center mb-4">
<h2 class="heading-section">문의관리</h2> 
		</div>
	</div> -->
	<div class="row panel-group" id="accordion">
		<div class="col-md-12 panel panel-default">
			<!-- <h3 class="h5 mb-4 text-center">Collapsible Table</h3> -->
			<!-- <div class="checkbox">
				<label class="container">
				  <input type="checkbox" checked="checked">
				  <span class="checkmark"></span>전체
				</label>
							
				<label class="container">
				  <input type="checkbox">
				  <span class="checkmark"></span>미응답
				</label>
				
				<label class="container">
				  <input type="checkbox">
				  <span class="checkmark"></span>응답완료
				</label>
			</div>
			
			<form action="">
     		<div class="input-group">
		        <div class="input-group-prepend">
		          <div class="input-group-text"><i class="fa fa-search"></i></div>
		        </div>
		        <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="주문번호, 상품명, 고객 핸드폰번호로 검색 가능합니다.">
		      	<div id="recentUpdate" style="color:#e0e0e0; padding: 8px 10px; font-size:10pt; text-align: center;">최근수집 16:10 <p href="#"><i class="fas fa-refresh"></i></p></div>
		      </div>
   			</form> -->
   	
		  
	
	<div class="container">
    <h3 style="text-align: center; ">
      <small class="text-muted">1:1 문의내역</small>
    </h3>
    <button id="btn-all-close">FAQ ALL Close</button>
    <br>
    <table class="table myaccordion ">
      <caption>FAQ List of Articles</caption>
      <thead class="text-center">
		<tr>
			<!-- <th>#</th> --> 
			<th>상담구분</th>
			<th style="text-align:left">상담제목</th>
			<!-- <th>작성자</th> -->
			<th>작성일</th>
			<th>답변유무</th>
			<th>&nbsp;</th> 
		</tr>
	</thead>
				
						
      <tbody class="text-center">
        <tr>
          <td>
          	<div class="panel-faq-container">
              <p class="panel-faq-title">배송문의</p>
		        </div>
              
            <div class="panel-faq-answer">
			
				<div class="contents" >
			
				<div class="row" style="">
			        <div id="question memContext"><span>내용</span></div>
		        </div>
              </div>
            </div>
          </td>
          
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">What is Lorem Ipsum?</p>
            
		     </div>
            	<div class="panel-faq-answer">
              
				<div class="contents" >
			        <div class="row" style="">
				        <div class="column ft10 " >
				         	<div id="question memContext"><span>내용</span></div>
				         	<img class="column" width="" height="" src="" style="/* position:fixed; */  /*  border: 0.5px solid black; */">
				         </div><br>
			         </div>
		        
              </div>
              
              
            </div>
          </td>
          
          <td>2032.02.02</td>
          <td>미완료</td>
          <td>x</td>
          
          
              
        </tr>
        <tr>
          <td>
          	<div class="panel-faq-container">
              <p class="panel-faq-title">배송문의</p>
              
            <div class="panel-faq-answer">
			
				<div class="contents" >
			
				<div class="row" style="">
			        <div id="question memContext"><span>내용</span></div>
		        </div>
		        </div>
              </div>
            </div>
          </td>
          
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">What is Lorem Ipsum?</p>
            
            <div class="panel-faq-answer">
              
				<div class="contents" >
			        <div class="row" style="">
				        <div class="column ft10 " >
				         	<div id="question memContext"><span>내용</span></div>
				         	<img class="column" width="" height="" src="" style="/* position:fixed; */  /*  border: 0.5px solid black; */">
				         </div><br>
			         </div>
		        </div>
              </div>
            </div>
          </td>
          
          <td>2032.02.02</td>
          <td>미완료</td>
          <td>x</td>
        </tr>
        <tr>
          <td>
          	<div class="panel-faq-container">
              <p class="panel-faq-title">배송문의</p>
              
            <div class="panel-faq-answer">
			
				<div class="contents" >
			
				<div class="row" style="">
			        <div id="question memContext"><span>내용</span></div>
		        </div>
		        </div>
              </div>
            </div>
          </td>
          
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">What is Lorem Ipsum?</p>
            
            <div class="panel-faq-answer">
              
				<div class="contents" >
			        <div class="row" style="">
				        <div class="column ft10 " >
				         	<div id="question memContext"><span>내용</span></div>
				         	<img class="column" width="" height="" src="" style="/* position:fixed; */  /*  border: 0.5px solid black; */">
				         </div><br>
			         </div>
		        </div>
              </div>
            </div>
          </td>
          
          <td>2032.02.02</td>
          <td>미완료</td>
          <td>x</td>
        </tr>
        <tr>
          <td>
          	<div class="panel-faq-container">
              <p class="panel-faq-title">배송문의</p>
              
            <div class="panel-faq-answer">
			
				<div class="contents" >
			
				<div class="row" style="">
			        <div id="question memContext"><span>내용</span></div>
		        </div>
		        </div>
              </div>
            </div>
          </td>
          
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">What is Lorem Ipsum?</p>
            
            <div class="panel-faq-answer">
              
				<div class="contents" >
			        <div class="row" style="">
				        <div class="column ft10 " >
				         	<div id="question memContext"><span>내용</span></div>
				         	<img class="column" width="" height="" src="" style="/* position:fixed; */  /*  border: 0.5px solid black; */">
				         </div><br>
			         </div>
		        </div>
              </div>
            </div>
          </td>
          
          <td>2032.02.02</td>
          <td>미완료</td>
          <td>x</td>
        </tr>


        <!-- <tr class="bg-info">
          <td colspan=4 class="text-left">자주 묻는 질문 총 합계</td>
          <td>429</td>
        </tr> --> 
      </tbody>
    </table>
  </div>
  
    </div>

    </div>

</div>
</div>
</div>

<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />