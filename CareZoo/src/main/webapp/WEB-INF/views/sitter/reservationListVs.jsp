<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
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

<link rel='stylesheet' href='${contextPath}/resources/css/resListVs_modal.css' />

<link rel='stylesheet' href='${contextPath}/resources/css/sideMenu.css' />

<!-- 선택요소 -->
<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
	
	// 로그아웃확인 <--모든페이지에 필수
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
	
	$(function() { //문서가 로딩되면 실행할 함수
		
// 		console.log("${rst1 }")
// 		console.log("${rst2 }")
		
	})
	
	
	
	function modalOpen(obj) {		
		var num = $(obj).attr('title');
		$(".number").val(num);
		$.ajax({
			url:"${contextPath}/sitter/getVSRInfo",
			data:{
				vsr_num:num
			},
			dataType:"JSON",
			success: function(data) {
				console.log(data)
				$("#name").text(data.C_NAME);
				$("#contact").text(data.C_CONTACT);
				$("#address").text(data.C_ADDRESS+" "+data.C_D_ADDRESS);
				$("#chkin").text(data.VSR_CHKIN);
				$("#hour").text(data.VSR_HOUR+" ~ "+data.VSR_ENDTIME);
				$("#attention").text(data.attention);									
				$("#contents").text(data.VSR_CONTENTS);	
				$("#total").text(data.VSR_TOTALPRICE);
				
				var pd = $("#pd");
				pd.empty();
				for (var p in data.petList) {
					console.log(p)
					var ptag = "<p class='col item'>"+data.petList[p].pet.p_name+"</p>"
					pd.append(ptag);
				}
				
			},
			error: function() {
				alert("error")
			}
		})

		$("#modal-showVsr").show();
		$("#vsrInfo").removeClass('noshow')
		
		$("#next").on("click", function() {
			$("#petList").removeClass('noshow');
			$("#vsrInfo").addClass('noshow');
		})
		
		$("#previous").on("click", function() {
			$("#petList").addClass('noshow');
			$("#vsrInfo").removeClass('noshow');
		})
		
		$(".close").on("click", function() {
			$("#modal-showVsr").hide();
			$("#vsrInfo").addClass('noshow')

		});
		
	}//modalOpen()
	
	function booking() {

		var num = $(".number").val();
		alert(num)
		if(confirm("신청된 예약을 수락하시겠습니까?") ==  true){
			location.href = '${contextPath}/sitter/acceptVsr?vsr_num='+num;
			
		} else{
			return false;
		}
	}
	

	$(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!
	
		if("${msg}" != ""){
			alert("${msg}");
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
	})
	
	// 기본적으로 세션에 저장된 정보
	var user_numtype = "<%=session.getAttribute("user_numtype")%>"
	var user_num = "<%=session.getAttribute("user_num")%>"
	var user_name = "<%=session.getAttribute("user_name")%>"


</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
.content{
	width: 900px;
	margin: 20px auto;
}
	
.noshow{
	display: none;
}
	
.vsrInfo{
	background-color: #fff;
	width: 500px;
	height: 470px;
	position: absolute;
	margin-top: -235px;
	margin-left: -250px;
	top: 50%;
	left: 50%;
}

.table td, .table th{
	vertical-align: middle;
}


textarea {
	width: 100%;
	border: 1px solid rgba(0,0,0,0.3);
	border-radius: .3em;
	resize: none;
}
	
.item{
	border: 1px solid rgba(0,0,0,.2);
	border-radius: .2em;
	height: 30px;
}

.cl{
	line-height: 1.5em;
}

.tt{
	font-size: 11px;
}
	
