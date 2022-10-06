<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>


<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/modules/b4bca5d779777cff9d5c51553952a0a1.min.css" >
<style>
div#question{
	margin-top: 15%;  
	display: inline-block;
}
.contents{
	width: 65%;
	margin: 0 auto;
}

/* Style the submit button with a specific background color etc */
input[type=submit] {
  display: block;
  background-color: #505050;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

/* When moving the mouse over the submit button, add a darker green color */
input[type=submit]:hover {
  background-color: #45a049;
}

/* Add a background color and some padding around the form */
.container {
  border-radius: 5px;
  /* background-color: #f2f2f2; */
  padding: 20px;
}
.divider {
    border-bottom: #e0e0e0 1px solid;
    width: 100%;
}
.margin_b20 {
  	 margin-bottom: 20%;
}
.margin_b10 {
  	 margin-bottom: 10%;
}
.margin_t10 {
  	 margin-top: 10%;
}
textarea {
  width: 100%; /* Full width */
  padding: 12px; /* Some padding */ 
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

.clearfix {
  overflow: auto;
}

.clearfix::after {
  content: "";
  clear: both;
  display: table;
}




.row {
  display: flex;
}



a.btn{
		background-color: #2c2c2c; 
		color: white; 
		margin-top: 5%; 
		margin-right: 1%;
		font-size: 11pt; 
		/* max-width: 100%;  */
		text-align: center;
	}
a.delete{
	float: right
		/* padding: 3% 43%;   */
}
.ft10{
	font-size: 12pt;
}
.mg10{
	padding-bottom: 10%;
}
.bld{
	font-weight: bold;
}

 /* @media screen and (max-width: 970px) {.container-wrap {width: ;}}  */
@media screen and (max-width: 767px) { .container-wrap {width: 90%;}}
@media screen and (min-width: 1100px) { .container-wrap {width: 70%;}}
</style>

<script>

$(document).ready(function() {
	$("#selDirect").hide();
	
	$("select.select").change(function() {
		if($(this).val() == "direct"){
			$("#selDirect").show();
		}else{
			$("#selDirect").hide();
		};
		
	})
});

</script>

<%-- 인덱스 시작 --%>
        <!-- <div class="contents margin_t10" >
        <div class="row" style="margin-left: 2%">
            <h3 style="font-size:13pt; ">Add New Product</h3>
	        <div>Product IMAGE</div>
         	<div class="divider margin_b10 margin_t10"></div>
         </div>
         	<a href="#" class="btn delete">문의삭제</a>
         	<div class="divider margin_b10 margin_t10"></div>
         	
          <div class="column " >
	        <div>Product INFO</div>
            <label for="inputContext bld"><span class="bld"></span></label>
            <textarea id="context" name="inputContext" placeholder="제품 상세설명을 작성해주세요."></textarea>
	        <div>Model Name</div>
	        <div>Select Color</div>
	        <div>Select Quantity</div>
	        <div>Product Price($)</div>
         	<div class="col">
         	<a href="#" class="btn" style="float:right;" >Discard</a>
         	<a href="#" class="btn" style="float:right;" >Save</a>
        </div>
        </div>
        </div>
          
 -->
 <div class="modal-dialog">
    <div class="modal-content ">
      
      <div class="modal-header">
		  <h4>New item</h4>
	  </div>
	  <div class="modal-body">
	  	<form>
	  	
		  	<div class="my-4 table-editor_input-wrapper" data-mdb-field="company">
		  		<div class="form-outline ">
		  			<input type="text" class="table-editor__input form-control" value="">
		  			<label class="form-label" style="margin-left: 0px;">Product Name</label>
		  				<div class="form-notch">
		  					<div class="form-notch-leading" style="width: 9px;"></div>
		  					<div class="form-notch-middle" style="width: 56.8px;"></div>
		  					<div class="form-notch-trailing"></div>
		  				</div>
		  		</div>
		  	</div>
		  	
	  <!-- 현재있는거 select-> dropdown  	원래있는상품이라면 소재고정 updown datepicker  updown   첨부파일
	  추가하려면 그냥 input입력/ pid원래있는거넣으면pname자동넣어짐 
		pid, pname, pcolor ,       상품 소재, 상품정가가격, 상품재고, 상품 출시일, 상품 할인율,  상품이미지 / -> 상품일련번호 pnum 은 자동으로 생성 -->
	    
			  <div class="my-4 table-editor_input-wrapper" data-mdb-field="office">
			  	<div id="select-wrapper-934186" class="select-wrapper">
			  		
			  		<div class="form-outline">
			  			<input class="form-control select-input active" type="text" role="listbox" aria-multiselectable="false" aria-disabled="false" aria-haspopup="true" aria-expanded="false" readonly="true">
			  			<label class="form-label select-label active" style="margin-left: 0px;">Office</label>
			  			
			  			<span class="select-arrow"></span>
			  			
		  				<div class="form-notch">
		  					<div class="form-notch-leading" style="width: 9px;"></div>
		  					<div class="form-notch-middle" style="width: 39.2px;"></div>
		  					<div class="form-notch-trailing"></div>
		 				</div>
		 				
			 		
			 		</div>
			  </div>
				  
		<div class="col-md-6 form-group mb-3">
         <label for="question"></label>
         <select id="type" name="type" class="select">
             <option value="delivery">배송문의</option>
             <option value="product">상품문의</option>
             <option value="refExch">환불/교환문의</option>
             <option value="cancel">취소문의</option>
             <option value="direct">직접입력</option>
         </select>
         <input class="form-control select-input active" id="selDirect" name="selDirect" type="text">
		</div>
		
				  
				  
				  
				  
				  
				</div>
		  </div>
		
		  <div class="my-4 table-editor_input-wrapper" data-mdb-field="employees">
		  	<div class="form-outline ">
		  		<input type="number" class="table-editor__input form-control active" value="1">
				  <label class="form-label" style="margin-left: 0px;">제품재고량</label>
				  <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div>
				  <div class="form-notch-middle" style="width: 64px;"></div>
				  <div class="form-notch-trailing"></div>
				</div>
			</div>
		 </div>
				
		 <div class="my-4 table-editor_input-wrapper" data-mdb-field="international">
		 	<div class="form-check ms-1 mt-1 ps-0">
				<input class="table-editor__input form-check-input ms-1" type="checkbox">
				<label class="ps-3 form-check-label">International</label>
			</div>
		</div>
		
	</form>
	
	</div>
     
     <div class="modal-footer">
       <button class="btn shadow-0 btn-md btn-outline-primary modal-discard-button" data-mdb-dismiss="modal" style="">Cancel</button>
       <button class="me-2 btn shadow-0 btn-md btn-primary modal-save-button" style="">Save</button>
     </div>
     
    </div>
  </div>

