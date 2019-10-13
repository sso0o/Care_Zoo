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
		
		$("#petList").addClass('noshow');
		$("#vsrInfo").removeClass('noshow');
	
		var num = $(obj).attr('title');
	
		$("#vsr_num").val(num);
		
		$.ajax({
			url:"${contextPath}/sitter/getVSRInfo",
			data:{
				vsr_num:num
			},
			dataType:"JSON",
			success: function(data) {
				console.log(data)
				$("#address").val(data.address);
				$("#chkin").val(data.chkin);
				$("#hour").val(data.hour);
				if(data.attention != ""){
					$("#attention").val(data.attention);									
				} else{
					$("#attention").val("없음");	
				}
				
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
			$("#address").val("");
			$("#chkin").val("");
			$("#hour").val("");
			$("#attention").val("");

		});
		
	}//modalOpen()
	
	function booking() {
		var num = $("#vsr_num").val()
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
	})
	
	// 기본적으로 세션에 저장된 정보
	var user_numtype = "<%=session.getAttribute("user_numtype")%>"
	var user_num = "<%=session.getAttribute("user_num")%>"
	var user_name = "<%=session.getAttribute("user_name")%>"


</script>
<style type="text/css">
	.content{
		width: 900px;
		margin: 20px auto;
	}
	
	.noshow{
		display: none;
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

</style>


<title>Insert title here</title>
</head>
<body>
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
					</ul>
				</div>
			</div>
<div class="container">
		<header>
			<a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

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
	<div class="row mmmmm" id="vsrInfo">
		<p class="col-12 cl" style="text-align: right;">
			<input type="hidden" name="vsr_num" id="vsr_num">
			<button type="button" class="close">&times;</button>
		</p>

		<label class="col-2" style="text-align: center;">날짜 :</label>
		<input type="text" class="col-4 item" style="text-align: center;" id="chkin">
		<label class="col-2" style="text-align: center;">시간 :</label>
		<input type="text" class="col-4 item" style="text-align: center;" id="hour">
		
		<label class="col-3" style="text-align: center;" >주소 :</label>
		<input type="text" class="col-9 item" style="text-align: center;" id="address">
		
		<label class="col-3" style="text-align: center;" >특이사항 :</label>
		<input type="text" class="col-9 item" style="text-align: center;" id="attention">
		
		<div class="col" style="text-align: left;"><button class="btn">&#9665;</button></div>
		<div class="col" style="text-align: center;"><a href="#" onclick="booking()" class="btn acc-btn" id="accept">수락</a></div>
		<div class="col" style="text-align: right;"><button id="next" class="btn">&#9654;</button></div>

	</div>
	<div class="row nnnnn noshow" id="petList">
		<p class="col-12 cl"  style="text-align: right;"><button type="button" class="close">&times;</button></p>
		
		<div class="col-12 row" id="pd">
			
		</div>
		
		<p class="col" style="text-align: left;"><button class="btn" id="previous">&#9664;</button></p>
		<p class="col" style="text-align: right;"><button class="btn">&#9655;</button></p>
	</div>
</div>
</body>
</html>