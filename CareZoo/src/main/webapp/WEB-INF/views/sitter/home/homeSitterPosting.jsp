<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"><!--부트스트랩-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/><!-- datePicker -->
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/><!-- dateTimePicker -->
<!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css" type='text/css'>안이쁨 dateTimePicker  -->
<!-- link for navBar -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"><!--부트스트랩-->
<!-- *필수요소*제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- datePicker -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script><!-- datePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>   <!-- dateTimePicker -->
<!--  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>안이쁨 dateTimePicker  -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>부트스트랩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>부트스트랩

<title>homeSitterPosting</title>
<script type="text/javascript">
$(function(){
	var index = 1;
	//옵션추가 버튼 클릭시
	$("#addItemBtn").click(function() {
		if (index > 1) {
			var file = document.getElementById('file'+ (index - 1));
			console.log(file.files.length);
			if (file.files.length == 0) {
				console.log("length 실행!");
				console.log($("#file" + (parseInt(index))));
				$(file).remove();
				index--;
			}
		}
		var newitem = "<input type='file' id='file"
				+ (parseInt(index))
				+ "'name='file'  style='display: none' accept='.jpg,.jpeg,.png,.gif,.bmp' />";
		if (index == 5) {
			alert("5개 이상 파일 추가 하실 수 없습니다.");
		} else {
			$("#example").append(newitem);
		}
		$("#file" + (parseInt(index))).trigger('click');
		$("#file" + (parseInt(index))).on("change",
				handleImgFileSelect);
		console.log(index);
		index++;
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
		// 이미지 정보들을 초기화
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				var html = "<img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' style='width:250px, height:250px'></a>";
				$(".imgs_wrap").append(html);
			}
			reader.readAsDataURL(f);
		});
	}
	$(function(id, file, func) {
		$('#' + id).ajaxForm({
			contentType : false,
			processData : false,
			enctype : "multipart/form-data",
			dataType : "POST",
			dataType : 'json',
			beforeSubmit : function(data, form, option) {
				var fileSize = file.length;
				if (fileSize > 0) {
					for (var i = 0; i < fileSize; i++) {
						var obj = {
							name : "files[]",
							value : file[k],
							type : "file"
						};
						console.log(obj);
						data.push = obj;
					}
				}
				console.log('beforeSubmit');
				console.log(file);
				console.log(data);
				console.log(form);
				console.log(option);
			},
			success : function(returnData) {
				console.log("returnData : " + returnData);
				func(returnData);
			},
			error : function(x, e) {
				console.log("[AF]ajax status : " + x.status);
				console.log(e);
			},
		});
	});

	$(document).on('click', '#removeImg', function() {
		const fileIndex = $(this).parent().index();
		fileBuffer.splice(fileIndex, 1);
		$('.fileList>div:eq(' + fileIndex + ')').remove();
	});
	
});
</script>
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
<div class="container">
게시글을 올리기 위해 상세 내용을 입력해 주세요 
<a href=""> </a>
	<form action="${contextPath }/home/write" method="post" enctype="multipart/form-data">
		<h1>가정용펫시터 글 등록페이지</h1>
		<table>
			<tr>
				<th>글제목**</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>글내용**</th>
				<td>
					Q. 왜 도그메이트 펫시터를 하게 되었나요?
					<input type="text">
				</td>
				<td>
					Q. 반려견을 키운 경험에 대해 알려주세요. 현재 반려견을 키우고 계시다면 자세히 소개해주세요!
					<input type="text">
				</td>
				<td>
					Q. 애견호텔이 아닌 저에게 맡겨주시면 아래와 같은 내용을 약속드립니다.
					<input type="text">
				</td>
				<td>
					※ 아래 유형의 아이들은 돌봄이 어려울 수 있습니다.
					<input type="text">
				</td>
			</tr>
			<tr>
				<th>돌봄 공간의 사진을 올려주세요**</th>
<!-- 					<td> -->
<!-- 						<input type="file" name="hsl_filename"> -->
<!-- 						<div id="example"></div> -->
<!-- 					</td> -->
				<td>
					<input type="button" id="addItemBtn" class="my_button" value="파일추가" name="hsl_img_filename"> 
					<div id="example"></div>
				</td> 
			</tr>
			<tr>
				<th>펫을 돌볼 수 있는 날짜를 선택해 주세요**</th>
				<td>
					<select name="hsl_service_type">
						<option title="24시간 돌봄" value="24시간돌봄">24시간 돌봄</option>
						<option title="데이케어" value="데이케어">데이케어</option>
					</select>			
				</td>
			</tr>
			<tr>
				<td>여기는 disable date 로 받기</td>
				<th>체크인 가능 시간의 범위를 지정해 주세요</th>
				<td><input type="date" name="hsl_chkin"></td>
			</tr>
			<tr>
				<th>체크아웃 가능 시간의 범위를 지정해 주세요</th>
				<td><input type="date" name="hsl_chkout"></td>
			</tr>
			<tr>
				<th>돌봄 가능한 강아지의 크기를 선택해 주세요</th>
				<td>
					<select name="hsl_size" data-width="130px">
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
					<select name="hsl_pet_age" data-width="130px">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option title="puppy" value="강아지">강아지 (1살 이하)</option>
						<option title="dog" value="성견">성견 (2~6살)</option>
						<option title="agedDog" value="노령견">노령견 (7살 이상)</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>현재 키우고 있는 펫 크기를 선택해주세요</th>
				<td>
					<select name="" data-width="130px">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option title="s" value="소형견">소형견 (0~4.9kg)</option>
						<option title="m" value="중형견">중형견 (5~14.9kg)</option>
						<option title="l" value="대형견">대형견 (15kg 이상)</option>
					</select>
				</td>
			</tr>
		</table>
		<h1>돌봄 환경에 대해 자세히 알려주세요</h1>
		<table>
			<tr>
				<th>돌봄공간</th>
				<td></td>
			</tr>
			<tr>
				<th>인근 지하철역</th>
				<td></td>
			</tr>
			<tr>
				<th>마당유무</th>
				<td></td>
			</tr>
			<tr>
				<th>14세미만 아동 거주 유무</th>
				<td></td>
			</tr>
			<tr>
				<th>가족 동거 유무</th>
				<td></td>
			</tr>
			<tr>
				<th>다른 동물 유무</th>
				<td></td>
			</tr>
			<tr>
				<th>강아지 사진</th>
				<td></td>
			</tr>
		</table>
		<div class="imgs_wrap"></div>
		<table>
			<tr>
				<td>
					<input type="submit" value="등록"> <input type="reset" value="다시쓰기"> <input type="button" value="돌아가기" onclick="location.href='${contextPath}/home/main">
				</td>
			</tr>
		</table>
	</form>
</div>
	
<br><br>
<footer>
	<div>durlsms footer</div>
</footer>
</body>
</html>