<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
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
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
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
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#idck").click(function() {
        
        var c_email =  $("#str_email01").val(); 
        var c_e_address = $("#selectEmail").val();
		var email = c_email + "@" + c_e_address;

        $.ajax({
            async: true,
            type : 'POST',
            data : {c_email : email},
            url : "${contextPath}/member/idCheck",
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
        });
    });
});
 
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="join" method="post" name="userInfo" onsubmit="return checkValue()">
			<%-- 			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"> --%>
			<fieldset>
				<legend> 회원가입 정보 입력 </legend>
				이메일 : 
				<input type="text" name="c_email" id="str_email01" style="width:100px"> @
				<input type="text" name="c_e_address" id="str_email02" style="width:100px" disabled value="naver.com">
				<select style="width: 100px; margin-right: 10px" name="c_e_address"
					id="selectEmail">
					<option value="1">직접입력</option>
					<option value="naver.com" selected>naver.com</option>
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
				<script type="text/javascript"
					src="http://code.jquery.com/jquery-latest.min.js"></script>
				<script type="text/javascript">
					//이메일 입력방식 선택
					$('#selectEmail').change(function() {
						$("#selectEmail option:selected").each(function() {
							if ($(this).val() == '1') { //직접입력일 경우
								$("#str_email02").val('');	//값 초기화
								$("#str_email02").attr("disabled", false); //활성화
							} else { //직접입력이 아닐경우
								$("#str_email02").val($(this).text()); //선택값 입력
								$("#str_email02").attr("disabled", true); //비활성화
							}
						});
					});
				</script>
				<input type="button" id="idck" value="중복확인">
				<br>
				 <label>비밀번호: 
				 	<input type="password" id="c_pass" name="c_pass" placeholder="비밀번호를 입력하세요"><br>
				</label> 
				<label>비밀번호 재확인: 
					<input type="password" id="c_pass_chk" name="c_pass_chk" placeholder="비밀번호 확인 해주세요"><br>
				</label>
				
				<label>이름: 
					<input type="text" name="c_name" placeholder="이름을 입력하세요"><br>
				</label> 
				<label>주소:
					 <input type="hidden" id="sample4_postcode" placeholder="우편번호"><br>
					 <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					 <input type="text" id="sample4_roadAddress" name="c_address" placeholder="도로명주소"><br>
					 <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"><br> 
					 <input	type="text" id="c_d_address" name="c_d_address"	placeholder="상세주소 입력해주세요"><br>
					<span id="guide" style="color: #999"></span>
				</label>
				<label>성별: 
					<input type="radio" name="c_sex" value="1">여자
					<input type="radio" name="c_sex" value="2">남자<br>
				</label>
				<label>생일:
					<input type="date" name="c_birth"><br>
				</label>
			    <label>휴대폰번호: 
			  	   <input type="text" name="c_contact" placeholder="숫자만 써주세요">
				</label> 
			</fieldset>
			<div>
				<input type="submit" value="가입">
				<input type="button" value="취소" onclick="location.href='${contextPath}'">

			</div>
		</form>
	</div>
</body>
</html>