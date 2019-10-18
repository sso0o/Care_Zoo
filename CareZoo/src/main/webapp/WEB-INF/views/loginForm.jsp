<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 카카오 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- 카카오 -->
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 
 <!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
	//비밀번호 찾기 새 창띄우기
	function openWin(){  
    window.open("${contextPath}/member/searchPw", "비밀번호 찾기", 
    		"width=600, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  
	//아이디(이메일) 찾기 새 창띄우기
	function openWin2(){  
    window.open("${contextPath}/member/searchEmail", "아이디 찾기", 
    		"width=700, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}

	function checkValue(){
		
		if($("#userid").val() == ""){
			alert("이메일을 입력해주세요.");
			return false;
		}
		if($("#pw").val() == ""){
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
	}		

	
	//kakaologin
	Kakao.init('d21dc2e8ec81b89ed57723a54ff54450');
	

	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({

			success : function(authObj) {

				Kakao.API.request({

					url : '/v1/user/me',

					success : function(res) {
						console.log("성공"); 	
						//alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력

						//alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
						console.log(res);
						console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
						var id = res.id;		
						console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
						var email = res.kaccount_email;
						console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
						var name = res.properties['nickname'];
						// res.properties.nickname으로도 접근 가능 )

						console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
						
			         	 alert("카카오 로그인 성공");

			         	
						 location.href = "${contextPath}/kakao/login?userid="+encodeURI(email)+"&user=kakao&kakaoId="+encodeURI(id)+"&name="+encodeURI(name);
						 
					}

				})


			},
			fail : function(err) {
				console.log("오류");
				alert(JSON.stringify(err));
			}
		});
	};
</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
}

.login-form {
  position: absolute;
  background-color: white;
  border-radius: 5px;
  margin-left: auto;
  margin-right: auto;
  width: 600px;
 padding: 20px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align:center;
}

.text-field {
  border: none;
  width: 150%;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-bottom: 10px;
  margin-left: -15px; 
  margin-right: auto;
  text-align:center;
}
.btn-login,
.btn-join{
  border: none;
  width: 90%;
  background-color: #1BBC9B;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-bottom: 30px;
  margin-left: 40px; 
  color: white;
}
.links {
  text-align: center;
  width: 150%;
 }
 .links a {
  font-size: 12px;
  color: #9B9B9B;
  margin-left: -15%
 } 
 #kakaoBtn{
   margin-left: 18%;
   width:90%
 } 
table{
	margin-left: 23%
}
#p{
    font-size: 11px;
    position: absolute;
    left: 189px;
    top: 332px;
    margin: 8px;
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
<title>serviceCenter</title>
<!-- 고객센터 -->
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
    
	<br>
	<br>
	<br>
	<div class="container">
		<div class="login-form">
		<form action="${contextPath }/login" method="post" onsubmit="return checkValue()">
			<%-- 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
			<fieldset id="center">
				<legend><img src="${contextPath}/resources/img/loginDog.png"></legend>
				
				<table >
					<tr id ="choose">
						<td>
							<input type="radio" name="user" value="customer" checked="checked">
							고객
						</td>
						<td>
							<input type="radio" name="user" value="admin">
							관리자
						</td>

						<td>
							<input type="radio" name="user" value="visit">
							방문시터
						</td>
						<td>
							<input type="radio" name="user" value="home">
							가정시터
						</td>

					</tr>
					<tr>
<!-- 						<td>이메일 :</td> -->
						<td colspan="3">
							<input type="text" id ="userid" name="userid" class="text-field" placeholder="이메일을 입력해주세요">
						</td>
					</tr>
					<tr>
<!-- 						<td>비밀번호 :</td> -->
						<td colspan="3">
							<input type="password" id="pw" class="text-field" name="pw" placeholder="비밀번호를 입력해주세요">
						</td>
					</tr>
						<tr>
							<td colspan="3">
								<!-- 						<a id="kakao-login-btn"></a> --> <a
								href="javascript:loginWithKakao()"> <img
									src="${contextPath}/resources/img/kakaoButton.png"
									id="kakaoBtn">

							</a>
								
							</td>
						</tr>	
						<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
						<tr>
							<td colspan="3"><p id="p">(카카오 로그인시, <span style="color:red;">고객</span>만 이용이 가능합니다!)</p></td>
						</tr>

						<tr>

							<td colspan="3">
	
							<input type="submit" value="로그인"
								class="btn btn-login"> <input type="button"
								onclick="location.href='${contextPath}/member/joinForm'"
								value="회원가입" class="btn btn-join"> </td>
					</tr>	
					<tr>
						<td colspan="3">
							<div class="links"><a href="#" onclick="openWin()">비밀번호를 잊어버리셨나요?</a></div>
							<div class="links"><a href="#" onclick="openWin2()">이메일을 잊어버리셨나요?</a></div>
						</td>
					</tr>
				</table>

			</fieldset>
		</form>

		<h3>
			<c:if test='${param.login eq "false"}'>
				로그인 후 이용하세요.
			</c:if>
			<c:if test='${param.login eq "fail"}'>
				로그인에 실패하였습니다.
			</c:if>
		</h3>
		</div>
	</div>
		 <div class="bottom-left alert" id="plusfriend-chat-button">  
</body>
</html>