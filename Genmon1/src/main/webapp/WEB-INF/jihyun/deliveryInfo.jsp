<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
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
    #logo, #footer_logo {font-family: "Helvetica"; src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot"); src: url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.woff") format("woff"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/1ff95b1ff8fb906b63d36e68d0d07a07.svg#Helvetica") format("svg"); }
    
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
	
	/*
	span.nm{
		font-size: 10pt;
		margin-bottom: 6px;
	} */
	
	a.link_tag{
		font-size: 10pt;
		color: black;
		text-decoration: underline;
	}
	
	input.input_style{
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
	}
	
	/* 반응형 */
    @media (max-width: 1659px) {
    	div#box1{
    		display:block;
    		margin-left: auto;
    		margin-right: auto;
    	}
        div#box2{
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
	    
	    
	    // 다음 단계로 클릭이벤트
	    $("button#next").click(function(){
	    	location.href = "<%=ctxPath%>/order/payInfo.sun";
	    });
	    
	}); // end of ready 
	
	
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
	<div id="box1" >
		<form name="frmDeliveryInfo">
			<span class="boldtxt mb-4">배송지정보</span>
			<span class="puretxt mb-4"> 현재 배송 지역은 South Korea 입니다. <a href="#" class="link_tag">다른 지역으로 배송하시겠습니까?</a> </span>
			<span class="puretxt">이메일</span>
			<input type="text" name="" class="input_style" autofocus placeholder="이메일"/>
			<span></span>
			
			<%-- 
			<span class="nm">성</span> <span class="nm" style="margin-left: 250px">이름</span><br>
			<input type="text" name="" class="input_style" style="width: 245px;" placeholder="성"/>
			<input type="text" name="" class="input_style" style="width: 245px; margin-left: 5px;" placeholder="이름"/>
			--%>
			
			<span class="puretxt">이름</span>
			<input type="text" name="" class="input_style" placeholder="이름"/>
			
			<span class="puretxt">전화번호</span>
			<input type="text" name="" class="input_style" placeholder="전화번호"/>
			
			<%-- 배송지 시작 --%>
			<span class="puretxt">배송지검색</span>
			<input type="hidden" id="postcode" name=""/>
			
			<input type="text" id="address" name="" class="input_style" placeholder="주소" style="display: inline-block; width: 380px;"/>
			<button type="button" class="button1" onclick="openDaumPOST();">검색</button>
			<span class="puretxt">상세주소</span>
			<input type="text" id="detailAddress" name="" class="input_style"  placeholder="상세주소" />
			<input type="hidden" id="extraAddress" name="" />
			<%-- 배송지 끝 --%>
			<br><br>
			<button type="button" id="prev" class="button2">이전 단계로</button>
			<button type="button" id="next" class="button1" style="width: 245px;">다음 단계로</button>
		</form>
	</div>
	<div id="box2">
		<table>
			<thead>
				<tr>
					<td style="font-weight: bold;">주문내역</td>
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
					<td>배송비</td>
					<td colspan="2" class="myright">0원</td>
				</tr>
				<tr style="height: 50px;" class="top_line">
					<td>총합계</td>
					<td>수량:10</td>
					<td class="myright">37826원</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
	
<jsp:include page="../common/footer.jsp" />