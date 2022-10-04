<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% String ctxPath = request.getContextPath(); %>
 
<jsp:include page="../common/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />



<style type="text/css">

	div#container {
	 	display: flex;
		font-size: 14px;
		width: 600px;
		height: 600px;
		margin: 20px auto 3% auto;
	 	
	}

	form#frm_adrupdateMenu {
		display: inline-block;
	}
	
	button.btn {
		background-color: black;
		color: white;
		width: 35%;
		display: block;
		line-height: 150%;
		margin: 5% 0 0 20%;
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
<script type="text/javascript">

	let b_flag_btn_adrsearch_click = false;
	// "우편번호찾기" 을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도.

	$(document).ready(function(){
		
		$("div.first_error").hide();
		$("div.error").hide();
		
		// === 성명포커스를 잃어버렸을 경우(blur) 이벤트를  처리해주는 것이다. === //
		$("input#name").blur( (e)=>{ 
			
			const $target = $(e.target);
			
			const name = $target.val().trim();
			if(name == "") {
				// 입력하지 않거나 공백만 입력한 경우
				$target.next("div.first_error").show();
			}
			else {
				// 공백이 아닌 경우
				$target.next("div.first_error").hide();
			}
		}); // end of $("input#name").blur() ----------------- 
		
	
		
		// === 우편번호 찾기를 클릭했을 때 이벤트 처리하기 === //
        $("button.btn_adrsearch").click(function() {
        	b_flag_btn_adrsearch_click = true;
        });
        
        // === 우편번호 입력란에 키보드로 입력할 경우 이벤트 처리하기 === //
        $("input:text[id='postcode']").keyup( function() {
        	alert("우편번호 입력은 \"우편번호찾기\"를 클릭하여 입력해야 합니다. ");
        	$(this).val("");
        });
        
     
	}); // end of $(document).ready(function(){}-----------------------------------------


	// >>> Function Declaration <<< //
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
	} // end of openDaumPOST() -------------------------------
	
	// >>> 주소를 저장하는 함수 <<<
	function goaddAddress() {
		
		// "우편번호 찾기" 를 클릭했는지 여부 알아오기
		if( !b_flag_btn_adrsearch_click ) {
			// / "우편번호 찾기" 를 클릭하지 않은 경우
			alert("우편번호 찾기 버튼을 이용하여 주소를 입력하세요.");
			return; // 종료
		}
		else {
			// "우편번호 찾기" 를 클릭한 경우
			// const regExp = /^[0-9]{5}$/g;
			// 또는
			const regExp = new RegExp(/^[0-9]{5}$/g);
			// 숫자 3자리 또는 4자리만 들어오도록 검사하는 정규표현식 객체 생성
			
			const postcode = $("input:text[id='postcode']").val();
			
			const bool = regExp.test( postcode );
			
			if( !bool ) {
				alert("우편번호 형식에 맞지 않습니다.");
				$("input:text[id='postcode']").val("");
				b_flag_btn_adrsearch_click = false;
			}
			
		}
		
		// 필수입력 사항 입력여부에 대한 흔적남기기
		let b_Flag_requiredInfo = false;
		
		const requiredInfo_list = document.querySelectorAll("input.requiredInfo");
		for( let i=0; i<requiredInfo_list.length; i++ ){
			const val = requiredInfo_list[i].value.trim();
			if(val == ""){
				alert("필수입력 사항은 모두 입력해야합니다.");
				b_Flag_requiredInfo = true;
				break;
			}
		} // end of for -------------------------
		
		if(b_Flag_requiredInfo) {
			return; // 종료
		}
		
		console.log("확인용 : " + $("input#name").val());
		console.log("확인용 : " + $("input#postcode").val());
		console.log("확인용 : " + $("input#address").val());
		console.log("확인용 : " + $("input#detailAddress").val());
		console.log("확인용 : " + $("input#extraAddress").val());
		
		const frm = document.frm_adrupdateMenu;
		frm.action = "adrView.sun";
		frm.method = "post";
		frm.submit();
	}
	
	
	
</script>


<div id="container">	
<form name="frm_adrupdateMenu" id="frm_adrupdateMenu">
	
<%-- 배송지 시작(만들어놓은 입력값 자동으로 들어가게하기) --%>

		  <ul>
			 <li>
		         <label >성명</label>
		       	 <input type="text" id="name" name="name" class="requiredInfo" placeholder="필수입력사항입니다." autofocus required />
		       	 <div class="first_error">필수 입력란입니다.</div>
	       	</li>
	      </ul>
	    
	      <ul>
		      <li>
				<div class="puretxt">우편번호</div>
				<input type="text" id="postcode" name="postcode " placeholder="우편번호" style="display: inline-block; width: 40%;"/>
				<button type="button" class="btn_adrsearch" onclick="openDaumPOST();">검색</button>
				<div class="error">검색을 통하여 배송지를 입력해주세요.</div>
				<div class="first_error">필수 입력란입니다.</div>
			</li>
		</ul>
			
		<ul>
			<li>
				<span class="puretxt">상세주소</span>
				<input type="text" id="address" name="address" class="input_style" placeholder="예)00동, 00로" />
				<input type="text" id="detailAddress" name="detailAddress" class="input_style"  placeholder="상세주소" style="display: inline-block;  width: 190px;" />
				<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" style="display: inline-block;  width: 190px;  margin: 10px 0 10px 8px;"/>
				<div class="first_error">필수 입력란입니다.</div>
			</li>
		</ul>
			<%-- 배송지 끝 --%>
		
		<button type="button" id="btn_update" class="btn" onClick="goaddAddress();">저장</button> <%-- 저장을 누르면 다시 adrAdd1로 이동 --%>
	</form>
</div>

<jsp:include page="/minsu/footer.jsp" />