.col, .col-1, .col-2, .col-3, .col-4, .col-5,
.col-6, .col-7, .col-8, .col-9, .col-10, .col-11, .col-12 {
	text-align: center;
	
}
.acc-btn{
	border: 1px solid #40bf9f;
	color: #40bf9f;
}
.acc-btn:hover, .acc-btn:focus{
	border: 1px solid #40bf9f;
	color: white;
	background-color: #40bf9f;
	cursor: pointer;
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
/* ------- 카카오 상담버튼 ------- */

</style>


<title>Insert title here</title>
</head>
<body class="container">
<input type="checkbox" id="menuicon">
			<label for="menuicon">
				<span></span>
				<span></span>
				<span></span>
			</label>
			<div class="sidebar">
				<div>
					<ul>
						<li><a href="${contextPath}/member/myPage">내 정보</a></li>
						<li><a href="${contextPath}/sitter/getVsrStatus0">신청 목록</a></li>
						<li><a href="${contextPath}/sitter/myReservationVs_Page">예약상황 보기</a></li>
						<li><a href="${contextPath}/member/goodByeCheckUser">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
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
					<li class='last'><a href='${contextPath}/home/main'>가정펫시터</a></li>
					<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
				</ul></li>
			<li class='active sub'><a href='${contextPath}/petHotel/petHotelList'>PETHOTEL</a>
				<ul>
					<li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
				</ul></li>
			<li class='active sub'><a href='${contextPath}/comment/hscList'>REVIEW</a>
				<ul>
					<!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
					<li class='last'><a href='#'>가정시터</a></li>
					<li class='last'><a href='#'>방문시터</a></li>
					<li class='last'><a href='#'>펫호텔</a></li>
				</ul></li>
			<li class='last'><a href='${contextPath}/member/myPage' style="font-size: 17px">MY PAGE</a></li>
			<li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">FAQ</a></li>
		</ul>
	</div>
</nav>

<br><br><br>
<div class="container">
<!-- 		여기다 내용을 작성하시면 됩니다 -->
	<div class="content">
		<h2>수락 대기중인 예약 목록</h2>
		<hr>
		<p>일반 방문시터</p>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>주소</th>
					<th>마리수</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>예약일</th>
					<th>정보</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rst1 }" var="vsr" >
					<tr>
						<td>${vsr.C_ADDRESS}&nbsp;${vsr.C_D_ADDRESS}</td>
						<td>${vsr.PETCOUNT}마리</td>
						<td>${vsr.VSR_HOUR}시</td>
						<td>${vsr.VSR_HOUR+vsr.VSR_HADD+3}시</td>
						<td>${vsr.VSR_CHKIN}</td>
						<td onclick="modalOpen(this)" title="${vsr.VSR_NUM}">보기</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<p>정기 방문시터</p>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>주소</th>
					<th>요일</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>정보</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rst2 }" var="vsr1">
					<tr>
						<td>${vsr1.C_ADDRESS}&nbsp;${vsr1.C_D_ADDRESS}</td>
						<c:choose>
							<c:when test="${vsr1.VSR_DAY == 0}">
								<td>일</td>
							</c:when>
							<c:when test="${vsr1.VSR_DAY == 1}">
								<td>월</td>
							</c:when>
							<c:when test="${vsr1.VSR_DAY == 2}">
								<td>화</td>
							</c:when>
							<c:when test="${vsr1.VSR_DAY == 3}">
								<td>수</td>
							</c:when>
							<c:when test="${vsr1.VSR_DAY == 4}">
								<td>목</td>
							</c:when>
							<c:when test="${vsr1.VSR_DAY == 5}">
								<td>금</td>
							</c:when>
							<c:when test="${vsr1.VSR_DAY == 6}">
								<td>토</td>
							</c:when>
							<c:otherwise>
								<td>?</td>
							</c:otherwise>
						</c:choose>
						<td>${vsr1.VSR_HOUR}시</td>
						<td>${vsr1.VSR_HOUR + vsr1.VSR_HADD+3}시</td>
						<td>${vsr1.STARTDAY}</td>
						<td>${vsr1.ENDDAY}</td>
						<td onclick="modalOpen(this)" title="${vsr1.A}">보기</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

	<!-- ///////////////////////////////////////////////////////////////모달 -->
<div class="container-fluid modal-modify" id="modal-showVsr">
		<div class="vsrInfo noshow" id="vsrInfo">
			<table class="table table-hover">
				<tr>
					<td>
						<input type="hidden" class="groupid" name="groupid">
					</td>
					<td>
						<input type="hidden" class="number" name="number">
					</td>
					<td colspan="2" style="text-align: right;">
						<button type="button" class="close" style="margin: 0">&times;</button>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td id="name"></td>
					<th>연락처</th>
					<td id="contact"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3" id="address"></td>
				</tr>
				<tr>
					<th>케어일</th>
					<td id="chkin"></td>
					<th>케어시간</th>
					<td id="hour"></td>
				</tr>
				<tr>
					<th>선택사항</th>
					<td id="attention" colspan="3"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="5" cols="50" id="contents"></textarea>
				</tr>
				<tr style="vertical-align: middle;">
					<th>총가격</th>
					<td id="total"></td>
					<td colspan="2" style="text-align: center;">
						<a href="#" onclick="booking()" class="btn acc-btn" id="accept">수락</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
<div class="bottom-left alert" id="plusfriend-chat-button"></div>
</body>
</html>