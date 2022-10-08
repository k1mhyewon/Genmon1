<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="../common/header.jsp" />

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
        font-size: 12pt;
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
		
		// 리뷰내용 글자수 200자 제한 -------------------------------------------------
		$('#rev_content').keydown(function (e) {
			let rev_content = $(this).val();
		    
		    // 글자수 세기
		    if (rev_content.length == 0 || rev_content == '') {
		    	$('#text_cnt').text('0자');
		    } else {
		    	$('#text_cnt').text(rev_content.length + '자');
		    }
		    
		    // 글자수 제한
		    if (rev_content.length > 99) {
		    	// 100자 부터는 타이핑이 안되게
		        $(this).val($(this).val().substring(0, 99));
		    };
		}); // end of $('#rev_content').keyup() ---------------------------------
		
		
		
		
		// let odid_pnum_pimage = $("#rev_category option:selected").val();
		
		let pimage1 = "";
		
		
		// select 의 상품이름을 바꿀 때마다 이벤트
		$("#rev_category").change(function(){
			
			let odid_pnum_pimage = $("#rev_category option:selected").val();
			// console.log(odid_pnum_pimage);
			
			let odid_pnum_pimage_arr = odid_pnum_pimage.split("_");
			
			let orderDetailId = odid_pnum_pimage_arr[0];
			let pnum = odid_pnum_pimage_arr[1];
			pimage1 = odid_pnum_pimage_arr[2];
			
			$("#orderDetailId").val(orderDetailId);
			$("#pnum").val(pnum);
			
			
			
		});
		
		
	}); // end of $(document).ready() ---------------
	
	
	function go_revWrite() { // --------------------------------------------------
		
		const rev_content = $("textarea#rev_content").val().trim();
	    
	    if(rev_content == "") {
	    	alert("리뷰내용 입력");
	    	$("textarea#rev_content").val("");
	    	$("textarea#rev_content").focus();
	    	return; // goLogin() 함수 종료
	    }
	    
	    if($(":radio[name='reviewStar']:checked").length<1){
	    	alert("별점 선택");
	    	return;
	    }
		
		
		const frm = document.reviewFrm; 
	    frm.action = "<%= ctxPath%>/member/reviewInsert.sun";
	    frm.method = "post";
	    frm.submit();
		
	} // end of function go_revWrite() -------------------------------------------
	
	
</script>

<%-- 인덱스 시작 --%>

    <div id="reviewTbl">
        <div id="rev_title">리뷰작성</div>
        <form class="mb-3" name="reviewFrm" id="reviewFrm" method="post" enctype="multipart/form-data">
        	<div style="float: left;">
	            <select id="rev_category" name="rev_category">
	                <option value ="select_prod">제품선택</option>
	                <c:forEach var="canReviewProdList" items="${requestScope.canReviewProdList}">
	                	<option value = '${canReviewProdList.pk_order_detail_id}_${canReviewProdList.cpvo.pnum}_${canReviewProdList.cpvo.pimage1}'>
	                		${canReviewProdList.cpvo.parentProvo.pname}
	                	</option>
	                </c:forEach>
	            </select>
	        
	            <fieldset > <!-- 필드셋은 여러 컨트롤과 레이블을 묶을 때 사용 -->
	                <input type="radio" name="reviewStar" value="5" id="rate1"><label
	                    for="rate1">★</label>
	                <input type="radio" name="reviewStar" value="4" id="rate2"><label
	                    for="rate2">★</label>
	                <input type="radio" name="reviewStar" value="3" id="rate3"><label
	                    for="rate3">★</label>
	                <input type="radio" name="reviewStar" value="2" id="rate4"><label
	                    for="rate4">★</label>
	                <input type="radio" name="reviewStar" value="1" id="rate5"><label
	                    for="rate5">★</label>
	            </fieldset>
	            <p>아이디</p>
	            <input type="text" id="userid" name="userid" value="${requestScope.userid}" />
            </div>
            <div id="review_prod">
            	<img src="" id="prodImg" style="width:200px; height:auto;" />
            </div>
            <div>
                <textarea class="col-auto form-control" type="text" id="rev_content" name="rev_content"
                          placeholder="리뷰내용을 입력해주세요."></textarea>
            </div>
            
            <div style="clear: both;"></div>
            <div id="text_cntBox">
                <span id="text_cnt">0자</span>
                <span>/100자</span>
            </div>
            <p>파일첨부</p>
            <input type="file" name="img" id="img" />
            
            <input type="hidden" id="orderDetailId" name="orderDetailId" />
            <input type="hidden" id="pnum" name="pnum" />
        </form>
    </div>
    <div id="buttons">
        <button type="button" id="btn_write" class="btn btn-secondary" onClick="go_revWrite()">작성</button>
        <button type="button" id="btn_cancel" class="btn btn-light">취소</button>
    </div>

<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />