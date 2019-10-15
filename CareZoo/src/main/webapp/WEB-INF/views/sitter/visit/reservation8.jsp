<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}

$(function() { //문서가 로딩되면 실행할 함수

})

// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!

// })

// 기본적으로 세션에 저장된 정보
var user_numtype = "<%=session.getAttribute("user_numtype")%>"
var user_num = "<%=session.getAttribute("user_num")%>"
var user_name = "<%=session.getAttribute("user_name")%>"
//새창띄우기(playPlan)
function openWin(){  
    window.open("${contextPath}/visit/playPlan", "새창", "width=800, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  

</script>
<style type="text/css">
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
</style>
<title>요청사항 폼!!</title>
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
                        <li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='${contextPath}/comment/hscList'>REVIEW</a>
                    <ul>
                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='#'>가정시터</a></li>
						<li class='last'><a href='#'>방문시터</a></li>
						<li class='last'><a href='#'>펫호텔</a></li>
                    </ul>
                </li>
                <li class='last'><a href='${contextPath}/member/myPage' style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
    
    <div class="container" id="visit">
<form action="sub" method="post">
		<input type="hidden" name="vsr_count" value="${vsr_count}">
		<input type="hidden" name="c_num" value="${c_num}">
		<c:forEach items="${p_num}" var="p">
			<input type="hidden" name="p_num" value="${p}">
		</c:forEach>
		<c:forEach items="${vsr_num}" var="vsr_num">
			<input type="hidden" value="${vsr_num}" name="vsr_num">
		</c:forEach>
		<div>
		<h2>펫시터에게 전달 할 요청사항이 있으신가요?</h2>
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<th>
						<input type="checkbox" id="play" name="vsr_attention" value="1" >산책없이 놀이 서비스로 대체해주세요.<br>
					</th>
				</tr>
				<tr>
					<th>
						<input type="checkbox" id="play" name="vsr_attention" value="2" >산책 위주로 진행해주세요.<br>
					</th>
				</tr>
				<tr>
					<th>	
						<input type="checkbox" id="play" name="vsr_attention" value="3" >생식 급여가 필요합니다.<br>
					</th>
				</tr>
				<tr>
					<th>	
						<input type="checkbox" id="play" name="vsr_attention"  value="4" >노령견 및 환자견 케어가 필요합니다.<br>
					</th> 
				</tr> 
			</table>
			<div>
			<!-- 새창띄우기 -->
				<input type="button" class="btn btn-chk" onclick="openWin()" value="놀이 프로그램 자세히보기">
			</div>
			<div>
				<textarea rows="20" cols="60" name="vsr_contents" placeholder="기타 요청 사항을 작성해주세요. 
															*정해진 시간에 투약을 해약하거나, 야외 배변 필수 등 돌봄 중 펫시터가 유의해야하는 사항을 꼭 작성해주세요."></textarea>
			</div>
		<div>
			<input type="submit" id="btn" class="btn btn-chk" value="다음">
		</div>
	</div>
</form>	
</div>	
</body>
</html>