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
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/lightslider.css" /> <!--이미지 슬라이더  -->
<!-- *필수요소*제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- datePicker -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script><!-- datePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>   <!-- dateTimePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/lightslider.js"></script> <!-- 슬라이드 -->
<!--  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>안이쁨 dateTimePicker  -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>부트스트랩 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>부트스트랩 -->

<title>homeSitterList</title>
<!-- 가정용 펫시터 리스트 -->
<style type="text/css">
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
.homesitterList {
cursor: pointer;

}
.homesitterList{
	 outline: 1px solid aqua;
}
</style>
<script type="text/javascript"> 
var i = 0;
$(function () {
	
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
	$("#menu_1").on("click", function(){	
		
		if(!isMenu1){
			$("#subtbl_1").css("display","block");
			$("#subtbl_1").siblings().css("display","none");
		}else{
			$("#subtbl_1").css("display","none");
		}
		isMenu1 = !isMenu1;
		isMenu2 = false;
		isMenu3 = false;
	});
	
	var isMenu2 =false;
	$("#menu_2").on("click", function(){
		if(!isMenu2){
			$("#subtbl_2").css("display","block");
			$("#subtbl_2").siblings().css("display","none");
		}else{
			$("#subtbl_2").css("display","none");
		}
		isMenu2 = !isMenu2;
		isMenu1 = false;
		isMenu3 = false;
	});
	
	var isMenu3 = false;
	$("#menu_3").on("click",function(){
		if(!isMenu3){
			$("#subtbl_3").css("display","block");
			$("#subtbl_3").siblings().css("display","none");
		}else{
			$("#subtbl_3").css("display","none");
		}
		isMenu3 = !isMenu3;
		isMenu1 = false;
		isMenu2 = false;
	});
	//datepicker동작
	var datepickerStart = jQuery('#hsl_chkin').datepicker({
		dateFormat: 'yy-mm-dd', 
		minDate: moment('yy-mm-dd').toDate(),
		onSelect: function (selected) {
			datepickerEnd.datepicker('option', 'minDate', selected);

			if (datepickerEnd.prop('disabled')) {
				datepickerEnd.datepicker('setDate', selected);
			} else if (!datepickerEnd.val()) {
				setTimeout($.proxy(datepickerEnd.datepicker, datepickerEnd, 'show'), 50);
			}
		}
	});
	var datepickerEnd = jQuery('#hsl_chkout').datepicker({
		dateFormat: 'yy-mm-dd', 
		minDate: moment('yy-mm-dd').toDate()
	});
	loadingPage();
	$(".search").on("click", function() {		
		alert("search 실행!!");
		 searchSwitch = 1;
		 loadingPage();
		 $('.homeSitterlist').empty();
		 i = 0;
	});
	$(".reset").on("click", function(){
		alert("reset 실행");
		 searchSwitch = 0;
		loadingPage();
		$('.homeSitterlist').empty();
		 i = 0;
	});
});
var searchSwitch = 0;
function loadingPage(){
	var detailParam = $("form").serialize();
// 	var stateParam = $('input[name=hsl_address]:checked').serialize(); 
	var homeSitterListDiv = $('.homeSitterlist');

	$.ajax({
		url : "${contextPath}/home/searchLoading",
// 		data : stateParam + '&' + detailParam + '&searchSwitch='+searchSwitch ,
		data : detailParam + '&searchSwitch='+searchSwitch ,
		dataType : "JSON",
		success : function(hsList) {
			var hsListLenghth = hsList
			if(hsListLenghth.length == 0){
				$('<span>').text("검색결과가 없슴둥..힝구 (이미지)").appendTo($('.homeSitterlist'));
			}
		
			ajaxSucessLoading(hsList);
		},
		error : function(request, status, error) {
			console.log(" error = " + request, status, error);
		}
	});
	return false;
}

