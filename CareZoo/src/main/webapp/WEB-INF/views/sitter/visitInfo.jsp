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

<link rel='stylesheet' href='${contextPath}/resources/css/sideMenu.css' />
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<script>
	var user_numtype = "<%=session.getAttribute("user_numtype")%>"
	var user_num = "<%=session.getAttribute("user_num")%>"
	var user_name = "<%=session.getAttribute("user_name")%>"
	var d = new Date();
	
// 	alert("방문시터");
	
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
	
	$(function() {
		$.ajax({
			url:"${contextPath}/sitter/getVisitInfo",
			data:{
				vs_num : user_num
			},
			dataType: "JSON",
			success: function(data) {
				console.log(data);
				$("#card-birth").text(data.vsInfo.vs_birth);
				$("#card-address").text(data.vsInfo.vs_address+" "+data.vsInfo.vs_d_address);
				$("#card-contact").text(data.vsInfo.vs_contact.substr(0, 3)+"-"+data.vsInfo.vs_contact.substr(3, 4)+"-"+data.vsInfo.vs_contact.substr(7, 4));
				
			}, error: function() {
				alert("error")
			}
		})
		
		$.ajax({
			url:"${contextPath}/sitter/getVsImg",
			data:{
				vs_num : user_num
			},
			dataType: "JSON",
			success: function(data) {
				console.log(data)
				if(data.filename != null){
					$("#img").attr("src","${contextPath}/sitter/image?fileName="+data.filename)
				} else {
					$("#img").attr("src","${contextPath}/resources/img/user.jpg")
				}
				
			}, error: function() {
				alert("error")
			}
		})
		
		if("${msg}" != ""){
			alert("${msg}");
		}
		
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
	

</script>
<style>
body{
   font-family: 'Noto Sans KR', sans-serif;
}
.content{
	width: 900px;
	margin: 0 auto;
}

.card{
	margin: 30px auto;
}

.card-body{
	text-align: center;
}

.btn-my{
	color: #40bf9f;
	background-color: #fff;
	border-color: #40bf9f;
}

.btn-my:hover{
	color: #fff;
	background-color: #40bf9f;
	border-color: #40bf9f;
}

.rounded-circle{
	border: 1.3px solid rgba(0,0,0,.5);
	margin: 20px auto;
	width: 90%;
	height: 310px;
} 

.card-label{
	width: 90px;
	display: inline-block;
	text-align: center;
	vertical-align: top;
}

.text-center{
	width: 190px;
	display: inline-block;
}

#card-address{
	font-size: 12px;
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
<title>mypage</title>
<!-- 마이페이지 시작 -->
</head>
<body class="container">
<input type="checkbox" id="menuicon">
			<label for="menuicon">
				<span></span>
				<span></span>
				<span></span>
			</label>
			<div class="sidebar">
				<div>
					<ul>
						<li><a href="${contextPath}/member/myPage">내 정보</a></li>
						<li><a href="${contextPath}/sitter/getVsrStatus0">신청 목록</a></li>
						<li><a href="${contextPath}/sitter/myReservationVs_Page">예약상황 보기</a></li>
						<li><a href="${contextPath}/sitter/myCommentVsr">내 후기들 보기</a></li>
						<li><a href="${contextPath}/member/goodByeCheckUser">회원탈퇴</a></li>
					</ul>
				</div>
			</div>

	 <div class="container">  
        <header>  
            <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo" style="position: relative; left: 35px"></a>
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
                        <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a></li>
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
    <div class='container'></div>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="content">
			<h2>내 정보</h2>
			<hr>
			<div class="card" style="width: 350px">
				<img class="card-img-top rounded-circle" id="img" alt="Card image">
				<div class="card-body">
					<h4 class="card-title "><%=session.getAttribute("user_name")%>님</h4>
					<label class="card-label">생년월일</label><p class="card-text text-center" id="card-birth">2</p><br>
					<label class="card-label">연락처</label><p class="card-text text-center" id="card-contact">2</p><br>
					<label class="card-label">주소</label><p class="card-text text-center" id="card-address">2</p><br>
					<a href="${contextPath }/sitter/modifySitterInfo" class="btn btn-my" style="text-align: center;">정보 수정</a>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom-left alert" id="plusfriend-chat-button">
</body>
</html>