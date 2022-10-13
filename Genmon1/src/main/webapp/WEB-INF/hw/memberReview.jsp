<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


    
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
        border-radius: 10px;
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
        font-size: 13pt;
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
        /* border: solid 1px gray;  */
        width: 250px;
        height: 340px;
        float: left;
        font-weight: bold;
        padding: 270px 0 0 30px;

    }

    div#prod_photo {
        /* border: solid 1px pink; */ 
        width: 240px;
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
        display: inline-block;
        margin: 0 0 0 5px;
    }
    
    .btn_modify {
    	font-size: 10pt;
        font-weight: bold;
        margin-left: 50px;
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
    	height: 140px;
    	margin-top: 20px;
    	padding: 10px 0 10px 10px;
    	border-radius: 15px 15px 15px 15px;
    }
	
	#go_review {
		margin-top: 120px;
		font-size: 10pt;
	}
	
	.write_reply_btn {
    	text-decoration: underline;
    	font-weight: normal;
    	margin-left: 10px;
    	font-size: 10pt;
    }
    
    .reply_content {
    	font-size: 10pt;
    	width: 97%;
    }
    
    .color_red {
    	color: red;
    }
  
    
    .reply_btns {
    	font-size: 10pt;
    	height: 30px;
    	margin: 7px 0 0 7px;
    }
    
    #pagebar {
    	/* border: solid 1px pink; */
    	font-size: 9pt;
    	padding-left: 700px;
    }
    
    
    .page-link {
	  color: #000; 
	  background-color: #fff;
	  border: 1px solid #ccc; 
	  font-size: 8pt;
	}
	
	.page-item.active .page-link {
	 z-index: 1;
	 color: #555;
	 font-weight:bold;
	 background-color: #f1f1f1;
	 border-color: #ccc;
	 
	}
	
	.page-link:focus, .page-link:hover {
	  color: #000;
	  background-color: #fafafa; 
	  border-color: #ccc;
	}
    

</style>