var breaker = 0; 
function ajaxSucessLoading(hsList){
	console.log("성겅!");
	for(i;breaker<8;i++){
		console.log(i);
		if(breaker <7){			
			var petHotelDiv = $('<div class="homeSitter" onclick="location.href=\'${contextPath}/home/view?hsl_num=' 
					+hsList[i].hsl_num +'\'\"style="border: 1px solid; margin: 50px; height: 350px;">');	
			var petHotelDiv2 = $('<div style="width: auto; display: inline-block display:inline; float: left; "> ');
			petHotelDiv.append(petHotelDiv2);
			var itemDiv = $('<div class="item" style="heigth:350;width:350px">');
			petHotelDiv2.append(itemDiv);
			var clearfixDiv = $('<div class="clearfix" style="max-width: 350px;">');
			itemDiv.append(clearfixDiv);
			var imagegalleryDiv = $('<ul style="width:350px;">');
			clearfixDiv.append(imagegalleryDiv);

			for ( var a in hsList[i].hsl_filesName) {

			var imgli=$("<li data-thumb='${contextPath}/home/image?fileName="+hsList[i].hsl_filesName[a]+"'>");
			imagegalleryDiv.append(imgli);
			$("<img style='width: 350px; height: 350px;' src='${contextPath}/home/image?fileName="
					+hsList[i].hsl_filesName[a]+"'/>").appendTo(imgli);
			}
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
			var aArDiv = $('<div style="">');
			$('<span>').text(hsList[i].ph_name).appendTo(aArDiv);
			$('<div>'+hsList[i].hs_address+hsList[i].hs_d_address+'</div>').appendTo(aArDiv);
//				var minAndMaxPrice = $('<div>');
//				console.log(hsList.ph_minPrice);
//				console.log(hsList.ph_maxPrice);
//				minAndMaxPrice.appendTo(aArDiv);
			var reviewDiv = $('<div>');
			$('<span>').text('후기: ' + hsList[i].hsc_cmt_count+'개 '+hsList[i].hs_avgStar).appendTo(reviewDiv);
			reviewDiv.appendTo(aArDiv);
			aArDiv.appendTo(petHotelDiv);
			$('.homeSitterlist').append(petHotelDiv);
			breaker = breaker + 1;
		} else{
			breaker = 0;
			break;
		}
	}
}
$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	if($(window).scrollTop() >= $(document).height() - $(window).height()){
		loadingPage(); 
	} 
});
$(".homeSitter").click(function() { 
	location.href='/index.do'
} );

	
	//이미지 띄우기
	// ajax로 이미지 띄우기 왜냐면 map으로 받으니깐!!!
</script>
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

