<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">


<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>

<script type="text/javascript">
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
	
// 	$(function(){
// 		var phr_num = ${phr.phr_num}
// 		var ph_num = ${phr.ph_num}
// 		var c_num = ${phr.c_num}
// 		$.ajax({
// 			url: "${contextPath}/petHotel/petHotel",
// 			data : {ph_num : ph_num},
// 			dataType: "JSON",
// 			success: function(data) {
// 				alert("dkssud")
// 				console.log(data)
// 			},
// 			error: function() {
				
// 			}
// 		})
// 	});

		var phr_num = ${phr.phr_num}
		var ph_num = ${phr.ph_num}
		var c_num = ${phr.c_num}
	
	$.ajax({
		url: "${contextPath}/petHotel/petHotel",
		data : {ph_num : ph_num},
		dataType: "JSON",
		success: function(data) {
			console.log(data)
			$("#name").val(data.ph.ph_name)
		},
		error: function() {
			alert("실패")
		}
	})
</script>


<style type="text/css">
.tab{
	width: 800px;
	margin: 0 auto;	
	border: 1px solid #efefef; 
	padding: 10px;
	margin-top: 35px;
}

.tab tr{
	line-height: 3em;
	
}

.tab th{
	background-color: #efefef;
	width: 30%;
}

.tab td input {
	width: 94.5%;
	line-height: 2.5em;
	font-size: 15px;
	font-weight: bolder;
	padding-left: 15px;
	margin-left: 10px;
}

.content{
	width: 96.5%;
	margin-left: 10px;
	vertical-align: middle;
	font-size: 15px;
	resize: none;
}

.name{
	border: none;
}
</style>
<title>hscWriteForm</title>
<!-- 고객센터 -->
</head>
<body>
	<div class="container">
		<header>
			<a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

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
	<div class="container">
		<fieldset>
			<legend style="text-align: center;">펫호텔 후기 작성</legend>
			<table class="tab">
				<tr>
					<th>제목*</th>
					<td><input type="text" id="title" class="title"></td>
				</tr>
				<tr>
					<th>호텔이름</th>
					<td><input type="text" id="name"></td>
				</tr>
				<tr>
					<th>별점*</th>
					<td></td>
				</tr>
				<tr>
					<th>내용*</th>
					<td><textarea rows="10" cols="50" id="content" class="content"></textarea></td>
				</tr>
				<tr>
					<th>dhdhdhhd</th>
					<td></td>
				</tr>
			</table>

		</fieldset>
	</div>
</body>
</html>