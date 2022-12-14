<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />

<style>

	* {font-family: 'Noto Sans KR', sans-serif; !important}

	div#order_nav{
		width: 40%;
		margin: auto;
	}
	
	nav > ul {
	    /* border: solid 1px blue; */
	
	    display: flex;
	    list-style-type: none;
	    padding: 0;
	    height: 90px;
	    position: relative;
	    top: 9px;
	}
	
	nav > ul > li {
	    /* border: solid 1px red; */
	    width: 15%;
	    
	    /* text-align: center; */
	
	    /* 안먹어 그니까 테이블셋이나 플렉스를 조야댐 */
	    /* vertical-align: middle;  */
	    margin: auto;
	}
	
	nav > ul > li > a {
	    /* border: solid 1px green; */
	
	    text-decoration: none;
	    color: black;
	    font-size: 13pt;
	    font-weight: bold;
	    padding: 3%;
	}
	
	nav > ul > li > a:hover{
	    color: gray;
	}
	
	/* 상단바 끝 */
	
	span.boldtxt{
		display: block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	.myright{
		text-align: right;
	}
	
	table {
		width: 100%;
		/* border : 1px solid black; */
		font-size: 10pt;
	}
	
	td{
		vertical-align: top;
		/* border-collapse:collapse;
		border : 1px solid black; */
	}
	
	tr {
		height: 30px;
	}
	
	.link_tag{
		font-size: 11pt;
		color: black;
		text-decoration: underline;
		font-weight:bold;
		margin-left : 20px;
		cursor: pointer;
	}
	
	div.box{
		width: 45%;
	}
	
	td.image{
		width: 175px;
		height: 220px;
	}
	
	img.image{
		width: 160px;
		height: 200px;
	}
	
	
	
	/* === 모달 CSS 시작 === */
    
    .modal-dialog.modals-fullsize_cancel {
    width: 50%;
    height: 80%;
    }
    
    .modal-dialog.modals-fullsize {
    width: 50%;
    height: 90%;
    }

    .modal-content.modals-fullsize {
	    height: auto;
	    min-height: 100%;
	    border-radius: 0;
    }
    
    
    /* .title_container : Modal 맨위에 글씨들 박스 */
    .title_container {
    	/* border : solid 1px pink; */
    	text-align: left;
    	margin: 20px 0 10px 0;
    	padding-left: 20px;
    }
    
    /* .modal_contents_size : 이건 가운데 정렬하려고 */
    .modal_contents_size {
    	width: 350px;
    	margin: auto;
    }
    
    
    #cancel_title {
    	font-weight: bold;
    	font-size: 12pt;
    	display: inline;
    	margin: 10px 10px 0 20px; 
    }
    
    #cancel_orderno {
    	font-weight: bold;
    	font-size: 12pt;
    	display: inline;
    }

	#cancel_sub_title {
    	font-size: 10pt;
    	margin-top: 10px;
    	margin-left: 45px;
    	
    }
    
    /* 스크롤 영역 크기 */
    .prod_container_cancel {
    	overflow: auto; 
    	height: 320px;
    	margin: auto;
    	
    }
    
    .prod_container {
    	overflow: auto; 
    	height: 280px;
    	margin: auto;
    	
    }
    
    /* 스크롤 내부의 개별 상품 박스 */
    .prod_container_each {
    	border : solid 2px #bfbfbf;
    	text-align: left;
    	padding: 25px 0 25px 20px;
    	margin-bottom: 20px;
    	
    }
    
    .serial_no{ font-size: 10px; }
    
    
    .prod_chkboxs {
    	display: block;
    }
    
    .prod_content_chk{
    	display: inline-block;
    	vertical-align: top;
    	margin-right: 15px;
    }
    
    .prod_content_img {
    	display: inline-block;
    	vertical-align: top;
    }
    
    .prod_contents {
    	display: inline-block;
    	/* border : solid 1px pink; */
    	margin: 13px 0 0 15px;
    }
    
    .sub_prod_contents {
    	font-size: 8.5pt;
    	margin-bottom: 5px;
    }
    
    .prod_select {
    	width: 70px;
    }
    
    .modal_footer {
    	/* border : solid 1px pink; */
    	margin-top: 15px;
    	font-size: 8pt;
    	text-align: left;
    	
    }
    
    .modal_btn {
    	text-align: center;
    	margin-top: 20px;
    }
    
    .request_btn {
    	width: 100px;
    	height: 30px;
    	font-size: 10pt;
    }
    
    
    .why_content {
    	height: 150px;
    	margin: auto;
    	font-size: 9pt;
    }
    
    .why_container {
    	width: 70%;
    	text-align: left;
    	font-size: 10pt;
    	font-weight: bold;
    	padding: 15px 0 10px 0 ;
    	margin-left: 14%;
    	margin-top: 10px;
    }
    
    .terms_chk {
    	width: 70%;
    	text-align: left;
    	font-size: 9pt;
    	margin-left: 14%;
    	margin-top: 10px;
    }
    
    
    /* === 모달 CSS 끝 === */
	
