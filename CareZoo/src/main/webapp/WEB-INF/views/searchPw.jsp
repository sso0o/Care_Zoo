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
<script>

function checkValue() {
	if($("#email").val() ==""){
		alert("아이디(이메일)을 입력해주세요");
		return false;
	}
}	


var index = 1;
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
$(function() {
	var user =$('input[name="user"]:checked').val();
	 $("input:radio[name=user]").click(function(){
		 //라디오 체크된 벨류값만 가져오기..
		 user = $('input[name="user"]:checked').val();
		console.log(user);
	 });
	
	
	$("#email").change(function() {
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = $("#email").val();
		
		if(regExp.test(email)){
			$.ajax({
				
	            async: true,
	            type : 'POST',
	            data : {email : email,user:user},
	            url : "${contextPath}/member/emailCheck",
	            dataType : "json",
	            success : function(data) {
	                if (data.cnt > 0) {   
	                	$("#idchk_val").removeClass('red');
	                	$("#idchk_val").addClass('green');
	                	$("#idchk_val").text("가입 되어있는 이메일 입니다.")

	                } else {
	                	$("#idchk_val").removeClass('green');
	                	$("#idchk_val").addClass('red');
	                	$("#idchk_val").text("가입 되어있지 않은 이메일 입니다.")
	                    
	                }
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	            }
	        });
		} else{
			$("#idchk_val").removeClass('green');
      		$("#idchk_val").addClass('red');
      		$("#idchk_val").text("이메일 형식에 맞지 않습니다.");
		}
		
	}); //email체크함수
	
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
		commandName="userDto" action="find_pass" method="post" onsubmit="return checkValue()">
		<div class="form-group">
			<div>
				<input type="radio" name="user" class="user" id="customer" value="customer" checked="checked">고객
				 <input	type="radio" name="user" class="user" id="visit" value="visit"> 방문시터 
				 <input	type="radio" name="user" class="user" id="home" value="home"> 가정시터
			</div>
			<br>
			<div class="col-md-10">
				<input type="text" class="text-field" id="email" name="email" placeholder="이메일을 작성해주세요">
				<br>
				<span id="idchk_val"></span>
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

		<div class="form-group">
			<div class="col-md-12 control">
				<div
					style="border-top: 1px solid #888; padding-top: 5px; font-size: 85%">
					가입하신 이메일로 비밀번호를 전송해드리겠습니다.</div>
			</div>
		</div>

	</form:form>


</body>
</html>