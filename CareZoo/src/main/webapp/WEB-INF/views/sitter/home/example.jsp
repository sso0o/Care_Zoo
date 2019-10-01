<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* light slider*/
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

/*input number*/
.number-input input[type="number"] {
  -webkit-appearance: textfield;
  -moz-appearance: textfield;
  appearance: textfield;
}

.number-input input[type=number]::-webkit-inner-spin-button,
.number-input input[type=number]::-webkit-outer-spin-button {
  -webkit-appearance: none;
}

.number-input {
  margin-bottom: 3rem;
}

.number-input button {
  -webkit-appearance: none;
  background-color: transparent;
  border: none;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  margin: 0;
  position: relative;
}

.number-input button:before,
.number-input button:after {
  display: inline-block;
  position: absolute;
  content: '';
  height: 2px;
  transform: translate(-50%, -50%);
}

.number-input button.plus:after {
  transform: translate(-50%, -50%) rotate(90deg);
}

.number-input input[type=number] {
  text-align: center;
}

.number-input.number-input {
  border: 1px solid #ced4da;
  width: 10rem;
  border-radius: .25rem;
}

.number-input.number-input button {
  width: 2.6rem;
  height: .7rem;
}

.number-input.number-input button.minus {
  padding-left: 10px;
}

.number-input.number-input button:before,
.number-input.number-input button:after {
  width: .7rem;
  background-color: #495057;
}

.number-input.number-input input[type=number] {
  max-width: 4rem;
  padding: .5rem;
  border: 1px solid #ced4da;
  border-width: 0 1px;
  font-size: 1rem;
  height: 2rem;
  color: #495057;
}

@media not all and (min-resolution:.001dpcm) {
  @supports (-webkit-appearance: none) and (stroke-color:transparent) {

    .number-input.def-number-input.safari_only button:before,
    .number-input.def-number-input.safari_only button:after {
      margin-top: -.3rem;
    }
  }
}
</style>
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
		console.log(hslList);
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
<div class="def-number-input number-input safari_only">
 								  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
<!-- 								  <input class="quantity" min="0" name="quantity" value="1" type="number"> -->
								  <input type="number" class="quantity" min="0" max="5" name="hsr_numof_pet" id="hsr_numof_pet" value="0">
								  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
								</div>
		<div class="homeSitterlist">
		<c:forEach var="hslList" items="${hslList}">
			<div class = "homesitter" onclick="location.href='${contextPath}/home/view?hsl_num=${hslList.HSL_NUM}'"  style="border: 1px solid; margin: 50px; height: 350px;">
				<div style="width: auto; display: inline-block display:inline; float: left;">
					<div class="item">
						<div class="clearfix" style="max-width: 350px;">
							<ul class="image-gallery" class="gallery list-unstyled cS-hidden">
								<c:forEach items="${hslList.HSL_IMG_FILENAME}" var="fn">
									<li data-thumb="${contextPath}/home/image?fileName=${fn}">
										<img alt="사진이 엄슴" src="${contextPath}/home/image?fileName=${fn}" onclick="location.href='${contextPath}/home/view?hsl_num=${hslList.HSL_NUM}'" style="width: 350px; height: 350px;" />										
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
</body>
</html>