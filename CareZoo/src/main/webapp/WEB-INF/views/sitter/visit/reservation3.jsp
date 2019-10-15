<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation3</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">

var sel_file;

$(document).ready(function(){
	$("#input_img").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	})
}

// 로그아웃확인 <--모든페이지에 필수
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}

$(function() { //문서가 로딩되면 실행할 함수
	
})

// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!

// })

// 기본적으로 세션에 저장된 정보
var user_numtype = "<%=session.getAttribute("user_numtype")%>"
var user_num = "<%=session.getAttribute("user_num")%>"
var user_name = "<%=session.getAttribute("user_name")%>"


function checkValue() {
	
	if($("#name").val() ==""){
		alert("이름을 입력해 주세요");
		return false;
	}
	
	if($("#kind").val() ==""){
		alert("견종을 입력해 주세요");
		return false;
	}
	
	if($("#birth").val() ==""){
		alert("생년월일을 입력해 주세요");
		return false;
	}
	
	if($("#sex").val() ==""){
		alert("성별을 입력해 주세요");
		return false;
	}
	
	if($("#none_sex").val() ==""){
		alert("중성화 여부를 입력해 주세요");
		return false;
	}
	
	if($("#weight").val() ==""){
		alert("몸무게를 입력해 주세요");
		return false;
	}

}

var index = 1;

$(function() {
	
	//옵션추가 버튼 클릭시
	$("#addImgBtn").click(function() {
//			
		//파일 선택란을 보여준다.
		//$("tr#item1").show();
		// tr태그의 마지막 번째를 구해 id="item"의 형태로 만들어 lastItemNo에 대입
		//새로 추가 할 경우 두번째 tr 값을 복사하여 newitem변수에 대입
		//var newitem = $("#file"+lastItemNo).clone();
		var newfile = "<input type='file' id='file' name='file' class='fileClass' style='display: none' accept='.jpg,.jpeg,.png,.gif,.bmp' />";
		$("#example").append(newfile);
		//아이템 추가시 id="item" 값에 넘버를 추가해 준다.               
		//newitem.attr("id", "file" + (parseInt(lastItemNo) + 1));

		$("#file").trigger('click');

		//file형식의 그것의 취소버튼을 눌렀을 때.

		//onclick=\"deleteImageAction("+index+")\"
		$("#file").on("change",handleImgFileSelect);
//			console.log("add가끝난뒤 index:"+index);
	});

	// 이미지 정보들을 담을 배열
	var sel_files = [];

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#file").trigger('click');
	}

	var sel_file;

	function handleImgFileSelect(e) {
//			console.log("handleImg");
//			console.log("handleImg때의 index:"+index);
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
				
				var html = "<img src=\"" + e.target.result + "\" data-file='"+f.name+"' id='img' class='img' style='width:250px, height:250px'></a>";
				$(".imgs_wrap").children().remove();
				$(".imgs_wrap").append(html);
			}		
			reader.readAsDataURL(f);		
		});
		index++;		
	}
	//----카카오 1:1상담
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('d5215a661c44ab13805d6f04adeddadb');
	// 플러스친구 1:1채팅 버튼을 생성합니다.
	Kakao.PlusFriend.createChatButton({
	  container: '#plusfriend-chat-button',
	  plusFriendId: '_QuCiT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
	});
	//]]>
	//----카카오 1:1상담	
});

</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
.img_wrap {
	width: 300px;
	margin-top: 50px;
}

.img_wrap img {
	max-width: 100%;
}

.content {
	width: 900px;
	margin: 0 auto;
}

legend {
	text-align: center;
}

.content fieldset {
	padding: 25px;
}

.main {
	width: 500px;
	margin: 40px auto;
}

.space {
	width: 70px;
}

.auth {
	background-color: #40bf9f;
	color: white;
	border-color: #40bf9f;
	width: 200px;
	display: inline;
	font-weight: bold;
}

.phone {
	display: inline;
	width: 295px;
}