<script src="https://kit.fontawesome.com/48fed31cce.js" crossorigin="anonymous"></script>
<script>
	
	$(document).ready(function(){ //  =============================================================
		
		const pnum = '${requestScope.pnum}';
		
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
		
		
		
		///////////////////////////////////////////////////
		
		let putSearchType = "${requestScope.searchType}";
		// alert("putSearchType: "+ putSearchType);
		
		$("#select_category").val(putSearchType).prop("selected", true);
		
		/////////////////////////////////////////////////// 
		
		
		
		// 카테고리를 바꿀때마다 ---------------------------------------------
		$("#select_category").change(function(){
			// searchType: t searchType = $("#select_category option:selected").attr('value');
			
			let searchType = this.value;
			// alert("searchType : "+searchType);
			// alert(searchType);
			
			const pnum = $("input#pnum").val();
			// alert("pnum: "+pnum);
			
			
			location.href= "<%= ctxPath%>/member/memberReview.sun?pnum="+pnum+"&searchType="+searchType;
			
		}); // end of $("#select_category").change(} -------------------
		
		
		// 위시리스트 개수 알아오기(하트)
		$.ajax({
			url:"<%= ctxPath%>/wish/wishCount.sun",
		//	type: "GET", 
			data: {"pnum":pnum},
		    dataType:"JSON",
		    success:function(json) {
		    	
		    	$("#wishCount").text(json.wishCnt);
		    	
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
		
	}); // end of $(document).ready() =============================================================

	
	/////////////////////////////////////////
	// 아이디 마스킹 - 굳이 뷰단에서 마스킹하는 이유는 온전한 userid 값을 다른곳에서도 써야해서ㅜㅜ
	
	function masking(useridMasking) {
		
		let useridLength = useridMasking.length;
		
	    if (useridMasking == undefined || useridLength < 3 ) {
	        return useridMasking;
	    }
	    else{
		    const regExp = /.{3}$/; // 정규식
		    return useridMasking.replace(regExp, "***");
	    }
	}
	
	
	
	
	
	let purpose = "";
	// 리뷰 삭제하기
	function reviewDelete(reviewid){ // --------------------------------
		
		purpose = "reviewDelete";
		
		if (confirm("리뷰를 삭제하시겠습니까?")) {
			// 확인(예) 버튼 클릭 시 이벤트
	        
	    	$.ajax({
				url:"<%= ctxPath%>/member/review.sun" ,
				type: "POST", 
				data:{"reviewid":reviewid, "purpose":purpose},
			    dataType:"TEXT",
			    success:function(json) {
			    	window.location.reload(true);
			    },
			    error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
	    } 
		else {
			// 취소(아니오) 버튼 클릭 시 이벤트
	        
	        return false;
		}
	
		
	} // end of function rev_delete(reviewid){} -----------------------
	
	
	// 리뷰댓글 삭제하기
	function reply_delete(reviewid){
		
		purpose = "replyDelete";
		
		if (confirm("리뷰 댓글을 삭제하시겠습니까?")) {
			// 확인(예) 버튼 클릭 시 이벤트
	        
	    	$.ajax({
				url:"<%= ctxPath%>/member/review.sun" ,
				type: "POST", 
				data:{"reviewid":reviewid, "purpose":purpose},
			    dataType:"TEXT",
			    success:function(json) {
			    	window.location.reload(true);
			    },
			    error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
	    } 
		else {
			// 취소(아니오) 버튼 클릭 시 이벤트
	        
	        return false;
		}
		
	}
	
	
	
	
	// 리뷰 댓글 달기
	function reply(reviewid){
		
		$("input#purpose").val("insertReply");
		
		const replyFrm = $("form[name=replyFrm]").serialize() ;
		
    	$.ajax({
			url:"<%= ctxPath%>/member/review.sun",
			type: "POST", 
			data:replyFrm,
		    dataType:"TEXT",
		    success:function(json) {
		    	window.location.reload(true);
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	    
	}
	
	
	
	

</script>

	<div id="review_container" >
        <div id="review_desc" class="containers">
        	<p style="font-weight: bold; font-size: 13pt;">
            	<i class="fa fa-pencil" style="width: 28px; font-size: 15pt;"></i>PRODUCT REVIEW<p>
            <ul style="font-size: 10pt;">
                <li>상품에 대한 후기를 남기는 공간입니다.</li>
                <li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 문의글에 남겨주세요.</li>
            </ul>
        </div>
        <hr style="width: 70%;">
        
       	<div class="containers">
	        <div id="prod_photo">
	            <img src="../images/common/products/${requestScope.pimage1}" style="width:250px; border-radius: 7px; height:auto;">
	        </div>
	        <div id="prod_info">
	        	<div style="font-size: 12pt; margin-bottom: 5px;">${requestScope.pname}</div>
	            <div style="font-size: 11pt; margin-bottom: 2px;" ><fmt:formatNumber value="${requestScope.price}" pattern="#,###" />원</div>
	            <span style="font-size: 10pt; color: #666666; margin-top: 5px; text-decoration: underline;">리뷰(${requestScope.replyCnt})</span>&nbsp;
	            <span style="font-size: 11pt; color: #ff6666; margin-top: 5px;"><i class="fa-solid fa-heart"></i>&nbsp;<span id="wishCount"></span></span>
	            
	        </div>
	        <input type="hidden" id="pnum" value="${requestScope.pnum}"/>
		</div>
        <c:if test="${ not empty requestScope.reviewList}">
			<div class="container_boxes">
				<div id="rate_title">
		           <select id="select_category" name="select_category">
		               <option value ="uploaddate">최신순</option>
		               <option value ="starhigh">별점높은순</option>
		               <option value ="starlow">별점낮은순</option>
		           </select>
		           <span id="avgStar">${requestScope.avg_star_shape}</span>
		           <div id="avgStar_text">
		               <span id="star_avgRate" >${requestScope.avg_star}</span>
		               <span id="star_full">/ 5.0</span>
		           </div>
		      	</div>
       		
       			<c:forEach var="reviewList" items="${requestScope.reviewList}">
			        <div class="each_box">
			            <div class="rate_content_1">
			                <div class="content_desc" style="font-weight: bold; font-size: 11pt;">${reviewList.mvo.useridMasked}</div>
			                <div style="font-size: 9pt;">${reviewList.uploaddate}</div>
			                <div class="content_desc" style="font-size: 11pt; color: orange; font-weight: bold;">${reviewList.star}</div>
			                <div class="content_desc" style="font-size: 10pt;">${reviewList.content}</div>
			            </div>
			            <c:if test="${reviewList.img_orginFileName != '없음'}">
				            <div class="rate_content_2">
			                	<img src="../images/reviewImg/${reviewList.img_orginFileName}" style="width: 80px;" data-toggle="modal" data-target="#imgModal_${reviewList.reviewid}" >
				            </div>
				            <div class="modal fade" id="imgModal_${reviewList.reviewid}">
								<div class="modal-dialog">
									<div class="modal-content modals-fullsize" style="width: 500px; height: auto;">
										<img src="../images/reviewImg/${reviewList.img_orginFileName}" />
									</div>
								</div>
							</div>
			            </c:if>
			            <div class="toggle_box">
			            	<c:if test="${reviewList.reply == '없음'}">
					            <span class="toggle_btn" type="button" data-toggle="collapse" data-target="#reply_${reviewList.reviewid}">
									댓글(0)
								</span>
								<c:if test="${not empty requestScope.userid && requestScope.userid == 'admin'}">
									<span id="reply_${reviewList.reviewid}" class="toggle_btn write_reply_btn" type="button" data-toggle="collapse" 
										  data-target="#see_reply_${reviewList.reviewid}">댓글 작성
									</span>
									<div class="toggle_content collapse reply_container" id="see_reply_${reviewList.reviewid}">
										<div style="font-weight: bold;">Gentle Monster</div>
										<div style="margin-top: 10px;">
											<form name="replyFrm">
								                <textarea class="col-auto form-control reply_content" name="reply_content" type="text" 
								                          placeholder="댓글내용을 작성해주세요." ></textarea>
							                <input type="hidden" name="purpose" id="purpose" />
							                <input type="hidden" name="reviewid" value="${reviewList.reviewid}" />
							                </form>
							                <div align="right" style="padding-right: 10px;">
								                <span class="text_cnt">0자</span>
								                <span>/50자</span>
								                <button type="button" id="btn_reply" class="btn btn-dark reply_btns" onClick="reply('${reviewList.reviewid}')">
								                	작성완료
								                </button>
								            </div>
							            </div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${reviewList.reply != '없음'}">
					            <span class="toggle_btn" type="button" data-toggle="collapse" data-target="#reply_${reviewList.reviewid}">
									댓글(1)
								</span>
								<c:if test="${ sessionScope.loginuser.userid eq 'admin' }">
									<span id="delete_reply_${reviewList.reviewid}" class="toggle_btn write_reply_btn" type="button" onClick="reply_delete('${reviewList.reviewid}')">
										댓글 삭제
									</span>
								</c:if>
								<div class="toggle_content collapse" id="reply_${reviewList.reviewid}">
									<div style="font-weight: bold;">Gentle Monster</div>
									<div style="font-size: 10pt; margin-top: 10px;">${reviewList.reply}</div>
								</div>
							</c:if>
						</div>
						
			        </div>
			        <div style="height: 30px;"></div>
			        <div style="margin-left: 410px;">
			        	<c:if test="${not empty requestScope.userid && requestScope.userid == reviewList.mvo.userid}">
							<div class="modify">
								<button type="button" class="btn btn-light btn_modify" onClick="reviewDelete('${reviewList.reviewid}')">리뷰삭제</button>
							</div>
						</c:if>
						<c:if test="${not empty requestScope.userid && requestScope.userid == 'admin'}">
							<div class="modify" style="padding-left: 80px;">
								<button onClick="reviewDelete('${reviewList.reviewid}')" type="button" class="btn btn-light btn_modify" >리뷰삭제</button>
							</div>
						</c:if>
					</div>
			        <hr>
	        	</c:forEach>
        	</div>
        </c:if> 
        
        <c:if test="${ empty requestScope.reviewList}">
        	<div class="container_boxes">
				<div id="no_review">
					<div style="padding-top: 50px; text-decoration: underline;">작성된 리뷰가 없습니다.</div>
      			</div>
        		<hr>
       		</div>
        </c:if>
        
        <div style="clear: both;"></div>
        
        <nav class="my-5" id="pagebar">
			<div style="display: flex; width: 80%;">
				<ul class="pagination pagination-sm" style="margin: auto;">${requestScope.pageBar}</ul>
			</div>
		</nav>
	
    </div>
    <div id="empty"></div>
    
    
    
    

<jsp:include page="../common/footer.jsp" />