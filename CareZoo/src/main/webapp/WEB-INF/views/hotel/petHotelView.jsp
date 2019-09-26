<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">

<link rel="stylesheet" href="${contextPath}/resources/css/lightslider.css" />
<!-- 슬라이드 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<!-- 데이트피커 -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css' />
<!-- 데이트피커 -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css' />
<!-- 데이트피커 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<!-- 메뉴바 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 폰트 -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<!-- ?ㅁ?  -->
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/core/main.css' />
<!-- 캘린더 -->
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/daygrid/main.css' />
<!-- 캘린더 -->

<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/moment.js'></script>
<!-- 데이트피커 -->

<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
<!-- 메뉴바 -->
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<script type="text/javascript" src="${contextPath}/resources/js/lightslider.js"></script>
<!-- 슬라이더 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<!-- 데이트피커 -->
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/lang/ko.js'></script>
<!-- 캘린더 -->

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 데이트피커 -->
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=ture_or_false"></script>
<!-- 구글맵 -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAgHEcAR6wGi2lnF3cqqiPJuwv_MVvutIA&callback=initMap"></script>
<!-- 구글맵 -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript"></script>
<!-- 데이트피커 -->
<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<!-- 캘린더 -->
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
<!-- 캘린더 -->
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/core/main.js'></script>
<!-- 캘린더 -->
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/interaction/main.js'></script>
<!-- 캘린더 -->
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/daygrid/main.js'></script>
<!-- 캘린더 -->
<script type="text/javascript">
	var imgCommonPreview = new Image();
	var sizeS=0;
	var sizeM=0;
	var sizeL=0;
	var currentVal = 0;
	var days=0;// 시작-마지막날 계산
	var pet_max=0;
	
	function sizePriceSetter(s,m,l){
		var sizeS=s;
		var sizeM=m;
		var sizeL=l;
		if ($('.sizeSelect option:selected').val() == "소형견") {
		$('.oneNightPrice').text(numberWithCommas(s));
		$('.nightCountPrice').text(numberWithCommas(days*s));
		}else if($('.sizeSelect option:selected').val() == "중형견"){
			$('.oneNightPrice').text(numberWithCommas(m));
		$('.nightCountPrice').text(numberWithCommas(days*m));
		}else{
			$('.oneNightPrice').text(numberWithCommas(l));
		$('.nightCountPrice').text(numberWithCommas(days*l));
		}
		$('.nightCount').text(days+"박: ");
		sizeAndCountPrice();
		total();
	}

	function sizeAndCountPrice(){
		if(currentVal == 0){
			
		}else{
			 $('.petAddPrice').text(numberWithCommas(($('.nightCountPrice').text()).replace(",","")*(currentVal)));
		}
	}
	
	
	function total(){
		$('.totalPrice').text(numberWithCommas((($('.nightCountPrice').text()).replace(",","")*1)+(($('.petAddPrice').text()).replace(",","")*1)));
	}
	
	function incrementValue(e) {
		if(currentVal == pet_max-1){
		}else{
		  e.preventDefault();
		  var fieldName = $(e.target).data('field');
		  var parent = $(e.target).closest('div');
		  currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);
		  if (!isNaN(currentVal)) {
		  currentVal = currentVal + 1
		    parent.find('input[name=' + fieldName + ']').val(currentVal);
		  } else {
		    parent.find('input[name=' + fieldName + ']').val(0);
		  } 
		  $('.petAddPrice').text(numberWithCommas(($('.nightCountPrice').text()).replace(",","")*(currentVal)));

			total();
		}
		console.log(currentVal);
		}

		function decrementValue(e) {
		  e.preventDefault();
		  var fieldName = $(e.target).data('field');
		  var parent = $(e.target).closest('div');
		  currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);
		  if (!isNaN(currentVal) && currentVal > 0) {
		  currentVal = currentVal - 1;
		    parent.find('input[name=' + fieldName + ']').val(currentVal);
		  } else {
		    parent.find('input[name=' + fieldName + ']').val(0);
		  }
		  $('.petAddPrice').text(numberWithCommas(($('.nightCountPrice').text()).replace(",","")*(currentVal)));

			console.log(currentVal);
			total();
		}
		


		
		
	$(document).on(
			'ready',
			function() {
				
				 var select = $("select#color");

				    select.change(function(){
				        var select_name = $(this).children("option:selected").text();
				        $(this).siblings("label").text(select_name);
				    });
				var datepickerStart = $('.col-dates .pull-left').datepicker(
						{
							dateFormat : 'yy-mm-dd',
							minDate : 0,
								onClose: function(dateText, inst) {
									$('.col-dates .pull-right').val("체크아웃 날짜");
		 					        $('.selectForm').remove(); // 방 선택 selectBox 보여주기.
		 					     	 $('.drawResForm').remove();
								},
								onSelect : function(selected) {
									var endDay = new Date(selected);
									endDay.setDate(endDay.getDate() + 1);
									
								datepickerEnd.datepicker('option', 'minDate', endDay);

								if (datepickerEnd.prop('disabled')) {
									datepickerEnd.datepicker('setDate' , selected
									);
								} else if (!datepickerEnd.val()) {
									setTimeout($.proxy(
											datepickerEnd.datepicker,
											datepickerEnd, 'show'), 50);
								}
							}

						});

				if ($('.col-dates .pull-left').val() == null) {
					alert("이거니!?");
					var datepickerEnd = $('.col-dates .pull-right').datepicker(
							{
								dateFormat : 'yy-mm-dd',
								minDate : "+1D",
							});
				} else {
					var datepickerEnd = $('.col-dates .pull-right').datepicker(
							{
								onClose: function(dateText, inst) { // 날짜 선택 후
									if($('.col-dates .pull-right').val() =="체크아웃 날짜"){
									
									}else{
						            console.log("onClose 실행!!");
	 						        var start = $('.col-dates .pull-left').datepicker('getDate');
		 					        var end   = $('.col-dates .pull-right').datepicker('getDate');
		 					        days   = (end - start)/1000;
		 					        days   = days/60;
		 					        days   = days/60;
		 					        days   = days/24;
		 					        alert(days);
		 					        $('.nightCount').text(days+"박");
		 					        
		 					        $('.selectForm').remove(); // 방 선택 selectBox 보여주기.
		 					     	  $('.drawResForm').remove();
		 					        
		 					       var petHotelNum = $('.ph_num').val();
		 					       var startDate=$('.col-dates .pull-left').val();
		 					       var endDate=$('.col-dates .pull-right').val();
		 							$.ajax({
		 								url : "${contextPath}/petHotel/petHotelRoomDateChoice",
		 								data : {
		 									phr_chkin : startDate,
		 									phr_chkout : endDate,
		 									ph_num : petHotelNum
		 								},
		 								dataType : "JSON",
		 								
		 								success : function(data) {

		 							var sForm=$('<div class="selectForm" style="text-align:center">');
		 	 						$('<label>').text("방: ").appendTo(sForm);
		 							var roomSelectBox = $('<select class="rSelect">');
		 							
		 							roomSelectBox.on("change",function(){
		 								$('.drawResForm').remove();
		 								
		 								if ($('.rSelect option:selected').val() == "required") {

		 								} else {
		 									var roomNum = $('.rSelect option:selected').val();
		 									$.ajax({
		 										url : "${contextPath}/petHotel/petHotelRoomDetail",
		 										data : {
		 											phrm_num : roomNum
		 										},
		 										dataType : "JSON",
		 										success : function(data) {
											pet_max = (data.phrm_p_max)-(data.rcount); 
		 									var resForm=$('<div>');
		 									var PriceAndSize=$('<div class="PriceAndSize" style="text-align:center">');
		 									
		 									$('<label for="color" style="display:none;">color</label>').appendTo(PriceAndSize);
		 									resForm.addClass('drawResForm');
//		 			 						var selectbox = $('<select>');
		 			 						var size=(data.phrm_pet_size).split(',');
//		 			 						for(var i=0;i<size.length; i++){
//		 			 						    console.log(i+":"+size[i]);
//		 			 						}
//		 			 						<label style="text-align: left">(1박 가격)</label><span>(kg선택)</span>
											$('<br>').appendTo(resForm);
		 									var selectbox = $('<select class="sizeSelect" style="text-align:center" onchange="sizePriceSetter('+data.phrm_price+','+data.phrm_m_price+','+data.phrm_l_price+')">');
		 			 						$('<label class="oneNightPrice" style="text-align:center;font-size:20px">').text(numberWithCommas(data.phrm_price)).appendTo(PriceAndSize);
		 			 						PriceAndSize.append('&nbsp;');
		 			 						PriceAndSize.append('&nbsp;');
		 			 						PriceAndSize.append('&nbsp;');
		 			 						PriceAndSize.append('&nbsp;');
		 									for(var i=0;i<size.length; i++){
		 										if(size[i]=="소형견"){
		 			 						$("<option value='"+size[i]+"'>소형견(5kg이하)</option>").appendTo(selectbox);
		 										}else if(size[i]=="중형견"){
		 			 						$("<option value='"+size[i]+"'>중형견(5~10kg)</option>").appendTo(selectbox);
		 										}else{
		 			 						$("<option value='"+size[i]+"'>대형견(15kg이상)</option>").appendTo(selectbox);
		 										}
		 									}
		 									PriceAndSize.append(selectbox);
		 			 						resForm.append(PriceAndSize);
		 			 						$('<br>').appendTo(resForm);
		 			 						//소형견 대형견 ,로 나눠서 3개로 만든다음에 select으로 만들어야함,,
		 			 						$('<hr>').appendTo(resForm);
		 			 						var nightCount=$('<div class="night" style="display:inline-block">');
		 			 						$('<div class="nightCount" style="text-align:left; float:left">').text(days+"박: ").appendTo(nightCount);
		 			 						var countPrice = $('<div class="countPrice" style="float:right">');
		 			 						$('<span class="nightCountPrice">').text(numberWithCommas(data.phrm_price*days)).appendTo(countPrice);
		 			 						$('<span>').text("원").appendTo(countPrice);
		 			 						
		 			 						resForm.append(nightCount);
		 			 						resForm.append(countPrice);
		 			 						$('<hr>').appendTo(resForm);
		 			 						var petCount=$('<div class="petCount" style="display:inline-block">');
		 			 						$('<span>').text("반려견 추가: ").appendTo(petCount);
		 			 						
		 			 						var pmButtonDiv=$('<div class="input-group">');
		 			 						var minusButton = $('<input type="button" value="-" class="button-minus" data-field="quantity" >').appendTo(pmButtonDiv);
		 			 						$('<input type="number" step="1" max="" value="0" name="quantity" class="quantity-field" readonly>').appendTo(pmButtonDiv);
		 			 						var plusButton = $('<input type="button" value="+" class="button-plus" data-field="quantity">').appendTo(pmButtonDiv);
// 		 			 						<div class="input-group">
// 		 			 					  <input type="button" value="-" class="button-minus" data-field="quantity">
// 		 			 					  <input type="number" step="1" max="" value="1" name="quantity" class="quantity-field">
// 		 			 					  <input type="button" value="+" class="button-plus" data-field="quantity">
// 		 			 						</div>
											pmButtonDiv.on('click', '.button-plus', function(e) {
											  incrementValue(e);
											});
											
											pmButtonDiv.on('click', '.button-minus', function(e) {
											  decrementValue(e);
											});
		 			 						var petCountPrice = $('<div class="petCountPrice" style="float:right;height:66px;display:flex;">');
		 			 						//추가하는거
		 			 						$('<span class="petAddPrice" style="margin-top:30px;">').text("0").appendTo(petCountPrice);
		 			 						$('<span style="margin-top:30px;">').text("원").appendTo(petCountPrice);
		 			 						petCount.append(pmButtonDiv);
		 			 						resForm.append(petCount);
		 			 						resForm.append(petCountPrice);

		 			 						$('<hr>').appendTo(resForm);
		 			 						
		 			 						var total=$('<div class="total" style="display:inline-block">');
		 			 						$('<span>').text("총 합계: ").appendTo(total);
		 			 						
		 			 						var totalPrice = $('<div class="totalPriceDiv" style="float:right">');
		 			 						$('<span class="totalPrice">').text(numberWithCommas(data.phrm_price*days)).appendTo(totalPrice);
		 			 						$('<span>').text("원").appendTo(totalPrice);
		 			 						resForm.append(total);
		 			 						resForm.append(totalPrice);
		 			 						
		 			 						$('<hr>').appendTo(resForm);
		 			 						
		 			 						var reserButton=$('<div class="reserButton">');
		 			 						$('<button id="test_btn1">예 약 하 기</button>').appendTo(reserButton);
		 			 						resForm.append(reserButton);
		 			 						
		 			 						$(".reservationForm").append(resForm);
		 											$('#test').prev().css("color", "aqua");
		 										},
		 										error : function() {
		 											alert("데이터를 불러오는데 실패했습니다.")
		 										}
		 									})
		 									$('.reservationForm').show();

		 								}
		 							});
		 							
		 	 						$("<option value='required'>필수선택</option>").appendTo(roomSelectBox);
		 							for(var i in data){
		 	 						$("<option value='"+data[i].phrm_num+"'>"+data[i].phrm_name+"/남은 자리("+((data[i].phrm_p_max)-(data[i].rcount))+")</option>").appendTo(roomSelectBox);
		 							}
		 	 						sForm.append(roomSelectBox);
		 	 						$(".sRoom").append(sForm);

		 								},
		 								error : function() {
		 									alert("데이터를 불러오는데 실패했습니다.")
		 								}
		 							})
									}
								},
								afterShow: function (input, inst, td) {
								},
								dateFormat : 'yy-mm-dd',
								minDate : "+1D"//qwewqe
							});
				}
				$('.reservationForm').hide();



				$('.pull-left').click(function() {

					if ($('.rSelect option:selected').val() == "required") {
					}
				});
				$('.pull-right').click(function() {
					alert($('.col-dates .pull-left').val());	
				if ($('.col-dates .pull-left').val() == "" || $('.col-dates .pull-left').val()=="체크인 날짜") {
						alert("체크인 날짜 먼저 선택해주세요.");
						datepickerEnd.prop('disabled');
						$('.ui-datepicker').css("display","none");
					}
				});
			});

	function initialize() {

		var geocoder = new google.maps.Geocoder();

		var addr = '${petHotel.ph_address}';

		var lat = "";
		var lng = "";

		geocoder.geocode({
			'address' : addr
		},

		function(results, status) {

			if (results != "") {

				var location = results[0].geometry.location;

				lat = location.lat();
				lng = location.lng();

				var latlng = new google.maps.LatLng(lat, lng);
				var myOptions = {
					zoom : 15,
					center : latlng,
					mapTypeControl : true,
					mapTypeId : google.maps.MapTypeId.ROADMAP
				};
				var map = new google.maps.Map(document
						.getElementById("map_canvas"), myOptions);
				var marker = new google.maps.Marker({
					position : latlng,
					map : map
				});

				marker.setMap(map);
			} else
				$("#map_canvas").html("위도와 경도를 찾을 수 없습니다.");
		})
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}


	$(function() {
		initialize();

		$("#content-slider").lightSlider({
			loop : true,
			keyPress : true
		});
		$('#image-gallery').lightSlider({
			isthumb : true,
			gallery : true,
			item : 1,
			thumbItem : 8,
			slideMargin : 0,
			speed : 1000,
			loop : true,
			onSliderLoad : function() {
				$('#image-gallery').removeClass('cS-hidden');
			}
		});
	})

	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}

	var calendar=null;
	document.addEventListener('DOMContentLoaded', function() {
		var d = new Date();
		<%=session.getAttribute("c_num")%>
	var calendarEl = document.getElementById('calendar');
		var calHeight = 450;
		calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid', 'interaction' ],
			//		 			timeZone : "Asian/Seoul",
			locale : 'ko',
			height : calHeight,
			// 				    contentHeight:calHeight,
			allDayDefault : false,
			editable : false,
			displayEventTime : false,
			defaultView : 'dayGridMonth',
			defaultDate : d,
			editable : true,
			selectable : false,
			eventLimit : true, // allow "more" link when too many events
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'dayGridMonth,dayGridWeek'
			},
			eventRender : function(info) {
				var tooltip = new Tooltip(info.el, {
					title : info.event.extendedProps.description,
					placement : 'top',
					trigger : 'hover',
					container : 'body'
				});
			},
		});
		function roomCalendar() {

			var room_num = $('.rCalSelect option:selected').val();
			$.ajax({
				url : "${contextPath}/petHotel/petHotelReservation",
				data : {
					phrm_num : room_num
				},
				dataType : "JSON",
				success : function(data) {
					// 						if(reservationId != null){
					// 							alert("reservationId");
					// 							reservationId.remove();
					// 						}
					var events = calendar.getEvents();
					var len = events.length;
					for (var i = 0; i < len; i++) {
						events[i].remove();
					}
					for (var i = 0; i < data.length; i++) {
						e = {
							groupId : 'vsr_num',
							id : data[i].phr_num,
							start : data[i].phr_chkin,
							end : data[i].phr_chkout + 'T11:00',
							title : '예약',
							description : data[i].phr_chkin.substring(2, 12)
									+ ' ~ '
									+ data[i].phr_chkout.substring(2, 12),
							color : 'rgba(0, 0, 120, 0.6)',
						}

						calendar.addEvent(e);
						calendar.render();
					}

				},
				error : function() {
					alert("데이터를 불러오는데 실패했습니다.")
				}
			})
		}

		// 				var iiii = {
		// 					start : '2019-09-26',
		// 					end: '2019-09-27',
		// 					description : 'test',
		// 					title: 'test'

		// 				}
		// 				calendar.addEvent(iiii);
		calendar.render();
		$('.rCalSelect').on("change", function() {
			roomCalendar();
		});
		roomCalendar();
	});
