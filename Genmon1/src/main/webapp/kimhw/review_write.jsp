<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />

<style>

div#reviewTbl {
        /* border: solid 1px gray; */
        width: 60%;
        margin: auto;
        padding: 7% 7% 7% 7%;
    }

    div#buttons {
        /* border: solid 1px gray; */
        width: 60%;
        margin: auto;
        padding-bottom: 100px;
    }


    div#rev_title {
        /* border: solid 1px pink; */
        font-weight: bold;
        font-size: 13pt;
        margin-bottom: 50px;
    }

    select#rev_category {
        width: 200px;
        font-size: 10pt;
        margin-bottom: 10px;
    }

    p {
        font-size: 10pt;
        font-weight: bold;
    }

    input#userid {
        width: 200px;
        font-size: 11pt;
        margin-bottom: 40px;
    }

    #rev_content {
        width: 100%;
        height: 150px;
        padding: 10px;
        box-sizing: border-box;
        border: solid 1.5px #D3D3D3;
        border-radius: 5px;
        font-size: 14px;
        resize: none;
        margin-bottom: 40px;
    }

    #photo {
        font-size: 10pt;
    }

    #btn_write {
        margin-left: 25%;
        margin-right: 20px;
        width: 20%;
        font-size: 10pt;
    }

    #btn_cancel {
        margin-right: 20%;
        width: 20%;
        font-size: 10pt;
    }
    
    #text_cntBox {
        /* border: solid 1px gray;  */
        text-align: right;
        font-size: 9pt;
        margin-bottom: 40px;
    }
    
    
    #review_prod {
    	/* border: solid 1px gray; */
    	float: right;
    	padding: 0 0 50px 0;
    }

    
    
    fieldset{
    /* display: inline-block; */
    direction: rtl;
    border:0;
    margin-bottom: 25px;
    }
    #reviewFrm fieldset legend{
        text-align: right;
    }
    #reviewFrm input[type=radio]{
        display: none;
    }
    #reviewFrm label{
        font-size: 30pt;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
    }
    #reviewFrm label:hover{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    #reviewFrm label:hover ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    #reviewFrm input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
</style>

<script type="text/javascript">


	$(document).ready(function(){
		
		// ???????????? ????????? 200??? ?????? -------------------------------------------------
		$('#rev_content').keyup(function (e) {
			let rev_content = $(this).val();
		    
		    // ????????? ??????
		    if (rev_content.length == 0 || rev_content == '') {
		    	$('#text_cnt').text('0???');
		    } else {
		    	$('#text_cnt').text(rev_content.length + '???');
		    }
		    
		    // ????????? ??????
		    if (rev_content.length > 200) {
		    	// 200??? ????????? ???????????? ?????????
		        $(this).val($(this).val().substring(0, 200));
		    };
		}); // end of $('#rev_content').keyup() ---------------------------------
		
	}); // end of $(document).ready() ---------------
	
	

	
	
</script>

<%-- ????????? ?????? --%>

    <div id="reviewTbl">
        <div id="rev_title">????????????</div>
        <form class="mb-3" name="reviewFrm" id="reviewFrm" method="post">
        	<div style="float: left;">
	            <select id="rev_category" name="rev_category">
	                <option value ="select_prod">????????????</option>
	                <option value ="prod_1">??????1</option>
	                <option value ="prod_2">??????2</option>
	                <option value ="prod_3">??????3</option>
	            </select>
	        
	            <fieldset > <!-- ???????????? ?????? ???????????? ???????????? ?????? ??? ?????? -->
	                <input type="radio" name="reviewStar" value="5" id="rate1"><label
	                    for="rate1">???</label>
	                <input type="radio" name="reviewStar" value="4" id="rate2"><label
	                    for="rate2">???</label>
	                <input type="radio" name="reviewStar" value="3" id="rate3"><label
	                    for="rate3">???</label>
	                <input type="radio" name="reviewStar" value="2" id="rate4"><label
	                    for="rate4">???</label>
	                <input type="radio" name="reviewStar" value="1" id="rate5"><label
	                    for="rate5">???</label>
	            </fieldset>
	            <p>?????????</p>
	            <input type="text" id="userid" name="userid" value="userid" />
            </div>
            <div id="review_prod">
            	<img src="le_iv1_1.jpg" style="width:200px; height:auto;">
            </div>
            <div>
                <textarea class="col-auto form-control" type="text" id="rev_content"
                          placeholder="??????????????? ??????????????????."></textarea>
            </div>
            
            <div style="clear: both;"></div>
            <div id="text_cntBox">
                <span id="text_cnt">0???</span>
                <span>/200???</span>
            </div>
            <p>????????????</p>
            <input type="file" name="photo" id="photo" />
        </form>
    </div>
    <div id="buttons">

        <button type="button" id="btn_write" class="btn btn-secondary">??????</button>
        <button type="button" id="btn_cancel" class="btn btn-light">??????</button>

    </div>

<%-- ????????? ??? --%>

<jsp:include page="footer.jsp" />