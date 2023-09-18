<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="resources/css/basis.css" /> 
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<link rel="stylesheet" href="resources/css/bbs.css" />
<style type="text/css">
.note-btn-group{width: auto;}
.note-toolbar{width: auto;}
.note-editable {
  text-align: left;
}
.m_table{width: 80%;}

label {
  line-height: 2rem;
  padding: 0.2em 0.4em;
}


[type="text"]{
	width: 325px;
	padding: 7px;
	margin-left : 30px;
	border: 1px solid #1b5ac2;
	outline: none;
	float: left;
}

#radio { color: black; text-align: left;}

.in_btn{  
	margin-top: 50px;
}


#chkbox_div {
    display: flex;
    lign-items: center;
}

#chkbox_div input[type="checkbox"] {
     opacity: 0;
     cursor: pointer;
     width: 15px; /* 크기 설정 */
     height: 15px; /* 크기 설정 */
     margin-right: 10px;
}
#chkbox_div label {
            margin-right: 20px; /* 오른쪽 마진 추가 */
        }

/* 체크 표시 스타일 설정 */
#chkbox_div input[type="checkbox"] + label {
    position: relative;
    display: inline-block;
    width: 15px; /* 크기 설정 */
    height: 15px; /* 크기 설정 */
    border: 2px solid gray; /* 변경된 보더 색상 */
    border-radius: 3px;;
   
}

/* 체크된 상태의 스타일 설정 */
 #chkbox_div input[type="checkbox"]:checked + label::before {
    content: "\2714"; /* 두꺼운 체크 표시 Unicode */
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 16px; /* 표시 크기 설정 */
    color: #1b5ac2; /* 체크 색상 설정 */
    font-weight: bold; /* 글꼴 두껍게 설정 */
}
#High{
	width: 225px;
	padding: 7px;
	margin-left : 30px;
	border: 1px solid #1b5ac2;
	outline: none;
	float: left;
}
#Low{
	width: 225px;
	padding: 7px;
	margin-left : 30px;
	border: 1px solid #1b5ac2;
	outline: none;
	float: left;
}
#Prod{
	width: 225px;
	padding: 7px;
	margin-left : 30px;
	border: 1px solid #1b5ac2;
	outline: none;
	float: left;
}
#cate1{
line-height: 2rem;
  padding: 0.2em 0.4em;
}
#cate2{
line-height: 2rem;
  padding: 0.2em 0.4em;
}
#combo_btn{
	width: 80x;
	padding: 5px;
	float: left;
	margin-left : 30px;
	height: 35px;
	background-color: #1b5ac2;
	border: none;
	color:white;
}

</style> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	function save_go(f) {
		 if(f.BOARD_SUBJECT.value.trim().length<=0){
				alert("제목을 입력하세요")
				f.BOARD_SUBJECT.focus();
				return;
			}
		if(f.BOARD_CONTENT.value.trim().length<=0){
				alert("내용을 입력하세요")
				f.BOARD_CONTENT.focus();
				return;
			}
		 var checkbox = document.getElementById("chkbox");
	        // 체크박스가 체크되었을 때
	        if (checkbox.checked) {
	            // 값 1을 hidden 필드에 설정합니다.
	            document.getElementById("secret_flag").value = "1";
	        } else {
	            // 체크가 해제되었을 때
	            document.getElementById("secret_flag").value = "0";
	        }
		f.action="/bbs_qa_writeOk.do";
		f.submit();
	}
	function list_go(f) {
		f.action="/bbs_qa_go.do";
		f.submit();
	}
</script>
<script type="text/javascript">
function categoty() {
		var highCategory = document.getElementById("High").value;
	    var lowCategory = document.getElementById("Low");
	    var prodCategory = document.getElementById("Prod");
	    // 기존 Low 카테고리 옵션 제거
	    lowCategory.innerHTML = "";

	    // 선택한 High 카테고리에 따라 Low 카테고리 옵션 추가
	    if (highCategory === "1") {
	    	lowCategory.innerHTML += '<option value="0"> ====소분류==== </option>';
	        lowCategory.innerHTML += '<option value="1"> 소화기 </option>';
	        lowCategory.innerHTML += '<option value="2"> 화재 감지 | 대피 </option>';
	        // 다른 옵션들도 추가
	    } else if (highCategory === "2") {   
	    	lowCategory.innerHTML += '<option value="0"> ====소분류==== </option>';
	        lowCategory.innerHTML += '<option value="3"> 구급함 | 제세동기 </option>';
	        lowCategory.innerHTML += '<option value="4"> 재난안전용품 </option>';
	        lowCategory.innerHTML += '<option value="5"> 방역안전용품 </option>';
	        // 다른 옵션들도 추가
	    } else if (highCategory === "3") {
	    	lowCategory.innerHTML += '<option value="0"> ====소분류==== </option>';
	        lowCategory.innerHTML += '<option value="6"> 마스크 </option>';
	        lowCategory.innerHTML += '<option value="7"> 위생장갑 </option>';
	        lowCategory.innerHTML += '<option value="8"> 통조림 | 비상식량 </option>';
	        // 다른 옵션들도 추가
	    }else if(highCategory === "0"){
	    	// High 카테고리가 0인 경우 "카테고리를 선택하세요" 옵션만 추가	
	        lowCategory.innerHTML += '<option value="0">카테고리를 선택하세요</option>';
	        prodCategory.innerHTML = "";
	      
	    }
	}

	function prod_combo() {
	    // 선택한 High와 Low 카테고리를 사용하여 상품 목록을 생성하고 콤보 박스에 추가하는 코드를 작성
	}
