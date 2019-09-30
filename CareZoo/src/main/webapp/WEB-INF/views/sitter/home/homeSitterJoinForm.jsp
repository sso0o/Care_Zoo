<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"><!--부트스트랩-->
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"><!--부트스트랩-->
<link rel="stylesheet" href="${contextPath}/resources/css/lightslider.css" /> <!--이미지 슬라이더  -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css"> <!-- 메뉴바 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> <!-- 데이트피커 -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css' /> <!-- 데이트피커 -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/jquery-ui-timepicker-addon.css' />
<%-- <link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css' /> <!-- 데이트피커 --> --%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> <!-- 폰트 -->
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 데이트피커 -->
<script type="text/javascript" src="${contextPath}/resources/js/lightslider.js"></script> <!-- 슬라이드 -->
<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script> <!-- 메뉴바 -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- 데이트피커 -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript"></script> <!-- 데이트피커 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script><!--부트스트랩-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script><!--부트스트랩-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script><!-- 부트스트랩 for tab -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->

<title>HomeSitterJoinForm</title>
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
<!-- 네비게이션 -->
<div>
	<div class="container">
        <header>
            <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
         
            <div class="header_Btn" id="sessioncheck"> 
            <sec:authorize access="isAnonymous()">
            	<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
            	<a class="btn_Join" href="${contextPath}/member/join">회원가입</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            	<label id="principal" style="display: none;" ><sec:authentication property="principal"/></label>
            	<label><%=session.getAttribute("user_name") %>님 반갑습니다!</label>
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
                    </ul>
                </li>
                <li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
                    <ul>
                        <li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='#'>REVIEW</a>
                    <ul>
                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
                        <li class='last'><a href='#'>시터</a></li>
                        <li class='last'><a href='#'>호텔</a></li>
                    </ul>
                </li>
                <li class='last'><a href='#' style="font-size: 17px">MY PAGE</a></li>
                <li class='last'><a href='${contextPath}/admin/qna' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
</div>	
<!-- 칸 띄우기 위함 -->
<br><br><br><br><br>
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
	
<br><br>
<footer>
	<div>durlsms footer</div>
</footer>
</body>
</html>