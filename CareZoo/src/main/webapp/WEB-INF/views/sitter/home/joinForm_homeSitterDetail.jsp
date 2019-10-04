<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/><!-- datePicker -->
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/><!-- dateTimePicker -->
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- datePicker -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script><!-- datePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>   <!-- dateTimePicker -->

<script type="text/javascript">
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}

function cancleCheck() {
	if (confirm("취소하시면 작성한 양식이 날라갑니다.\n그래도 취소하시겠습니까?") == true) {
		location.href = '${contextPath}'
	} else {
		return false;
	}
}

function checkValue() {
	if($("#hsl_title").val() ==""){
		alert("제목을 입력해주세요");
		return false;
	}
	
	if($("#hsl_service_type").val() ==""){
		alert("서비스타입을 입력해 주세요");
		return false;
	}
	
	if($("#hsl_size").val() ==""){
		alert("강아지의 크기를 입력해 주세요");
		return false;
	}
	
	if($("#hsl_pet_age").val() ==""){
		alert("강아지의 나이를 입력해 주세요");
		return false;
	}
	
	if($("#hsl_care_place").val() ==""){
		alert("돌봄공간을 체크해 주세요");
		return false;
	}

}
// $(function(){
// 	checkValue();
// 	var index = 1;
// 	//옵션추가 버튼 클릭시
// 	$("#addItemBtn").click(function() {
// 		if (index > 1) {
// 			var file = document.getElementById('file'+ (index - 1));
// 			console.log(file.files.length);
// 			if (file.files.length == 0) {
// 				console.log("length 실행!");
// 				console.log($("#file" + (parseInt(index))));
// 				$(file).remove();
// 				index--;
// 			}
// 		}
// 		var newitem = "<input type='file' id='file"
// 				+ (parseInt(index))
// 				+ "'name='file'  style='display: none' accept='.jpg,.jpeg,.png,.gif,.bmp' />";
// 		if (index == 5) {
// 			alert("5개 이상 파일 추가 하실 수 없습니다.");
// 		} else {
// 			$("#example").append(newitem);
// 		}
// 		$("#file" + (parseInt(index))).trigger('click');
// 		$("#file" + (parseInt(index))).on("change",
// 				handleImgFileSelect);
// 		console.log(index);

// 		index++;
// 	});
// 	// 이미지 정보들을 담을 배열
// 	var sel_files = [];
// 	function fileUploadAction() {
// 		console.log("fileUploadAction");
// 		$("#file1").trigger('click');
// 	}
// 	var sel_file;
// 	function handleImgFileSelect(e) {
// 		console.log("handleImg");
// 		// 이미지 정보들을 초기화
// 		var files = e.target.files;
// 		var filesArr = Array.prototype.slice.call(files);
// 		filesArr.forEach(function(f) {
// 			if (!f.type.match("image.*")) {
// 				alert("확장자는 이미지 확장자만 가능합니다.");
// 				return;
// 			}
// 			sel_file = f;
// 			var reader = new FileReader();
// 			reader.onload = function(e) {
// 				var html = "<img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' style='width:250px, height:250px'></a>";
// 				$(".imgs_wrap").append(html);
// 			}
// 			reader.readAsDataURL(f);
// 		});
// 	}
// 	$(function(id, file, func) {
// 		$('#' + id).ajaxForm({
// 			contentType : false,
// 			processData : false,
// 			enctype : "multipart/form-data",
// 			dataType : "POST",
// 			dataType : 'json',
// 			beforeSubmit : function(data, form, option) {
// 				var fileSize = file.length;
// 				if (fileSize > 0) {
// 					for (var i = 0; i < fileSize; i++) {
// 						var obj = {
// 							name : "files[]",
// 							value : file[k],
// 							type : "file"
// 						};
// 						console.log(obj);
// 						data.push = obj;
// 					}
// 				}
// 				console.log('beforeSubmit');
// 				console.log(file);
// 				console.log(data);
// 				console.log(form);
// 				console.log(option);
// 			},
// 			success : function(returnData) {
// 				console.log("returnData : " + returnData);
// 				func(returnData);
// 			},
// 			error : function(x, e) {
// 				console.log("[AF]ajax status : " + x.status);
// 				console.log(e);
// 			},
// 		});
// 	});

