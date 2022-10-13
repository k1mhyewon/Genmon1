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
	
	*{
		font-size: 11pt;
	}

</style>

<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>


<!--한국어  달력 쓰려면 추가 로드-->
 <script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script> 
  
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
		
		
		
		// 데이터 피커
		$('#datePicker1').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '180d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		});//datepicker end
		
		
		// 데이터 피커
		$('#datePicker1').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '180d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		});//datepicker end
		
	}); // end of ready

	
	
	
	
	function goSearch(){
		  alert('gkgkgk');
		  console.log($("input#from").val());
		  
		  if($("input#from").val() == ""){
			  alert('조회시작일을 지정해주세요');
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
 		<div style="margin: 0 auto 20px auto">
		 	<label for="from">From</label>
			<input type="text" id="datePicker1" class="form-control" name="from">
			<label for="to"> to </label>
			<input type="text" d="datePicker1" class="form-control" name="to">
		 	<button class="btn btn-outline-dark  ml-3" onclick="goSearch()">조회하기</button>
 		</div>
 	</div>
 	
 	<div id="show"></div>
 	
 </section>
 
 </body>