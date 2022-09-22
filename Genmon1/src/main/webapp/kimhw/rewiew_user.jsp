<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="header.jsp" />

<style>

	div#review_desc {
        /* border: solid 1px gray;  */
        width: 60%;
        margin-bottom: 90px;
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
        margin-bottom: 90px;
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
    }

    img.review_img {
        margin: 20px 0 10px 0;
        max-width: 25%; height: auto;
    }
    
    #empty {
        height: 100px;
    }
    
    div#prod_info {
        /* border: solid 1px gray; */
        width: 250px;
        height: 400px;
        float: left;
        font-weight: bold;
        padding-top: 310px;
        padding-left: 10px;
        margin-top: 20px;

    }

    div#prod_photo {
        /* border: solid 1px pink; */
        width: 250px;
        height: 400px;
        float: left;
        margin-top: 20px;
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
                <img src="le_iv1_1.jpg" style="width:250px; height:370px;">
            </div>
            <div id="prod_info">
            	<div style="font-size: 11pt;">르</div>
                <div style="font-size: 10pt;">189,000원</div>
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

        <div id="rate_contentBox" class="containers">
            <div class="rate_content">
                <div id="userid" class="content_desc" style="font-weight: bold; font-size: 11pt;">gentlemons***</div>
                <div id="writeDate" style="font-size: 9pt;">2022-09-13</div>
                <div id="star" class="content_desc" style="font-size: 12pt; color: orange; font-weight: bold;">★★★★☆</div>
                <div id="content" class="content_desc" style="font-size: 11pt;">내용내용내용내용내용내용내용내용내용내용</div>
                <img src="le_iv1_1.jpg" class="review_img">
            </div>
        </div>
        <hr style="width: 60%;">
    </div>
    <div id="empty"></div>

<jsp:include page="footer.jsp" />