.red {
	color: red;
	font-size: 10px;
}

.green {
	color: green;
	font-size: 10px;
}

.btnGroup {
	text-align: center;
	margin: 35px;
}

.btn-submit, .btn-go {
	background-color: #40bf9f;
	color: white;
	border-color: #40bf9f;
	margin: 15px;
	width: 400px;
	font-weight: bold;
}


.btn-addImg {
	border-color: #40bf9f;
	color: #40bf9f;
	font-weight: bold;
	border: 1.5px solid;
	float: right;
	margin: 95px 70px;
}

.btn-addImg:hover {
	border-color: #40bf9f;
	background-color: #40bf9f;
	color: #fff;
}

.imgs_wrap {
	float: left;
}

.img {
	width: 250px;
	height: 250px;
}

.imgs {
	display: inline-block;
}
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
</head>
<body class="container">
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
				<label><%=session.getAttribute("user_name")%>님 반갑습니다!</label>
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
                <li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
				    <ul>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>펫호텔</a></li>

                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->

                    </ul>
                </li>

                <li class='last'><a href='${contextPath}/member/myPage' style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
<!-- 	<div class="container"> -->
			<form action="petjoin2" method="post"  onsubmit="return checkValue()" enctype="multipart/form-data">
			<%-- 			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"> --%>
			<input type="hidden" name="c_num" value="${c_num}">
			<div class="main">
				<span style="font-size: 12px; float: right;">* 사항은 필수입니다</span><br>
				<div class="form-group">
					<label for="name">*이름</label>
					<input type="text" class="form-control" id="name" placeholder="이름을 입력해 주세요" name="p_name">
				</div>
				<div class="form-group">
					<label for="kind">*견종</label>
					<input type="text" class="form-control" id="kind" placeholder="견종을 입력해 주세요" name="p_kind">
				</div>
				<div class="form-group">
					<label for="birth">*생년월일</label>
					<input type="date" class="form-control" id="birth" name="p_birth">
				</div>
				<div class="form-group">
					<label for="sex">*성별</label><label class="space"></label>
					<select id="sex" name="p_sex" class="form-control" >
						<option value="" selected="selected">성별</option>
						<option value="암컷">암컷</option>
						<option value="수컷">수컷</option>
					</select>
				</div>
				<div class="form-group">
					<label for="none_sex">*중성화</label><label class="space"></label>
					<select id="none_sex" name="p_none_sex" class="form-control" >
						<option value="" selected="selected">중성화 선택</option>
						<option value="유">유</option>
						<option value="무">무</option>
					</select>
				</div>
				<div class="form-group">
					<label for="weight">*몸무게</label>
					<select id="weight" name="p_weight" class="form-control" >
						<option value="" selected="selected">몸무게</option>
						<option value="소형견">소형견(7kg 미만)</option>
						<option value="중형견">중형견(7kg ~ 15kg)</option>
						<option value="대형견">대형견(15kg 초과)</option>
					</select>

				</div>
				<div class="form-group">
					<label for="comment">특이사항</label>
					<textarea class="form-control" name="p_notify" rows="5" id="comment" placeholder="ex) 닭고기 알러지가 있어요, 슬개골이 약해요"></textarea>
				</div>
				<div class="form-group imgs">
					<div class="imgs_wrap" id="imgs_wrap" >
						<img id="img" class="img" >
					</div>
					<input type="button" class="btn btn-addImg" id="addImgBtn" value="사진 등록">
					<div id="example"></div>
				</div>
				<div class="btnGroup">
					<input type="submit" class="btn btn-submit" value="등록완료">
					<input type="button" class="btn btn-go" value="기존 반려견으로 할래요!" onclick="location.href='${contextPath}/visit/petList?c_num=${c_num}'">
				</div>
			</div>
		</form>
<!-- 	</div> -->
	

<div class="bottom-left alert" id="plusfriend-chat-button">
</body>
</html>