</script>
<script type="text/javascript">
function updateProductList() {
    var lowCategory = document.getElementById("Low").value;
    var prodCategory = document.getElementById("Prod");
    
   
   $.ajax({
	   url : "/product_combo.do?lowCategory="+lowCategory,
	   method: "post",
	   dataType: "text",
	   success: function(data) {
		   console.log(data)
		   
		    // "prod" 콤보 박스 엘리먼트 가져오기
		   var prodCategory = document.getElementById("Prod");

		    // 받은 HTML을 "prod" 콤보 박스에 추가
		    prodCategory.innerHTML = data;
	   },
	   error:function() {
		   alert("읽기실패");
	   }
   });
}
// Low 카테고리 변경 시에도 물품 리스트 업데이트
document.getElementById("Low").addEventListener("change", updateProductList)
 //선택한물품의 번호
    var selectedOption = prodCategory.options[prodCategory.selectedIndex];
    var prodNum = selectedOption.value; 
    console.log(prodNum);
</script>
<script type="text/javascript">

function prod_combo() {
	var lowCategory = document.getElementById("Low").value;
    var prodCategory = document.getElementById("Prod");

    // Low 카테고리 초기화
    prodCategory.innerHTML = "";

    if (lowCategory === "0" ) {
        // High 카테고리가 0인 경우 "카테고리를 선택하세요" 옵션만 추가
        prodCategory.innerHTML += '<option value="">카테고리를 선택하세요</option>';
    } 
}
</script>
</head>
<body>
	<div id="mydiv"> 
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
			
					<hr class="hr">
				<div id="bbs_sub"><h1>Q&A 작성화면</h1></div>
					<!-- 메인 내용 -->

					<form method="post" enctype="multipart/form-data" id="form">
					<!--db랑 연결시 name부분은 db와 동일하게.  -->
						<table class="m_table">
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">문의 유형</td>
									<td id="radio">
										<input type="radio" name="BOARD_TYPE" value="상품문의" checked  />
										<span>상품문의</span>	
									
										<input type="radio" name="BOARD_TYPE" value="결제/주문문의" />
										<span>결제/주문문의</span>	
									
										<input type="radio" name="BOARD_TYPE" value="기타문의" />
										<span>기타문의</span>	
									</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">분류</td>
								<td>
									<label id="cate1" for=High></label>
										<select id="High" onchange="categoty()">
											<option value="0"> ====대분류==== </option>
											<option value="1"> ■ 소방/안전 </option>
											<option value="2"> ■ 재난/응급/긴급 </option>
											<option value="3"> ■ 일상/기타 </option>
										</select>
									<label id="cate2" for="Low"></label>
    								<select id="Low" onchange="updateProductList()">
    									<!--처음 글쓰기들어왔을때, 초기값  -->
    									<option value="0"> ====소분류==== </option>
    								</select>
    								<label id="cate3" for="Prod"></label>
    								<select id="Prod" name="prod_num"> 
    								<!--동적으로 자동으로 붙여질곳  -->
    								</select>
								</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">작성자</td>
								<!--이건 로그인한 사람이 자동으로 뜨게하기.  -->
								<td><input type="text" name="BOARD_WRITER" size="20" autocomplete='off'value="${nick}" disabled/></td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font" >제목</td>
								<td><input type="text" name="BOARD_SUBJECT" size="20" autocomplete='off' /></td>
							</tr>
							
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font"  width="200px">첨부파일</td>
								<td><input type="file" name="file" size="20" /></td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">비밀글여부</td>
								<td>
									<div id="chkbox_div">
										<input type="checkbox" id="chkbox" name="BOARD_LOCK" />									
										<label for="chkbox"></label>
										비밀글여부
									</div>
									</td>
							</tr>
							<tr align="center">
								<td colspan="2">
									<textarea rows="10" cols="60" name="BOARD_CONTENT" id="content"></textarea>
								</td>
							</tr>
							<tfoot>
								<tr align="center">
									<td colspan="2">
										<input type="button" value="작성" onclick="save_go(this.form)" class="in_btn"/>
										<input type="hidden" name="secret_flag" id="secret_flag" value="0" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="목록" onclick="list_go(this.form)" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" value="취소" class="in_btn" id="reset"/>
									</td>
								</tr>
							</tfoot>
						</table>
						
					</form>
			</article>
		</section>	
		
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>

    	<script src="resources/js/summernote-lite.js"></script>
    	<script src="resources/js/lang/summernote-ko-KR.js"></script>
    	<script type="text/javascript">
    	$(function(){
    		$('#content').summernote({
    			lang : 'ko-KR',
    			height : 800,
    			focus : true,
    			callbacks : {
    				onImageUpload :  function(files, editor){
    					for (var i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
    				}
    			}
			});
    	});
    	function sendImage(file, editor) {
			var frm = new FormData();
			frm.append("s_file",file);
			$.ajax({
				url : "/saveImage.do",
				data : frm,
				type : "post",
				contentType : false,
				processData : false,
				dataType : "json",
			}).done(function(data) {
				var path = data.path;
				var fname = data.fname;
				$("#content").summernote("editor.insertImage",path+"/"+fname);
			});
			consloe.log("끝");
		}
    	
    	</script>
</body>
</html>