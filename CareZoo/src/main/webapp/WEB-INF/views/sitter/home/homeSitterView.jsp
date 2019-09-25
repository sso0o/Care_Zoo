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
	var days = 0;
	var empPricePerDay = 1;
	calculatePrice();
//datepicker disable : 해당일 제외하고 선택하기 *************** 홈시터가 지정한 날짜를 disable 설정필요
	$('#calendar').datepicker({ beforeShowDay: unavailableD });
	var unavailableDates = ["2019-9-19","2019-9-14"];   //*************** 홈시터가 지정한 날짜를 disable 설정필요
	function unavailableD(date) {
	    var dateType = date.getFullYear()+ "-" +(date.getMonth()+1)+ "-" +date.getDate();
	    if ($.inArray(dateType, unavailableDates) < 0) {
	        return [true,"","Book Now"];
	    } else {
	        return [false,"","Booked Out"];
	    }
	}	
	// 특정일 선택막기 
// 	function unavailableD(date) { 
// 	   var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
// 	   for (i = 0; i < unavailableDates.length; i++) { 
// 	       if($.inArray(y + '-' +(m+1) + '-' + d,unavailableDates) != -1) { 
// 	           return [false]; 
// 	       } 
// 	   } 
// 	   return [true]; 
// 	}
	var datepickerStart = $('#checkin').datepicker({
		beforeShowDay: unavailableD,
		dateFormat: 'yy-mm-dd', 
		minDate: 'today',
		onSelect: function (selected) {
			datepickerEnd.datepicker('option', 'minDate', selected);
			if (datepickerEnd.prop('disabled')) {
				datepickerEnd.datepicker('setDate', selected);
			} 
// 			showDays();
			calculatePrice();
		}
	});
	var datepickerEnd = $('#checkout').datepicker({
		beforeShowDay: unavailableD,
		dateFormat: 'yy-mm-dd', 
		minDate: 'today',
		//예약 불가능일때 선택 막기
		onSelect: function(){
			var startDate = new Date(datepickerStart.val())
			var endDate = new Date($(this).val())
			for(var i in unavailableDates){				
				var notableDays = new Date(unavailableDates[i])
				if(startDate<notableDays && notableDays<endDate){
					alert("예약 불가능한 일자가 존재합니다. 다시 선택해 주세요.");
					return [false];	
				}		
			}
// 			showDays();
			calculatePrice();
			alert("성공")
			return [true];
		}
	});
	
	//가격 계산하기
// 	var pricePerST = 20000;
// 	var pricePerDay = 30000;
// 	var pricePerPetSize = 15000;
// 	var amount = 30000;
// 	$('#petSize-select').change(function() {
// 		if($('#petSize-select option:selected').val()=="소형견, 중형견"){
// 			pricePerDay = 30000;
// 			pricePerPetSize = 15000;
// 			$('.pricePerDay').empty().append(pricePerDay);
// 			$('#addPet').empty().append(pricePerPetSize);
// 			$('#hsr_totalprice').empty().append(pricePerDay);
// 		}else{
// 			pricePerDay = 40000;
// 			pricePerPetSize = 25000;
// 			$('.pricePerDay').empty().append(pricePerDay);
// 			$('#addPet').empty().append(pricePerPetSize);
// 			$('#hsr_totalprice').empty().append(pricePerDay);
// 		}
// 		amount = (pricePerDay+pricePerPetSize*$('#hsr_numof_pet').val());
// 		$('#hsr_totalprice').empty().append(amount);
// 		return pricePerDay;
// 	})
// 	$('#hsr_numof_pet').on("click", function(){
// 		$('#hsr_totalprice').empty().append(pricePerPetSize);
// 		amount = (pricePerDay+pricePerPetSize*$('#hsr_numof_pet').val());
// 		$('#hsr_totalprice').empty().append(amount);
// 		$('#totalpriceInput').val(amount);
// 	});
// 	$('#totalpriceInput').val(amount);
	
});
//날짜 기간차 구하기
function showDays() {
    var start = $('#checkin').val();
   	var startL = start.split('-');
   	var startday = new Date(startL[0], Number(startL[1])-1, startL[2]);
    console.log(startday);
    var end = $('#checkout').val();
    var endL = end.split('-');
    var endday = new Date(endL[0], Number(endL[1])-1, endL[2])
    console.log(endday);
    if (!start||!end) return days;
    days = ((endday.getTime() - startday.getTime())/1000/60/60/24);
    if (days == 0){
    	$('#DAY').empty().append('1 day');
    	$('#days').val(days+'박');
    	empPricePerDay = 1;
    }else if(days > 0){
    	$('#DAY').empty().append(days+'박');
    	$('#days').val(days+'박');
    	empPricePerDay = days;
    }
    console.log(empPricePerDay);
    console.log(days);
    return days;
}

