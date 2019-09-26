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
		<h2>펫 등록</h2>
		<hr>
		<form action="${contextPath }/member/join" method="post" name="userInfo" onsubmit="return checkValue()">
			<%-- 			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"> --%>
			<div class="main">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" id="name" placeholder="이름을 입력해 주세요" name="p_name">
				</div>
				<div class="form-group">
					<label for="birth">생년월일</label>
					<input type="date" class="form-control" id="birth" name="p_birth">
				</div>
				<div class="form-group">
					<label for="sex">성별</label><label class="space"></label>
					<select id="sex" name="p_sex" class="form-control" >
						<option value="" selected="selected">성별</option>
						<option value="암컷">암컷</option>
						<option value="수컷">수컷</option>
					</select>
				</div>
				<div class="form-group">
					<label for="none_sex">중성화</label><label class="space"></label>
					<select id="none_sex" name="p_none_sex" class="form-control" >
						<option value="" selected="selected">중성화 선택</option>
						<option value="유">유</option>
						<option value="무">무</option>
					</select>
				</div>
				<div class="form-group">
					<label for="weight">몸무게</label>
					<input type="text" class="form-control" id="weight" name="p_weight">
				</div>
				<div class="form-group">
					<label for="birth">생년월일</label>
					<input type="date" class="form-control" id="birth" name="p_birth">
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