<div class='container'>
<%-- 	<form action="${contextPath }/home/search" method="get" id="searchForm"> --%>
	<form id="searchForm">
		<!-- 지역 검색 -->
		<ul class="nav nav-tabs nav-justified">
			<li id="menu_0" class="active"><a href="${contextPath}/home/main">전체</a></li >
			<li id="menu_1" ><a href="#">서울</a></li >
			<li id="menu_2" ><a href="#">경기</a></li >
			<li id="menu_3" ><a href="#">인천</a></li >
		</ul>
		<div class="nav states">
			<div id="subtbl_0" style="display: none">
				<table>
					<tr>
						<td><input type="checkbox" name="hsl_address" value="서울"> <input type="checkbox" name="hsl_address" value="경기"> <input type="checkbox" name="hsl_address" value="인천"></td>
					</tr>
				</table>
			</div>
			<div id="subtbl_1" style="display: none">
				<table>
					<tr class="state_seoul">
						<td><input type="checkbox" name="hsl_address" id="state1" value="강남구">강남구</td>
						<td><input type="checkbox" name="hsl_address" id="state2" value="강동구">강동구</td>
						<td><input type="checkbox" name="hsl_address" id="state3" value="강북구">강북구</td>
						<td><input type="checkbox" name="hsl_address" id="state4" value="강서구">강서구</td>
						<td><input type="checkbox" name="hsl_address" id="state5" value="관악구">관악구</td>
						<td><input type="checkbox" name="hsl_address" id="state6" value="광진구">광진구</td>
					</tr>                          
					<tr class="state_seoul">       
						<td><input type="checkbox" name="hsl_address" id="state7" value="구로구">구로구</td>
						<td><input type="checkbox" name="hsl_address" id="state8" value="금천구">금천구</td>
						<td><input type="checkbox" name="hsl_address" id="state9" value="노원구">노원구</td>
						<td><input type="checkbox" name="hsl_address" id="state10" value="도봉구">도봉구</td>
						<td><input type="checkbox" name="hsl_address" id="state11" value="동대문구">동대문구</td>
						<td><input type="checkbox" name="hsl_address" id="state12" value="동작구">동작구</td>
					</tr>                            
					<tr class="state_seoul">         
						<td><input type="checkbox" name="hsl_address" id="state13" value="마포구">마포구</td>
						<td><input type="checkbox" name="hsl_address" id="state14" value="서대문구">서대문구</td>
						<td><input type="checkbox" name="hsl_address" id="state15" value="서초구">서초구</td>
						<td><input type="checkbox" name="hsl_address" id="state16" value="성동구">성동구</td>
						<td><input type="checkbox" name="hsl_address" id="state17" value="성북구">성북구</td>
						<td><input type="checkbox" name="hsl_address" id="state18" value="송파구">송파구</td>
					</tr>                              
					<tr class="state_seoul">           
						<td><input type="checkbox" name="hsl_address" id="state19" value="양천구">양천구</td>
						<td><input type="checkbox" name="hsl_address" id="state20" value="영등포구">영등포구</td>
						<td><input type="checkbox" name="hsl_address" id="state21" value="용산구">용산구</td>
						<td><input type="checkbox" name="hsl_address" id="state22" value="은평구">은평구</td>
						<td><input type="checkbox" name="hsl_address" id="state23" value="종로구">종로구</td>
						<td><input type="checkbox" name="hsl_address" id="state24" value="중구">중구</td>	
						<td><input type="checkbox" name="hsl_address" id="state25" value="중랑구">중랑구</td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="search">검색</button>
							<button type="reset">초기화</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="subtbl_2" style="display: none">
				<table>
					<tr>
						<td id="check_container">
							<input type="checkbox" name="hsl_address" id="state26" value="고양시">고양시 
							<input type="checkbox" name="hsl_address" id="state27" value="과천시">과천시 
							<input type="checkbox" name="hsl_address" id="state28" value="광명시">광명시 
							<input type="checkbox" name="hsl_address" id="state29" value="광주시">광주시 
							<input type="checkbox" name="hsl_address" id="state30" value="구리시">구리시 
							<input type="checkbox" name="hsl_address" id="state31" value="군포시">군포시 
							<input type="checkbox" name="hsl_address" id="state32" value="김포시">김포시 
							<input type="checkbox" name="hsl_address" id="state33" value="남양주시">남양주시 
							<input type="checkbox" name="hsl_address" id="state34" value="동두천시">동두천시 
							<input type="checkbox" name="hsl_address" id="state35" value="부천시">부천시 
							<input type="checkbox" name="hsl_address" id="state36" value="성남시">성남시 
							<input type="checkbox" name="hsl_address" id="state37" value="수원시">수원시 
							<input type="checkbox" name="hsl_address" id="state38" value="시흥시">시흥시 
							<input type="checkbox" name="hsl_address" id="state39" value="안산시">안산시 
							<input type="checkbox" name="hsl_address" id="state40" value="안성시">안성시 
							<input type="checkbox" name="hsl_address" id="state41" value="안양시">안양시 
							<input type="checkbox" name="hsl_address" id="state42" value="양주시">양주시 
							<input type="checkbox" name="hsl_address" id="state43" value="여주시">여주시 
							<input type="checkbox" name="hsl_address" id="state44" value="오산시">오산시 
							<input type="checkbox" name="hsl_address" id="state45" value="용인시">용인시 
							<input type="checkbox" name="hsl_address" id="state46" value="의왕시">의왕시 
							<input type="checkbox" name="hsl_address" id="state47" value="의정부시">의정부시 
							<input type="checkbox" name="hsl_address" id="state48" value="이천시">이천시 
							<input type="checkbox" name="hsl_address" id="state49" value="파주시">파주시 
							<input type="checkbox" name="hsl_address" id="state50" value="평택시">평택시 
							<input type="checkbox" name="hsl_address" id="state51" value="포천시">포천시 
							<input type="checkbox" name="hsl_address" id="state52" value="하남시">하남시 
							<input type="checkbox" name="hsl_address" id="state53" value="화성시">화성시 
							<input type="checkbox" name="hsl_address" id="state54" value="가평군">가평군 
							<input type="checkbox" name="hsl_address" id="state55" value="양평군">양평군 
							<input type="checkbox" name="hsl_address" id="state56" value="연천군">연천군
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="search">검색</button>
							<button type="reset">초기화</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="subtbl_3" style="display: none">
				<table>
					<tr>
						<td id="check_container">
							<input type="checkbox" name="hsl_address" id="state57" value="계양구">계양구 
							<input type="checkbox" name="hsl_address" id="state58" value="남동구">남동구 
							<input type="checkbox" name="hsl_address" id="state59" value="동구">동구 
							<input type="checkbox" name="hsl_address" id="state60" value="미추홀구">미추홀구 
							<input type="checkbox" name="hsl_address" id="state61" value="부평구">부평구 
							<input type="checkbox" name="hsl_address" id="state62" value="서구">서구 
							<input type="checkbox" name="hsl_address" id="state63" value="연수구">연수구 
							<input type="checkbox" name="hsl_address" id="state64" value="중구">중구 
							<input type="checkbox" name="hsl_address" id="state65" value="강화군">강화군 
							<input type="checkbox" name="hsl_address" id="state66" value="옹진군">옹진군
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="search">검색</button>
							<button type="reset" >초기화</button>
						</td>
					</tr>
				</table>
			</div>
		</div>                       
		<!-- 홈시터 검색필터 설정부분 -->
		<div class="nav">
			<table>
				<tr>
					<th>서비스</th>
					<td>
						<select name="hsl_service_type"  >
							<option title="24시간 돌봄" value="24시간돌봄" >24시간 돌봄</option>
							<option title="데이케어" value="데이케어">데이케어</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>예약일</th>
					<td >
						<input type="text" placeholder="시작 날짜" readonly="readonly" name="hsl_chkin" id="hsl_chkin"/><span  class="glyphicon glyphicon-calendar form-control-feedback"></span>
						<span>&gt;</span>
						<input type="text" placeholder="마침 날짜" readonly="readonly" name="hsl_chkout" id="hsl_chkout" class="glyphicon glyphicon-calendar"/>
					</td>
				</tr>
				<tr>
					<th>반려견 나이</th>
					<td>
						<select name="hsl_pet_age" data-width="130px">
							<option value="" selected disabled hidden>==선택하세요==</option>
							<option title="puppy" value="강아지">강아지 (1살 이하)</option>
							<option title="dog" value="성견">성견 (2~6살)</option>
							<option title="agedDog" value="노령견">노령견 (7살 이상)</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>반려견 크기</th>
					<td>
						<select name="hsl_size" data-width="130px">
							<option value="" selected disabled hidden>==선택하세요==</option>
							<option title="s" value="소형견">소형견 (0~4.9kg)</option>
							<option title="m" value="중형견">중형견 (5~14.9kg)</option>
							<option title="l" value="대형견">대형견 (15kg 이상)</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="search">찾기</button>
						<button type="reset" class="reset">초기화</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<div class="homeSitterlist">
