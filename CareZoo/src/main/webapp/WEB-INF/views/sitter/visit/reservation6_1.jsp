
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
	<!-- 메인 상단바 툴 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- css -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
	<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>

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

<!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">

//로그아웃확인 <--모든페이지에 필수
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
	  container: '#plusfriend-chat-button',
	  plusFriendId: '_QuCiT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
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

	function oneCheckbox(a) {
		var chk2 = document.getElementsByName("vsr_hour");
		for (var i = 0; i < chk2.length; i++) {
			if (chk2[i] != a) {
				chk2[i].checked = false;
			}
		}
	}
	function oneCheckbox1(a) {
		var chk3 = document.getElementsByName("vsr_hAdd");
		for (var i = 0; i < chk3.length; i++) {
			if (chk3[i] != a) {
				chk3[i].checked = false;
			}
		}
	}

	$(function() {
		$("#btn").on("click", function() {

			var check = $("#vsr_chkin").val();
			var check2 = $("#checkContainer2").children().is(":checked");
			var check3 = $("#checkContainer3").children().is(":checked");
			alert(check)
			if (!(check && check2 && check3)) {
				alert("체크해주세요");
				return false;
			}
			alert("완료")
			return true;
		});
	});
	
	//datepicker

	$(function() {
		$('#calendar').multiDatesPicker({
			minDate : 0, // today
			maxDate : 90,
			maxPicks : 30,
			altField : '#vsr_chkin'
		});

	});
	if("${msg}" != ""){
		alert("${msg}");
	}
</script>

<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
.ui-datepicker{ font-size: 30px; width: 1100px; height:500px;}
.ui-datepicker select.ui-datepicker-month{ width:50%; font-size: 100px; height:50%; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 100px; height:50%;  }
.ui-datepicker td span, .ui-datepicker td a{ font-size:35px;}
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

<meta charset="UTF-8">
<title>방문 펫시터 예약</title>
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
    <div class="container" id="visit">
		<form action="complete11" method="post" name="checkForm" id="checkForm">
			<input type="hidden" name="c_num" value="${c_num}">
			<c:forEach items="${p_num}" var="p">
				<input type="hidden" name="p_num" value="${p}">
			</c:forEach>
			<c:forEach items="${p_name}" var="n">
				<input type="hidden" name="p_name" value="${n.p_name}">
			</c:forEach>
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<th>
							<div id="calendar" ></div>
							<input type="hidden" id="vsr_chkin" name="vsr_chkin">
						
						
<!-- 						<div class="input-group date form-group" id="datepicker" > -->
						
<!--   <input type="text" class="form-control" id="vsr_chkin" name="vsr_chkin" placeholder="날자를 골라주세요!" required /> -->
<!--   <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i><span class="count"></span></span> -->
<!-- </div> -->
					</th>
				</tr>
	
				<!-- datepicker가 날자가 요일로 들어가게끔! -->
				<!-- 			<tr> -->
				<!-- 				<td>날자선택: <input type="text" id="datepicker1" name="pd_week"> -->
				<!-- 				</td> -->
				<!-- 			</tr> -->
	
				<tr>
					<th>시간대 선택(선택한 시간대에 펫시터가 방문합니다)</th>
				</tr>
				<tr>
					<td id="checkContainer2">
					<input type="checkbox" name="vsr_hour"id="one" value="9" 
					onclick="oneCheckbox(this)">9시~12시
					<input type="checkbox" name="vsr_hour" id="two" value="12"
					onclick="oneCheckbox(this)">12시~15시 
					<input type="checkbox" name="vsr_hour" id="three" value="15"
					onclick="oneCheckbox(this)">15시~18시 
					<input type="checkbox" name="vsr_hour" id="four" value="18"
					onclick="oneCheckbox(this)">18시~21시</td>
				</tr>
				<tr>
					<th>시간 추가(기본 1시간 돌봄)</th>
				</tr>
				<tr>
					<td id="checkContainer3">
					<input type="checkbox" name="vsr_hAdd" id="0" value="0" 
					onclick="oneCheckbox1(this)">없음
					<input	type="checkbox" name="vsr_hAdd" id="1" value="1"
					onclick="oneCheckbox1(this)">+1시간
					<input type="checkbox" name="vsr_hAdd" id="2" value="2"
					 onclick="oneCheckbox1(this)">+2시간
					<input type="checkbox" name="vsr_hAdd" id="3" value="3"
					onclick="oneCheckbox1(this)">+3시간 
					<input type="checkbox" name="vsr_hAdd" id="4" value="4" 
					onclick="oneCheckbox1(this)">+4시간
					</td>
				</tr>
			</table>
			<div>
				<input type="submit" id="btn" class="btn btn-chk"  value="다음">
			</div>
		</form>
	</div>
	<div class="bottom-left alert" id="plusfriend-chat-button">
</body>
</html>