// 	$(document).on('click', '#removeImg', function() {
// 		const fileIndex = $(this).parent().index();
// 		fileBuffer.splice(fileIndex, 1);
// 		$('.fileList>div:eq(' + fileIndex + ')').remove();
// 	});
	
// });


 
</script>
<script type="text/javascript">
	// 이미지 정보들을 담을 배열
	var index = 1;
	$(function() {
		var count = 0;

		$('#addRoom').click(function() {
							
			var tab = $("#mytable");
			var tr = $("<tr>");

			var r_name = $("<td><input type=\"text\" placeholder=\"방이름\" name=\"r_name"+count+"\">")
			var r_adult = $("<td><input type=\"number\" placeholder=\"가능어른수\" name=\"r_adult"+count+"\">")
			var r_child = $("<td><input type=\"number\" placeholder=\"가능어른수\" name=\"r_child"+count+"\">")
			var r_p_count = $("<td><input type=\"number\" placeholder=\"동반가능펫수\" name=\"r_p_count"+count+"\">")
			var r_price = $("<td><input type=\"number\" placeholder=\"가격\" name=\"r_price"+count+"\">")

			// 			$('#mytable').append('<tr><td>ㅁ</td><td>ㅁ</td><td>ㅁ</td><td>ㅁ</td><td>ㅁ</td><td>ㅁ</td></tr>');
			count++;
			tr.append(r_name);
			tr.append(r_adult);
			tr.append(r_child);
			tr.append(r_p_count);
			tr.append(r_price);
			tr.append(r_img);
			tr.appendTo(tab);
		});

		$('#delRoom').click(function() {
			if (count > 0) {
				$('#mytable:last > tr:last').remove();
				count--;
			}

		})

		// 		옵션추가 버튼 클릭시
		$("#addItemBtn")
				.click(
						function() {
							console.log("addItem의 index:"+index);
								console.log("file개수세기:"+$(".fileClass").length);
							if ($(".fileClass").length > 0) {
								console.log("img개수세기:"+$(".selProductFile").length);
								var file = document.getElementById('file'
										+ ($(".fileClass").length));
								// 								var file = $("#file"+(index-1));
								console.log("file의length:"+file.files.length);
								if (file.files.length == 0) {
									console.log("length 실행!");
									console.log($("#file" + (parseInt(index))));
									// 									$("#file" + (parseInt(index))).remove();
									$(file).remove();
								}
							}
							//파일 선택란을 보여준다.
							//             $("tr#item1").show();
							// tr태그의 마지막 번째를 구해 id="item"의 형태로 만들어 lastItemNo에 대입
							//새로 추가 할 경우 두번째 tr 값을 복사하여 newitem변수에 대입
							// 			var newitem = $("#file"+lastItemNo).clone();
							var newfile = "<input type='file' id='file"
									+ (parseInt(index))
									+ "'name='file' class='fileClass'  style='display: none' accept='.jpg,.jpeg,.png,.gif,.bmp' />";

							if ($(".selProductFile").length == 5) {
								//그리고 해당 아이템은 5개 이상 생성할수 없도록 제한
								alert("5개까지 가능합니다.");
							} else {
								$("#example").append(newfile);

							}
							//아이템 추가시 id="item" 값에 넘버를 추가해 준다.               
							// 			newitem.attr("id", "file" + (parseInt(lastItemNo) + 1));

							$("#file" + (parseInt(index))).trigger('click');

							//file형식의 그것의 취소버튼을 눌렀을 때.

							//onclick=\"deleteImageAction("+index+")\"
							$("#file" + (parseInt(index))).on("change",
									handleImgFileSelect);

							console.log("add가끝난뒤 index:"+index);

						});

	});

	// 이미지 정보들을 담을 배열
	var sel_files = [];

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#file1").trigger('click');
	}

	var sel_file;

	function handleImgFileSelect(e) {

		console.log("handleImg");
		console.log("handleImg때의 index:"+index);
		// 이미지 정보들을 초기화
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<img src=\"" + e.target.result + "\" data-file='"+f.name+"' id='preImg"+(index-1)+"' class='selProductFile' title='Click to remove' style='width:250px, height:250px'></a>";
						$(".imgs_wrap").append(html);

						var newButton = "<input type='button' id='deleteButton"+(index-1)+"'  onclick='deleteImageAction("
								+ index + ")' value='삭제'>";
						$(".imgs_wrap").append(newButton);
					}
					reader.readAsDataURL(f);
				});
		index++;
	}

	function deleteImageAction(fileIndex) {
		console.log("delete start!");
		var file = document.getElementById('file' + (fileIndex - 1));
		var img = document.getElementById('preImg' + (fileIndex - 1));
		var dButton = document.getElementById('deleteButton' + (fileIndex - 1));
		$(file).remove();
		$(img).remove();
		$(dButton).remove();
		index--;
		console.log("index="+index);
	}
