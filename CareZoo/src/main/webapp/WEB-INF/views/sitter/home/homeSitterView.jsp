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
	var unavailableDates = ["19-9-2019","14-9-2019"];   //*************** 홈시터가 지정한 날짜를 disable 설정필요
	function unavailableD(date) {
	    var dateType = date.getDate() + "-" + (date.getMonth()+1) + "-" +date.getFullYear();
	    if ($.inArray(dateType, unavailableDates) < 0) {
	        return [true,"","Book Now"];
	    } else {
	        return [false,"","Booked Out"];
	    }
	}	
	var datepickerStart = $('#checkin').datetimepicker({
		beforeShowDay: unavailableD,
		dateFormat: 'yy-mm-dd', 
		minDate: moment('yy-mm-dd').toDate(),
		onSelect: function (selected) {
			datepickerEnd.datepicker('option', 'minDate', selected);
			if (datepickerEnd.prop('disabled')) {
				datepickerEnd.datepicker('setDate', selected);
			} else if (!datepickerEnd.val()) {
				setTimeout($.proxy(datepickerEnd.datepicker, datepickerEnd, 'show'), 50);
			}
		},
		timeFormat: 'HH:mm' ,
		stepMinute: '30',
		timeRange: '7:00','11:00','30'
		
	});
	var datepickerEnd = $('#checkout').datetimepicker({
		beforeShowDay: unavailableD,
		dateFormat: 'yy-mm-dd', 
		minDate: moment('yy-mm-dd').toDate(),
		timeFormat: 'HH:mm'
	});
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
			소개웅앵웅
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
					<td>시작/마침날짜 선택할 수 있도로 누르면 달력 띄우기<br>
						<input type="text" id="checkin"><br>
						<select name="hsr_chkin" id="checkin_time">
							<option value="" selected disabled hidden>맡기는 시간</option>
							<option value="7:00">7:00</option>
							<option value="7:30">7:30</option>
							<option value="8:00">8:00</option>
							<option value="8:30">8:30</option>
							<option value="9:00">9:00</option>
							<option value="9:30">9:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
							<option value="18:30">18:30</option>
							<option value="19:00">19:00</option>
							<option value="19:30">19:30</option>
							<option value="20:00">20:00</option>
							<option value="20:30">20:30</option>
							<option value="21:00">21:00</option>
							<option value="21:30">21:30</option>
							<option value="22:00">22:00</option>
							<option value="22:30">22:30</option>
							<option value="23:00">23:00</option>
						</select>
						<br>
						<input type="text" id="checkout"><br>
						<select name="hsr_chkout" id="checkout_time">
							<option value="" selected disabled hidden>데려가는 시간</option>
							<option value="7:00">7:00</option>
							<option value="7:30">7:30</option>
							<option value="8:00">8:00</option>
							<option value="8:30">8:30</option>
							<option value="9:00">9:00</option>
							<option value="9:30">9:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
							<option value="18:30">18:30</option>
							<option value="19:00">19:00</option>
							<option value="19:30">19:30</option>
							<option value="20:00">20:00</option>
							<option value="20:30">20:30</option>
							<option value="21:00">21:00</option>
							<option value="21:30">21:30</option>
							<option value="22:00">22:00</option>
							<option value="22:30">22:30</option>
							<option value="23:00">23:00</option>
						</select>
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