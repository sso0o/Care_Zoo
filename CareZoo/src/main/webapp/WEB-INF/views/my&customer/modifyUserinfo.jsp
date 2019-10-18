<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!-- 이것도 네줄이 꼭 있어야합니당! -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 필수요소 -->
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- 메뉴바 -->
<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- 주소가져오기 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function getAddress() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
// 						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>

<script type="text/javascript">

var user_numtype = "<%=session.getAttribute("user_numtype")%>"
var user_num = "<%=session.getAttribute("user_num")%>"
var user_name = "<%=session.getAttribute("user_name")%>"
	
	// 로그아웃확인 <--모든페이지에 필수
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
		
		if($("#pw2").val() ==""){
			alert("비밀번호를 입력해 주세요");
			return false;
		}
		
		if($("#name").val() ==""){
			alert("이름을 입력해 주세요");
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
		
		if($("#address").val() ==""){
			alert("주소를 입력해 주세요");
			return false;
		}
		
		if($("#d_address").val() ==""){
			alert("상세주소를 입력해주세요");
			return false;
		}
		   console.log($("#phone1").val().length);
		   if($("#phone1").val().length<2||$("#phone1").val().length>4){
		      alert("핸드폰번호를 정확하게 입력해주세요.");
		      return false;
		   }
		   if($("#phone2").val().length<2||$("#phone2").val().length>4){
		      alert("핸드폰번호를 정확하게 입력해주세요.");
		      return false;
		   }  
	}
	
	$(function() { //문서가 로딩되면 실행할 함수
		
		if("${msg}" != ""){
			alert("${msg}");
		}
		
		$("#pw2").change(function() {
			var pw = $("#pw").val(); 
			var pw2 = $("#pw2").val(); 
//	 		console.log(pw)
//	 		console.log(pw2)
			
			if(pw==pw2 ){
				$("#pwchk_val").removeClass('red');
	        	$("#pwchk_val").addClass('green');
	        	$("#pwchk_val").text("비밀번호가 동일합니다!")
			} else{
				$("#pwchk_val").removeClass('green');
	        	$("#pwchk_val").addClass('red');
	        	$("#pwchk_val").text("비밀번호가 다릅니다!")
			}
			
		});
	
		$("#email").val("${customer.c_email}");
		$("#name").val("${customer.c_name}");
		$("#contact").val("${customer.c_contact}");
		$("#address").val("${customer.c_address}");
		$("#d_address").val("${customer.c_d_address}");
		$("#birth").val("${customer.c_birth}");
		if("${customer.c_birth}" == "1"){
			$("#sex").val("여자");
			$("#c_sex").val("1");
		} else {
			$("#sex").val("남자");
			$("#c_sex").val("2");
		}
		
		$.ajax({
			url:"${contextPath}/member/getImg",
			data:{
				user_num : user_num
			},
			dataType: "JSON",
			success: function(data) {
				console.log(data)
				if(data.filename != null){
					$("#img").attr("src","${contextPath}/member/image?fileName="+data.filename)
				} else {
					$("#img").attr("src","${contextPath}/resources/img/user.jpg")
				}
				
			}, error: function() {
				alert("error")
			}
		})
		
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
// 			console.log("add가끝난뒤 index:"+index);
		});
	
		// 이미지 정보들을 담을 배열
		var sel_files = [];

		function fileUploadAction() {
			console.log("fileUploadAction");
			$("#file").trigger('click');
		}

		var sel_file;

		function handleImgFileSelect(e) {
// 			console.log("handleImg");
// 			console.log("handleImg때의 index:"+index);
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
		
	})

	// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!
	
	// })
	
	// 기본적으로 세션에 저장된 정보
<%-- 	var user_numtype = "<%=session.getAttribute("user_numtype")%>" --%>
<%-- 	var user_num = "<%=session.getAttribute("user_num")%>" --%>
<%-- 	var user_name = "<%=session.getAttribute("user_name")%>" --%>


</script>
   
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
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
}

.btn-addImg{
	border-color: #40bf9f;
	color: #40bf9f;
	font-weight: bold;
	border: 1.5px solid;
	float: right;
	margin: 95px 70px;
}
.btn-addImg:hover{

	border-color: #40bf9f;
	background-color: #40bf9f;
	color: #fff;
	
}

.imgs_wrap{

	
	float: left;
}

.img{
	width: 250px;
	height: 250px;
}

.imgs{
	display: inline-block;
}

</style>
  
<title>Insert title here</title>
</head>  
<body>
    <div class="container">
        <header>
            <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo" style="position:relative;left:35px"></a>
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
	<div class="content">
		<span>회원정보 수정페이지ㅣ</span>
		<form action="${contextPath }/member/modify" method="post" name="userInfo" onsubmit="return checkValue()" enctype="multipart/form-data" >
			<%-- 			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"> --%>
			<input type="hidden" value="<%=session.getAttribute("user_num")%>" name="c_num">
			<div class="main">
				<div class="form-group">
					<label for="c_email">아이디</label>
					<input type="email" class="form-control" id="email" name="c_email" readonly="readonly">
					<span id="idchk_val"></span>
				</div>
				<div class="form-group">
					<label for="c_pass">비밀번호</label>
					<input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력해 주세요" name="c_pass">
					<span id="pw_val"></span>
				</div>
				<div class="form-group">
					<label for="c_pass_chk">비밀번호 확인</label>
					<input type="password" class="form-control" id="pw2" placeholder="비밀번호 확인" name="c_pass_chk">
					<span id="pwchk_val"></span>
				</div>
				<div class="form-group">
					<label for="c_name">이름</label>
					<input type="text" class="form-control" id="name" placeholder="이름을 입력해 주세요" name="c_name" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="email">생년월일</label>
					<input type="date" class="form-control" id="birth" name="c_birth" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="c_sex">성별</label>
					<input type="text" class="form-control" id="sex" readonly="readonly">
					<input type="hidden" class="form-control" id="c_sex" name="c_sex" readonly="readonly">
				</div>
				<div class="form-group imgs">
					<div class="imgs_wrap" id="imgs_wrap" >
						<img id="img" class="img" >
					</div>
					<input type="button" class="btn btn-addImg" id="addImgBtn" value="사진수정">
					<div id="example"></div>
				</div>
				<div class="form-group">
					<label for="address">주소</label><label class="space"></label>
	<!-- 				<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-outline-success" value="우편번호 찾기"> -->
					<input type="text" class="form-control" id="address" placeholder="도로명 주소" name="c_address" readonly="readonly" onclick="getAddress()">
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
					<input type="text" class="form-control" id="d_address" placeholder="상세주소를 입력해 주세요" name="c_d_address" style="margin-top: 5px">
					<span id="guide" style="color: #999"></span>
				</div>
				<div class="form-group">
					<label for="c_contact">휴대전화</label>
					<div class="mobile-area">
						<select name="phone">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
						</select> - <input type="text" name="phone1" id="phone1"
							style="width: 65px; height: 26px;"> - <input type="text" name="phone2"
							id="phone2" style="width: 65px; height: 26px;">
					</div>
				</div>
				<div class="btnGroup">
					<input type="submit" class="btn btn-submit" value="변경">
					<input type="button" class="btn btn-cancle" value="취소" onclick="cancleCheck()">
				</div>
			</div>
		</form>
		
	</div>
	</body>
</html>