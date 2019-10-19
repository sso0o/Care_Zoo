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
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/><!-- datePicker -->
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/><!-- dateTimePicker -->
<!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css" type='text/css'>안이쁨 dateTimePicker  -->
<!-- link for navBar -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"><!--부트스트랩-->
<!-- *필수요소*제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- datePicker -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script><!-- datePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>   <!-- dateTimePicker -->
<!--  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>안이쁨 dateTimePicker  -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script><!--부트스트랩-->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>부트스트랩 -->
<!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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

	// 로그아웃확인 <--모든페이지에 필수
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
	
	$(function() { //문서가 로딩되면 실행할 함수
		//----카카오 1:1상담
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('d5215a661c44ab13805d6f04adeddadb');
		// 플러스친구 1:1채팅 버튼을 생성합니다.
		Kakao.PlusFriend.createChatButton({
			container : '#plusfriend-chat-button',
			plusFriendId : '_QuCiT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
		});
		//]]>
		//----카카오 1:1상담	
	})
	
	// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!
	
	// })
	
	// 기본적으로 세션에 저장된 정보
	var user_numtype = "<%=session.getAttribute("user_numtype")%>"
	var user_num = "<%=session.getAttribute("user_num")%>"
	var user_name = "<%=session.getAttribute("user_name")%>"

</script>
<style type="text/css">
.menu>ul {
	height: 45px;
}


input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
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
/* -------카카오 상담버튼------- */
</style>
</head>
<body>
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
					<label style="width: 150px;"><%=session.getAttribute("user_name")%>님 반갑습니다!</label>
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
                        <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a>
                            <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      -->
                        </li>
                        <li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='${contextPath}/petHotel/petHotelList'>HOTEL</a>
                    <ul>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>펫호텔</a></li>

                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->

                    </ul>
                </li>
                <li class='last'><a href='${contextPath}/member/myPage'  style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='${contextPath}/member/qna'  style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
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