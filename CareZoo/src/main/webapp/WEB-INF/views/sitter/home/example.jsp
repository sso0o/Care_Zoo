<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var i = 0;
var searchSwitch = 0;
$(function() {
	$(".search").on("click", function() {		
			alert("search 실행!!");
			 searchSwitch = 1;
			 loadingPage();
			 $('.homeSitterlist').empty();
			 i = 0;
	});	
	loadingPage();
	function loadingPage(){
		var detailParam = $("#searchForm").serialize();
		var stateParam = $('input[name=hsl_address]:checked').serialize(); 
		var homeSitterlistDiv = $('.homeSitterlist');
	
		$.ajax({
			url : "${contextPath}/home/searchLodagin", //////////고치기
			data : stateParam + '&' + detailParam + '&searchSwitch='+searchSwitch ,
			dataType : "JSON",
			success : function(hslList) {
			var hslListLenghth = hslList
			if(hslListLenghth.length == 0){
				$('<span>').text("검색결과가 없슴둥..힝구 (이미지)").appendTo($('.homeSitterlist'));
			}
				ajaxSucessLoading(hslList);
			},
			error : function(request, status, error) {
				console.log(" error = " + request, status, error);
			}
		})
			
	}
	var breaker = 0; 
	function ajaxSucessLoading(hslList){
		console.log("성겅!");
		for(i;breaker<8;i++){
			console.log(i);
			if(breaker <7){		
				var homeSitterDiv = $('<div class="homesitter" onclick="location.href=\'${contextPath}/home/view?hsl_num=' +hslList[i].hsl_num +'\'\"style="border: 1px solid; margin: 50px; height: 350px;">');   // HSL_NUM
				var homeSitterDiv2 = $('<div style="width: auto; display: inline-block display:inline; float: left; "> ');
				homeSitterDiv.append(homeSitterDiv2);
				var itemDiv = $('<div class="item" style="heigth:350;width:350px">');
				homeSitterDiv2.append(itemDiv);
				var clearfixDiv = $('<div class="clearfix" style="max-width: 350px;">');
				itemDiv.append(clearfixDiv);
				var imagegalleryDiv = $('<ul style="width:350px;">');
				clearfixDiv.append(imagegalleryDiv);
				for ( var a in hslList[i].hsl_img_filename) { //대문자  HSL_IMG_FILENAME
					var imgli=$("<li data-thumb='${contextPath}/home/image?fileName="+hslList[i].hsl_img_filename[a]+"'>");
					imagegalleryDiv.append(imgli);
					$("<img style='width: 350px; height: 350px;' src='${contextPath}/home/image?fileName="+hslList[i].hsl_img_filename[a]+"'/>").appendTo(imgli);
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
				$('<span>').text(hslList[i].hsl_name).appendTo(aArDiv);
				$('<div>'+hslList[i].hsl_address+hslList[i].h_d_address+'</div>').appendTo(aArDiv);
				var minAndMaxPrice = $('<div>'+hslList[i].hsl_price+'</div>'); //HSL_PRICE
				console.log(hslList[i].hsl_price);  //HSL_PRICE
				minAndMaxPrice.appendTo(aArDiv);
				var reviewDiv = $('<div>');
// 				$('<span>').text('후기: ' + hslList[i].ph_c_count+'개 '+hslList[i].ph_avgStar).appendTo(reviewDiv);
				reviewDiv.appendTo(aArDiv);
				aArDiv.appendTo(homeSitterDiv);
				
				
				$('.homeSitterlist').append(homeSitterDiv);
				breaker = breaker + 1;
			}else{
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
});
</script>
</head>
<body>
	<div class="homeSitterlist">
	</div>
</body>
</html>