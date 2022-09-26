<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="header.jsp" />

<style>

	* {font-family: 'Roboto Condensed', sans-serif;}
	
	.review_container {
		/* width: 80%; */
	}
	
	
	div#review_desc {
        /* border: solid 1px gray; */
        width: 60%;
        margin-bottom: 30px;
        margin-top: 70px;
        
    }

    div.containers {
        width: 70%;
        margin: 3% auto;
    }

    div#rate_title {
        /* border: solid 1px gray; */
        background-color: #f2f2f2;
        height: 35px;
        margin-bottom: 50px;
    }


    #star_text {
        display: inline-block;
        width: 70px;
        font-weight: bold;
        text-align: center;
        font-size: 10pt;
    }

    #select_category {
        font-size: 10pt;
        margin-left: 2%;
        width: 120px;
        background-color: #f2f2f2;
    }

    #avgStar_text {
        display: inline-block;
        margin-left: 2%;
        font-size: 10pt;
        font-weight: bold;
    }

    span#avgStar {
        /* border: solid 1px gray; */
        color: orange; 
        font-weight: bold; 
        font-size: 15pt;
        margin-left: 5%;
    }

    div.content_desc {
        margin-top: 10px;
        width: 400px;
    }

    
    #empty {
        height: 100px;
    }
    
	div#prod_info {
        /* border: solid 1px gray; */
        width: 250px;
        height: 280px;
        float: left;
        font-weight: bold;
        padding-top: 200px;

    }

    div#prod_photo {
        /* border: solid 1px pink; */
        width: 220px;
        height: 280px;
        float: left;
        margin-top: 20px;
    }
    
    .rate_content_1 {
    	/* border: solid 1px pink; */
    	display: inline-block;
    }
    
    .rate_content_2 {
    	/* border: solid 1px black; */
    	display: inline-block;
    	vertical-align: bottom;
    	padding-bottom: 10px;
    	padding-left: 20px;
    	text-align: right;
    	
    }
    
    .toggle_btn, .toggle_content {
    	font-size: 11pt; 
    	margin-top: 10px;
    }
    
    .toggle_btn {
    	font-weight: bold;
    }
    
    .toggle_content {
    	border: solid 1px gray;
    	width: 450px;
    	height: 130px;
    	margin-top: 20px;
    	padding: 10px 0 10px 10px;
    	border-radius: 15px 15px 15px 15px;
    }
    
    .toggle_box {
    	/* border: solid 1px pink; */
    	display: inline-block;
    	width: 60%;
    }
    
    .modify {
    	/* border: solid 1px gray; */
    	text-align: right;
    	margin-top: 10px;
    }
    
    .btn_modify {
    	font-size: 10pt;
        font-weight: bold;
    }
    
    .each_box {
    	/* border: solid 1px gray; */
    	width: 580px;
    	
    }
    
    .container_boxes {
    	border-left: solid 1px #e6e6e6;
    	width: 610px;
    	float:left;
    	padding-left: 25px;
    }
    
    
    .modal-dialog.modals-fullsize_img {
	    width: 100%;
	    height: auto;
    }
    
    .write_reply_btn {
    	text-decoration: underline;
    	font-weight: normal;
    	margin-left: 10px;
    }
    
    .reply_content {
    	font-size: 10pt;
    	width: 97%;
    }
    
    .color_red {
    	color: red;
    }
    

</style>


<script>


	
	function go_rev_modify(){ // ---------------------------
		
		window.location.href = 'review_write.jsp';
		
	} // end of function go_rev_modify() -------------------
	

	
	$(document).ready(function(){
		
		
		// 리뷰내용 글자수 50자 제한 -------------------------------------------------
		$('.reply_content').keyup(function (e) {
			let reply_content = $(this).val();
		    
		    // 글자수 세기
		    if (reply_content.length == 0 || reply_content == '') {
		    	$('.text_cnt').text('0자');
		    } else {
		    	$('.text_cnt').text(reply_content.length + '자');
		    }
		    
		    // 글자수 제한
		    if (reply_content.length > 49) {
		    	// 50자 부터는 타이핑이 안되게
		    	$('.text_cnt').addClass('color_red');
		        $(this).val($(this).val().substring(0, 49));
		    }
		    else {
		    	$('.text_cnt').removeClass('color_red');
		    }
		}); // end of $('#rev_content').keyup() ---------------------------------
		
		
		
		
	}); // end of $(document).ready() ---------------
	
	function delete_rev() {
		
		alert("정말 삭제하시겠습니까?");
	}

</script>

