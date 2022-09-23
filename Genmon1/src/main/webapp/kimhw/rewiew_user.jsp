<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="header.jsp" />

<style>

	* {font-family: 'Roboto Condensed', sans-serif;}
	
	div#review_desc {
        /* border: solid 1px gray; */
        width: 60%;
        margin-bottom: 30px;
        margin-top: 70px;
        
    }

    div.containers {
        width: 60%;
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

    img.review_img {
        margin: 20px 0 10px 0;
        max-width: 100%; height: auto;
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
        margin-top: 20px;

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
    	width: 220px;
    }
    
    .rate_content_2 {
    	/* border: solid 1px black; */
    	display: inline-block;
    	vertical-align: bottom;
    	padding-bottom: 10px;
    	padding-left: 20px;
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
    	display: inline-block;
    	width: 38%;
    	
    }
    
    .btn_modify {
    	font-size: 10pt;
        font-weight: bold;
        width: 20%;
    }

</style>

<div id="review_container" >
        <div id="review_desc" class="containers">
            <p style="font-weight: bold; font-size: 13pt;">PRODUCT REVIEW<p>
            <ul style="font-size: 10pt;">
                <li>상품에 대한 후기를 남기는 공간입니다.</li>
                <li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 문의글에 남겨주세요.</li>
            </ul>
            <hr>
            <div id="prod_photo">
                <img src="le_iv1_1.jpg" style="width:200px; height:auto;">
            </div>
            <div id="prod_info">
            	<div style="font-size: 11pt;">르</div>
                <div style="font-size: 10pt;">189,000원</div>
                <div style="font-size: 10pt; color: pink; margin-top: 5px;">♥ 13</div>
            </div>
            <div style="clear:both;"></div>
        </div>
		<hr style="width: 60%;">

        <div id="rate_title" class="containers">
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

        <div class="containers each_box">
            <div class="rate_content_1">
                <div class="content_desc" style="font-weight: bold; font-size: 11pt;">gentlemons***</div>
                <div style="font-size: 9pt;">2022-09-13</div>
                <div class="content_desc" style="font-size: 12pt; color: orange; font-weight: bold;">★★★★☆</div>
                <img src="le_iv1_1.jpg" class="review_img">
            </div>
            <div class="rate_content_2">
                <div class="content_desc" style="font-size: 10pt;">내용내용내용내용내용내용내용내용내용내용내용내용내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
                <div style="font-size: 10pt; color: pink; margin-top: 5px;">♥ 13</div>
            </div>
            <div class="toggle_box">
	            <div class="toggle_btn" type="button" data-toggle="collapse" data-target="#reply_1">
					댓글(1)
				</div>
				<div class="toggle_content collapse" id="reply_1">
					<div style="font-weight: bold;">Gentle Monster</div>
					<div style="font-size: 10pt; margin-top: 10px;">리뷰 감사 포인트 +500 적립해드렸습니다.</div>
				</div>
			</div>
        </div>
        <hr style="width: 60%;">
        
        <div class="containers each_box">
            <div class="rate_content_1">
                <div class="content_desc" style="font-weight: bold; font-size: 11pt;">gentlemons***</div>
                <div style="font-size: 9pt;">2022-09-13</div>
                <div class="content_desc" style="font-size: 12pt; color: orange; font-weight: bold;">★★★★☆</div>
                <img src="le_iv1_1.jpg" class="review_img">
            </div>
            <div class="rate_content_2">
                <div class="content_desc" style="font-size: 10pt;">내용내용내용내용내용내용내용내용내용내용내용내용내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
                <div style="font-size: 10pt; color: pink; margin-top: 5px;">♥ 13</div>
            </div>
            <div class="toggle_box">
	            <div class="toggle_btn" type="button" data-toggle="collapse" data-target="#reply_1">
					댓글(1)
				</div>
				<div class="toggle_content collapse" id="reply_1">
					<div style="font-weight: bold;">Gentle Monster</div>
					<div style="font-size: 10pt; margin-top: 10px;">리뷰 감사 포인트 +500 적립해드렸습니다.</div>
				</div>
			</div>
			<div class="modify" align="right">
				<button type="button" class="btn btn-light btn_modify" >수정</button>
			</div>
        </div>
        <hr style="width: 60%;">
        
        
    </div>
    <div id="empty"></div>

<jsp:include page="footer.jsp" />