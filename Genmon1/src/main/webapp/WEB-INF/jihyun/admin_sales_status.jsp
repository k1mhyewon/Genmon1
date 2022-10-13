<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% String ctxPath = request.getContextPath(); %>
    
<jsp:include page="../common/adminSidebar.jsp" />

<!-- 폰트 -->
<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<style>

	* {font-family: 'Pretendard', sans-serif; !important}
	
	table{
		background-color: white;
		text-align: center;
		font-size: 11pt;
	}
	
	input {
		width: 150px;
		margin: 10px;
		height: 40px;
		border: 1px solid gray;
		border-radius: 0.5rem;
		text-indent: 30px;
	}
	
	input:hover{
		cursor: pointer;
	}
	
	*{
		font-size: 11pt;
	}

</style>

<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<!-- JQuery UI CSS 밒 js -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<script>
	
	$(document).ready(function(){
		
		// 그래프 시작
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChart").getContext('2d');
		/*
		- Chart를 생성하면서, 
		- ctx를 첫번째 argument로 넘겨주고, 
		- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		*/
		var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: ["${sixmonthChartmap.label1}", "${sixmonthChartmap.label2}", "${sixmonthChartmap.label3}", "${sixmonthChartmap.label4}", "${sixmonthChartmap.label5}", "${sixmonthChartmap.label6}"],
		        datasets: [{
		        	responsive: true,
		            data: ['${sixmonthChartmap.data1}', '${sixmonthChartmap.data2}', '${sixmonthChartmap.data3}', '${sixmonthChartmap.data4}', '${sixmonthChartmap.data5}', '${sixmonthChartmap.data6}'],
		            label: '매출',
		            borderColor: [
		                'gray'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        }
		    }
		}); // 그래프 끝
		
		
	     
	     
	     
	  	// === 전체 datepicker 옵션 일괄 설정하기 ===  
        //     한번의 설정으로 $("input#fromDate"), $('input#toDate')의 옵션을 모두 설정할 수 있다.
        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
             // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
             // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
             // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
             // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
             // ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
              ,maxDate: "-1D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
          });
    
               //input을 datepicker로 선언
               $("input#fromDate").datepicker();                    
               $("input#toDate").datepicker();
               
               //From의 초기값을 오늘 날짜로 설정
               $('input#fromDate').datepicker('setDate', '-1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
               
               //To의 초기값을 3일후로 설정
               $('input#toDate').datepicker('setDate', '-1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
           });
		
	}); // end of ready

	
	
	
	
	function goSearch(){
		
		  // 종료일이 시작일보다 앞섰을때
		  if($("input#fromDate").val()>$("input#toDate").val()){
			  
			  alert('조회 시작일은 조회 종료일과 같거나 작아야 합니다');
			  $('input#fromDate').datepicker('setDate', '-1D');
              $('input#toDate').datepicker('setDate', '-1D'); 
			  return;
		  }
		  
		  
		 
	  }
	
	  
	  
</script>


<body style="background: #f4f4f4;">   
<section class="py-4 px-2 " style="width:60%; margin:0 auto; ">
 
	 &nbsp;&nbsp; <h3 style="color:#404040; font-size: 16pt; font-weight: bolder; margin: 0 0 5% 6%;">Sales status</h3> 
	 
	 <span class="my-3" style="font-size: 12pt; font-weight: bolder;">일자별 요약</span>
		<table class="table table-sm mt-2 mb-5 border" style="border-radius: 1rem;">
		  <thead class="table-active">
		    <tr>
		      <th>날짜</th>
		      <th>주문</th>
		      <th>취소</th>
		      <th>환불</th>
		      <th>매출</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var="salemap" items="${salemapList}">
		    <tr>
		      <th>${salemap.date}</th>
		      <td>${salemap.order}</td>
		      <td>${salemap.cancel}</td>
		      <td>${salemap.refund}</td>
		      <td><fmt:formatNumber value="${salemap.total}"></fmt:formatNumber>원</td>
		    </tr>
		    </c:forEach>
		    <tr>
		      <th>최근 7일 합계</th>
		      <td>${weeksalemap.order }</td>
		      <td>${weeksalemap.cancel }</td>
		      <td>${weeksalemap.refund }</td>
		      <td><fmt:formatNumber value="${weeksalemap.total}"></fmt:formatNumber>원</td>
		    </tr>
		    <tr>
		      <th>30일 합계</th>
		      <td>${monthsalemap.order }</td>
		      <td>${monthsalemap.cancel }</td>
		      <td>${monthsalemap.refund }</td>
		      <td><fmt:formatNumber value="${monthsalemap.total}"></fmt:formatNumber>원</td>
		    </tr>
		  </tbody>
		</table>
		
 	<span style="font-size: 12pt; font-weight: bolder;padding-top: 30px; display: block; margin-bottom: 10px;">월별매출 요약</span>
 	<div class="card" style="height: 300px; margin-bottom: 40px;">
         <canvas id="myChart" ></canvas>
     </div>
 	
 	
 	<span style="font-size: 12pt; font-weight: bolder;padding-top: 40px; display: block; ">기간별 조회</span> 
 	
 	<div style="display: flex;">
 		<div style="margin: 10px auto 20px 0">
			
			<input type="text" id="fromDate">
			<span style="display:inline-block; padding: 0 15px; font-size: 20pt;"> - </span>
            <input type="text" id="toDate">
            
		 	<button class="btn btn-outline-dark  ml-3 mt-0" onclick="goSearch()" style="height: 38px; width: 120px;">조회하기</button>
 		</div>
 	</div>
 	
 	<div id="show"></div>
 	
 </section>
 
 </body>