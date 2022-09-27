<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>GENTLE MONSTER Officail Site</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>

<style>

	/* 폰트 적용(헬베티카) */
    @import url(//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica);
    #logo, #footer_logo {font-family: "Helvetica" !important; src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot"); src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff") format("woff"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.svg#Helvetica") format("svg"); }
   
    div.toast { 
        max-width: 100%; 
        text-align: center;
    }

    nav.navbar{
        height: 73px;
        background-color: white;
    }

    #logo{
        font-size: 19pt;
        font-weight: bold;
        color: black;
    }

    /* 반응형 */
    @media (max-width: 768px) {
        nav.navbar { height: 60px; }
        #logo{font-size: 14pt;}
    }

    a.nav-link, span.nav-link{
        color: black;
        font-size: 12pt;
        font-weight: bold;
        margin: auto 11px;
    }

    a.nav-link:hover{
        color: rgb(63, 63, 63);
    }

    footer{
        background-color: rgb(243, 243, 243);
    }

    .small_font{
        font-size: 9pt;
    }

    span.span_click:hover{
        color: rgb(117, 117, 117);
        cursor: pointer;
    }
    
    
    
    
    /*  헤더 끗  */
    
	span.boldtxt{
		display: block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	span.puretxt{
		display: block;
		font-size: 10pt;
		margin-bottom: 6px;
	}
	
	
	.link_tag{
		font-size: 11pt;
		color: black;
		text-decoration: underline;
	}
	
	
	input.input_style, select{
		margin-bottom: 20px;
		width: 100%;
		height: 40px;
		border: 1px solid black;
		font-size: 10pt;
		text-indent: 10px;
	}
	
	button.button1{
		cursor: pointer;
		width: 110px;
		height: 40px;
		margin-left: 5px;
		background-color: black;
		color: white;
		font-size: 10pt;
	}
	
	button.button2{
		cursor: pointer;
		width: 245px;
		height: 40px;
		border: 1px solid black;
		background-color: white;
		color: black;
		font-size: 10pt;
	}
	
	div#box1{
		display:inline-block;
		width: 500px;
		margin-left: 37%;
	}
	
	div#box2{
		display:inline-block;
		width: 350px;
		margin-left: 10%;
		position: fixed;
		top: 250px;
		overflow: auto;
	}
	
	/* 반응형 */
    @media (max-width: 1659px) {
    	div#box1{
    		display:block;
    		margin-left: auto;
    		margin-right: auto;
    	}
        div#box2{
        	position: static;
        	display:block;
        	width: 500px;
        	margin: 100px auto 150px auto;
        }
    }
    
    table {
		width: 100%;
		font-size: 10pt;
	}
	
	.myleft{
		text-align: left;
	}
	
	.myright{
		text-align: right;
	}
	
	tr > td:first-child {
		width: 90px;
	}
	
	img{
		width: 80px;
		height: 100px;
	}
	
	tr.empty_tr{
		height: 70px;
	}
	
	tr.height_tr{
		height: 30px;
	}
	
	tr.top_line{
		border-top: 1px solid gray;
	}
	
	label.labelst, a.labelst{
		font-size: 10pt; 
		padding-left: 10px;
	}
	
	/* a:link    : 방문 전 링크 상태이다.
       a:visited : 방문 후 링크 상태이다.
      a:hover   : 마우스 오버 했을 때 링크 상태이다.
      a:active  : 클릭 했을 때 링크 상태이다.
    */
	
	label.labelst:hover, span.link_tag{
		cursor: pointer;
	}
	
	/* 주문상세 테이블 */
	table#tbl_pay tr{
		height: 30px;
	}
	
</style>
<!-- Optional JavaScript -->
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
	
	    // toast(광고창)
	    $('.toast.fade').toast('show');
	    
	    $('#liveToastBtn').click(function(){
	        $('.toast.hide').toast('show');
	    });
	
	    // 하단 토글
	    $("div.hid").hide();
	    $("span.span_click").click(function(){
	        if($(this).text()=="법적고지+"){
	            $("div#toggle_list").toggle();
	        } else if($(this).text()=="소셜미디어+"){
	            $("div#toggle_list2").toggle();
	        }
	    });
	    
	}); // end of ready
	
	// 우편번호 찾기
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
	
	
	// 서비스 가입사실 클릭 이벤트
	function click_service(){
		window.open("service.png", "MyPopup" // 팝업창 안에 들어갈 내용물 // 직접쓰던가 파일네임
                , "left=300px, top=100px, width=1015px, height=560px"); 
	} // end of 서비스 가입사실 클릭 이벤트
	
