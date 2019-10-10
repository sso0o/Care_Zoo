<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript">
function checkValue() {
	if($("#name").val() ==""){
		alert("이름을 입력해주세요");
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


var index = 1;
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
$(function() {
	var user ="";
	 $("input:radio[name=user]").click(function(){
		 //라디오 체크된 벨류값만 가져오기..
		 user = $('input[name="user"]:checked').val();
		console.log(user);
	 });
	 
	 if("${msg}" != ""){
			alert("${msg}");
		}
});

</script>
<style type="text/css">
.red{
	color: red;
	font-size: 10px;
}
.green{
	color: green;
	font-size: 10px;
}
#signupform{
	text-align:center;
}

.btn-chk{
  border: none;
  width: 10%;
  background-color: #1BBC9B;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-bottom: 30px;
  color: white;
}
.text-field {
  border: none;
  width: 50%;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-bottom: 10px;
  margin-left: auto;
  margin-right: auto;
  text-align:center;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
	<form:form id="signupform" class="form-horizontal" role="form"
		commandName="userDto" action="find_email" method="post" onsubmit="return checkValue()">
		<div class="form-group">
			<div>
				<input type="radio" name="user" class="user" id="customer" value="customer" checked="checked">고객
				 <input	type="radio" name="user" class="user" id="visit" value="visit"> 방문시터 
				 <input	type="radio" name="user" class="user" id="home" value="home"> 가정시터
			</div>
			<br>
			<div class="col-md-10">
				이름:<input type="text" class="text-field" id="name" name="name"
					placeholder="이름을 입력해 주세요"> <br> 
					휴대폰: <select name="phone">
					<option value="010" selected="selected">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
				</select> - <input type="text" name="phone1" id="phone1" style="width: 70px"> - <input
					type="text" name="phone2" id="phone2" style="width: 70px">
			</div>

			<div class="col-md-offset-2 col-md-10">
				<div style="color: red; margin-top: 2px">
					<form:errors path="bEmail" />
					<form:errors />
				</div>
			</div>

		</div>

		<div class="form-group" style="margin-left: 1%">
			<!-- Button -->

			<div class="col-md-offset-10 col-md-9">
				<button id="btn-signup" type="submit" class="btn btn-chk">확인</button>
			</div>
		</div>


	</form:form>


</body>
</html>