<%-- 		<c:forEach var="hsList" items="${hsList}"> --%>
<%-- 			<div class = "homesitter" onclick="location.href='${contextPath}/home/view?hsl_num=${hsList.HSL_NUM}'"  style="border: 1px solid; margin: 50px; height: 350px;"> --%>
<!-- 				<div style="width: auto; display: inline-block display:inline; float: left;"> -->
<!-- 					<div class="item"> -->
<!-- 						<div class="clearfix" style="max-width: 350px;"> -->
<!-- 							<ul class="image-gallery" class="gallery list-unstyled cS-hidden"> -->
<%-- 								<c:forEach items="${hsList.HSL_IMG_FILENAME}" var="fn"> --%>
<%-- 									<li data-thumb="${contextPath}/home/image?fileName=${fn}"> --%>
<%-- 										<img alt="사진이 엄슴" src="${contextPath}/home/image?fileName=${fn}" onclick="location.href='${contextPath}/home/view?hsl_num=${hsList.HSL_NUM}'" style="width: 350px; height: 350px;" />										 --%>
<!-- 									</li> -->
<%-- 								</c:forEach> --%>
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
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
<!-- 			</div> -->
<%-- 		</c:forEach> --%>
	</div>
</div>
	
<br><br>
<footer>
	<div>durlsms footer</div>
</footer>
</body>                                                  
</html>                                                                                                      