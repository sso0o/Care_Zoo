<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
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
<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/jquery-ui.multidatespicker.css'/><!-- multidatePicker -->
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/><!-- dateTimePicker -->
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- datePicker -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script><!-- datePicker -->
<script src="${contextPath}/resources/js/jquery-ui.multidatespicker.js" type="text/javascript" ></script><!-- multidatePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>   <!-- dateTimePicker -->

<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function getAddress() {
	new daum.Postcode({
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
				//document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('address').value = fullRoadAddr;
			document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if (data.autoRoadAddress) {
				//예상되는 도로명 주소에 조합형 주소를 추가한다.
				var expRoadAddr = data.autoRoadAddress
						+ extraRoadAddr;
				document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
						+ expRoadAddr + ')';

			} else if (data.autoJibunAddress) {
				var expJibunAddr = data.autoJibunAddress;
				document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
						+ expJibunAddr + ')';

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
	if($("#email").val() ==""){
		alert("아이디(이메일)을 입력해주세요");
		return false;
	}
	
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
	
	if($("#contact").val() ==""){
		alert("연락처를 입력해주세요");
		return false;
	}	
}
var index = 1;
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
$(function() {
	$("#email").change(function() {
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var hs_email = $("#email").val();
		console.log(hs_email)
		if(regExp.test(hs_email)){
			console.log('이거 동작?')
			$.ajax({
	            async: true,
	            type : 'POST',
	            data : {hs_email : hs_email},
	            url : "${contextPath}/home/idCheck",
	            dataType : "json",
	            success : function(data) {
	                if (data.cnt > 0) {   
	                	$("#idchk_val").removeClass('green');
	                	$("#idchk_val").addClass('red');
	                	$("#idchk_val").text("사용 불가능한 아이디 입니다")

	                } else {
	                	$("#idchk_val").removeClass('red');
	                	$("#idchk_val").addClass('green');
	                	$("#idchk_val").text("사용 가능한 아이디 입니다")
	                    
	                }
	            },
	            error : function(error) {	                
	                alert("error : " + error);
	            }
	        });
		} else{
			$("#idchk_val").removeClass('green');
        	$("#idchk_val").addClass('red');
        	$("#idchk_val").text("이메일 형식에 맞지 않습니다.")
		}		
	}); //email체크함수
	
	$("#pw2").change(function() {
		var pw = $("#pw").val(); 
		var pw2 = $("#pw2").val(); 		
		if(pw==pw2 ){
			$("#pwchk_val").removeClass('red');
        	$("#pwchk_val").addClass('green');
        	$("#pwchk_val").text("비밀번호가 동일합니다!")
		} else{
			$("#pwchk_val").removeClass('green');
        	$("#pwchk_val").addClass('red');
        	$("#pwchk_val").text("비밀번호가 다릅니다!")
		}		
	});//pw체크함수
	
	//Disable date & time
	$('#chisTime').timepicker({
		minTime:'07:00' ,
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30,
		onSelect:  function() {
            $('#chieTime').timepicker('option', 'minTime', $(this).val());
        }
    });
	$('#chieTime').timepicker({
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30
    });
	$('#chosTime').timepicker({
		minTime:'07:00' ,
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30,
		onSelect:  function() {
            $('#choeTime').timepicker('option', 'minTime', $(this).val());
        }
    });
	$('#choeTime').timepicker({
		minTime:'07:00' ,
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30
    });
	//불가능한 날짜 받기
	$('#calendar').multiDatesPicker({
		minDate: 0, // today
		maxDate: 90,
		maxPicks: 30,
		altField:'#hsd_disabledate'
		});
	//image
	$.ajax({
		url:"${contextPath}/sitter/getHsImg",
		data:{
			hs_num : user_num
		},
		dataType: "JSON",
		success: function(data) {
			console.log(data)
			if(data.filename != null){
				$("#img").attr("src","${contextPath}/sitter/image?fileName="+data.filename)
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
		var newfile = "<input type='file' id='file' name='fileName' class='fileClass' style='display: none' accept='.jpg,.jpeg,.png,.gif,.bmp' />";
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
	
})
});


 
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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<header>
			<a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

			<div class="header_Btn" id="sessioncheck">
				<sec:authorize access="isAnonymous()">
					<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
					<a class="btn_Join" href="${contextPath}/member/join">회원가입</a>
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
						<li class='last'><a href='${contextPath}/home/main'>가정펫시터</a> <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      --></li>
						<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
					</ul></li>
				<li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
					<ul>
						<li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
						<li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
					</ul></li>
				<li class='active sub'><a href='${contextPath}/comment/hscList'>REVIEW</a>
					<ul>
						<!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='${contextPath}/comment/hscList'>가정시터</a></li>
						<li class='last'><a href='${contextPath}/comment/vscList'>방문시터</a></li>
						<li class='last'><a href='${contextPath}/comment/phcList'>펫호텔</a></li>
					</ul></li>
				<li class='last'><a href='#' style="font-size: 17px">MY PAGE</a></li>
				<li class='last'><a href='#' style="font-size: 17px">Q&A</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="content">
		<h2>홈시터 게시글 등록을 위한 회원정보를 정확하게 입력해 주세요.</h2>
		<hr>
		<form action="${contextPath }/home/write" method="post" name="homesitterInfo" onsubmit="return checkValue()">
			<%-- 			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"> --%>
			<input type="hidden" value="<%=session.getAttribute("user_num")%>" name="hs_num">
			<div class="main">
				<div class="card card-body">				 
					<div class="form-group">
						<label for="hsl_title">글제목</label>
						<input type="text" class="form-control" id="title" name="hsl_title">
					</div>
					<div class="form-group">
						<label for="hsl_comment">글내용</label>
						<textarea class="form-control" id="title" name="hsl_comment" style="resize: none;" rows="8" >
Q. 왜 도그메이트 펫시터를 하게 되었나요? 


Q. 반려견을 키운 경험에 대해 알려주세요. 현재 반려견을 키우고 계시다면 자세히 소개해주세요! 


Q. 애견호텔이 아닌 저에게 맡겨주시면 아래와 같은 내용을 약속드립니다. 


Q. ※ 아래 유형의 아이들은 돌봄이 어려울 수 있습니다.


						</textarea>
					</div>
					<div class="form-group">
						<label for="hsl_service_type">케어 가능한 서비스 타입을 선택해 주세요.(중복체크 가능)</label>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="24시간돌봄" name="hsl_service_type" >24시간 돌봄(하루 이상)
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="데이케어" name="hsl_service_type" >데이케어(하루 미만)
						  </label>
						</div>
					</div>	
					<div class="form-group">
						<label for="hsl_disdates">불가능한 날짜를 선택하여 주세요.(매 90일마다 갱신) </label><br>
						<div id="calendar"></div>
						<input type="text" class="form-control" id="hsd_disabledate" name="hsl_disdates"  placeholder="불가능한 날을 모두 선택해 주세요." autocomplete=off >
					</div>

					<div class="form-group">
						<label for="hsl_chkin_str_time">체크인 가능 시간의 범위를 지정해 주세요</label>
						<div class="form-inline">
							<input type="text" class="form-control" id="chisTime" name="hsl_chkin_str_time" style="width: 35%"  autocomplete=off> ~ 
							<input type="text" class="form-control" id="chieTime" name="hsl_chkin_end_time" style="width: 35%"  autocomplete=off>
						</div>
					</div>
					<div class="form-group">
						<label for="hsl_chkout_str_time">체크인 가능 시간의 범위를 지정해 주세요</label>
						<div class="form-inline">
							<input type="text" class="form-control" id="chosTime" name="hsl_chkout_str_time" style="width: 35%" autocomplete=off> ~ 
							<input type="text" class="form-control" id="choeTime" name="hsl_chkout_end_time" style="width: 35%" autocomplete=off>
						</div>
					</div>
					<div class="form-group">
						<label for="hsl_size">돌봄 가능한 강아지의 크기를 선택해 주세요.(중복체크 가능)</label>
						<div class="form-check">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="소형견" name="hsl_size" >소형견 (0~4.9kg)
						  </label>
						</div>
						<div class="form-check">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="중형견" name="hsl_size" >중형견 (5~14.9kg)
						  </label>
						</div>
						<div class="form-check">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="대형견" name="hsl_size" >대형견 (15kg 이상)
						  </label>
						</div>
					</div>	
					<div class="form-group">
						<label for="hsl_pet_age">돌봄 가능한 강아지의 나이를 선택해 주세요.(중복체크 가능)</label>
						<div class="form-check">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="강아지" name="hsl_pet_age" >강아지(0~1살)
						  </label>
						</div>
						<div class="form-check">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="성견" name="hsl_pet_age" >성견(2~6살)
						  </label>
						</div>
						<div class="form-check">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="노령견" name="hsl_pet_age" >노령견(7살 이상)
						  </label>
						</div>
					</div>
				 	<h6><mark>**돌봄 환경에 대해 자세히 알려주세요**</mark></h6>
				</div>
				 	<div class="form-group">
						<label for="hsl_care_place">돌봄공간</label>
						<div class="form-check">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="hsl_care_place" value="아파트">아파트
						  </label>
						</div>
						<div class="form-check">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="hsl_care_place" value="빌라">빌라
						  </label>
						</div>
						<div class="form-check">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="hsl_care_place" value="주택">주택
						  </label>
						</div>
					</div>
				 	<div class="form-group">
						<label for="hsl_yard">마당이 있나요? </label>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="hsl_yard" value="있습니다.">있습니다.
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="hsl_yard" value="없습니다.">없습니다.
						  </label>
						</div>
					</div>	
				 	<div class="form-group">
						<label for="hsl_baby">14세 미만의 아동이 함께 거주하고 있나요? </label><br>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="hsl_baby" value="있습니다.">있습니다.
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="hsl_baby" value="없습니다.">없습니다.
						  </label>
						</div>
					</div>
				 	<div class="form-group">
						<label for="hsl_family">다른 가족과 함께 거주하고 있나요? </label>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="hsl_family" value="있습니다.">있습니다.
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="hsl_family" value="없습니다.">없습니다.
						  </label>
						</div>
					</div>
					<div class="form-group imgs">
				 	<label for="imgs_wrap">돌봄공간의 사진을 올려주세요</label>
						<div class="imgs_wrap" id="imgs_wrap" >
							<img id="img" class="img" >
						</div>
						<input type="button" class="btn btn-addImg" id="addImgBtn" value="사진수정">
					<div id="example"></div>
				</div>
				<div class="btnGroup">
					<input type="submit" class="btn btn-submit" value="가입">
					<input type="button" class="btn btn-cancle" value="취소" onclick="cancleCheck()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>