function calculatePrice() {
		showDays();
		empPricePerDay = 1;
	var pricePerDay = 20000;
	var pricePerPetSize = 15000;
	var totalPrice = 20000;
	//펫 크기 당
	$('#petSize-select').off("change").on("change",function() {
		alert("22")
		if($('#petSize-select option:selected').val()=="소형견, 중형견"){
// 			pricePerDay = 20000;
// 			pricePerPetSize = 15000;
// 			$('.pricePerDay').empty().append(pricePerDay);
// 			$('#addPet').empty().append(pricePerPetSize);
// 			$('#hsr_totalprice').empty().append(pricePerDay);
			pricePerPetSize = 15000;
			if(days==0){
				pricePerDay = 20000;
// 				empPricePerDay = 1;
// 				$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
			}else if(days > 0){
				pricePerDay = 40000;
// 				empPricePerDay = days;
// 				$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
			}
		}else{
// 			pricePerDay = 30000;
// 			pricePerPetSize = 25000;
// 			$('.pricePerDay').empty().append(pricePerDay);
// 			$('#addPet').empty().append(pricePerPetSize);
// 			$('#hsr_totalprice').empty().append(pricePerDay);
			console.log('dlrj');
			pricePerPetSize = 25000;
			if(days==0){
				pricePerDay = 30000;
// 				empPricePerDay = 1;
// 				$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
			}else if(days> 0){
				pricePerDay = 50000;
// 				empPricePerDay = days;
// 				$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
			}
		}
		console.log("22222222");
// 		alert(empPricePerDay);
// 		totalPrice = ((pricePerDay*empPricePerDay)+pricePerPetSize*$('#hsr_numof_pet').val());
// 		$('.pricePerDay').empty().append(pricePerDay);
// 		$('#hsr_totalprice').empty().append(totalPrice);
	});

	//반려견 추가 당
	$('#hsr_numof_pet').off("change").on("click", function(){
// 		$('#hsr_totalprice').empty().append(pricePerPetSize);
// 		totalPrice = ((pricePerDay*empPricePerDay)+pricePerPetSize*$('#hsr_numof_pet').val());
// 		$('#hsr_totalprice').empty().append(totalPrice);
	});
	totalPrice = ((pricePerDay*empPricePerDay)+pricePerPetSize*$('#hsr_numof_pet').val()); 
	$('.pricePerDay').empty().append(pricePerDay);
	$('#hsr_totalprice').empty().append(totalPrice);
	$('#totalpriceInput').val(totalPrice);
	return true;
}

