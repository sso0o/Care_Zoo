<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<link rel="stylesheet"
	href="${contextPath}/resources/css/lightslider.css" />
<!--이미지 슬라이더  -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/index.css">
<!-- 메뉴바 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 데이트피커 -->
<link rel='stylesheet' type='text/css'
	href='${contextPath}/resources/css/datepicker.css' />
<!-- 데이트피커 -->
<link rel='stylesheet' type='text/css'
	href='${contextPath}/resources/css/homeSitter.css' />
<!-- 데이트피커 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 폰트 -->
<link rel='stylesheet' href='${contextPath}/resources/css/star.css' />
<!-- 별점 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- ㄴㅁㅇ -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 데이트피커 -->
<script type="text/javascript"
	src="${contextPath}/resources/js/lightslider.js"></script>
<!-- 슬라이드 -->
<script type="text/javascript"
	src="${contextPath}/resources/js/index.js"></script>
<!-- 메뉴바 -->
<script src="${contextPath}/resources/js/moment.js"
	type="text/javascript"></script>
<!-- 데이트피커 -->
<script src="${contextPath}/resources/js/datepicker-ko.js"
	type="text/javascript"></script>
<!-- 데이트피커 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 카카오 상담 -->


<title>homeSitterList</title>
<!-- 가정용 펫시터 리스트 -->
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.menu>ul {
	height: 45px;
}

ul {
	list-style: none outside none;
	padding-left: 0;
	margin: 0;
}

.demo .item {
	margin-bottom: 60px;
}

.content-slider li {
	background-color: #ed3020;
	text-align: center;
	color: #FFF;
}

.content-slider h3 {
	margin: 0;
	padding: 70px 0;
}

.demo {
	width: 800px;
}

.homeSitter {
	cursor: pointer;
}

