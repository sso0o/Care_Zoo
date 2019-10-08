<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/jquery-ui.multidatespicker.css'/><!-- multidatePicker -->
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/><!-- dateTimePicker -->
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- datePicker -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script><!-- datePicker -->
<script src="${contextPath}/resources/js/jquery-ui.multidatespicker.js" type="text/javascript" ></script><!-- multidatePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>   <!-- dateTimePicker -->

<script type="text/javascript">
var i = 0;
var searchSwitch = 0;
$(document).ready(function() {

	$("#datepicker").datepicker({
		minDate : 0
	});
	var datepickerStart = $('.col-dates .pull-left').datepicker({
		dateFormat : 'yy-mm-dd',
		minDate : 0,
		onSelect : function(selected) {
			var endDay = new Date(selected);
			endDay.setDate(endDay.getDate() + 1);
			
			datepickerEnd.datepicker('option', 'minDate', endDay);

			if (datepickerEnd.prop('disabled')) {
				datepickerEnd.datepicker('setDate',
						selected);
			} else if (!datepickerEnd.val()) {
				setTimeout($.proxy(
						datepickerEnd.datepicker,
						datepickerEnd, 'show'), 50);
			}
		}
	});

	if (moment('yyyy-mm-dd').toDate() == null) {
		var datepickerEnd = $('.col-dates .pull-right').datepicker(
				{
					dateFormat : 'yy-mm-dd',
					minDate : moment('yy-mm-dd').toDate()
				});
	} else {
		var datepickerEnd = $('.col-dates .pull-right').datepicker(
				{
					dateFormat : 'yy-mm-dd',
					minDate : 0
				});
	}

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

	 
		 
		 
	$(".search").on("click", function() {		
			alert("search 실행!!");
			 searchSwitch = 1;
			 loadingPage();
			 $('.homeSitterlist').empty();
			 i = 0;
	});
	
	
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
					isthumb : false, // 이 부분이 제가 추가한 옵션 true 이면 썸네일을 표시하고, false 이면 표시하지 않습니다
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
// 				var minAndMaxPrice = $('<div>');
// 				console.log(hsList.ph_minPrice);
// 				console.log(hsList.ph_maxPrice);
// 				minAndMaxPrice.appendTo(aArDiv);
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

	loadingPage();
	function loadingPage(){
		var detailParam = $("form").serialize();
		var stateParam = $('input[name=hsl_address]:checked').serialize(); 
		var homeSitterListDiv = $('.homeSitterlist');
	
		$.ajax({
			url : "${contextPath}/petHotel/petHotelListLoading",
			data : stateParam + '&' + detailParam + '&searchSwitch='+searchSwitch ,
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
		})
				
	}
		$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	    	if($(window).scrollTop() >= $(document).height() - $(window).height()){
	    	loadingPage(); 
	    } 
	});
});

$(".homeSitter").click(function() { 
	location.href='/index.do'
} );

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${contextPath }/home/getDate">
	<div class="form-group">
	<div id="mdp-demo"></div>
	<input type="text" id="altField" >

							<label for="hsd_disabledate">불가능한 날짜를 선택하여 주세요.(매 90일마다 갱신) </label>
							<div id="calendar" ></div>
							<input type="text" id="hsd_disabledate" name="hsd_disabledate">
						</div>
						<input type="submit" value="wpcnf"> 
</form>
	

</body>
</html>