//가격 계산하기
// function calculatePrice() {
// 	showDays();
// 	var pricePerDay = 20000;
// 	var pricePerPetSize = 15000;
// 	var totalPrice = 20000;
// 	var empPricePerDay = 1;
// 	$('#petSize-select').change(function() {
// 		if($('#petSize-select option:selected').val()=="소형견, 중형견"){
// 			pricePerDay = 20000;
// 			pricePerPetSize = 15000;
// 			$('.pricePerDay').empty().append(pricePerDay);
// 			$('#addPet').empty().append(pricePerPetSize);
// 			$('#hsr_totalprice').empty().append(pricePerDay);
// 			if(days==0){
// 				empPricePerDay = 1;
// 				$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
// 			}else if(days > 0){
// 				empPricePerDay = days;
// 				pricePerDay = 40000;
// 				$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
// 			}
// 		}else{
// 			pricePerDay = 30000;
// 			pricePerPetSize = 25000;
// 			$('.pricePerDay').empty().append(pricePerDay);
// 			$('#addPet').empty().append(pricePerPetSize);
// 			$('#hsr_totalprice').empty().append(pricePerDay);
// 			if(days==0){
// 				empPricePerDay = 1;
// 				$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
// 			}else if(days> 0){
// 				empPricePerDay = days;
// 				pricePerDay = 50000;
// 				$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
// 			}
// 		}
// 		$('.pricePerDay').empty().append(pricePerDay);
// 		alert(empPricePerDay);
// 		totalPrice = ((pricePerDay*empPricePerDay)+pricePerPetSize*$('#hsr_numof_pet').val());
// 		$('#hsr_totalprice').empty().append(totalPrice);
// 	})	
// 	$('#days').change(function(){
// 		if(days==0){
// 			empPricePerDay = 1;
// 			$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
// 		}else if(days > 0){ 
// 			empPricePerDay = days;
// 			$('.pricePerDay').empty().append(pricePerDay);
// 				$('#hsr_totalprice').empty().append(pricePerDay);
// 		}
// 		alert(empPricePerDay);
// 	});
// 	$('#hsr_numof_pet').on("click", function(){
// 		$('#hsr_totalprice').empty().append(pricePerPetSize);
// 		totalPrice = ((pricePerDay*empPricePerDay)+pricePerPetSize*$('#hsr_numof_pet').val());
// 		$('#hsr_totalprice').empty().append(totalPrice);
// 		return $('#totalpriceInput').val(totalPrice);
// 	});
// 	totalPrice = ((pricePerDay*empPricePerDay)+pricePerPetSize*$('#hsr_numof_pet').val());
// 	$('#hsr_totalprice').empty().append(totalPrice);
// 	$('#totalpriceInput').val(totalPrice);
// 	return true;
// }
</script>
</head>
<body>
<div>
	<div>이미지 올리기</div>
	<div>
		<ul>
			<li>돌봄 가능한 강아지 크기&나이</li>
			<li>$KG부터 모두 가능합니다.</li>
			<li>${hsList.hsl_pet_age }케어 가능합니다.</li>
		</ul>
		<ul>
			<li>체크인 체크아웃 시간</li>
			<li>체크인 : ${hsList.hsl_chkin }</li>
			<li>체크아웃 : ${hsList.hsl_chkout }</li>
		</ul>
	</div>
	<fieldset>
		<legend>돌보미환경</legend>
			<ul>
				<li>돌봄 공간 : <span>${hsList.hsl_chkout }</span></li>
				<li>인근지하철역 : <span>${hsList.hsl_subway }</span></li>
				<li>마당유무 : <span>${hsList.hsl_yard }</span></li>
				<li>14세 미만 아동 : <span>${hsList.hsl_baby }</span></li>
				<li>가족 동거 여부 : <span>${hsList.hsl_family }</span></li>
				<li>다른 동물 유무 : <span>칼럼추가필요**</span></li>
			</ul>
	</fieldset>
	<fieldset>
	<legend>돌보미 소개</legend>
	<ul>
		<li>제목 : <span>${hsList.hsl_title }</span></li>
		<li>내용 : <span>${hsList.hsl_comment }</span></li>
	</ul>
	</fieldset>
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
		<fieldset>
			<legend>예약을 원하는 날짜와 시간을 선택해주세요</legend>
			<form action="reserve" method="post" >
				<table>
					<tr>
						<td>시작/마침날짜 선택할 수 있도로 누르면 달력 띄우기<br>
							<input type="text" id="checkin" name="hsr_chkin"><br>
							<input type="text" id="checkout" name="hsr_chkout"><br>
							<input type="text" id="days" readonly="readonly">
						</td>
						<td><span class="pricePerDay">20000</span>원 
							<span>
								<select id="petSize-select" name="hsl_size" data-width="130px">
									<option id="nomalSize" value="소형견, 중형견" selected="selected">15kg 미만</option>
									<option id="bigSize" value="대형견">15kg 이상</option>
								</select>
							</span>
						</td>
						<td>반려견 추가 당 <span id="addPet">15000</span>원</td>
						<td><span id ="DAY">1박 </span> <span class="pricePerDay"> 20000</span>원</td>
						<td>반려견 추가<span><input type="number" min="0" max="5" name="hsr_numof_pet" id="hsr_numof_pet"></span><span id="totalAddPetPrice"></span>원</td>
						<td>총 가격 : <span id="hsr_totalprice">20,000</span>원
						<input type="text" name="hsr_totalprice" id="totalpriceInput">
						</td>
					</tr>					
					<tr>
						<td><input type="submit" value="예약하기"></td>
					</tr>
				</table>
				<input type="text" name="hsl_num" value="${hsList.hsl_num }">
				<input type="text" name="c_num" value="${c_num}">
				<input type="text" name="hs_num" value="${hsList.hs_num}">
			</form>
		</fieldset>
	</div>
	<div>
		<div>캘린더 미리보기</div>
		<div id="calendar">
		**************달력 그리기**********
		</div>
	</div>
	<div>
		<ul>
			<li><img alt="" src="">홈시터 이미지</li>
			<li>홈시터 별점</li>
			<li>홈시터 이름</li>
			<li>홈시터 주소</li>
			<li><button onclick="">예약요청하기</button></li>
		</ul>
	</div>
</div>
</body>
</html>