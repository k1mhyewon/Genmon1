<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String ctxPath = request.getContextPath();
    //     /MyMVC
%>
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-4.6.0-dist/css/bootstrap-multiselect.min.css">



<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.2.13/dist/semantic.min.css" >
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
/* Style inputs with type="text", select elements and textareas */
	input[type=text], select, textarea {
	  width: 100%; /* Full width */
	  padding: 10px; /* Some padding */ 
	  border: 1px solid #ccc; /* Gray border */
	  border-radius: 4px; /* Rounded borders */
	  box-sizing: border-box; /* Make sure that padding and width stays in place */
	  margin-bottom: 16px; /* Bottom margin */
	  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
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
	
	
	div.body{
	    margin: 40px 0;
	}
	a.btn{
		background-color: #000; 
		color: white; 
		font-size: 11pt; 
		width: 200px;
		text-align: center;
		margin: 30.5px 5px 0 0;
    	height: 40px;
    	border: solid 1px #000;
    	border-radius: 0;
		}
	div.questionFrm , div.form{
		width: 80%;
		margin-bottom: 100px;
	}
	input[type=text]#password, input[type=password]#password{
		width: 40%; /* Full width */
	  padding: 5px; /* Some padding */ 
	  border: 1px solid #ccc; /* Gray border */
	  border-radius: 4px; /* Rounded borders */
	  margin: 0 ;
	}
	.error{
		color: red;
		font-size: 9pt;
		padding-left: 10px;
		padding-bottom: 1px;
	}
	label{
		padding-left: 10px;
		font-size: small;
	}
	
	
	
	
	
	
	.insert {
    padding: 20px 30px;
    display: block;
    width: 600px;
    margin: 5vh auto;
    height: 90vh;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .file-list {
    height: 200px;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.insert .file-list .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}
#image {background‑image:url of the image}
.placeholder{color: grey;}
select option:first-child{color: grey; display: none;}
select option{color: #555;} // bootstrap default color

btn{
	box-shadow: 0px;
}


 /* @media screen and (max-width: 970px) {.container-wrap {width: ;}}  */
@media screen and (max-width: 767px) { .container-wrap {width: 90%;}}
@media screen and (min-width: 1100px) { .container-wrap {width: 70%;}}
</style>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>


 <script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script> 
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js" ></script>

<script>

$(document).ready(function() {
	let html = '';
	
	$("div#View_area").hide();
	$("#selDirect").hide();
	$("span.error").hide();
	$("select.select").change(function() {
		if($(this).val() == "direct"){
			$("#selDirect").show();
		}else{
			$("#selDirect").hide();
		};
	})
	$(".must").prop("disabled", true);


	 // 상품 등록 버튼을 누르면 	
	$("button#btnEdit").click(function(){
		$(".must").prop("disabled", false);
		
		let flag = false;
		if(confirm("상품정보수정을 하시겠습니까?")){
			
			$(".infoData").each(function(){// 하나하나 검사한다.
			
				$(".infoData").keydown(function(){
					$("span.error").hide();
					return;
				});
			
				let val = $(this).val().trim();
				if(val == ""){ // 선택안했으면 에러 메시지 표기
					$(this).focus();
					$(this).parent().find("span.error").show();
					flag = true;
					
					return false; // 일반 for 문의 break와 같은 것 
				}
			});
			
			
		 if(!flag){ // 필수입력사항을 다 선택했으면 
			  const frm = document.prodInputFrm;
		  	  frm.submit(); 
		  	  // 제품등록 성공했으면 상품 목록  업데이트
		  }
		}
		else{
			history.go(-1);
		}
		
		
		// pname 이 같은게 있으면  
	});	  
	
 	// 취소버튼을 누르면 
  $("button[type='reset']").click(function(){
	  $("span.error").hide();
	  $("div#divfileattach").html(""); // 또는 $("div#divfileattach").empty()
	  if(confirm("상품등록을 취소하시겠습니까?")){

	  };
  });
  
	
 	
 	
 	
  
  // 추가이미지파일에 스피너 달아주기 
  $("input#spinnerImgQty").spinner({
	  spin:function(event,ui){
            if(ui.value > 100) {
               $(this).spinner("value", 10);
               return false;
            }
            else if(ui.value < 1) {
               $(this).spinner("value", 0);
               return false;
            }
         }
  });// end of $("input#spinnerImgQty").spinner({})---------------
  
  // ### 스피너의 이벤트는 click 도 아니고 change 도 아니고 "spinstop" 이다. ### //
  // divfileattach
  $("input#spinnerImgQty").bind("spinstop",function(){
	 
	  let html = "";
	  const cnt = $(this).val(); // typeof cnt : string 
	  
	  for(let i=0; i<Number(cnt); i++){
		  /* html += "<br>"; */
		  html += "<input type='file' name='attach"+i+"' class='btn btn-default' style='box-shadow: none; border: 1px;'/>";
	  }// end of for()-------------------------------
		
	  $("div#divfileattach").html(html);
	  
	  $("input#attachCount").val(cnt);
	  
  });// end of $("input#divfileattach").bind("spinstop",function(){}--------
  
  	
	// 상품상세정보 글자수 
	  $('#pcontent').on('keyup', function() {
	      $('#pcontent_cnt').html("("+$(this).val().length+" / 1000)");
	
	      if($(this).val().length > 1000) {
	          $(this).val($(this).val().substring(0, 1000));
	          $('#pcontent_cnt').html("(1000 / 1000)");
	      }
	  });
});// end of $(document).ready(function() {}------------------[]



// pname 직접입력을 선택했을경우 
	function changepname(obj){
		$("span.error").hide();
		var val = $("select#pname").val();
		alert(val);
		let html1 = "";
		let html2 = "";
		if(val !="plus"){
			$("div.existhide").hide();
		}
		else{
			$("div.existhide").show();
			html1 += '<label for="pname" class="col-form-label">상품명 *</label>';
			html2 += '<input type="text" class="form-control infoData" name="pname" id="pname" placeholder="Product name" >';
			$("div#divPlusPname1").html(html1);
			$("div#divPlusPname2").html(html2);
		}
	};



	//   ======== 미리보기 이미지 ========= // 
	function previewImage(targetObj, View_area) {
		$("div#View_area").show();
		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent;

	  //ie일때(IE8 이하에서만 작동)
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text; // get file full path
				var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(View_area); //이미지가 뿌려질 곳

				//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + View_area)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + View_area;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
	  //ie가 아닐때(크롬, 사파리, FF)
		} else {
			var files = targetObj.files;
			for ( var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img"); 
				img.id = "prev_" + View_area;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '100px'; 
				img.style.height = '100px';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ View_area)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + View_area;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
		//  ======== 미리보기 이미지 ========= // 
	
		
		
		
		
	// "수정" 버튼 클릭시 호출되는 함수  
	function goEdit() {
		// **** 필수입력사항에 모두 입력이 되었는지 검사한다. **** //
		let b_Flag_requiredInfo = false;
	/*	
		$("input.requiredInfo").each( (index, item)=>{
			const data = $(item).val().trim();
			if(data == "") {
				alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
				b_Flag_requiredInfo = true;
				return false; // break; 라는 뜻이다.
			}
		});
	*/
	//  또는
	    const required_list = document.querySelectorAll(".required"); 
	    for(let i=0; i<required_list.length; i++) {
	    	const val = required_list[i].value.trim();
	    	if(val == "") {
	    		alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
	    		b_Flag_requiredInfo = true;
	    		break;
	    	}
	    }// end of for-----------------------
	    ///////////////////////////////////////////////////////
	    
	    frm.submit();
	    
	}// end of function goRegister()----------------------	

	
	
	
	
	

	//   ======== 미리보기 이미지 ========= // 
	function previewImage(targetObj, View_area) {
		$("img.originimg").hide();
		$("div#View_area").show();
		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent;

	  //ie일때(IE8 이하에서만 작동)
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text; // get file full path
				var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(View_area); //이미지가 뿌려질 곳

				//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + View_area)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + View_area;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
	  //ie가 아닐때(크롬, 사파리, FF)
		} else {
			var files = targetObj.files;
			for ( var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img"); 
				img.id = "prev_" + View_area;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '100px'; 
				img.style.height = '100px';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ View_area)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + View_area;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
		//  ======== 미리보기 이미지 ========= // 
	

</script>

 <div class="modal-dialog">
    <div class="modal-content ">
      
      <div class="modal-header">
		  <h4>Product Information</h4>
	  </div>
	  <div class="modal-body">

	<form name="prodInputFrm"
	      action="<%= request.getContextPath()%>/admin/adminEditProduct.sun"
	      method="post"
	      enctype="multipart/form-data">


		<div class="row">
			<div class="form-group">
				<label for="pname" class="col-form-label">상품명 *${requestscope.cpvo.pname}</label><span class="error">상품명을 입력해주세요</span>
				<input value="${cpvo.parentProvo.pname}"type="text" class="form-control infoData must" name="pname" id="pname" > 
			</div>
			
			<div class="form-group existhide" style="width: 50%;display:inline-block;">
         		<label for="pmaterial" class="col-form-label " >상품 재질*</label><span class="error">상품색상을 모두 선택해주세요</span><br>
				<select class="must" name="pmaterial" id="pmaterial" >
				  <option value="">선택해주세요</option>
				  <option selected value='${cpvo.parentProvo.pmaterial}'>${cpvo.parentProvo.pmaterial}</option>
				<c:forEach var="map" items="${requestScope.materialList}">
				  <c:if test="${map.pmaterial ne cpvo.parentProvo.pmaterial}">
					  <option value="${map.pmaterial}">${map.pmaterial}</option>
				  </c:if>
				</c:forEach>
				</select>
			</div>
			
         	<div class="form-group  " style="width: 50%;display:inline-block;">
         		<label for="pcolor" class="col-form-label " >상품 색상*</label><span class="error">상품색상을 모두 선택해주세요</span><br>
				<select class="must" name="pcolor" id="pcolor" >
				  <option value="">선택해주세요</option>
				  <option selected value='${cpvo.pcolor}'>${cpvo.pcolor}</option>
				<c:forEach var="map" items="${requestScope.colorList}">
				  <c:if test="${map.pcolor ne cpvo.pcolor}">
					  <option value="${map.pcolor}">${map.pcolor}</option>
				  </c:if>
				</c:forEach> 
				</select>
			</div>
         	<div class="form-group ">
				<label class="form-label" for="pimage1">상품썸네일사진 *</label><span class="error">상품사진을 등록해주세요</span>
				<input  type="file" class="form-control infoData" name="pimage1" id="pimage1" onchange="previewImage(this,'View_area')"/>
				<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>
				<img src="/Genmon1/images/common/products/${cpvo.pimage1}" class="originimg img-fluid" style="width:100%;" />
			</div>
        
			<div class="form-group existhide">
				<label for="price" class="col-form-label">가격(₩) *</label><span class="error">가격을 입력해주세요</span>
				<input value="${cpvo.parentProvo.price}" type="text" class="form-control infoData" name="price" id="price" >
			</div>
			<div class="form-group existhide">
				<label for="salePcnt" class="col-form-label">할인율(%)</label>
				<input value="${cpvo.salePcnt}"type="text" class="form-control" name="salePcnt" id="salePcnt" >
			</div>
			<div class="form-group">
				<label for="pqty" class="col-form-label">상품재고량 *</label><span class="error">상품재고를 입력해주세요</span>
				<input value="${cpvo.pqty}"type="number" name="pqty" class="table-editor__input form-control infoData" value="1" min="1">
			</div>
			<div class="form-group existhide">
				<label for="pcontent" class="col-form-label">상품상세정보 *</label><span class="error">상품상세정보를 입력해주세요</span>
				<textarea class="form-control infoData" name="pcontent" id="pcontent" cols="30" rows="8" placeholder="내용을 입력해주세요.">${cpvo.parentProvo.pcontent}</textarea>
				<div id="pcontent_cnt">(<c:out value="${fn:length(cpvo.parentProvo.pcontent)}" /> / 1000)</div>
			</div>

         	<div class="form-group ">
         	  <label for="preleasedate" class="col-form-label">상품출시일 *</label><span class="error">상품출시일을 입력해주세요</span>
              <input value="${cpvo.preleasedate}" type="text" id="preleasedate" name="preleasedate" class="infoData">
			</div>
			
        
         	<!-- <div class="form-group mb-5">
	        	<label for="imgfilename" class="col-form-label" >상품상세사진</label>
				<input class="form-control" name="imgfilename" type="file" id="imgfilename" multiple max="4"/>
			</div> -->
        
         	
        	<br>
         	<div class="form-group ">
	          	 <label for="imgfilename" class="col-form-label" >상품상세사진</label><br>
	             <label for="spinnerImgQty" class="col-form-label" style="font-size:8pt;">• 파일갯수 : </label>
	          	 <input id="spinnerImgQty" name="imgfilename" value="0" style="width: 30px; height: 20px;">
	          	 <br>
	             <div id="divfileattach"></div>
	             
	             <c:forEach var="imgfilename" items="${imgList}">
	             	<img src="/Genmon1/images/common/products/${imgfilename}" class="img-fluid" style="width:50%;" />
				</c:forEach>
				
	             <input type="hidden" name="attachCount" id="attachCount" />
			</div>
        	
		</div>



     <div class="modal-footer">
       <button type="button" value="register" id="btnEdit" class="btn shadow-0 btn-md btn-outline-primary "onclick="goEdit()" >Edit</button>
       <button type="reset" value="delete"  class="me-2 btn shadow-0 btn-md btn-primary btnRegister" style="" >delete</button>
     </div>
     
	</form>
	
</div>
	</div>
     
     
    </div>