</script>
<style type="text/css">
.content{
	width: 900px;
	margin: 0 auto;
}

legend{
	text-align: center;
}

.content fieldset {
	padding: 25px;
}

.main{
	width: 500px;
	margin: 40px auto;
}

.space{
	width: 70px;
}

.auth{
    background-color: #40bf9f;
    color: white;
    border-color: #40bf9f;
    width: 200px;
    display: inline;
    font-weight: bold;
}

.phone{
	display: inline;
	width: 295px;
}

.red{
	color: red;
	font-size: 10px;
}
.green{
	color: green;
	font-size: 10px;
}

.btnGroup{
	text-align: center;
	margin: 35px;
}

.btn-submit,
.btn-cancle{
	background-color: #40bf9f;
    color: white;
    border-color: #40bf9f;
    margin: 15px;
    width: 70px;
    font-weight: bold;
}


</style>
<meta charset="UTF-8">
<title>가정시터 글등록을 위한 상세내용</title>
</head>
<body>
<!-- 네비게이션 -->
<div>
	<div class="container">
        <header>
            <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
         
            <div class="header_Btn" id="sessioncheck"> 
            <sec:authorize access="isAnonymous()">
            	<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
            	<a class="btn_Join" href="${contextPath}/member/join">회원가입</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            	<label id="principal" style="display: none;" ><sec:authentication property="principal"/></label>
            	<label><%=session.getAttribute("user_name") %>님 반갑습니다!</label>
            	<a class="btn_Logout" onclick="logoutCheck()" href="#">로그아웃</a>
            </sec:authorize>
             </div>
        </header>
    </div>
    <nav>
        <div class='menu'>
            <ul style="">
                <li class='active sub'><a href='${contextPath}/sitter/main'>SITTER</a>
         
                    <ul>
                        <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a></li>
                        <li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
                    <ul>
                        <li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='#'>REVIEW</a>
                    <ul>
                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
                        <li class='last'><a href='#'>시터</a></li>
                        <li class='last'><a href='#'>호텔</a></li>
                    </ul>
                </li>
                <li class='last'><a href='#' style="font-size: 17px">MY PAGE</a></li>
                <li class='last'><a href='${contextPath}/admin/qna' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
</div>	
<!-- 칸 띄우기 위함 -->
<br><br><br><br><br>