<div id="review_container" >
        <div id="review_desc" class="containers">
        	<p style="font-weight: bold; font-size: 13pt;">PRODUCT REVIEW<p>
            <ul style="font-size: 10pt;">
                <li>상품에 대한 후기를 남기는 공간입니다.</li>
                <li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 문의글에 남겨주세요.</li>
            </ul>
        </div>
        <hr style="width: 70%;">
        
       	<div class="containers">
	        <div id="prod_photo">
	            <img src="le_iv1_1.jpg" style="width:200px; height:auto;">
	        </div>
	        <div id="prod_info">
	        	<div style="font-size: 11pt;">르</div>
	            <div style="font-size: 10pt;">189,000원</div>
	            <div style="font-size: 10pt; color: pink; margin-top: 5px;">♥ 13</div>
	        </div>
		</div>
        
		<div class="container_boxes">
			<div id="rate_title">
	           <select id="select_category" name="select_category">
	               <option value ="recent">최신순</option>
	               <option value ="star">별점순</option>
	               <option value ="like">좋아요순</option>
	           </select>
	           
	           <span id="avgStar">★★★★☆</span>
	           <div id="avgStar_text">
	               <span id="star_avgRate">4.0</span>
	               <span id="star_full">/ 5.0</span>
	           </div>
	      	</div>
       	
	        <div class="each_box">
	            <div class="rate_content_1">
	                <div class="content_desc" style="font-weight: bold; font-size: 11pt;">gentlemons***</div>
	                <div style="font-size: 9pt;">2022-09-13</div>
	                <div class="content_desc" style="font-size: 12pt; color: orange; font-weight: bold;">★★★★☆</div>
	                <div class="content_desc" style="font-size: 10pt;">내용내용내용내용내용내용내용내용내용내용내용내용내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
	                <div style="font-size: 10pt; color: pink; margin-top: 5px;">♥ 13</div>
	            </div>
	            <div class="rate_content_2">
	                <img src="le_iv1_1.jpg" style="width: 80px;">
	            </div>
	            <div class="toggle_box">
		            <span style="font-weight: bold;">댓글(0)</span>
					<span id="reply_no" class="toggle_btn write_reply_btn" type="button" data-toggle="collapse" 
						  data-target="#see_reply_1">댓글 작성
					</span>
					<div class="toggle_content collapse reply_container" id="see_reply_1">
						<div style="font-weight: bold;">Gentle Monster</div>
						<div style="margin-top: 10px;">
			                <textarea class="col-auto form-control reply_content" type="text" 
			                          placeholder="댓글내용을 작성해주세요." ></textarea>
			                <div align="right" style="padding-right: 10px;">
				                <span class="text_cnt">0자</span>
				                <span>/50자</span>
				            </div>
			            </div>
					</div>
				</div>
				<div class="modify">
					<button type="button" class="btn btn-light btn_modify" onclick="delete_rev()">리뷰삭제</button>
				</div>
	        </div>
	        <hr>
	        
	        <div class="each_box">
	            <div class="rate_content_1">
	                <div class="content_desc" style="font-weight: bold; font-size: 11pt;">gentlemons***</div>
	                <div style="font-size: 9pt;">2022-09-13</div>
	                <div class="content_desc" style="font-size: 12pt; color: orange; font-weight: bold;">★★★★☆</div>
	                <div class="content_desc" style="font-size: 10pt;">내용내용내용내용내용내용내용내용내용내용내용내용내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
	                <div style="font-size: 10pt; color: pink; margin-top: 5px;">♥ 13</div>
	            </div>
	            <div class="rate_content_2">
	                <img src="le_iv1_1.jpg" type="button" style="width: 80px;" data-toggle="modal" data-target="#img_modal">
	                <div class="modal fade" id="img_modal">
			        	<div class="modal-dialog modals-fullsize_img">
			        		<div class="modal-content modals-fullsize">
			                	<img src="le_iv1_1.jpg" type="button" style="width: 500px;">
			         		</div>
			         	</div>
			         </div>
	            </div>
	            <div class="toggle_box">
		            <div class="toggle_btn" type="button" data-toggle="collapse" data-target="#see_reply_2">
						댓글(1)
					</div>
					<div class="toggle_content collapse" id="see_reply_2">
						<span style="font-weight: bold;">Gentle Monster</span>
						<span style="font-size: 9pt; color: gray; margin-left: 15px;">2022/10/01</span>
						<div style="font-size: 10pt; margin-top: 10px;">리뷰 감사 포인트 +500 적립해드렸습니다.</div>
					</div>
				</div>
				<div class="modify">
					<button type="button" class="btn btn-light btn_modify">리뷰삭제</button>
				</div>
	        </div>
	        <hr>
	        
	        
	        
	        
        </div>
        <div style="clear: both;"></div>
    </div>
    <div id="empty"></div>

<jsp:include page="footer.jsp" />