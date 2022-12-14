<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/minsu/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />

<style type="text/css">

	div#container {
	 	display: inline-block;
	 	
	}

	form#frm_adrupdateMenu {
		vertical-align: top;
		top: -150px;
	 	position: relative;
	}
	
	button.btn {
		background-color: black;
		color: white;
		width: 30%;
		display: block;
		line-height: 200%;
		margin: 5% 0 0 30%;
	}
	
	form#frm_adrupdateMenu {
		/*border: solid 1px orange;*/ 
		display: inline-table;
		font-size: 12px;
		width: 600px;
	}
	
	form#frm_adrupdateMenu > ul >li{
		margin-bottom: 5%;
	}
	
	input {
		width:70%;
		display: block;
		line-height: 200%;
	}
	
	button.btn_adrsearch {
		display: inline-block;
		width: 28%;
		margin-left: 2%; 
		line-height: 200%;
		background-color: black;
		color:white;
	}

	.first_error, .error {
  		font-size: 11px;
  		color:red;
  	}
  	
  	ul {
  		list-style: none;
  		line-height: 25px;
  	}

</style>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function openDaumPOST(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            let addr = ''; // 주소 변수
	            let extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	} // end of openDaumPOST()
</script>


<div id="container">	
<form name="frm_adrupdateMenu" id="frm_adrupdateMenu">
	
<%-- 배송지 시작(만들어놓은 입력값 자동으로 들어가게하기) --%>

		  <ul>
			 <li>
		         <label >성명</label>
		       	 <input type="text" id="name" name="name"/>
		       	 <div class="first_error">필수 입력란입니다.</div>
	       	</li>
	      </ul>
	      
	       <ul>
		       <li>
		         <label >전화번호</label>
		         <input type="text" id="mobile" name="mobile"/>
		         <div class="first_error">필수 입력란입니다.</div>
		      </li>
	      </ul>
	      
	      <ul>
		      <li>
				<div class="puretxt">주소검색</div>
				<input type="hidden" id="postcode" name=""/>
				<input type="text" id="address" name="" class="input_style" placeholder="예)00동, 00로" style="display: inline-block; width: 40%" />
				<button type="button" class="btn_adrsearch" onclick="openDaumPOST();">검색</button>
				<div class="error">검색을 통하여 배송지를 입력해주세요.</div>
				<div class="first_error">필수 입력란입니다.</div>
			</li>
		</ul>
			
		<ul>
			<li>
				<span class="puretxt">상세주소</span>
				<input type="text" id="detailAddress" name="" class="input_style"  placeholder="상세주소" />
				<div class="first_error">필수 입력란입니다.</div>
			</li>
		</ul>
			<%-- 배송지 끝 --%>
		
		<button type="button" id="btn_update" class="btn">저장</button> <%-- 저장을 누르면 다시 adrAdd1로 이동 --%>
	</form>
</div>

<jsp:include page="/minsu/footer.jsp" />