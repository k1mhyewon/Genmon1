<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="/minsu/header.jsp" />
<jsp:include page="myinfo_mainMenu.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />



<style type="text/css">

	form#frm_update {
		margin: 40px auto;
		width: 400px;
		height: 600px;
		font-size: 12px;
	}
	
	ul{
		list-style: none;
	}

     input {
    	margin:2% 0;
    	width: 79%;
    	text-align: left;
    	line-height: 25px;
    	display: block;
    }
    label {
	    display: block;
	    line-height: 25px;
	}
    
  	div#updateFrm > ul > li > label, 
  	div#updateFrm > section > ul > li > label {
  		display: block;
  	}
  
	div#birth > select {
		 /*border: solid 1px purple; */
		width: 26%;
		padding: 8px;
  	}
  	
  	select {
  		width:80%; 
  		height:35px; 
  		margin:2% 0;
  	}
  	
  	button.btn {
		background-color: black; 
		color: white;
		width: 72%;
		display: block;
		line-height: 250%;
		margin: 7% 0 -2% 10%;
	}
  	

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
       
    $(document).ready(function(){
    	
    	 // === select box 연도 , 월 표시 === //
		
    	
    
  		 
		//=== 국가선택 시작 ===
		$.get('https://restfulcountries.com/api/v1/countries?fetch_type=slim',function(countries){
		
		    //Loop through returned result and populate countries select
		    $.each(countries.data,function(key,value){
		        $('#country-select')
		            .append($("<option></option>")
		                .attr("value", value.name)
		                .text(value.name));
		        });
		    });
    	 
    	 
 	
		// 수정하기 버튼을 누르면
        $("button#btn_update").click(function(){
        	location.href="<%= ctxPath%>/myinfo/infoUpdate.sun";
			
		}); // end of $("button#btn_pwdcheck").click(function() --------------
			
	
				
				
	}); // end of $(document).ready(function() ------------------------------------
				
				
		// >>> Function Declaration <<< //
        // select box 연도 , 월 표시
		  function setDateBox() {
		    var dt = new Date();
		    var year = "";
		    var com_year = dt.getFullYear();

		    // 발행 뿌려주기
		    $("#year").append("<option value=''>년도</option>");

		    // 올해 기준으로 -50년부터 +1년을 보여준다.
		    for (var y = (com_year - 50); y <= (com_year + 1); y++) {
		      $("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
		    }

		    // 월 뿌려주기(1월부터 12월)
		    var month;
		    $("#month").append("<option value=''>월</option>");
		    for (var i = 1; i <= 12; i++) {
		      $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
		    }

		    // 일 뿌려주기(1일부터 31일)
		    var day;
		    $("#day").append("<option value=''>일</option>");
		    for (var i = 1; i <= 31; i++) {
		      $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
		    }

		  }
		  
		/* let dd_html = "";
		for(var i=1; i<=31; i++) {
			if(i<10) {
				dd_html += "<option>0"+i+"</option>";
			}
			else {
				dd_html += "<option>"+i+"</option>";
			}
		}
		$("select#birthdd").html(dd_html);
		// === 생년월일 끝 === 
  		 */
		
  		// === 국가선택 함수 시작 === //
		function initStates(){
		    //Get selected country name
		    let country=$("#country-select").val();
		
		    //Remove previous loaded states
		    $('#state-select option:gt(0)').remove();
		    $('#district-select option:gt(0)').remove();
		
		    //Call restful countries states endpoint
		    $.get('https://restfulcountries.com/api/v1/countries/'+country+'/states?fetch_type=slim',function(states){
		
		        //Loop through returned result and populate states select
		        $.each(states.data,function(key,value){
		            $('#state-select')
		                .append($("<option></option>")
		                    .attr("value", value.name)
		                    .text(value.name));
		        });
		    });
		}
  		// === 국가선택 함수 끝 === //
		
</script>

	<form id="frm_update">
	     <ul>
		     <li>
				<label for="email">이메일주소</label>
				<input type="email" name="email" id="email" required/> <%-- 이메일자동으로 들어오게 설정 --%>
			</li>
		</ul>
		
		<%-- 성별과 이름은 변경불가 변경을 원할경우 창띄우기
			이름과 생년월일은 변경이 불가합니다. 변경을 원하실 경우 고객문의센터로 연락부탁드립니다.
		 --%>
	 	<ul>
		 	<li>
		         <label >성별</label>
		         <select type="text" id="gender" class="requiredInfo" required style="color: gray;"> 
		         	<option>남성</option>
		         	<option>여성</option>
		          </select>
	          </li>
	      </ul>
	      
	      <%-- 성명과 생년월일은 수정불가함으로 ${requestScope.___}로 정보 부르기--%>
	      <ul>
		     <li>
		         <label >성명</label>
		         <input type="text" id="name" class="requiredInfo" required readonly/>
	         </li>
	      </ul>
		      
	    
	     <ul>
	     	<li>
		         <span>생년월일</span>
		         <div style="text-align: left;" id="birth" onclick="setDateBox()">
				    	<select name="year" id="year" title="년도" class="custom-select" readonly></select>
						<select name="month" id="month" title="월" class="custom-select" readonly></select>
						<select name="day" id="day" title="일" class="custom-select" readonly></select>
				</div>
			</li>
     	 </ul>
     	  
     	 
	     <ul>
	      <li>
		      	<label>국가</label>
		      	<select id="nation" class="form-control">
				    <option>대한민국</option>
				    <option>미국</option>
					<option>영국</option>
					<option>중국</option>
					<option>일본</option>
					<option>베트남</option>
					<option>프랑스</option>
				</select>
			</li>
		</ul>
	      
	      <button type="button" id="btn_update" class="btn" href="<%= ctxPath%>/member/infoUpdate.sun">수정하기</button>
	      <%-- 이버튼을 클릭하면 infoUpdate로 이동 --%>

</form>

<jsp:include page="/minsu/footer.jsp" />