<!-- 		여기다 내용을 작성하시면 됩니다 -->
<div class="container">
		<form action="${contextPath }/home/write" method="post" enctype="multipart/form-data" onsubmit="return checkValue()">
		<h1>가정용펫시터 글 등록페이지</h1>
		<table>

			<tr>
				<th>글제목**</th>
				<td><input type="text" name="hsl_title" id="hsl_title"></td>
			</tr>
			<tr>
				<th>글내용**</th>
				<td>
					<textarea name="hsl_comment" cols="40" rows="8">
					Q. 왜 도그메이트 펫시터를 하게 되었나요? 
					Q. 반려견을 키운 경험에 대해 알려주세요. 현재 반려견을 키우고 계시다면 자세히 소개해주세요! 
					Q. 애견호텔이 아닌 저에게 맡겨주시면 아래와 같은 내용을 약속드립니다. 
					※ 아래 유형의 아이들은 돌봄이 어려울 수 있습니다.
					</textarea>
				</td>
			</tr>
			<tr>
				<th>돌봄 공간의 사진을 올려주세요**</th>
				<td>
					<input type="button" id="addItemBtn" class="my_button" value="파일추가" name="hsl_img_filename"> 
					<div id="example"></div>
					
				</td>
				<td>
					<div class="imgs_wrap"></div>
				</td> 
			</tr>
			<tr>
				<th>펫을 돌볼 수 있는 날짜를 선택해 주세요**</th>
				<td>
					<select name="hsl_service_type" id="hsl_service_type">
						<option title="24시간 돌봄" value="24시간돌봄">24시간 돌봄</option>
						<option title="데이케어" value="데이케어">데이케어</option>
					</select>			
				</td>
			</tr>
			<tr>
				<td>여기는 disable date 로 받기</td>
				<th>예약 불가능한 날짜를 입력해 주세요</th>
				<td><input type="text" name="hsl_chkin"></td>
			</tr>
			<tr>
				<th>체크인 가능 시간의 범위를 지정해 주세요</th>
				<td><input type="text" name="hsl_chkin_str_time">~<input type="text" name="hsl_chkin_end_time"></td>
			</tr>
			<tr>
				<th>체크아웃 가능 시간의 범위를 지정해 주세요</th>
				<td><input type="text" name="hsl_chkout_str_time">~<input type="text" name="hsl_chkout_end_time"></td>
			</tr>

			<tr>
				<th>돌봄 가능한 강아지의 크기를 선택해 주세요</th>
				<td>
					<select name="hsl_size" data-width="130px" id="hsl_size">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option title="s" value="소형견">소형견 (0~4.9kg)</option>
						<option title="m" value="중형견">중형견 (5~14.9kg)</option>
						<option title="l" value="대형견">대형견 (15kg 이상)</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>돌봄 가능한 강아지의 나이를 선택해 주세요</th>
				<td>
					<select name="hsl_pet_age" data-width="130px" id="hsl_pet_age">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option title="puppy" value="강아지">강아지 (1살 이하)</option>
						<option title="dog" value="성견">성견 (2~6살)</option>
						<option title="agedDog" value="노령견">노령견 (7살 이상)</option>
					</select>
				</td>
			</tr>
		</table>
		<h1>돌봄 환경에 대해 자세히 알려주세요</h1>
		<table>
			<tr>
				<th>돌봄공간</th>
				<td>
					<select name="hsl_care_place" data-width="130px" id="hsl_care_place">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option value="아파트">아파트 </option>
						<option value="빌라">빌라</option>
						<option value="주택">주택</option>
					</select>
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th>인근 지하철역</th> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
			<tr>
				<th>마당유무</th>
				<td>
					<input type='radio' name='hsl_yard' value='있습니다.' id="hsl_yard"/>있습니다.
 					<input type='radio' name='hsl_yard' value='없습니다.' checked  id="hsl_yard"/>없습니다.	
 				</td>
			</tr>
			<tr>
				<th>14세미만 아동 거주 유무</th>
				<td>
					<input type='radio' name='hsl_baby' value='있습니다.' id="hsl_baby"/>있습니다.
 					<input type='radio' name='hsl_baby' value='없습니다.' checked id="hsl_baby"/>없습니다.	
 				</td>
			</tr>
			<tr>
				<th>가족 동거 유무</th>
				<td>
					<input type='radio' name='hsl_family' value='있습니다.' id='hsl_family'/>있습니다.
 					<input type='radio' name='hsl_family' value='없습니다.' checked id='hsl_family'/>없습니다.	
 				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th>다른 동물 유무</th> -->
<!-- 				<td> -->
<!-- 					<input type='radio' name='' value='있습니다.' />있습니다. -->
<!--  					<input type='radio' name='' value='없습니다.' checked/>없습니다.	 -->
<!--  				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>강아지 사진</th> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
		</table>
		<table>
			<tr>
				<td>
					<input type="submit" value="등록"> <input type="reset" value="다시쓰기"> 
					<input type="button" value="돌아가기" value="취소" onclick="cancleCheck()">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>