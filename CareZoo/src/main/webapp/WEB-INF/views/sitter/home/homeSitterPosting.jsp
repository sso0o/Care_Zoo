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
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"><!--부트스트랩-->
<link rel="stylesheet" href="${contextPath}/resources/css/lightslider.css" /> <!--이미지 슬라이더  -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css"> <!-- 메뉴바 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> <!-- 데이트피커 -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css' /> <!-- 데이트피커 -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/jquery-ui-timepicker-addon.css' />
<%-- <link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css' /> <!-- 데이트피커 --> --%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> <!-- 폰트 -->
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 데이트피커 -->
<script type="text/javascript" src="${contextPath}/resources/js/lightslider.js"></script> <!-- 슬라이드 -->
<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script> <!-- 메뉴바 -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- 데이트피커 -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript"></script> <!-- 데이트피커 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script><!--부트스트랩-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script><!--부트스트랩-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script><!-- 부트스트랩 for tab -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<title>homeSitterPosting</title>
<style type="text/css">
/* -------카카오 상담버튼------- */
.bottom-left {
  position: fixed;
  bottom: 0;
  right:0;
}

.alert {
  background: white;
  font-weight: bold;
  padding: 1em;
}
/* -------카카오 상담버튼------- */
</style>
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


// 로그아웃확인 <--모든페이지에 필수
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}

$(function() { //문서가 로딩되면 실행할 함수
	//----카카오 1:1상담
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('d5215a661c44ab13805d6f04adeddadb');
	// 플러스친구 1:1채팅 버튼을 생성합니다.
	Kakao.PlusFriend.createChatButton({
		container : '#plusfriend-chat-button',
		plusFriendId : '_QuCiT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
	});
	//]]>
	//----카카오 1:1상담	
})

// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!

// })

// 기본적으로 세션에 저장된 정보
var user_numtype = "<%=session.getAttribute("user_numtype")%>"
var user_num = "<%=session.getAttribute("user_num")%>"
var user_name = "<%=session.getAttribute("user_name")%>"

</script>
<style type="text/css">
.menu>ul {
	height: 45px;
}


</style>
</head>
<body>
  <div class="container">
        <header>
            <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
            <br>
			<div class="header_Btn" id="sessioncheck">
				<sec:authorize access="isAnonymous()">
					<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
					<a class="btn_Join" href="${contextPath}/member/joinForm">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<label id="principal" style="display: none;"><sec:authentication property="principal" /></label>
					<label style="width: 150px;"><%=session.getAttribute("user_name")%>님 반갑습니다!</label>
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
                        <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a>
                            <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      -->
                        </li>
                        <li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='${contextPath}/petHotel/petHotelList'>HOTEL</a>
                    <ul>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>펫호텔</a></li>

                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->

                    </ul>
                </li>
                <li class='last'><a href='${contextPath}/member/myPage'  style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='${contextPath}/member/qna'  style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
<div>
	<form action="${contextPath }/home/write" method="post" enctype="multipart/form-data">
		<h1>가정용펫시터 글 등록페이지</h1>
		<table>
			<tr>
				<th>글제목**</th>
				<td></td>
			</tr>
			<tr>
				<th>글내용**</th>
				<td>
					Q. 왜 도그메이트 펫시터를 하게 되었나요?
					<textarea rows="5" cols="10"></textarea>
				</td>
				<td>
					Q. 반려견을 키운 경험에 대해 알려주세요. 현재 반려견을 키우고 계시다면 자세히 소개해주세요!
					<textarea rows="5" cols="10"></textarea>
				</td>
				<td>
					Q. 애견호텔이 아닌 저에게 맡겨주시면 아래와 같은 내용을 약속드립니다.
					<textarea rows="5" cols="10"></textarea>
				</td>
				<td>
					※ 아래 유형의 아이들은 돌봄이 어려울 수 있습니다.
					<textarea rows="5" cols="10"></textarea>
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
				<td><input type="text" name="hsl_service_type" value="24시간돌봄"></td>
			</tr>
			<tr>
				<th>체크인 가능 시간의 범위를 지정해 주세요</th>
				<td><input type="date" name="hsl_chkin"></td>
			</tr>
			<tr>
				<th>체크아웃 가능 시간의 범위를 지정해 주세요</th>
				<td><input type="date" name="hsl_chkout"></td>
			</tr>
			<tr>
				<th>돌봄 가능한 강아지의 크기를 선택해 주세요</th>
				<td><input type="text" name="hsl_size" value="소형견"></td>
			</tr>
			<tr>
				<th>돌봄 가능한 강아지의 나이를 선택해 주세요</th>
				<td><input type="text" name="hsl_pet_age" value="강아지"></td>
			</tr>
			<tr>
				<th>현재 키우고 있는 펫 크기를 선택해주세요</th>
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
<div class="bottom-left alert" id="plusfriend-chat-button"/>
</body>
</html>