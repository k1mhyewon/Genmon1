<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="../common/header.jsp" />

<style>

	* {font-family: 'Roboto Condensed', sans-serif;}
	
	#review_container {
		/* width: 80%; */
		/* border: solid 1px gray; */
		margin: 0 auto;
	}
	
	
	div#review_desc {
        /* border: solid 1px gray; */
        width: 60%;
        margin-bottom: 30px;
        margin-top: 70px;
        
    }

    div.containers {
    /* 	border: solid 1px gray; */
        width: 70%;
        margin: 3% auto;
        padding-left: 100px;
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
        height: 340px;
        float: left;
        font-weight: bold;
        padding: 250px 0 0 25px;

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
    
    
	#no_review {
		/* border: solid 1px pink; */
		height: 270px;
		margin: 10%;
		text-align: center;
		font-size: 11pt;
		font-weight: bold;
	}
	
	#go_review {
		margin-top: 120px;
		font-size: 10pt;
	}
    
    

</style>


<script>
	
	$(document).ready(function(){ //  =============================================================
		
		
		
	}); // end of $(document).ready() =============================================================

	
	function go_rev_modify(){ // ---------------------------
		
		window.location.href = 'review_write.jsp';
		
	} // end of function go_rev_modify() -------------------
	
	
	
	
	

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
	            <img src="../images/common/products/${requestScope.pimage1}" style="width:230px; height:auto;">
	        </div>
	        <div id="prod_info">
	        	<div style="font-size: 11pt;">${requestScope.pname}</div>
	            <div style="font-size: 10pt;">${requestScope.price}</div>
	            <span style="font-size: 11pt; color: #ff6666; margin-top: 5px;">♥ 13</span>&nbsp;
	            <span style="font-size: 11pt; color: #666666; margin-top: 5px;">리뷰(${requestScope.replyCnt})</span>
	        </div>
		</div>
        <c:if test="${ not empty requestScope.reviewList}">
			<div class="container_boxes">
				<div id="rate_title">
		           <select id="select_category" name="select_category">
		               <option value ="recent">최신순</option>
		               <option value ="star">별점순</option>
		               <option value ="like">좋아요순</option>
		           </select>
		           
		           <span id="avgStar">${requestScope.avg_star_shape}</span>
		           <div id="avgStar_text">
		               <span id="star_avgRate">${requestScope.avg_star}</span>
		               <span id="star_full">/ 5.0</span>
		           </div>
		      	</div>
       		
       			<c:forEach var="reviewList" items="${requestScope.reviewList}">
			        <div class="each_box">
			            <div class="rate_content_1">
			                <div class="content_desc" style="font-weight: bold; font-size: 11pt;">${reviewList.mvo.userid}</div>
			                <div style="font-size: 9pt;">${reviewList.uploaddate}</div>
			                <div class="content_desc" style="font-size: 12pt; color: orange; font-weight: bold;">${reviewList.star}</div>
			                <div class="content_desc" style="font-size: 10pt;">${reviewList.content}</div>
			              
			            </div>
			            <c:if test="${reviewList.img != 'noimage.png'}">
				            <div class="rate_content_2">
			                	<img src="../images/reviewImg/${reviewList.img}" style="width: 80px;">
				            </div>
			            </c:if>
			            <div class="toggle_box">
			            	<c:if test="${reviewList.reply == '없음'}">
					            <div class="toggle_btn" type="button" data-toggle="collapse" data-target="#reply_${reviewList.reviewid}">
									댓글(0)
								</div>
							</c:if>
							<c:if test="${reviewList.reply != '없음'}">
					            <div class="toggle_btn" type="button" data-toggle="collapse" data-target="#reply_${reviewList.reviewid}">
									댓글(1)
								</div>
								<div class="toggle_content collapse" id="reply_${reviewList.reviewid}">
									<div style="font-weight: bold;">Gentle Monster</div>
									<div style="font-size: 10pt; margin-top: 10px;">${reviewList.reply}</div>
								</div>
							</c:if>
							
						</div>
			        </div>
			        <div style="height: 30px;"></div>
			        <hr>
	        	</c:forEach>
        	</div>
        </c:if> 
        
        <c:if test="${ empty requestScope.reviewList}">
        	<div class="container_boxes">
				<div id="no_review">
					<div style="padding-top: 50px; text-decoration: underline;">작성된 리뷰가 없습니다.</div>
           			<button type="button" class="btn btn-dark" id="go_review">리뷰작성 하러가기</button>
      			</div>
        		<hr>
       		</div>
        </c:if>
        
        <div style="clear: both;"></div>
        
    </div>
    <div id="empty"></div>

<jsp:include page="../common/footer.jsp" />