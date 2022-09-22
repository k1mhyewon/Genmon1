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
        width: 35%;
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
    
    
    
    
    
    fieldset{
    /* display: inline-block; */
    direction: rtl;
    border:0;
    margin-bottom: 25px;
    }
    #myform fieldset legend{
        text-align: right;
    }
    #myform input[type=radio]{
        display: none;
    }
    #myform label{
        font-size: 30pt;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
    }
    #myform label:hover{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    #myform label:hover ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    #myform input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

</style>

<%-- 인덱스 시작 --%>

    <div id="reviewTbl">
        <div id="rev_title">리뷰작성</div>
        <form class="mb-3" name="myform" id="myform" method="post">
            <select id="rev_category" name="rev_category">
                <option value ="select_prod">제품선택</option>
                <option value ="prod_1">제품1</option>
                <option value ="prod_2">제품2</option>
                <option value ="prod_3">제품3</option>
            </select>
        
            <fieldset> <!-- 필드셋은 여러 컨트롤과 레이블을 묶을 때 사용 -->
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
            <input type="text" id="userid" name="userid" value="userid" />
            <div>
                <textarea class="col-auto form-control" type="text" id="rev_content"
                          placeholder="리뷰내용을 입력해주세요."></textarea>
            </div>
            <p>파일첨부</p>
            <input type="file" name="photo" id="photo" />
        </form>
    </div>
    <div id="buttons">

        <button type="button" id="btn_write" class="btn btn-secondary">작성</button>
        <button type="button" id="btn_cancel" class="btn btn-light">취소</button>

    </div>

<%-- 인덱스 끝 --%>

<jsp:include page="footer.jsp" />