.homeSitter:hover {
	outline: 1px solid aqua;
}
.nav-link {  
color: #17a2b8;
border: 1px solid white;
}
.nav-link:hover{     
border : 1px solid mediumaquamarine;
/* background-color: skyblue; slategrey;teal;mediumaquamarine; */
background-color: mediumaquamarine;
color: #fff;
} 
label {
    display: inline-block;
    margin-bottom: .5rem;
    width: 138px;
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
/* #subtbl_1,#subtbl_2,#subtbl_3{ */
/* border-bottom-left-radius:10px; */
/* border-bottom-right-radius:10px; */
/* opacity:8; */
/* } */
/* #subtbl_1:after,#subtbl_2:after,#subtbl_3:after{ */
/* border-bottom:10px solid pink; */
/* position:absolute; */
/* top:21px;left:200px; */
/* } */

li {
	color: #40bf9f;
	border-color: #40bf9f;
}

li:hover {
	color: #fff;
	border-color: #40bf9f;
}
</style>
<script type="text/javascript">

	var i = 0;
	$(function() {

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

		//네비게이션
		function logoutCheck() {
			if (confirm("정말 로그아웃?") == true) {
				location.href = '${contextPath}/logout'
			} else {
				return false;
			}
		}
		//검색탭
		var isMenu1 = false;
		$("#menu_1").on("click", function() {

			if (!isMenu1) {
				$("#subtbl_1").css("display", "block");
				$("#subtbl_1").siblings().css("display", "none");
			} else {
				$("#subtbl_1").css("display", "none");
			}
			isMenu1 = !isMenu1;
			isMenu2 = false;
			isMenu3 = false;
		});

		var isMenu2 = false;
		$("#menu_2").on("click", function() {
			if (!isMenu2) {
				$("#subtbl_2").css("display", "block");
				$("#subtbl_2").siblings().css("display", "none");
			} else {
				$("#subtbl_2").css("display", "none");
			}
			isMenu2 = !isMenu2;
			isMenu1 = false;
			isMenu3 = false;
		});

		var isMenu3 = false;
		$("#menu_3").on("click", function() {
			if (!isMenu3) {
				$("#subtbl_3").css("display", "block");
				$("#subtbl_3").siblings().css("display", "none");
			} else {
				$("#subtbl_3").css("display", "none");
			}
			isMenu3 = !isMenu3;
			isMenu1 = false;
			isMenu2 = false;
		});
		//datepicker동작
		var datepickerStart = $('#hsr_chkin').datepicker({
			dateFormat: 'yy-mm-dd', 
			minDate: 'today',
			onSelect: function (selected) {
				datepickerEnd.datepicker('option', 'minDate', selected);
				if (datepickerEnd.prop('disabled')) {
					datepickerEnd.datepicker('setDate', selected);
				} 
				showDays();
			}
		});
		var datepickerEnd = $('#hsr_chkout').datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : 'today'
		});
		
		loadingPage();
		$(".search").on("click", function() {
// 			alert("search 실행!!");
			searchSwitch = 1;
			loadingPage();
			$('.homeSitterlist').empty();
			i = 0;
		});
		$(".reset").on("click", function() {
// 			alert("reset 실행");
			searchSwitch = 0;
			loadingPage();
			$('.homeSitterlist').empty();
			i = 0;
		});
	});
	var searchSwitch = 0;
	function loadingPage() {
		var detailParam = $("#searchForm").serialize();
// 			var stateParam = $('input[name=hs_address]:checked').serialize(); //
		var homeSitterListDiv = $('.homeSitterlist');

		$.ajax({
			url : "${contextPath}/home/searchLoading",
// 					data : stateParam + '&' + detailParam + '&searchSwitch='+searchSwitch ,
			data : detailParam + '&searchSwitch=' + searchSwitch,
			dataType : "JSON",
			success : function(hsList) {
				var hsListLenghth = hsList
				if (hsListLenghth.length == 0) {
					$('<span>').text("검색결과가 없슴둥..힝구 (이미지)").appendTo(
							$('.homeSitterlist'));
				}

				ajaxSucessLoading(hsList);
				
			},
			error : function(request, status, error) {
				console.log(" error = " + request, status, error);
			}
		});
		return false;
	}
	//
	var breaker = 0;
	function ajaxSucessLoading(hsList) {
		console.log(hsList);
// 		console.log("성겅!");
		for (i; breaker < 8; i++) {
			console.log(i);
			if (breaker < 7) {
				var petHotelDiv = $('<div class="homeSitter" onclick="location.href=\'${contextPath}/home/view?hsl_num='+ hsList[i].HSL_NUM+ '\'\"style="border: 1px solid rgba(0,0,0,0.3); margin: 50px; height: 352px;border-radius:5px">');
				var petHotelDiv2 = $('<div style="width: auto; display: inline-block display:inline; float: left; "> ');
				petHotelDiv.append(petHotelDiv2);
				var itemDiv = $('<div class="item" style="heigth:350;width:350px">');
				petHotelDiv2.append(itemDiv);
				var clearfixDiv = $('<div class="clearfix" style="max-width: 350px;">');
				itemDiv.append(clearfixDiv);
				var imagegalleryDiv = $('<ul style="width:350px;">');
				clearfixDiv.append(imagegalleryDiv);
				
				$.each(hsList[i].imgList,function(i, data){
					var imgli = $("<li class='imgli' data-thumb='${contextPath}/home/image?fileName="+ data + "'/>");
					imagegalleryDiv.append(imgli);
					$("<img class='image' style='width: 350px; height: 348px;' src='${contextPath}/home/image?fileName="+ data + "'/>")
					.appendTo(imgli);										
				})
				imagegalleryDiv.lightSlider({
				 				isthumb : false,
				 				gallery : true,
				 				item : 1,
				 				thumbItem : 9,
				 				slideMargin : 0,
				 				speed : 1000,
				 				pause : 4000,
				 				auto : true,
				 				loop : true,
				 				addClass : clearfixDiv,
				 				onSliderLoad : function() {
				 					imagegalleryDiv.removeClass('cS-hidden');
				 				}
				 			});
								
				var aArDiv = $('<div style="padding:50px;padding-left: 370px;height:350pxd">');
				$('<span>').text(hsList[i].HS_NAME).appendTo(aArDiv);
				
				$('<span style="position: relative;left: 196px;">' + hsList[i].HS_ADDRESS + '</span>').appendTo(aArDiv);
				$('<br><hr>').appendTo(aArDiv);
				var reviewDiv = $('<div><span><strong>' + hsList[i].HSL_TITLE+ '</strong></span><br><br><br><br><br><hr>').appendTo(aArDiv);
				$('<span>').text('후기: ' + (hsList[i].HSC_CMT_COUNT == null ? 0 : hsList[i].HSC_CMT_COUNT ) + '개 ').appendTo(reviewDiv)
				$('<span style="position: relative;left: 196px;">').text('평점: ' + hsList[i].HS_AVGSTAR).appendTo(reviewDiv);
				reviewDiv.appendTo(aArDiv);
				aArDiv.appendTo(petHotelDiv);
				$('.homeSitterlist').append(petHotelDiv);
				breaker = breaker + 1;
			} else {
				breaker = 0;
				break;
			}
		}
	}
		
	

	//

	$(window).scroll(
			function() { //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
				if ($(window).scrollTop() >= $(document).height()
						- $(window).height()) {
					loadingPage();
				}
			});
	$(".homeSitter").click(function() {
		location.href = '/index.do'
	});

	//이미지 띄우기
	// ajax로 이미지 띄우기 왜냐면 map으로 받으니깐!!!
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
</script>
</head>
<body>
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
	<br>
	<br>
	
	<div class='container'>
		<%-- 	<form action="${contextPath }/home/search" method="get" id="searchForm"> --%>
		<form id="searchForm">
			<!-- 지역 검색 -->
			<ul class="nav nav-pills nav-fill" role="tablist" style=" position: relative; left: 21px;">
				<li id="menu_0" class="nav-item"><a class="nav-link" href="${contextPath}/home/main" >전체</a></li>
				<li id="menu_1" class="nav-item"><a class="nav-link" href="#" >서울</a></li>
				<li id="menu_2" class="nav-item"><a class="nav-link" href="#">경기</a></li>
				<li id="menu_3" class="nav-item"><a class="nav-link" href="#" >인천</a></li>
			</ul>
			<div class="tab-content">
				<div id="subtbl_0" style="display: none">
					<input type="checkbox" name="hs_address" value="서울"> 
					<input type="checkbox" name="hs_address" value="경기"> 
					<input type="checkbox" name="hs_address" value="인천">
				</div>
				<div id="subtbl_1" style="display: none; border: 1px  solid #17a2b8 ;padding: 14px; position:relative; left: 21px; width: 1110px;">
					<div id="check_container" style="font-size:18px">
						<input type="checkbox" name="hs_address" id="state1" value="강남구"><label>강남구</label>
						<input type="checkbox" name="hs_address" id="state2" value="강동구"><label>강동구</label>
						<input type="checkbox" name="hs_address" id="state3" value="강북구"><label>강북구</label>
						<input type="checkbox" name="hs_address" id="state4" value="강서구"><label>강서구</label>
						<input type="checkbox" name="hs_address" id="state5" value="관악구"><label>관악구</label>
						<input type="checkbox" name="hs_address" id="state6" value="광진구"><label>광진구</label>
						<input type="checkbox" name="hs_address" id="state7" value="구로구" ><label style="width: 60px;">구로구</label>
					<br>	                                                                           
						<input type="checkbox" name="hs_address" id="state8" value="금천구"><label>금천구</label>
						<input type="checkbox" name="hs_address" id="state9" value="노원구"><label>노원구</label>
						<input type="checkbox" name="hs_address" id="state10" value="도봉구"><label>도봉구</label> 
						<input type="checkbox" name="hs_address" id="state11" value="동대문구"><label>동대문구</label> 
						<input type="checkbox" name="hs_address" id="state12" value="동작구"><label>동작구</label> 
						<input type="checkbox" name="hs_address" id="state13" value="마포구"><label>마포구</label> 
						<input type="checkbox" name="hs_address" id="state14" value="서대문구" ><label style="    width: 61px; font-size: 16.5px">서대문구</label> 
					<br>	
						<input type="checkbox" name="hs_address" id="state15" value="서초구"><label>서초구</label>
						<input type="checkbox" name="hs_address" id="state16" value="성동구"><label>성동구</label>
						<input type="checkbox" name="hs_address" id="state17" value="성북구"><label>성북구</label>
						<input type="checkbox" name="hs_address" id="state18" value="송파구"><label>송파구</label>
						<input type="checkbox" name="hs_address" id="state19" value="양천구"><label>양천구</label>
						<input type="checkbox" name="hs_address" id="state20" value="영등포구"><label>영등포구</label> 
						<input type="checkbox" name="hs_address" id="state21" value="용산구"><label style="width: 60px;">용산구</label> 
					<br>	
						<input type="checkbox" name="hs_address" id="state22" value="은평구"><label>은평구</label> 
						<input type="checkbox" name="hs_address" id="state23" value="종로구"><label>종로구</label> 
						<input type="checkbox" name="hs_address" id="state24" value="중구"><label>중구</label> 
						<input type="checkbox" name="hs_address" id="state25" value="중랑구"><label>중랑구</label>
					</div>

					<div style="padding: 7px;">
						<input type="button" class="search btn btn-outline-info" style="height: 31px; line-height: 17px; width: 70px; border: 1px solid rgba(23, 162, 184, 0.5);" value="찾기" >
						<button type="reset" class="btn btn-outline-info" style="height: 31px; line-height: 17px; width: auto; border: 1px solid rgba(23, 162, 184, 0.5);" >초기화</button>
					</div>

				</div>
				<div id="subtbl_2" style="display: none; border: 1px  solid #17a2b8 ;padding: 14px; position:relative; left: 21px; width: 1110px;"  class="container tab-pane active">
					<div id="check_container"  style="font-size:18px">
						<input type="checkbox" name="hs_address" id="state26" value="고양시"><label>고양시</label>
						<input type="checkbox" name="hs_address" id="state27" value="과천시"><label>과천시</label>
						<input type="checkbox" name="hs_address" id="state28" value="광명시"><label>광명시</label>
						<input type="checkbox" name="hs_address" id="state29" value="광주시"><label>광주시</label>
						<input type="checkbox" name="hs_address" id="state30" value="구리시"><label>구리시</label>
						<input type="checkbox" name="hs_address" id="state31" value="군포시"><label>군포시</label>
						<input type="checkbox" name="hs_address" id="state32" value="김포시"><label style="width: 60px;">김포시</label>
					<br>	
						<input type="checkbox" name="hs_address" id="state33" value="남양주시"><label>남양주시</label>
						<input type="checkbox" name="hs_address" id="state34" value="동두천시"><label>동두천시</label>
						<input type="checkbox" name="hs_address" id="state35" value="부천시"><label>부천시 </label>
						<input type="checkbox" name="hs_address" id="state36" value="성남시"><label>성남시 </label>
						<input type="checkbox" name="hs_address" id="state37" value="수원시"><label>수원시 </label>
						 <input type="checkbox" name="hs_address"id="state38" value="시흥시"><label>시흥시 </label>
						 <input type="checkbox" name="hs_address" id="state39" value="안산시"><label style="width: 60px;">안산시</label> 
					<br>		 
						 <input type="checkbox" name="hs_address" id="state40" value="안성시"><label>안성시</label>
						 <input type="checkbox" name="hs_address" id="state41" value="안양시"><label>안양시</label>
						 <input type="checkbox" name="hs_address" id="state42" value="양주시"><label>양주시</label>
						 <input type="checkbox" name="hs_address" id="state43" value="여주시"><label>여주시</label>
						 <input type="checkbox" name="hs_address" id="state44" value="오산시"><label>오산시</label>
						 <input type="checkbox" name="hs_address" id="state45" value="용인시"><label>용인시</label>
						 <input type="checkbox" name="hs_address" id="state46" value="의왕시"><label style="width: 60px;">의왕시</label>
					<br>		 
						 <input type="checkbox" name="hs_address" id="state47" value="의정부시"><label>의정부시</label> 
						 <input type="checkbox" name="hs_address" id="state48" value="이천시"><label>이천시</label> 
						 <input type="checkbox" name="hs_address" id="state49" value="파주시"><label>파주시</label> 
						 <input type="checkbox" name="hs_address" id="state50" value="평택시"><label>평택시</label> 
						 <input type="checkbox" name="hs_address" id="state51" value="포천시"><label>포천시</label> 
						 <input type="checkbox" name="hs_address" id="state52" value="하남시"><label>하남시</label> 
						 <input type="checkbox" name="hs_address" id="state53" value="화성시"><label style="width: 60px;">화성시</label> 
					<br>		                                                                        
						 <input type="checkbox" name="hs_address" id="state54" value="가평군"><label>가평군</label> 
						 <input type="checkbox" name="hs_address" id="state55" value="양평군"><label>양평군</label> 
						 <input type="checkbox" name="hs_address" id="state56" value="연천군"><label>연천군</label>

					</div>

					<div style="padding: 7px;">
						<input type="button" class="search btn btn-outline-info" style="height: 31px; line-height: 17px; width: 70px; border: 1px solid rgba(23, 162, 184, 0.5);" value="찾기" >
						<button type="reset" class="btn btn-outline-info" style="height: 31px; line-height: 17px; width: auto; border: 1px solid rgba(23, 162, 184, 0.5);" >초기화</button>
					</div>

				</div>
				<div id="subtbl_3"   style="display: none; border: 1px  solid #17a2b8 ;padding: 14px; position:relative; left: 21px; width: 1110px;">
					<div id="check_container"  style="font-size:18px">
						<input type="checkbox" name="hs_address" id="state57" value="계양구"><label>계양구</label> 
						<input type="checkbox" name="hs_address" id="state58" value="남동구"><label>남동구</label> 
						<input type="checkbox" name="hs_address" id="state59" value="동구"><label>동구</label>
						<input type="checkbox" name="hs_address" id="state60" value="미추홀구"><label>미추홀구</label> 
						<input type="checkbox" name="hs_address" id="state61" value="부평구"><label>부평구</label> 
						<input type="checkbox" name="hs_address" id="state62" value="서구"><label>서구</label> 
						<input type="checkbox" name="hs_address" id="state63" value="연수구"><label style="width: 60px;">연수구</label> 
					<br>	
						<input type="checkbox" name="hs_address" id="state64" value="중구"><label>중구</label> 
						<input type="checkbox" name="hs_address" id="state65" value="강화군"><label>강화군</label> 
						<input type="checkbox" name="hs_address" id="state66" value="옹진군"><label>옹진군</label>

					</div>

					<div style="padding: 7px;">
						<input type="button" class="search btn btn-outline-info" style="height: 31px; line-height: 17px; width: 70px; border: 1px solid rgba(23, 162, 184, 0.5);" value="찾기" >
						<button type="reset" class="btn btn-outline-info" style="height: 31px; line-height: 17px; width: auto; border: 1px solid rgba(23, 162, 184, 0.5);" >초기화</button>
					</div>

				</div>
			</div>
			<hr>
			<!-- 홈시터 검색필터 설정부분 asd-->
			<div class="nav" style="position: relative;left: 88px;">
				<table >
					<tr>
						<th>서비스</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약일을 알려주세요!</th>
