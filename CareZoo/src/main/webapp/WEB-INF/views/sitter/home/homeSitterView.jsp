<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoosthness/jquery-ui.css" /> -->
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script>          
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>     
<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<meta charset="UTF-8">
<title>homeSitterView</title>
<!-- 가정집 펫시터 상세내용 -->
<script type="text/javascript">
$(function() {
//datepicker disable : 해당일 제외하고 선택하기 *************** 홈시터가 지정한 날짜를 disable 설정필요
	$('#calendar').datepicker({ beforeShowDay: unavailableD });
	$('#checkin').datetimepicker({
	});
	$('#checkout').datetimepicker({
	});
	var unavailableDates = ["19-9-2019","14-9-2019"];
	function unavailableD(date) {
	    var dateType = date.getDate() + "-" + (date.getMonth()+1) + "-" +date.getFullYear();
	    if ($.inArray(dateType, unavailableDates) < 0) {
	        return [true,"","Book Now"];
	    } else {
	        return [false,"","Booked Out"];
	    }
	}	
	$('#check_in').timepicker({
		timeFormat:'HH:mm',
		'minTime':'09:00',
		'maxTime': '11:00'});
	$('#check_out').timepicker({
		timeFormat:'HH:mm',
		'minTime':'15:00',
		'maxTime': '17:00'});

// 	$('#check_out').datepicker();
});
</script>
</head>
<body>
<div>
	<div>이미지 올리기</div>
	<div>
		<table>
			<tr>
				<td>돌봄 가능한 강아지 크기&나이</td>
				<td>$KG부터 모두 가능합니다.</td>
				<td>$,케어</td>
			</tr>
			<tr>
				<td>체크인 체크아웃 시간</td>
				<td>체크인 : <input type="text" id="check_in"/></td>
				<td>체크아웃 : <input type="text" id="check_out"/></td>
			</tr>
		</table>
	</div>
	<div>
		<div>돌보미환경</div>
		<table>
			<tr>
				<td>돌봄 공간</td>
				<td>인근지하철역</td>
				<td>마당유무</td>
				<td>14세 미만 아동</td>
				<td>가족 동거 여부</td>
				<td>다른 동물 유무</td>
			</tr>
		</table>
	</div>
	<div>돌보미 소개</div>
	<div>
		<p>
			
		</p>
	</div>
	<div>
		<div>후기</div>
		<div>
			<div>프로필사진<img src="" alt=""></div>
			<div>이름</div><div>돌봄타입</div>
			<div>후기내용</div>
			<div>작성일</div>
		</div>
	</div>
</div>

<div>
	<div>
		<form action="reserve" method="post" id="reserve">
			<div>예약을 원하는 날짜와 시간을 선택해주세요</div>
			<table>
				<tr>
					<td>시작/마침날짜 선택할 수 있도로 누르면 달력 띄우기
						<input type="text" id="checkin">
						<input type="text" id="checkout">
					</td>
					<td>총 가격</td>
					<td>checkBox:pet_size선택
						<span>
							<select name="hsl_size" data-width="130px">
								<option value="" selected disabled hidden>==선택하세요==</option>
								<option title="소형견" value="S">소형견 (0~4.9kg)</option>
								<option title="중형견" value="M">중형견 (5~14.9kg)</option>
								<option title="대형견" value="L">대형견 (15kg 이상)</option>
							</select>
						</span>
					</td>
				</tr>
				<tr>
					<td>1박<span>4,3000원</span></td>
					<td>반려견 추가<span>4,3000원</span></td>
					<td>부가세<span>4,3000원</span></td>
					<td>총 합계<span>4,3000원</span></td>
				</tr>
				<tr>
					<td><input type="submit" value="예약하기"></td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<div>캘린더 미리보기</div>
		<div id="calendar">
		**************달력 그리기**********
		</div>
	</div>
	<div>
		<div><img alt="" src="">홈시터 이미지</div>
		<div>홈시터 별점</div>
		<div>홈시터 이름</div>
		<div>홈시터 주소</div>
		<div><button onclick="">예약요청하기</button></div>
	</div>
</div>
</body>
</html>