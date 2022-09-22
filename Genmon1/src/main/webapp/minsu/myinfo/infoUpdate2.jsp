<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/minsu/header.jsp" />
<jsp:include page="myinfoMenu.jsp" />

<style type="text/css">

	form#frm_infoupdate {
		margin-bottom: 20%;
	}

	div#updateFrm {
       /* border: solid 1px blue; */
        display: inline-block;
       	font-size: 12px;
    	margin : 10% 0; 
    	width: 30%;
    	left: 35%;
    	position: absolute;
    	
    }
    
      input {
    	margin:2% 0;
    	width: 79%;
    	text-align: left;
    	line-height: 23px;
    }
    
  	div#updateFrm > ul > label, 
  	div#updateFrm > section > ul > label {
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
		width: 73%;
		display: block;
		line-height: 250%;
		margin: 7% 0 -2% 9%;
	}
  	

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
       
    $(document).ready(function(){
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
		});
		
		//Function to fetch states
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
		//=== 국가선택 끝 ===
		}
</script>

	<div id=updateFrm>
	     <ul>
			<label for="email">이메일주소</label>
			<input type="email" name="email" id="email" required/> <%-- 이메일자동으로 들어오게 설정 --%>
		</ul>
		
		<%-- 성별과 이름은 변경불가 변경을 원할경우 창띄우기
			이름과 생년월일은 변경이 불가합니다. 변경을 원하실 경우 고객문의센터로 연락부탁드립니다.
		 --%>
	 	<ul>
	         <label >성별</label>
	         <select type="text" id="gender" class="requiredInfo" required style="color: gray;"> 
	         	<option>남성</option>
	         	<option>여성</option>
	          </select>
	      </ul>
	      
	      <ul>
	         <label >성명</label>
	         <input type="text" id="name" class="requiredInfo" required/>
	      </ul>
		      
	    
	     <ul>
	         <span>생년월일</span>
	         <div style="text-align: left;" id="birth">
			    	<select name="year" id="year" title="년도" class="custom-select"></select>
					<select name="month" id="month" title="월" class="custom-select"></select>
					<select name="day" id="day" title="일" class="custom-select"></select>
				</div>
	         
     	 </ul>
   
	      <ul>
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
		</ul>
	      
	      <button type="button" id="btn_update" class="btn" >수정하기</button>
	      <%-- 이버튼을 클릭하면 infoUpdate1로 이동 --%>
	      
	</div>

</form>

<jsp:include page="/minsu/footer.jsp" />