</style>

<script>

	$(document).ready(function(){
		
		
		// 리뷰내용 글자수 50자 제한 -------------------------------------------------
		$('.why_content').keyup(function (e) {
			let rev_content = $(this).val();
		    
		    // 글자수 세기
		    if (rev_content.length == 0 || rev_content == '') {
		    	$('.text_cnt').text('0자');
		    } else {
		    	$('.text_cnt').text(rev_content.length + '자');
		    }
		    
		    // 글자수 제한
		    if (rev_content.length > 50) {
		    	// 50자 부터는 타이핑이 안되게
		        $(this).val($(this).val().substring(0, 50));
		    };
		}); // end of $('#rev_content').keyup() ---------------------------------
		
		
		
		
	}); // end of $(document).ready() ---------------
	
	
	

</script>

<%-- 상단네비 시작 --%>
<div class="border-top"></div>
<div id="order_nav">
	<nav>
	    <ul>
	    	<li><a href="#">회원정보</a></li>
	    	<li><a href="#">주문/배송</a></li>
	    	<li><a href="#">위시리스트</a></li>
	    	<li><a href="#">상품문의</a></li>
	    </ul>
	</nav>
</div>
<%-- 상단네비 끝 --%>

<div class="border-top"></div>
<div class="container my-5">
	<span class="boldtxt mb-3">주문</span>
	
	<%-- 주문번호 부분 시작 --%>
	<table class="tbl_1 border-bottom">
		<tbody>
			<tr><td><strong>Order#000001010</strong><td></tr>
			<tr><td><strong>2022/09/03</strong></td></tr>
			<tr><td>주문수량 : 3</td></tr>
			<tr>
				<td class="myright" style="height: 50px;">
				
				
					<!-- ======== [주문취소 Modal] ================================================================ -->
					
					<!-- 주문 취소 Modal 버튼 -->
			        <span id="cancel" type="button" class="link_tag" data-toggle="modal" data-target="#cancel_modal">주문취소</span>
			        <!-- 주문 취소 Modal 버튼 끝 -->  
			
			
					<!-- 주문 취소 Modal 시작 -->
					
			        <div class="modal fade" id="cancel_modal">
			        	<div class="modal-dialog modals-fullsize_cancel">

			        		<div class="modal-content modals-fullsize">
			                
			                <!-- Modal body -->
				                <div class="cancel_modal-body">
				                
				                	<!-- .title_container : Modal 맨위에 글씨들 박스 -->
				                	<div class="title_container">
					                    <div id="cancel_title">주문 취소</div>
					                    <div id="cancel_orderno">Order&nbsp;#00001010</div>
					                  	<button type="button" class="close" data-dismiss="modal">&times;</button>
					                  	<div id="cancel_sub_title">주문취소할 상품을 선택하세요.</div>
				                  	</div>
				                  	
				                  	<!-- .prod_container : 스크롤 영역 -->
				                  	<div class="prod_container_cancel">
				                  	
				                  		<!-- foreach 여기부터 하면 됨 (아마도..?) -->
					                  	<div class="prod_container_each modal_contents_size">
					                  		<div class="prod_content_chk">
					                  			<input type="checkbox" name="cancel_prod" class="prod_chkboxs" value="상품아이디" >
					                  		</div>
				                  			<div class="prod_content_img">
					                  			<img src="sun_img.png" style="max-width: 100%; height: auto;">
					                  		</div>
					                  		<div class="prod_contents">
						                  		<div class="sub_prod_contents">젠몬 01</div>
						                  		<div class="sub_prod_contents serial_no">시리얼넘버: 0000111123</div>
						                  		<div class="sub_prod_contents">259,000원</div>
						                  		<select name="상품아이디_cnt" class="prod_select">
												  <option value="1">1</option>
												</select>
											</div>
											<div style="clear:both;"></div>
					                  	</div>
					                  	<!-- foreach 여기까지 끊으면 됨 -->
					                  	
					                  	<!-- 여기부터는 삭제 ㄱㄱ -->
					                  	<div class="prod_container_each modal_contents_size">
					                  		<div class="prod_content_chk">
					                  			<input type="checkbox" name="cancel_prod" class="prod_chkboxs" value="상품아이디" >
					                  		</div>
				                  			<div class="prod_content_img">
					                  			<img src="sun_img.png" style="max-width: 100%; height: auto;">
					                  		</div>
					                  		<div class="prod_contents">
						                  		<div class="sub_prod_contents">젠몬 01</div>
						                  		<div class="sub_prod_contents">259,000원</div>
						                  		<select name="상품아이디_cnt" class="prod_select">
												  <option value="1">1</option>
												</select>
											</div>
											<div style="clear:both;"></div>
					                  	</div>
					                  	
					                  	<div class="prod_container_each modal_contents_size">
					                  		<div class="prod_content_chk">
					                  			<input type="checkbox" name="cancel_prod" class="prod_chkboxs" value="상품아이디" >
					                  		</div>
				                  			<div class="prod_content_img">
					                  			<img src="sun_img.png" style="max-width: 100%; height: auto;">
					                  		</div>
					                  		<div class="prod_contents">
						                  		<div class="sub_prod_contents">젠몬 01</div>
						                  		<div class="sub_prod_contents">259,000원</div>
						                  		<select name="상품아이디_cnt" class="prod_select">
												  <option value="1">1</option>
												</select>
											</div>
											<div style="clear:both;"></div>
					                  	</div>
					                  	<!-- 여기까지 삭제 ㄱㄱ -->
					                  	
				                  	</div>
				                  	<!-- .prod_container : 스크롤 영역 끝 -->
				                  	
				                  	<!-- .modal_footer: 밑에 글씨들 -->
				                  	<div class="modal_footer modal_contents_size">
				                  		<div>환불예정금액: 259,000원</div>
				                  		<div>주문시 작성하신<br>우리은행 1002-950-797783 김지현 계좌로 환불됩니다.</div>
				                  	</div>
				                  	<!-- .modal_footer -->
				                  	
				                  	<!-- .modal_btn: 환불신청 버튼 -->
				                  	<div class="modal_btn modal_contents_size">
				                  		<button type="button" class="btn btn-dark request_btn">환불신청</button>
				                  	</div>
				                  	<!-- .modal_btn -->
				                </div>
			         		</div>
			         	</div>
			         </div>
			        
					<!-- 주문 취소 Modal 끝 똑같이 두번 하면 됨 -->
					
					
					
					<!-- ======== [환불신청 Modal] ================================================================ -->
					
					<!-- 환불신청 Modal 버튼 -->
			        <span id="refund" type="button" class="link_tag" data-toggle="modal" data-target="#refund_modal">환불신청</span>
			        <!-- 환불신청 Modal 버튼 끝 -->  
			
			
					<!-- 환불신청 Modal 시작 -->
					
			        <div class="modal fade" id="refund_modal">
			        	<div class="modal-dialog modals-fullsize">

			        		<div class="modal-content modals-fullsize">
			                
			                <!-- Modal body -->
				                <div class="refund_modal-body">
				                
				                	<!-- .title_container : Modal 맨위에 글씨들 박스 -->
				                	<div class="title_container">
					                    <div id="cancel_title">환불 신청</div>
					                    <div id="cancel_orderno">Order&nbsp;#00001010</div>
					                  	<button type="button" class="close" data-dismiss="modal">&times;</button>
					                  	<div id="cancel_sub_title">환불을 신청할 상품을 선택하세요.</div>
				                  	</div>
				                  	
				                  	<!-- .prod_container : 스크롤 영역 -->
				                  	<div class="prod_container">
				                  	
				                  		<!-- foreach 여기부터 하면 됨 (아마도..?) -->
					                  	<div class="prod_container_each modal_contents_size">
					                  		<div class="prod_content_chk">
					                  			<input type="checkbox" name="cancel_prod" class="prod_chkboxs" value="상품아이디" >
					                  		</div>
				                  			<div class="prod_content_img">
					                  			<img src="sun_img.png" style="max-width: 100%; height: auto;">
					                  		</div>
					                  		<div class="prod_contents">
						                  		<div class="sub_prod_contents">젠몬 01</div>
						                  		<div class="sub_prod_contents serial_no">시리얼넘버: 0000111123</div>
						                  		<div class="sub_prod_contents">259,000원</div>
						                  		<select name="상품아이디_cnt" class="prod_select">
												  <option value="1">1</option>
												</select>
											</div>
											<div style="clear:both;"></div>
					                  	</div>
					                  	<!-- foreach 여기까지 끊으면 됨 -->
					                  	
				                  	</div>
				                  	<!-- .prod_container : 스크롤 영역 끝 -->
				                  	
				                  	<!-- .modal_footer: 밑에 글씨들 -->
				                  	<div class="modal_footer modal_contents_size">
				                  		<div>환불예정금액: 259,000원</div>
				                  		<div>주문시 작성하신<br>우리은행 1002-950-797783 김지현 계좌로 환불됩니다.</div>
				                  	</div>
				                  	<!-- .modal_footer -->
				                  	<div style="text-align: left;" class=" why_container">
					                  	<div style="display: inline; margin-right: 70px; text-align: left;">환불사유를 입력해주세요 (최대 50자)</div>
					                  	<div id="text_cntBox"  style="display: inline;">
							                <span class="text_cnt">0자</span>
							                <span>/50자</span>
							            </div>
					                  	<div>
							                <textarea class="col-auto form-control why_content" type="text" 
							                          placeholder="사유를 50자 이내로 입력해주세요."></textarea>
							            </div>
				                  	</div>
				                  	
				                  	<div class="terms_chk">
			                  			<input type="checkbox" name="terms1" value="terms1" style="display: inline" >
			                  			<div style="display:inline">단순 변심등의 사유는 배송비가 청구될 수 있습니다.</div><br>
			                  			<input type="checkbox" name="terms2" value="terms2" style="display: inline" >
			                  			<div style="display:inline">상품 상태에 따라 환불신청이 거부될 수 있습니다.</div>
			                  		</div>
				                  	
				                  	
				                  	<!-- .modal_btn: 환불신청 버튼 -->
				                  	<div class="modal_btn modal_contents_size">
				                  		<button type="button" class="btn btn-dark request_btn">환불신청</button>
				                  	</div>
				                  	<!-- .modal_btn -->
				                </div>
			         		</div>
			         	</div>
			         </div>
			        
					<!-- 환불신청 Modal 끝 -->



					<!-- ======== [교환신청 Modal] ================================================================ -->
					
					<!-- 교환신청 Modal 버튼 -->
			        <span id="refund" type="button" class="link_tag" data-toggle="modal" data-target="#exchange_modal">교환신청</span>
			        <!-- 교환신청 Modal 버튼 끝 -->  
			
			
					<!-- 환불신청 Modal 시작 -->
					
			        <div class="modal fade" id="exchange_modal">
			        	<div class="modal-dialog modals-fullsize">

			        		<div class="modal-content modals-fullsize">
			                
			                <!-- Modal body -->
				                <div class="refund_modal-body">
				                
				                	<!-- .title_container : Modal 맨위에 글씨들 박스 -->
				                	<div class="title_container">
					                    <div id="cancel_title">교환 신청</div>
					                    <div id="cancel_orderno">Order&nbsp;#00001010</div>
					                  	<button type="button" class="close" data-dismiss="modal">&times;</button>
					                  	<div id="cancel_sub_title">교환을 신청할 상품을 선택하세요.</div>
				                  	</div>
				                  	
				                  	<!-- .prod_container : 스크롤 영역 -->
				                  	<div class="prod_container">
				                  	
				                  		<!-- foreach 여기부터 하면 됨 (아마도..?) -->
					                  	<div class="prod_container_each modal_contents_size">
					                  		<div class="prod_content_chk">
					                  			<input type="checkbox" name="cancel_prod" class="prod_chkboxs" value="상품아이디" >
					                  		</div>
				                  			<div class="prod_content_img">
					                  			<img src="sun_img.png" style="max-width: 100%; height: auto;">
					                  		</div>
					                  		<div class="prod_contents">
						                  		<div class="sub_prod_contents">젠몬 01</div>
						                  		<div class="sub_prod_contents serial_no">시리얼넘버: 0000111123</div>
						                  		<div class="sub_prod_contents">259,000원</div>
						                  		<select name="상품아이디_cnt" class="prod_select">
												  <option value="색상">블랙</option>
												</select>
											</div>
											<div style="clear:both;"></div>
					                  	</div>
					                  	<!-- foreach 여기까지 끊으면 됨 -->
					                  	
					                  	<!-- 여기부터는 삭제 ㄱㄱ -->
					                  	<div class="prod_container_each modal_contents_size">
					                  		<div class="prod_content_chk">
					                  			<input type="checkbox" name="cancel_prod" class="prod_chkboxs" value="상품아이디" >
					                  		</div>
				                  			<div class="prod_content_img">
					                  			<img src="sun_img.png" style="max-width: 100%; height: auto;">
					                  		</div>
					                  		<div class="prod_contents">
						                  		<div class="sub_prod_contents">젠몬 01</div>
						                  		<div class="sub_prod_contents">259,000원</div>
						                  		<select name="상품아이디_cnt" class="prod_select">
												  <option value="1">1</option>
												</select>
											</div>
											<div style="clear:both;"></div>
					                  	</div>
					                  	
					                  	<div class="prod_container_each modal_contents_size">
					                  		<div class="prod_content_chk">
					                  			<input type="checkbox" name="cancel_prod" class="prod_chkboxs" value="상품아이디" >
					                  		</div>
				                  			<div class="prod_content_img">
					                  			<img src="sun_img.png" style="max-width: 100%; height: auto;">
					                  		</div>
					                  		<div class="prod_contents">
						                  		<div class="sub_prod_contents">젠몬 01</div>
						                  		<div class="sub_prod_contents">259,000원</div>
						                  		<select name="상품아이디_cnt" class="prod_select">
												  <option value="1">1</option>
												</select>
											</div>
											<div style="clear:both;"></div>
					                  	</div>
					                  	<!-- 여기까지 삭제 ㄱㄱ -->
					                  	
				                  	</div>
				                  	<!-- .prod_container : 스크롤 영역 끝 -->
				                  	
				                  	<!-- .modal_footer: 밑에 글씨들 -->
				                  	<div class="modal_footer modal_contents_size">
				                  		<div>환불예정금액: 259,000원</div>
				                  		<div>주문시 작성하신<br>우리은행 1002-950-797783 김지현 계좌로 환불됩니다.</div>
				                  	</div>
				                  	<!-- .modal_footer -->
				                  	<div style="text-align: left;" class=" why_container">
					                  	<div style="display: inline; margin-right: 70px; text-align: left;">교환사유를 입력해주세요 (최대 50자)</div>
					                  	<div id="text_cntBox"  style="display: inline;">
							                <span class="text_cnt">0자</span>
							                <span>/50자</span>
							            </div>
					                  	<div>
							                <textarea class="col-auto form-control why_content" type="text" 
							                          placeholder="사유를 50자 이내로 입력해주세요."></textarea>
							            </div>
				                  	</div>
				                  	
				                  	<div class="terms_chk">
			                  			<input type="checkbox" name="terms1" value="terms1" style="display: inline" >
			                  			<div style="display:inline">단순 변심등의 사유는 배송비가 청구될 수 있습니다.</div><br>
			                  			<input type="checkbox" name="terms2" value="terms2" style="display: inline" >
			                  			<div style="display:inline">상품 상태에 따라 환불신청이 거부될 수 있습니다.</div>
			                  		</div>
				                  	
				                  	
				                  	<!-- .modal_btn: 교환신청 버튼 -->
				                  	<div class="modal_btn modal_contents_size">
				                  		<button type="button" class="btn btn-dark request_btn">교환신청</button>
				                  	</div>
				                  	<!-- .modal_btn -->
				                </div>
			         		</div>
			         	</div>
			         </div>
			        
					<!-- 교환신청 Modal 끝 -->

					
					<!-- ======== [Modal 끝] ================================================================ -->


				</td>
			</tr>
		</tbody>
	</table>
	<%-- 주문번호 부분 끝 --%>
	
	
	<%-- 밑에 테이블 두개 시작 --%>
	<div style="display: flex;" class="my-4">
		<div class="box">
			<table class="mb-4 border-right">
				<tbody>
					<tr>
						<td colspan="2"><strong>입금대기중</strong></td>
					</tr>
					<%-- 반복시작 --%>
					<tr>
						<td rowspan="3" class="image"><img src="sun_img.png"  class="image"></td>
						<td style="vertical-align: middle;"><strong>릴리트01</strong><br>259000원</td>
					</tr>
					<tr>
						<td>수량 : 1</td>
					</tr>
					<tr>
						<td  style="height: 70px;"> </td>
					</tr>
					<%-- 반복끝 --%>
					<tr>
						<td rowspan="3" class="image"><img src="sun_img.png"  class="image"></td>
						<td style="vertical-align: middle;"><strong>릴리트01</strong><br>259000원</td>
					</tr>
					<tr>
						<td>수량 : 1</td>
					</tr>
					<tr>
						<td  style="height: 70px;"> </td>
					</tr>
					<tr>
						<td rowspan="3" class="image"><img src="sun_img.png"  class="image"></td>
						<td style="vertical-align: middle;"><strong>릴리트01</strong><br>259000원</td>
					</tr>
					<tr>
						<td>수량 : 1</td>
					</tr>
					<tr>
						<td  style="height: 70px;"> </td>
					</tr>
				</tbody>
			</table> <br>
		</div>
		
		<div class="box" style="margin-left: auto">
			<table class="mb-4">
				<tbody>
					<tr>
						<td  colspan="3"> </td>
					</tr>
					<tr>
						<td><strong>배송방법</strong></td>
						<td  colspan="2">일반배송</td>
					</tr>
					<tr>
						<td><strong>배송주소</strong></td>
						<td  colspan="2">김젠몬<br>서울특별시 관악구 청림3마길 28-8<br>101동 101호<br>08732</td>
					</tr>
					<tr  style="height: 70px;">
						<td><strong>연락처</strong></td>
						<td  colspan="2">01012345678</td>
					</tr>
					<tr>
						<td><strong>결제수단</strong></td>
						<td  colspan="2">가상계좌</td>
					</tr>
					<tr style="height: 70px;">
						<td><strong>입금 계좌번호</strong></td>
						<td  colspan="2">우리은행 1002-850-797783</td>
					</tr>
					<tr>
						<td rowspan="4"><strong>주문상세</strong></td>
						<td>소계</td>
						<td class="myright">259000원</td>
					</tr>
					<tr>
						<td>배송비</td>
						<td class="myright">0원</td>
					</tr>
					<tr>
						<td>적립금 사용</td>
						<td class="myright">-1000원</td>
					</tr>
					<tr  style="height: 60px;">
						<td>총결제금액</td>
						<td class="myright">258000원</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><strong>배송사</strong></td>
					</tr>
					<tr>
						<td colspan="2"><strong>CJ대한통운</strong></td>
					</tr>
				</tfoot>
			</table> <br>
		</div>
	</div>
	<%-- 밑에 테이블 두개 끝 --%>
</div>

<jsp:include page="footer.jsp" />