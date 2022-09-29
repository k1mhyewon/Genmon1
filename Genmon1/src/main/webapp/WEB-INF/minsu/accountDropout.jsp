<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
<style>


	div#content > div{
		margin: 7% 0;
	}
	
	div#content > ul > li{
		line-height: 300%;
	}
	
	span#button > button{
		margin:10% 2%;
		background: white;
		width: 30%;
		line-height: 250%;
	}
	button:hover {
		cursor: pointer;
	}
	

</style>

<form name="Frm_acountDrop" id="Frm_acountDrop" style="padding: 2%; height: 0;">

	<h4 align="center" style="margin-top: 5%;">회원탈퇴 안내</h4>
	 
	<div id="content">
		<h4 style="margin-top: 50px;">회원탈퇴 전 유의사항을 확인해 주세요</h4>
		<ul>
		  	<li>부정 이용을 방지하기 위하여 회원탈퇴 후 48시간 이내로 재가입이 불가합니다. <br>(단, 간편가입 회원은 즉시 재가입 가능합니다.)</li>
		  	<li>탈퇴 즉시 개인정보가 삭제되고 어떠한 방법으로도 복원할 수 없습니다.</li>
		  	<li>교환/반품/환불 및 사후처리(A/S) 등을 위하여 전자상거래 등에서의 <br>소비자보호에 관한 법률에 의거해 일정 기간동안 보관 후 파기됩니다.</li>
		</ul>
		<input type="checkbox" name="agree" id="agree" style="margin-top: 2%;">위 유의사항을 모두 확인하였고, 회원탈퇴에 동의합니다.</input>
	</div>
	
	<span id="button">
		<button id="btn_cancle" type="button" >취소</button>
		<button id="btn_submit" type="button" class="btn btn-dark ms">확인</button>
	</span>
</form>