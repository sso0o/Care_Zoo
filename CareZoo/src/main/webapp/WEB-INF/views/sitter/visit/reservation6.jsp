
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
           <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
    <c:set var="contextPath" value="<%=request.getContextPath() %>" ></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
    
    <!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
//로그아웃확인 <--모든페이지에 필수
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
	  container: '#plusfriend-chat-button',
	  plusFriendId: '_QuCiT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
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

function oneCheckbox(a){
	var chk2 = document.getElementsByName("vsr_hour");
	for(var i =0;i<chk2.length;i++){
		if(chk2[i] != a){
			chk2[i].checked = false;
		}
	}
}
function oneCheckbox1(a){
	var chk3 = document.getElementsByName("vsr_hAdd");
	for(var i =0;i<chk3.length;i++){
		if(chk3[i] != a){
			chk3[i].checked = false;
		}
	}
}
function oneCheckbox2(a){
	var chk = document.getElementsByName("vsr_day");
	for(var i =0;i<chk.length;i++){
		if(chk[i] != a){
			chk[i].checked = false;
		}
	}
}

	$(function(){
		$("#btn").on("click",function(){
			var check = $("#checkContainer").children().is(":checked");
			var check2 = $("#checkContainer2").children().is(":checked");
			var check3 = $("#checkContainer3").children().is(":checked");
			console.log(check);

			if(!(check&&check2&&check3)){
				alert("체크해주세요");
				return false;
			}
			alert("완료")
			return true;
		});
	});
	
	if("${msg}" != ""){
		alert("${msg}");
	}
</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
#visit{
	text-align:center;
}
.btn-chk{
	background-color: #40bf9f;
	color: white;
	border-color: #40bf9f;
	margin: 15px;
	width: 200px;
	font-weight: bold;
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
<meta charset="UTF-8">
<title>방문 펫시터 예약</title>
</head>
<body class="container">
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
                <li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
				    <ul>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>펫호텔</a></li>

                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->

                    </ul>
                </li>

                <li class='last'><a href='${contextPath}/member/myPage' style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
    <div class="container" id="visit">
		<form action="complete1" method="post" name="checkForm" id="checkForm">
			<input type="hidden" name="c_num" value ="${c_num}">
			<c:forEach items="${p_num}" var="p">
				<input type="hidden" name="p_num" value="${p}">
			</c:forEach>
			<c:forEach items="${p_name}" var="n">
				<input type="hidden" name="p_name" value="${n.p_name}">
			</c:forEach>
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>요일선택(중복선택 불가능)</th>
			</tr>
			<tr>
				<td id="checkContainer">
					<input type="checkbox" name="vsr_day" id="mon" value="1" onclick="oneCheckbox2(this)">월
					<input type="checkbox" name="vsr_day" id="tus" value="2" onclick="oneCheckbox2(this)">화
					<input type="checkbox" name="vsr_day" id="wen" value="3" onclick="oneCheckbox2(this)">수
					<input type="checkbox" name="vsr_day" id="thu" value="4" onclick="oneCheckbox2(this)">목
					<input type="checkbox" name="vsr_day" id="fri" value="5" onclick="oneCheckbox2(this)">금
					<input type="checkbox" name="vsr_day" id="sat" value="6" onclick="oneCheckbox2(this)">토
					<input type="checkbox" name="vsr_day" id="sun" value="0" onclick="oneCheckbox2(this)">일
				</td>
			</tr>
			<tr>
				<th>시간대 선택(선택한 시간대에 펫시터가 방문합니다)</th>
			</tr>
			<tr>
				<td id="checkContainer2">
					<input type="checkbox" name="vsr_hour" id="one" value="09" onclick="oneCheckbox(this)">9시~12시
					<input type="checkbox" name="vsr_hour" id="two" value="12" onclick="oneCheckbox(this)">12시~15시
					<input type="checkbox" name="vsr_hour" id="three" value="15" onclick="oneCheckbox(this)">15시~18시
					<input type="checkbox" name="vsr_hour" id="four" value="18" onclick="oneCheckbox(this)">18시~21시
				</td>
			</tr>
			<tr>
				<th>시간 추가(기본 1시간 돌봄)</th>
			</tr>
			<tr>
				<td id="checkContainer3">
					<input type="checkbox" name="vsr_hAdd" id="0" value="0" onclick="oneCheckbox1(this)">없음
					<input type="checkbox" name="vsr_hAdd" id="1" value="1" onclick="oneCheckbox1(this)">+1시간
					<input type="checkbox" name="vsr_hAdd" id="2" value="2" onclick="oneCheckbox1(this)">+2시간
					<input type="checkbox" name="vsr_hAdd" id="3" value="3" onclick="oneCheckbox1(this)">+3시간
					<input type="checkbox" name="vsr_hAdd" id="4" value="4" onclick="oneCheckbox1(this)">+4시간
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" id="btn" class="btn btn-chk" value="다음" >
		</div>
		
		</form>
</div>
<div class="bottom-left alert" id="plusfriend-chat-button">
</body>
</html>