<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>homeSitterList</title>
<!-- 가정용 펫시터 리스트 -->
<!--link for lightslider -->
<link rel="stylesheet" href="${contextPath}/resources/css/lightslider.css" />
<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>
<!--  link for DogMate datepicker css -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>
<!-- link for navBar -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- *필수요소*제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script>
<!-- script for navBar -->
<!-- <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script> -->
<%-- <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>  --%>
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
$(function () {
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
	//이미지 슬라이더
	$('.image-gallery').lightSlider({
		isthumb : false, // 이 부분이 제가 추가한 옵션 true 이면 썸네일을 표시하고, false 이면 표시하지 않습니다
		gallery : true,
		item : 1,
		thumbItem : 9,
		slideMargin : 0,
		speed : 1000,
		pause : 4000,
		auto : true,
		loop : true,
		addClass : $('.clearfix'),
		onSliderLoad : function() {
			$('.image-gallery').removeClass('cS-hidden');
		}
	});
	//네비게이션
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
	
});
	//이미지 띄우기
	// ajax로 이미지 띄우기 왜냐면 map으로 받으니깐!!!
</script>
</head>
<body>
<div class="container">
	<!-- 네비게이션 -->
	<div>
		<div class="container">
	        <header>
	            <a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
	         
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
	<div class='container'></div>
	<br>
	<br>
	<div>
		<form action="${contextPath }/home/search">
			<!-- 지역 검색 -->
			<div>
					<table style="width: 420px;">
						<tr>
							<td colspan="3" class="top_space"></td>
						</tr>
						<tr>
							<td>
								<table id="maintable" style="width: 100%; height: 30px">
									<tr>
										<td id="menu_0" class="td_mainmenubox_Off" style="cursor: hand"><a href="${contextPath}/petHotel/petHotelList">전체</a></td>
										<td id="menu_1" class="td_mainmenubox_Off" style="cursor: hand"><a href="#">서울</a></td>
										<td id="menu_2" class="td_mainmenubox_Off" style="cursor: hand"><a href="#">경기</a></td>
										<td id="menu_3" class="td_mainmenubox_Off" style="cursor: hand"><a href="#">인천</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<div>
						<div id="subtbl_0" style="display: none">
							<table>
								<tr>
									<td><input type="checkbox" name="ph_address" value="서울"> <input type="checkbox" name="ph_address" value="경기"> <input type="checkbox" name="ph_address" value="인천"></td>
								</tr>
							</table>
						</div>
						<div id="subtbl_1" style="display: none">
							<table>
								<tr class="state_seoul">
									<td id="check_container"><input type="checkbox" name="ph_address" id="state1" value="강남구"> <label for="state1">강남구</label> <input type="checkbox" name="ph_address" id="state2" value="강동구"> <label for="state2">강동구</label> <input type="checkbox" name="ph_address" id="state3" value="강북구"> <label for="state3">강북구</label> <input type="checkbox" name="ph_address" id="state4" value="강서구"> <label for="state4">강서구</label> <input type="checkbox" name="ph_address" id="state5" value="관악구"> <label for="state5">관악구</label> <input type="checkbox" name="ph_address" id="state6" value="광진구"> <label for="state6">광진구</label> <input type="checkbox" name="ph_address" id="state7" value="구로구"> <label for="state7">구로구</label> <input type="checkbox" name="ph_address" id="state8" value="금천구"> <label for="state8">금천구</label> <input type="checkbox" name="ph_address" id="state9" value="노원구"> <label for="state9">노원구</label> <input
										type="checkbox" name="ph_address" id="state10" value="도봉구"
									> <label for="state10">도봉구</label> <input type="checkbox" name="ph_address" id="state11" value="동대문구"> <label for="state11">동대문구</label> <input type="checkbox" name="ph_address" id="state12" value="동작구"> <label for="state12">동작구</label> <input type="checkbox" name="ph_address" id="state13" value="마포구"> <label for="state13">마포구</label> <input type="checkbox" name="ph_address" id="state14" value="서대문구"> <label for="state14">서대문구</label> <input type="checkbox" name="ph_address" id="state15" value="서초구"> <label for="state15">서초구</label> <input type="checkbox" name="ph_address" id="state16" value="성동구"> <label for="state16">성동구</label> <input type="checkbox" name="ph_address" id="state17" value="성북구"> <label for="state17">성북구</label> <input type="checkbox" name="ph_address" id="state18" value="송파구"> <label for="state18">송파구</label> <input type="checkbox" name="ph_address" id="state19" value="양천구"> <label
										for="state19"
									>양천구</label> <input type="checkbox" name="ph_address" id="state20" value="영등포구"> <label for="state20">영등포구</label> <input type="checkbox" name="ph_address" id="state21" value="용산구"> <label for="state21">용산구</label> <input type="checkbox" name="ph_address" id="state22" value="은평구"> <label for="state22">은평구</label> <input type="checkbox" name="ph_address" id="state23" value="종로구"> <label for="state23">종로구</label> <input type="checkbox" name="ph_address" id="state24" value="중구"> <label for="state24">중구</label> <input type="checkbox" name="ph_address" id="state25" value="중랑구"> <label for="state24">중랑구</label></td>
								</tr>
								<tr>
									<td>
										<button type="submit">검색</button>
										<button type="reset">초기화</button>
									</td>
								</tr>
							</table>
						</div>
						<div id="subtbl_2" style="display: none">
							<table>
								<tr>
									<td id="check_container"><input type="checkbox" name="ph_address" id="state26" value="고양시">고양시 <input type="checkbox" name="ph_address" id="state27" value="과천시">과천시 <input type="checkbox" name="ph_address" id="state28" value="광명시">광명시 <input type="checkbox" name="ph_address" id="state29" value="광주시">광주시 <input type="checkbox" name="ph_address" id="state30" value="구리시">구리시 <input type="checkbox" name="ph_address" id="state31" value="군포시">군포시 <input type="checkbox" name="ph_address" id="state32" value="김포시">김포시 <input type="checkbox" name="ph_address" id="state33" value="남양주시">남양주시 <input type="checkbox" name="ph_address" id="state34" value="동두천시">동두천시 <input type="checkbox" name="ph_address" id="state35" value="부천시">부천시 <input type="checkbox" name="ph_address" id="state36" value="성남시">성남시 <input type="checkbox" name="ph_address" id="state37" value="수원시">수원시 <input
										type="checkbox" name="ph_address" id="state38" value="시흥시"
									>시흥시 <input type="checkbox" name="ph_address" id="state39" value="안산시">안산시 <input type="checkbox" name="ph_address" id="state40" value="안성시">안성시 <input type="checkbox" name="ph_address" id="state41" value="안양시">안양시 <input type="checkbox" name="ph_address" id="state42" value="양주시">양주시 <input type="checkbox" name="ph_address" id="state43" value="여주시">여주시 <input type="checkbox" name="ph_address" id="state44" value="오산시">오산시 <input type="checkbox" name="ph_address" id="state45" value="용인시">용인시 <input type="checkbox" name="ph_address" id="state46" value="의왕시">의왕시 <input type="checkbox" name="ph_address" id="state47" value="의정부시">의정부시 <input type="checkbox" name="ph_address" id="state48" value="이천시">이천시 <input type="checkbox" name="ph_address" id="state49" value="파주시">파주시 <input type="checkbox" name="ph_address" id="state50" value="평택시">평택시 <input type="checkbox" name="ph_address"
										id="state51" value="포천시"
									>포천시 <input type="checkbox" name="ph_address" id="state52" value="하남시">하남시 <input type="checkbox" name="ph_address" id="state53" value="화성시">화성시 <input type="checkbox" name="ph_address" id="state54" value="가평군">가평군 <input type="checkbox" name="ph_address" id="state55" value="양평군">양평군 <input type="checkbox" name="ph_address" id="state56" value="연천군">연천군</td>
								</tr>
								<tr>
									<td>
										<button type="submit">검색</button>
										<button type="reset">초기화</button>
									</td>
								</tr>
							</table>
						</div>
						<div id="subtbl_3" style="display: none">
							<table>
								<tr>
									<td id="check_container"><input type="checkbox" name="ph_address" id="state57" value="계양구">계양구 <input type="checkbox" name="ph_address" id="state58" value="남동구">남동구 <input type="checkbox" name="ph_address" id="state59" value="동구">동구 <input type="checkbox" name="ph_address" id="state60" value="미추홀구">미추홀구 <input type="checkbox" name="ph_address" id="state61" value="부평구">부평구 <input type="checkbox" name="ph_address" id="state62" value="서구">서구 <input type="checkbox" name="ph_address" id="state63" value="연수구">연수구 <input type="checkbox" name="ph_address" id="state64" value="중구">중구 <input type="checkbox" name="ph_address" id="state65" value="강화군">강화군 <input type="checkbox" name="ph_address" id="state66" value="옹진군">옹진군</td>
								</tr>
								<tr>
									<td>
										<button type="submit">검색</button>
										<button type="reset">초기화</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>                            
			<!-- 홈시터 검색필터 설정부분 -->
			<div id="detail_form">
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
							<input type="text" placeholder="시작 날짜" readonly="readonly" name="hsl_chkin" id="hsl_chkin"/>
							<span>&gt;</span>
							<input type="text" placeholder="마침 날짜" readonly="readonly" name="hsl_chkout" id="hsl_chkout"/>
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
							<button type="submit" class="btn">찾기</button>
							<button type="reset" class="btn">초기화</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<div class="homeSitterlist">
			<c:forEach var="hslList" items="${hslList}">
				<div class = "homesitterList" onclick="location.href='${contextPath}/home/view?hsl_num=${hslList.HSL_NUM}'"  style="border: 1px solid; margin: 50px; height: 350px;">
					<div style="width: auto; display: inline-block display:inline; float: left;">
						<div class="item">
							<div class="clearfix" style="max-width: 350px;">
								<ul class="image-gallery" class="gallery list-unstyled cS-hidden">
									<c:forEach items="${hslList.HSL_IMG_FILENAME}" var="fn">
										<li data-thumb="${contextPath}/home/image?fileName=${fn}">
											<img src="${contextPath}/home/image?fileName=${fn}" onclick="location.href='${contextPath}/home/view?hsl_num=${hslList.HSL_NUM}'" style="width: 350px; height: 350px;" />										
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<br>
					</div>
					<div>
						<span></span> <br> <a href="${contextPath}/home/view?hsl_num=${hslList.HSL_NUM}">${hslList.HS_NAME }</a><br>
						<div>${hslList.HSL_ADDRESS}${hslList.HSL_D_ADDRESS}</div>
						<div>
							<fmt:formatNumber value="${hslList.HSL_PRICE}" pattern="#,###" />+
						</div>
						<div>
							후기:${hslList.ph_c_count}개 <br> ${hslList.HS_STAR }
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</body>                                                  
</html>                                                                                                      