</script>

</head>
<body>
	
	<%-- 광고창 시작 --%>
    <div>
		<div class="toast fade" data-autohide="false" role="alert" aria-live="assertive" aria-atomic="true">
		  <div class="toast-header">
		    <div class="mx-auto" style="padding: 6px 0;"><span style="font-size: 9pt; font-weight: bold;">광고 할라는데 캐러셀 넣을 수 있나? 암튼 더 해봐야 할듯</span></div>
		    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
		      <span aria-hidden="true">&times;</span>
		    </button>
		  </div>
		</div>
    </div>
    <%-- 광고창 끝 --%>
    


    <%-- 상단바 시작 --%>
    <nav class="navbar navbar-expand-md border-bottom" >
        <a class="navbar-brand" href="#"><span id="logo">GENTLE MONSTER</span></a>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
          <span style="font-weight: bold; font-size: 11pt;">결제</span>
          <ul class="navbar-nav" style="margin: auto 0 auto 30%;">
            <li class="nav-item">
              <a class="nav-link" style="color: gray;">①로그인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link">②배송주소</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" style="color: gray;">③결제방법</a>
            </li>
          </ul>
          <a class="link_tag ml-5" href="#">쇼핑계속하기</a>
        </div>  
        
    </nav>
    <%-- 상단바 끝 --%>
    
   
	<div class="container-fluid" style="margin-top:120px; margin-bottom:120px;">
	
	<%-- 결제구역 시작 --%>
	<div id="box1" >
		<form name="frmPayInfo" >
			<span class="boldtxt mb-4">결제 방법</span>
			<div class="border-bottom"></div><br>
			<span class="puretxt my-4">원하시는 결제 방법을 선택해주세요.</span>
			
			<%-- 라디오 시작 --%>
			<input type="radio" name="payment" id="card"><label class="labelst" for="card">신용카드</label><br>
			<input type="radio" name="payment" id="potint"><label class="labelst" for="potint">카카오페이</label><br>
			<input type="radio" name="payment" id="account"><label class="labelst" for="account">가상계좌</label><br>
			<%-- 라디오 끝 --%>
			
			<%-- 적립금 사용 --%>
			<span class="puretxt my-4">적립금 및 포인트 사용</span>
			<span class="puretxt my-2">사용 가능한 적립금 + 포인트 : <a class="link_tag"> 1000원</a></span>
			<input type="text" name="" class="input_style" placeholder="사용하실 금액을 입력하세요"/>
			
			<%-- 가상계좌 등장메뉴 --%>
			<div id="account">
				<br><div class="border-bottom my-3"></div><br>
				
				<span class="puretxt mb-3">잔액환불 원하는 계좌 정보를 입력해주세요</span>
				<span class="puretxt">환불 계좌 은행명</span>
				<select  class="myselect">
					<option value="0" selected>은행명선택</option> 
                    <option value="kakao">카카오뱅크</option>
                    <option value="nong">농협</option>
                    <option value="woori">우리</option>
                    <option value="shinhan">신한</option>
                    <option value="hana">하나</option>
	            </select>
				
				<span class="puretxt">환불 계좌번호</span>
				<input type="number" name="" class="input_style" placeholder="환불 계좌번호"/>
				<span></span>
				
				<span class="puretxt">계좌주명</span>
				<input type="text" name="" class="input_style" placeholder="계좌주명"/>
				<span></span>
			</div>
			<%-- 가상계좌 등장메뉴 끝 --%>
			
			<br>
			<span class="puretxt by-5" style="color: gray;">채무지급보증안내 - 고객님의 안전한 현금자산 거래를 위하여 하나은행과 채무지급보증계약을 체결하여 보장해드리고 있습니다.</span>
			<span class="link_tag" onclick="click_service()">서비스 가입사실 확인</span><br><br><br><br>
		

			<%-- 주문상세 시작 --%>
			<span class="boldtxt mb-4">주문상세</span>
			<span class="puretxt mb-3">이메일</span>
			<span class="puretxt">kimgenmon@naver.com</span>
			
			<table class="my-4" id="tbl_pay">
				<thead>
					<tr style="height: 40px;">
						<td style="font-weight: bold; font-size: 11pt;">배송</td>
						<td class="myright"><strong><a href="#" class="link_tag">수정</a></strong></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 250px;">배송주소</td>
						<td>전화번호</td>
					</tr>
					<tr>
						<td style="width: 250px;">김젠몬</td>
						<td>01012345678</td>
					</tr>
					<tr>
						<td colspan="2">서울특별시 관악구 청림3마길 28-8</td>
					</tr>
					<tr>
						<td colspan="2">101동 101호</td>
					</tr>
					<tr>
						<td colspan="2">08732</td>
					</tr>
					<tr>
						<td colspan="2"> </td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">배송사</td>
					</tr>
					<tr>
						<td colspan="2">CJ대한통운</td>
					</tr>
				</tfoot>
			</table> <br>
			<%-- 주문상세 끝 --%>
			
			
			<%-- 체크박스 시작 --%>
			<div class="my-3">
				<input id="agree_all" type="checkbox" /><label for="agree_all" class="labelst">전체동의</label><br>
				<input id="agree_1" type="checkbox" /><label for="agree_1" class="labelst">[필수]만14세이상입니다</label><br>
				<input id="agree_2" type="checkbox" /><label><a href="#" class="link_tag labelst">[필수]이용약관동의</a></label><br>
				<input id="agree_3" type="checkbox" /><label><a href="#" class="link_tag labelst">[필수]개인정보 수집 및 이용동의</a></label><br>
				<input id="agree_4" type="checkbox" /><label><a href="#" class="link_tag labelst">[선택]마켓팅목적 개인정보 수집 및 이용동의</a></label><br>
				<input id="agree_5" type="checkbox" /><label><a href="#" class="link_tag labelst">[선택]마켓팅정보수신 및 활용동의</a></label><br>
			</div>
			<%-- 체크박스 끝 --%>
			
			<br><br>
			<button type="button" class="button2">이전 단계로</button>
			<button type="button" class="button1" style="width: 245px;">결제</button>
		</form>
	</div>
	<%-- 결제구역 끝 --%>
	
	
	<%-- 장바구니 시작 --%>
	<div id="box2">
		<table>
			<thead>
				<tr>
					<td style="font-weight: bold; font-size: 11pt;">주문내역</td>
					<td colspan="2" class="myright"><strong><a href="#" class="link_tag">수정</a></strong></td>
				</tr>
				<tr style="height: 50px;">
					<td> 상품</td>
					<td colspan="2" class="myright">가격</td>
				</tr>
			</thead>
			<tbody>
				<%-- 반복시작 --%>
				<tr>
					<td rowspan="3" style="vertical-align: top; text-align: center;"><img src="sun_img.png"></td>
					<td style="font-weight: bold;">상품명</td>
					<td class="myright">상품가격</td>
				</tr>
				<tr>
					<td>수량:1</td>
					<td class="myright">37826원</td>
				</tr>
				<tr class="empty_tr">
					<td colspan="3" class="empty_td"></td>
				</tr>
				<%-- 반복끝 --%>
				<tr>
					<td rowspan="3" style="vertical-align: top; text-align: center;"><img src="sun_img.png"></td>
					<td style="font-weight: bold;">상품명</td>
					<td class="myright">상품가격</td>
				</tr>
				<tr>
					<td>수량:1</td>
					<td class="myright">37826원</td>
				</tr>
				<tr class="empty_tr">
					<td colspan="3" class="empty_td"></td>
				</tr>
				<tr>
					<td rowspan="3" style="vertical-align: top; text-align: center;"><img src="sun_img.png"></td>
					<td style="font-weight: bold;">상품명</td>
					<td class="myright">상품가격</td>
				</tr>
				<tr>
					<td>수량:1</td>
					<td class="myright">37826원</td>
				</tr>
				<tr class="empty_tr">
					<td colspan="3"></td>
				</tr>
				<%-- 반복끝 --%>
			</tbody>
			<tfoot>
				<tr class="height_tr top_line">
					<td>상품합계</td>
					<td colspan="2" class="myright">37826원</td>
				</tr>
				<tr class="height_tr">
					<td>적립금 사용</td>
					<td colspan="2" class="myright">-1000원</td>
				</tr>
				<tr class="height_tr">
					<td>배송비</td>
					<td colspan="2" class="myright">0원</td>
				</tr>
				<tr style="height: 50px;" class="top_line">
					<td>총 결제금액</td>
					<td>수량:10</td>
					<td class="myright">37826원</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<%-- 장바구니 끝 --%>
</div>
	
<jsp:include page="footer.jsp" />