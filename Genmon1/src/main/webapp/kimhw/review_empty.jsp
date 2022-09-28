<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="header.jsp" />

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
    

    .container_boxes {
    	border-left: solid 1px #e6e6e6;
    	width: 610px;
    	float:left;
    	padding-left: 25px;
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
	            <img src="le_iv1_1.jpg" style="width:230px; height:auto;">
	        </div>
	        <div id="prod_info">
	        	<div style="font-size: 11pt;">르</div>
	            <div style="font-size: 10pt;">189,000원</div>
	            <div style="font-size: 10pt; color: #666666; margin-top: 5px;">리뷰(0)</div>
	        </div>
		</div>
        
		<div class="container_boxes">
			<div id="no_review">
				<div style="padding-top: 50px; text-decoration: underline;">작성된 리뷰가 없습니다.</div>
	           	<button type="button" class="btn btn-dark" id="go_review">리뷰작성 하러가기</button>
	      	</div>
	        <hr>
	        
	        
        </div>
        <div style="clear: both;"></div>
    </div>
    <div id="empty"></div>

<jsp:include page="footer.jsp" />