<!-- 						<th>반려견 나이</th> -->
						<th>반려견 크기</th>
					</tr>
					<tr>
						<td>
							<select name="hsl_service_type">
								<option value="" selected disabled hidden>==선택하세요==</option>
								<option title="24시간 돌봄" value="24시간돌봄">24시간 돌봄</option>
								<option title="데이케어" value="데이케어">데이케어</option>
							</select>
						</td>
						
						<td>
							<input type="text" placeholder="시작 날짜" readonly="readonly" name="hsr_chkin" id="hsr_chkin" style="border-radius: 5px; height: auto; font-size: 18px; text-align: center; width: 180px; opacity: 0.9;"/> 
							<span>&gt;</span> 
							<input type="text" placeholder="마침 날짜" readonly="readonly" name="hsr_chkout" id="hsr_chkout" style="border-radius: 5px; height: auto; font-size: 18px; text-align: center; width: 180px; opacity: 0.9;" />
						</td>
<!-- 						<td> -->
<!-- 							<select name="hsl_pet_age" data-width="130px"> -->
<!-- 								<option value="" selected disabled hidden>==선택하세요==</option> -->
<!-- 								<option title="puppy" value="강아지">강아지 (1살 이하)</option> -->
<!-- 								<option title="dog" value="성견">성견 (2~6살)</option> -->
<!-- 								<option title="agedDog" value="노령견">노령견 (7살 이상)</option> -->
<!-- 							</select> -->
<!-- 						</td> -->
						<td>
							<select name="hsl_size" data-width="130px">
								<option value="" selected disabled hidden>==선택하세요==</option>
								<option title="s" value="소형견">소형견 (0~4.9kg)</option>
								<option title="m" value="중형견">중형견 (5~14.9kg)</option>
								<option title="l" value="대형견">대형견 (15kg 이상)</option>
							</select>
						</td>
						<td  style="padding: 7px;position: relative;left: 40px;">
							<input type="button" class="search btn btn-outline-info" style="height: 31px; line-height: 17px; width: 70px; border: 1px solid rgba(23, 162, 184, 0.5);" value="찾기" >
							<button type="reset" class="btn btn-outline-info" style="height: 31px; line-height: 17px; width: auto; border: 1px solid rgba(23, 162, 184, 0.5);" >초기화</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<br>
		<hr>
		<div class="homeSitterlist">
			<%-- 		<c:forEach var="hsList" items="${hsList}"> --%>
			<%-- 					<div class = "homesitter" onclick="location.href='${contextPath}/home/view?hsl_num=${hsList.HSL_NUM}'"  style="border: 1px solid; margin: 50px; height: 350px;"> --%>
			<!-- 						<div style="width: auto; display: inline-block display:inline; float: left;"> -->
			<!-- 							<div class="item"> -->
			<!-- 								<div class="clearfix" style="max-width: 350px;"> -->
			<!-- 									<ul class="image-gallery" class="gallery list-unstyled cS-hidden"> -->
			<%-- 										<c:forEach items="${hsList.HSL_IMG_FILENAME}" var="fn"> --%>
			<%-- 											<li data-thumb="${contextPath}/home/image?fileName=${fn}"> --%>
			<!-- 												<img style="width: 350px; height: 350px;" />										 -->
			<!-- 											</li> -->
			<%-- 										</c:forEach> --%>
			<!-- 									</ul> -->
			<!-- 								</div> -->
			<!-- 							</div> -->
			<!-- 					<br> -->
			<!-- 				</div> -->
			<!-- 				<div> -->
			<%-- 					<span></span> <br> <a href="${contextPath}/home/view?hsl_num=${hsList.HSL_NUM}">${hsList.HS_NAME }</a><br> --%>
			<%-- 					<div>${hsList.HSL_ADDRESS}${hsList.HSL_D_ADDRESS}</div> --%>
			<!-- 					<div> -->
			<%-- 						<fmt:formatNumber value="${hsList.HSL_PRICE}" pattern="#,###" />+ --%>
			<!-- 					</div> -->
			<!-- 					<div> -->
			<%-- 						후기:${hsList.ph_c_count}개 <br> ${hsList.HS_STAR } --%>
			<!-- 					</div> -->
			<!-- 				</div> -->
		</div>
		<%-- 		</c:forEach> --%>
	</div>

	<br>
	<br>
	<footer>
		<div>durlsms footer</div>
	</footer>
<div class="bottom-left alert" id="plusfriend-chat-button"/>
</body>
</html>
