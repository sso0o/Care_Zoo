<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
    <c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
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

	function checkAll() {
		var chk1 = document.checkForm.needs1.checked;
		var chk2 = document.checkForm.needs2.checked;
		var chk3 = document.checkForm.needs3.checked;
		var chk4 = document.checkForm.needs4.checked;
		
		if(!chk1){
			alert("확인란을 체크해 주세요");
			return false;
		}
		if(!chk2){
			alert("확인란을 체크해 주세요");
			return false;
		}
		if(!chk3){
			alert("확인란을 체크해 주세요");
			return false;
		}
		if(!chk4){
			alert("확인란을 체크해 주세요");
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
.btn-chk{
	background-color: #40bf9f;
	color: white;
	border-color: #40bf9f;
	margin: 15px;
	width: 200px;
	font-weight: bold;
}
#visit{
	text-align:center;
}
table{
 position:relative;
 width: 1000px;
 
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
<title>notify</title>
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
	<h1>예약 전 안내사항</h1>
	<br><br>
	<form action="complete10" method="post" id="checkForm" name="checkForm">
	<input type="hidden" name="c_num" value ="${c_num}">
	<c:forEach items="${p_num}" var="p">
		<input type="hidden" name="p_num" value="${p}">
	</c:forEach>
	<c:forEach items="${p_name}" var="n">
		<input type="hidden" name="p_name" value="${n.p_name}">
	</c:forEach>
	<table border='1' class="table table-striped table-bordered table-hover">
		<tr>
			<th><input type="checkbox" name="needs" id="needs1">
				원하는 시간대 안에서 예약이 진행됩니다
			</th>
		</tr>
		<tr>	
			<td>
				맡겨주는 원활한 돌봄을 위해 시간대로 운영되고 있습니다.<br>
				오전(9~12) 오후(12~15/15~18)타임 중 요청한 시간대 내에서 스케쥴 에따라 시간대가 결정됩니다.
			</td>
		</tr>
		<tr>
			<th><input type="checkbox" name="needs" id="needs2">
			돌봄은 1시간 단위로 제공됩니다
			</th>
		</tr>
		<tr>	
			<td>
				펫시터는 요청한 시간대에 방문해 기본 1시간 돌봄을(산책,배식,배변처리)진행합니다.<br>
				또한 1시간 내 최대 2마리까지 산책이 가능하여 3마리 이상 산책을 원할 경우 2시간 돌봄으로 예약 신청 바랍니다.
			</td>
			<tr>
			<th><input type="checkbox" name="needs" id="needs3">
				2명의 펫시터가 교차 배정될 수 있습니다
			</th>
		</tr>
		<tr>	
			<td>
				원하는 날짜, 시간대 방문을 위해 최소 2명의 펫시터가 배정될 수 있으며 펫시터 지정은 불가합니다.
			</td>
			<tr>
			<th><input type="checkbox" name="needs" id="needs4">
				하네스가 없으면 산책이 불가합니다
			</th>
		</tr>
		<tr>	
			<td>
				맡겨주는 산책 시 발생될 수 있는 놓침 사고를 예방하기 위해 이중산책줄을 사용합니다.<br>
				맡겨주에서 준비한 목줄과 하네스를 결합하여 사고를 방치하고 있습니다.<br>
				하네스가 없을 경우 산책은 불가하여 실내놀이로 대체됩니다.
			</td>
	</table>
	<br><br>
	<div>
		<input type="submit" value="확인했습니다!" class="btn btn-chk" onclick="return checkAll()">
	</div>
	</form>
	</div>
	<div class="bottom-left alert" id="plusfriend-chat-button">
</body>
</html>