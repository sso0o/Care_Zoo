<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomeSitterJoinForm</title>
<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script>
<!--script for daum postcode -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${contextPath}/resources/js/daumPostcode.js" type="text/javascript"></script>
<!--  Jquery version -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- script for checking form fillout  -->
<script type="text/javascript" src="${contextPath}/resources/js/homeSitterJoin.js"></script>
<script type="text/javascript">
$(function() {
	//생일 선택 datepicker
	$("#hs_birth").datepicker({
		maxDate: 'today'
	});
	//form 유효성 검사
	$("#joinForm").on("submit",function(){
		//만약에 필수요소가 제대로 채워지지 않았으면 return false;
		var result = homeSitterJoinCheck("joinForm");
		if(!result){		
			return false;
		}
	});
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
    //idck 버튼을 클릭했을 때 
    $("#idCheck").click(function() {
        
        var hs_email =  $("#hs_email").val(); 
        var hs_e_address = $("#selectEmail").val();
		var email = hs_email + "@" + hs_e_address;
        $.ajax({
            async: true,
            type : 'POST',
            data : {hs_email : email},
            url : "${contextPath}/home/idCheck",
            dataType : "json",
            success : function(data) {            	
                if (data.cnt > 0) {                    
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                } else {
                    alert("사용가능한 아이디입니다.");
                }
            },
            error : function(error) {                
                alert("error : " + error);
            }
        }); //ajax end
    });
  //이메일 입력방식 선택
	$('#selectEmail').change(function() {
		$("#selectEmail option:selected").each(function() {
			if ($(this).val() == '') { //직접입력일 경우       
				$("#hs_e_address").val(''); //값 초기화
				$("#hs_e_address").attr("disabled", false); //활성화
			} else { //직접입력이 아닐경우
				$("#hs_e_address").val($(this).text()); //선택값 입력
				$("#hs_e_address").attr("disabled", true); //비활성화
			}
		});
	});
}); 
</script>
<style type="text/css">
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
</head>
<body>
	<div>
		<form action="join" method="post" name="userInfo" onsubmit="return checkValue()" id="joinForm">
			<%-- 			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"> --%>
			<fieldset>
				<legend> 회원가입 정보 입력 </legend>
				<table>
					<tr>
						<td>이메일 : </td>
						<td><input type="text" name="hs_email" id="hs_email">@
							<input type="text" name="hs_e_address" id="hs_e_address">
								<select name="hs_e_address" id="selectEmail">
									<option value="" selected="selected" id="directFillIn">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="empas.com">empas.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="freechal.com">freechal.com</option>
									<option value="lycos.co.kr">lycos.co.kr</option>
									<option value="korea.com">korea.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmir.com">hanmir.com</option>
									<option value="paran.com">paran.com</option>
								</select>
						</td>
						<td><input type="button" id="idCheck" value="중복확인"></td>
					</tr>
					<tr >
						<td>비밀번호:</td>
						<td><input type="password" id="hs_pass" name="hs_pass" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td>비밀번호 재확인: </td>
						<td><input type="password" id="hs_pass_chk" name="hs_pass_chk" placeholder="비밀번호 확인 해주세요"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="hs_name" placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td>주소:</td>
						<td><input type="hidden" id="sample4_postcode" placeholder="우편번호">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
							<input type="text" id="sample4_roadAddress" name="hs_address" placeholder="도로명주소">
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
							<input	type="text" id="hs_d_address" name="hs_d_address"	placeholder="상세주소 입력해주세요">
							<span id="guide" style="color: #999"></span>
						</td>					
					</tr>
					<tr>
						<td>성별:</td>
						<td><input type="radio" name="hs_sex" value="1">여자
						 	<input type="radio" name="hs_sex" value="2">남자</td>
					</tr>
					<tr>
						<td>생일:</td>
						<td><input type="text" name="hs_birth" id="hs_birth"></td>
					</tr>
					<tr>
						<td>휴대폰번호: </td>
						<td><input type="number" name="hs_contact" placeholder="숫자만 써주세요"></td>
					</tr>
				</table>	
				<div>
					<input type="submit" value="가입">
					<input type="button" value="취소" onclick="location.href='${contextPath}'">
				</div>			
			</fieldset>			
		</form>
	</div>
</body>
</html>