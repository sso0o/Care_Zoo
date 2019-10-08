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
</script>
<style type="text/css">

* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
}

.login-form {
  position: absolute;
  background-color: white;
  border-radius: 5px;
  margin-left: auto;
  margin-right: auto;
  width: 400px;
 padding: 20px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align:center;
}

.text-field {
  border: none;
  width: 150%;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-bottom: 10px;
  margin-left: auto;
  margin-right: auto;
  text-align:center;
}
.btn-login,
.btn-join{
  border: none;
  width: 150%;
  background-color: #1BBC9B;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-bottom: 30px;
  color: white;
}
.links {
  text-align: center;
  width: 150%;
 }
 .links a {
  font-size: 12px;
  color: #9B9B9B;
 } 
</style>
<title>serviceCenter</title>
<!-- 고객센터 -->
</head>
<body>
	<div class="container">
		<header>
			<a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo" onclick="location.href='${contextPath}'"></a>

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
	<br>
	<br>
	<br>
	<div class="container">
		<div class="login-form">
		<form action="${contextPath }/login" method="post">
			<%-- 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
			<fieldset>
				<legend><img src="${contextPath}/resources/img/loginDog.png"></legend>
				<table >
					<tr>
						<td>
							<input type="radio" name="user" value="customer" checked="checked">
							고객
						</td>
						<td>
							<input type="radio" name="user" value="admin">
							관리자
						</td>

						<td>
							<input type="radio" name="user" value="visit">
							방문시터
						</td>
						<td>
							<input type="radio" name="user" value="home">
							가정시터
						</td>

					</tr>
					<tr>
<!-- 						<td>이메일 :</td> -->
						<td colspan="3">
							<input type="text" name="userid" class="text-field" placeholder="이메일을 입력해주세요">
						</td>
					</tr>
					<tr>
<!-- 						<td>비밀번호 :</td> -->
						<td colspan="3">
							<input type="password" class="text-field" name="pw" placeholder="비밀번호를 입력해주세요">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit" value="로그인" class="btn btn-login">
							<input type="button" onclick="location.href='${contextPath}/member/joinForm'" value="회원가입" class="btn btn-join">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="links"><a href="#" >비밀번호를 잊어버리셨나요?</a></div>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>

		<h3>
			<c:if test='${param.login eq "false"}'>
				로그인 후 이용하세요.
			</c:if>
			<c:if test='${param.login eq "fail"}'>
				로그인에 실패하였습니다.
			</c:if>
		</h3>
		</div>
	</div>
</body>
</html>