</script>
<style>
#map_canvas {
	width: 300px;
	height: 300px;
}

.pignose-calendar-unit-disabled a {
	color: red !important
}

footer {
	
}

body {
	margin: 0;
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

.popper, .tooltip {
	position: absolute;
	z-index: 9999;
	background: #e1e1e1;
	color: black;
	width: 150px;
	border-radius: 3px;
	box-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
	padding: 10px;
	text-align: center;
}

.style5 .tooltip {
	background: #1E252B;
	color: #FFFFFF;
	max-width: 200px;
	width: auto;
	font-size: .8rem;
	padding: .5em 1em;
}

.popper .popper__arrow, .tooltip .tooltip-arrow {
	width: 0;
	height: 0;
	border-style: solid;
	position: absolute;
	margin: 5px;
}

.tooltip .tooltip-arrow, .popper .popper__arrow {
	border-color: #e1e1e1;
}

.style5 .tooltip .tooltip-arrow {
	border-color: #050f0c;
}

.popper[x-placement^="top"], .tooltip[x-placement^="top"] {
	margin-bottom: 5px;
}

.popper[x-placement^="top"] .popper__arrow, .tooltip[x-placement^="top"] .tooltip-arrow
	{
	border-width: 5px 5px 0 5px;
	border-left-color: transparent;
	border-right-color: transparent;
	border-bottom-color: transparent;
	bottom: -5px;
	left: calc(50% - 5px);
	margin-top: 0;
	margin-bottom: 0;
}

.popper[x-placement^="bottom"], .tooltip[x-placement^="bottom"] {
	margin-top: 5px;
}

.tooltip[x-placement^="bottom"] .tooltip-arrow, .popper[x-placement^="bottom"] .popper__arrow
	{
	border-width: 0 5px 5px 5px;
	border-left-color: transparent;
	border-right-color: transparent;
	border-top-color: transparent;
	top: -5px;
	left: calc(50% - 5px);
	margin-top: 0;
	margin-bottom: 0;
}

.tooltip[x-placement^="right"], .popper[x-placement^="right"] {
	margin-left: 5px;
}

.popper[x-placement^="right"] .popper__arrow, .tooltip[x-placement^="right"] .tooltip-arrow
	{
	border-width: 5px 5px 5px 0;
	border-left-color: transparent;
	border-top-color: transparent;
	border-bottom-color: transparent;
	left: -5px;
	top: calc(50% - 5px);
	margin-left: 0;
	margin-right: 0;
}

.popper[x-placement^="left"], .tooltip[x-placement^="left"] {
	margin-right: 5px;
}

.popper[x-placement^="left"] .popper__arrow, .tooltip[x-placement^="left"] .tooltip-arrow
	{
	border-width: 5px 0 5px 5px;
	border-top-color: transparent;
	border-right-color: transparent;
	border-bottom-color: transparent;
	right: -5px;
	top: calc(50% - 5px);
	margin-left: 0;
	margin-right: 0;
}

/* 	===========================================모달 */
.modal-modify {
	overflow: hidden;
	z-index: 999;
	display: none;
	left: 0;
	top: 0;
	position: fixed;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-table {
	background-color: #fefefe;
	padding-top: 5px;
	padding-left: 40px;
	padding-right: 20px;
	padding-bottom: 10px;
	border: 1px solid #888;
	width: 550px; /* Could be more or less, depending on screen size */
	height: 300px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -150px;
	margin-left: -275px;
	border: 1px solid #888;
}

.modal-table th {
	background-color: #7858a7;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	text-align: right;
}

.review {
	color: #aaa;
	float: right;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

.close:hover, .close:focus, .review:hover, .review:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

a.fc-more {
	font-size: 1px;
}

.fc-toolbar h2 {
	font-size: 20px;
	margin: 0;
}

td.fc-day.fc-past { /*지난 날 블러*/
	background-color: #EEEEEE;
}

input, textarea {
	border: 1px solid #b9d5e8;
	box-sizing: border-box;
	margin: 0;
	outline: none;
	padding: 10px;
}

input[type="button"] {
	-webkit-appearance: button;
	cursor: pointer;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

.input-group {
	clear: both;
	margin: 15px 0;
	position: relative;
}

.input-group input[type='button'] {
	background-color: #eeeeee;
	min-width: 34px;
	width: auto;
	transition: all 300ms ease;
}

.input-group .button-minus, .input-group .button-plus {
	font-weight: bold;
	height: 31px;
	padding: 0;
	width: 38px;
	position: relative;
}

.input-group .quantity-field {
	position: relative;
	height: 31px;
	left: -6px;
	text-align: center;
	width: 40px;
	display: inline-block;
	font-size: 13px;
	margin: 0 0 5px;
	resize: vertical;
}

.button-plus {
	left: -8px;
}

input[type="number"] {
	-moz-appearance: textfield;
	-webkit-appearance: none;
}

.reserButton {
	text-align: center;
}

#test_btn1 {
	border-radius: 8px;
	margin-right: -4px;
	height: 50px;
	width: 200px;
	font-size: 20px
}

.reserButton button {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}

.reserButton button:hover {
	cursor: pointer;
	color: white;
	background-color: skyblue;
}

.sizeSelect {
	position: relative;
	width: 130px;
	height: 40px;
	background: url(select_arrow.png) 180px center no-repeat; /* 화살표 이미지 */
	border: 1px solid #b9d5e8;
}

.sizeSelect label {
	position: absolute;
	font-size: 14px;
	color: #a97228;
	top: 13px;
	left: 12px;
	letter-spacing: 1px;
}

.sizeSelect select#color {
	width: 100%;
	height: 40px;
	min-height: 40px;
	line-height: 40px;
	padding: 0 10px;
	opacity: 0;
	filter: alpha(opacity = 0); /* IE 8 */
}
</style>



<title>petHotelView</title>

</head>
<body>
	<div class="container">
		<header>
			<a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

			<div class="header_Btn" id="sessioncheck">
				<sec:authorize access="isAnonymous()">
					<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
					<a class="btn_Join" href="${contextPath}/member/join">회원가입</a>
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
				<li class='active sub'><a href='#'>SITTER</a>
					<ul>
						<li class='last'><a href='#'>가정펫시터</a> <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      --></li>
						<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
					</ul></li>
				<li class='active sub'><a href='#'>HOTEL</a>
					<ul>
						<li class='last'><a href='#'>애견동반호텔</a></li>
						<li class='last'><a href='#'>애견호텔(보호자비동반)</a></li>
					</ul></li>
				<li class='active sub'><a href='#'>REVIEW</a>
					<ul>
						<!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='#'>시터</a></li>
						<li class='last'><a href='#'>호텔</a></li>
					</ul></li>
				<li class='last'><a href='#' style="font-size: 17px">MY PAGE</a></li>
				<li class='last'><a href='#' style="font-size: 17px">Q&A</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div style="width: 700px; display: inline-block; float: left;">
			<div>

				<table>
					<tr>
						<td>${petHotel.ph_name}</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td>
							<hr width=670px>
						</td>
					</tr>
				</table>
				<!--             <div style="width: 700px;"> -->
				<!--                <div class="lazy slider" -->
				<!--                   style="width: 700px; height: 600px; margin-left: 0;"> -->
				<%--                   <c:forEach items="${filesName}" var="fn"> --%>
				<!--                      <div> -->
				<%--                         <img src="${contextPath}/petHotel/image?fileName=${fn}" --%>
				<!--                            data-sizes="100vw" data-srcset="" -->
				<!--                            style="width: 680px; height: 580px;"> -->
				<!--                      </div> -->
				<%--                   </c:forEach> --%>
				<!--                </div> -->
				<!--             </div> -->
				<div style="width: 700px;">

					<div class="item">
						<div class="clearfix" style="max-width: 680px;">
							<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
								<c:forEach items="${filesName}" var="fn">
									<li data-thumb="${contextPath}/petHotel/image?fileName=${fn}"><img src="${contextPath}/petHotel/image?fileName=${fn}" style="width: 680px; height: 580px;" /></li>
								</c:forEach>
							</ul>
						</div>
					</div>

				</div>

				<table>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td>
							<hr width=670px>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td>가능한 펫 마리수:${petHotel.ph_p_count }
					</tr>
					<tr>
						<td><input type="hidden" id="sample4_postcode" placeholder="우편번호"> 주소:${petHotel.ph_address} <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> ${petHotel.ph_d_address }
					</tr>
					<tr>
						<td>
							<div>
								<div id="map_canvas"></div>
							</div>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td>
							<hr width=670px>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<c:forEach var="phComment" items="${phComment}">
						<tr>
							<td>${phComment.c_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${phComment.phc_star}</td>
						</tr>
						<tr>
							<td>${phComment.phc_comment}</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td>${phComment.phc_write_date}</td>
						</tr>
						<!--             <p> -->
						<tr>
							<td>
								<hr width=670px>
							</td>
						</tr>
					</c:forEach>

				</table>
				<div class="demo"></div>
			</div>
			<div class="reservation">
				<div class="reserRequest"></div>
				<div class="calendar"></div>
			</div>
			<div class="show_map">
				<div id="map_canvas"></div>
			</div>
		</div>
		<br> <br>
		<div style="float: left;">
			<form action="${contextPath }/petHotel/petHotelResForm" method="post">
				<div style="padding: 10px; font-size: 15px; width: auto; border: 1px solid darkgray; margin-left: 30px; border-radius: 4px;">

					<div class="col-dates" style="text-align: center;">
						<label>원하는 날짜를 선택해주세요.</label> <br> <input type="hidden" class="ph_num" name="ph_num" value="${petHotel.ph_num }"> <br> <input type="text" class="pull-left" placeholder="체크인 날짜" readonly="readonly" name="phr_chkin" style="width: 115px; color: #666666; text-align: center; border-radius: 4px; font-size: 15px;" /> &nbsp;&nbsp;<span>&gt;</span>&nbsp;&nbsp; <input type="text" class="pull-right" placeholder="체크아웃 날짜" readonly="readonly" name="phr_chkout" style="width: 115px; color: #666666; text-align: center; border-radius: 4px; font-size: 15px;" /> <br style="padding: 20px"> <br>
					</div>

					<div class="sRoom">
						<!-- 						<label>방:&nbsp; </label> <select name="roomSelect" class="rSelect"> -->
						<!-- 							<option value="required">필수선택</option> -->
						<%-- 							<c:forEach items="${petHotelRoomList}" var="phrl"> --%>
						<%-- 															<li data-thumb="${contextPath}/petHotel/image?fileName=${fn}"><img src="${contextPath}/petHotel/image?fileName=${fn}" style="width: 680px; height: 580px;" /></li> --%>
						<%-- 								<option value="${phrl.phrm_num}">${phrl.phrm_name}</option> --%>
						<%-- 							</c:forEach> --%>
						<!-- 						</select> -->
					</div>
					<div class="reservationForm" style="">
						<!-- 						<label style="text-align: left">(1박 가격)</label><span>(kg선택)</span> -->

						<!-- 						<hr> -->
						<!-- 						<span>(시작날짜 마침날짜 계산일)박</span><span>(가격)</span> -->
						<!-- 						<hr> -->
						<!-- 						<span>반려견 추가</span><span>(가격)</span> -->
						<!-- 						<hr> -->
						<!-- 						<span>총 합계:</span> <span>(총가격)</span> <br> <br> <input type="submit" value="예약하기"> -->
					</div>
				</div>
			</form>
			<br>
			<div class="calendarDiv" style="display: inline-block; padding: 10px; font-size: 15px; width: 300px; border: 1px solid darkgray; margin-left: 30px; border-radius: 4px; text-align: center;">
				<br> <span style="font-size: 21px;">&nbsp;캘린더 미리보기&nbsp;</span>

				<div class="roomCalendarDiv" style="display: inline-block">
					<select name="roomCalendarSelect" class="rCalSelect">
						<c:forEach items="${petHotelRoomList}" var="phrl">
							<option value="${phrl.phrm_num}">${phrl.phrm_name}</option>
						</c:forEach>
					</select>
				</div>
				<br>
				<br>
				<hr>
				<div id='calendar'></div>
			</div>
		</div>

	</div>
	<div class="container"></div>
</body>
</html>