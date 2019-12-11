<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>

<head>
<title>맡겨주~~</title>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<!-- 메인 이미지슬라이드 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/slick/slick-theme.css">
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 메뉴바 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- 폰트 -->
<script type="text/javascript" src="../assets/js/jquery-latest.js"></script>
<script src="../assets/js/admin.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">
/* body { */
/*   background-image: url('${contextPath}/resources/img/blue.png'); */
/*   background-repeat: no-repeat; */
/*   position: relative; */
/*   width: 85%; */
/*   height: 610px; */
/*   margin-left: auto; */
/*   margin-right: auto; qwewqe*/
/* } */
body{
	font-family: 'Noto Sans KR', sans-serif;
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
.container {
	width: 1100px;
	margin: 0px auto;
}
nav {
	
}

footer {
	border-top: 1px solid;
	text-align: center;
}

.slider {
	width: 900px;
	margin: 50px auto;
}

.slick-slide {
	margin: 10px;
}

.slick-slide img {
	width: 100%;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.slick-slide {
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: .5;
}

.slick-current {
	opacity: 1;
}

.sitterReview, .hotelReview{
	border: 5px solid #ddd;
	border-radius: 5px;
	padding: 5px;
	margin: 2px;
}

.sitterReview p, .hotelReview p{
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    height: 70px;

}

legend{
	border: 5px solid #ddd;
    border-radius: 5px;
    padding: 2px 8px;
    width: auto;
    color: #fff;
    background-color: #40bf9f;
    height: 50px;
    font-size: 1.3em;
}


.review .fieldview {
	border: 5px solid #ddd;
	border-radius: 5px;
	padding: 5px;
	min-height: 200px;
}

.review .fieldview legend {
	background: #40bf9f;
	color: #fff;
	padding: 5px 10px;
	font-size: 20px;
	border-radius: 5px;
	box-shadow: 0 0 0 5px #ddd;
	margin-left: 20px;
}

.review.review .fieldview p {
	text-align: right;
	padding-right: 10px;
}

main{
	margin: 50px auto;
}
.menu>ul{
height:45px;

}

.p-3{
	height: 130px;
}

</style>

<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
<script type="text/javascript">

	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}

	$(document).on('ready', function() {
		
		$(".lazy").slick({
			dots : true,
			lazyLoad : 'ondemand', // ondemand progressive anticipated
			infinite : true,
			autoplay : true, //자동플레이 유무( false시 자동플레이 안됨)
			autoplaySpeed : 4000
		// 자동플레이 스피드
		});
		
		
		if("${msg}" != ""){
			alert("${msg}");
		}
		
		
		$.ajax({
			url:"${contextPath}/member/getMainReview",
			dataType:"JSON",
			success: function (data){
				console.log(data)
				var hotD = $("#hotelReview")
				for (var i = 0; i < data.pethotelR.length; i++) {
					var divM = "<div class='media border p-3' style='margin: 3px auto;'>"
					if(data.pethotelR[i].C_FILENAME == null){						
						divM += '<img src="${contextPath}/resources/img/user.jpg" class="mr-3 mt-3 rounded-circle" style="width:60px; height: 60px">'
					} else {
						divM += '<img src="${contextPath}/member/image?fileName='+data.pethotelR[i].C_FILENAME+'" class="mr-3 mt-3 rounded-circle" style="width:60px; height: 60px">'
					}
					divM += '<div class="media-body"><table style="width: 100%"><tr>';
					divM += '<td style="text-align: left; width: 50%"><a href="${contextPath}/petHotel/petHotelView?ph_num='+data.pethotelR[i].PH_NUM+'">'+data.pethotelR[i].PH_NAME+'</a></td>';
					divM += '<td style="text-align: right;">'
					for (var j = 1; j <= parseInt(data.pethotelR[i].PHC_STAR) ; j++) {
						divM += '<img src="${contextPath}/resources/img/paw.png" style="width: 20px; height: 20px;">'
					}
					divM += '</tr><tr><td colspan="2"><p style="margin-left: 10px; ">'+data.pethotelR[i].PHC_COMMENT+'</p></td></tr></table></div></div>'
						
					hotD.append(divM);
				}
				
				var sitD = $("#sitterReview");
				for (var i = 0; i < data.sitterR.length; i++) {
					var divM = "<div class='media border p-3' style='margin: 3px auto;'>"
					if(data.sitterR[i].HS_FILENAME == null){
						divM += '<img src="${contextPath}/resources/img/user.jpg" class="mr-3 mt-3 rounded-circle" style="width:60px; height: 60px">'
					} else{						
						divM += '<img src="${contextPath}/member/image?fileName='+data.sitterR[i].HS_FILENAME+'" class="mr-3 mt-3 rounded-circle" style="width:60px; height: 60px">'
					}
					divM += '<div class="media-body"><table style="width: 100%"><tr>';
					divM += '<td style="text-align: left; width: 50%"><a href="${contextPath}/home/view?hsl_num='+data.sitterR[i].HSL_NUM+'">'+data.sitterR[i].HS_NAME+'시터</a></td>';
					divM += '<td style="text-align: right;">'
					for (var j = 1; j <= parseInt(data.sitterR[i].HSC_STAR) ; j++) {
						divM += '<img src="${contextPath}/resources/img/paw.png" style="width: 20px; height: 20px;">'
					}
					divM += '</tr><tr><td colspan="2"><p style="margin-left: 10px; ">'+data.sitterR[i].HSC_COMMENT+'</p></td></tr></table></div></div>'
					
					sitD.append(divM);
				}					
			},
			error : function(){
				alert("error")
			}
		})
		
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
						
	});
	
	

</script>

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

	<div class='container'>
		<section class="content">
			<main>
	<br>
	<br>
			<div class="lazy slider">
				<div>
					<img src="${contextPath}/resources/img/event_image.jpg" data-sizes="100vw" data-srcset="">
				</div>
				<div>
					<img src="${contextPath}/resources/img/event_image2.jpg" data-sizes="100vw" data-srcset="">
				</div>
				<div>
					<img src="${contextPath}/resources/img/event_image3.jpg" data-sizes="100vw" data-srcset="">
				</div>
				<div>
					<img src="${contextPath}/resources/img/event_image4.jpg" data-sizes="100vw" data-srcset="">
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="row" style="margin-bottom: 100px">
				<fieldset class="col sitterReview">
					<legend>시터후기</legend>
					<div id="sitterReview">
						
					</div>

				</fieldset>
				<fieldset class="col hotelReview">
					<legend>호텔후기</legend>
					<div id="hotelReview">
						
					</div>
				</fieldset>
			</div>
			</main>

		</section>
		
		
	</div>
	<div class="bottom-left alert" id="plusfriend-chat-button">
	</div>
	<br>
	<br>
	<br>
	<br>
	
	
</body>

</html>
