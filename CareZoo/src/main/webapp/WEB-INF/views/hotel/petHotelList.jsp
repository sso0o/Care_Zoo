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
<title>petHotelList</title>
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
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- 폰트 -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style type="text/css">
/* -------카카오 상담버튼------- */
body{
	font-family: 'Noto Sans KR', sans-serif;
}
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

.petHotel {
	cursor: pointer;
}

.petHotel:hover {
	outline: 1px solid aqua;
}

.btn-my {
	color: #40bf9f;
	background-color: #fff;
	border-color: #40bf9f;
}

.btn-my:hover {
	color: #fff;
	background-color: #40bf9f;
	border-color: #40bf9f;
}

.btn {
	width: 265.5px;
	display: inline-block;
	font-weight: 400;
	vertical-align: middle;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid;
	padding: .375rem .75rem;
	font-size: 1.2rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	text-decoration: none;
}


#subtbl_1,#subtbl_2,#subtbl_3{
width:1072px;
height:100px;
border-bottom-left-radius:10px;
border-bottom-right-radius:10px;
opacity:8;
}
#subtbl_1:after,#subtbl_2:after,#subtbl_3:after{
border-top:0 solid transparent;
border-left:10px solid transparent;
border-right:10px solid transparent;
border-bottom:10px solid pink;
position:absolute;
top:21px;left:200px;
}

.menu>ul{
height:45px;

}


</style>
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


<script type="text/javascript">

	var i = 0;
	var searchSwitch = 0;
	$(document)
			.ready(
					function() {
						
						//----카카오 1:1상담
						//<![CDATA[
						// 사용할 앱의 JavaScript 키를 설정해 주세요.
						Kakao.init('d5215a661c44ab13805d6f04adeddadb');
						// 플러스친구 1:1채팅 버튼을 생성합니다.
						Kakao.PlusFriend.createChatButton({
						  container: '#plusfriend-chat-button',
						  plusFriendId: '_QuCiT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
						});
						//]]>
						//----카카오 1:1상담	
						
						
					
						//datepicker동작

						//state 검색 폼 전달
						//=====================================================================================================//
						$("#datepicker").datepicker({
							minDate : 0
						});
						var datepickerStart = $('.col-dates .pull-left')
								.datepicker(
										{
											dateFormat : 'yy-mm-dd',
											minDate : 0,
											onSelect : function(selected) {
												var endDay = new Date(selected);
												endDay
														.setDate(endDay
																.getDate() + 1);

												datepickerEnd.datepicker(
														'option', 'minDate',
														endDay);

												if (datepickerEnd
														.prop('disabled')) {
													datepickerEnd
															.datepicker(
																	'setDate',
																	selected);
												} else if (!datepickerEnd.val()) {
													setTimeout(
															$
																	.proxy(
																			datepickerEnd.datepicker,
																			datepickerEnd,
																			'show'),
															50);
												}
											}
										});

						if (moment('yyyy-mm-dd').toDate() == null) {
							var datepickerEnd = $('.col-dates .pull-right')
									.datepicker({
										dateFormat : 'yy-mm-dd',
										minDate : moment('yy-mm-dd').toDate()
									});
						} else {
							var datepickerEnd = $('.col-dates .pull-right')
									.datepicker({
										dateFormat : 'yy-mm-dd',
										minDate : 0
									});
						}
						// 						$("form").on("submit", function() {
						// 				// 			event.preventDefault();
						// 							alert(datepickerStart
						// 									.datepicker('getDate'));
						// // 							var stateParam = $('input[name=ph_address]:checked').serialize();
						// 							var detailParam = $("form").serialize();
						// 														var dateStart = moment(datepickerStart
						// 																.datepicker('getDate'));
						// 														var dateEnd = moment(datepickerEnd
						// 																.datepicker('getDate'));
						// 														if (dateStart.isValid() && dateEnd.isValid()) {
						// 															detailParam.phr_chkin = dateStart
						// 																	.format('YYYY-MM-DD');
						// 															detailParam.phr_chkout = dateEnd
						// 																	.format('YYYY-MM-DD');
						// 														}else{
						// 															alert("날짜를 선택해주세요.");
						// 															}
						// // 							alert("stateParam submit : " + encodeURI(stateParam));

						// 							alert("d"+detailParam);
						// 							alert("phr"+detailParam.phr_chkin);
						// 							alert("detailParam submit : " + encodeURI(detailParam));

						// 			$.ajax({
						// 				url : "${contextPath}/petHotel/petHotelSearch",
						// 				data : stateParam + '&' + detailParam,
						// 				// 				data : stateParam,
						// 				type : "get",
						// 				dataType : "json",
						// 				success : function(d) {
						// 					if (d) {
						// 						($(".pethotelList").children()).remove();
						// 						console.log("result : " + d);
						// 						for ( var i in d) {

						// 							// 							var table = $('<table>');
						// 							// 							$('<tr>').appendTo(table);
						// 							// 							$('<td>)').text(d[i].HSL_FILENAME).appendTo(table);
						// 							// 							$('<td>)').text(d[i].HSL_ADDRESS).appendTo(table);
						// 							// 							$('<td>)').text(d[i].HSL_CHKIN).appendTo(table);

						// 							// 							$('<td>)').text(d[i].HSL_CHKOUT).appendTo(table);
						// 							// 							$('<td>)').text(d[i].HS_NAME).appendTo(table);
						// 							// 							$('</tr>').appendTo(table);
						// 							// 							$('</table>').appendTo(table);
						// // 							$(".pethotelList").append(table);
						// 							var div1 = $('<div style="border: 1px solid; margin: 50px; height: 350px;">');
						// 							var div2 = $('<div style="width: auto; display: inline-block display:inline; float: left;">').appendTo(div1);
						// // 							var div3 = $('<div class="item">').text(d[i].ph_name).appendTo(div2);
						// 							var div3 = $('<div class="item">').appendTo(div2);
						// 							var div4 = $('<div class="clearfix" style="max-width: 350px;">').appendTo(div3);
						// 							var fileList = $('<ul class="image-gallery" class="gallery list-unstyled cS-hidden">').appendTo(div4);

						// 							for ( var a in d[i].ph_filesName) {
						// 								console.log("2222222 : " + d[i].ph_filesName);
						// // 								var fileName = ('<li data-thumb="${contextPath}/petHotel/image?fileName='+(d[i].ph_filesName)[a]+'>');
						// // 								var fileName= $('<li data-thumb="${contextPath}/petHotel/image?fileName='+(d[i].ph_filesName)[a]+'>');
						// 								var imgli=$("<li data-thumb='${contextPath}/petHotel/image?fileName="+d[i].ph_filesName[a]+"'>").appendTo(fileList);
						// 								$("<img style='width: 350px; height: 350px;' src='${contextPath}/petHotel/image?fileName="+d[i].ph_filesName[a]+"'/>").appendTo(imgli);

						// // 								fileName
						// // 								fileName += (d[i].ph_filesName)[a];
						// // 								fileName += '></li>';
						// // 								fileList.append(fileName);
						// // 								fileName.appendTo(fileList);
						// // 								table += fileName;

						// 							}

						// 							$(".pethotelList").append(div1);
						// 							fileList.lightSlider({
						// 								isthumb : false, // 이 부분이 제가 추가한 옵션 true 이면 썸네일을 표시하고, false 이면 표시하지 않습니다
						// 								gallery : true,
						// 								item : 1,
						// 								thumbItem : 9,
						// 								slideMargin : 0,
						// 								speed : 1000,
						// 								pause : 4000,
						// 								auto : true,
						// 								loop : true,
						// 								addClass : div4,
						// 								onSliderLoad : function() {
						// 									fileList.removeClass('cS-hidden');
						// 								}
						// 							});

						// 						}
						// 					} else {
						// 						alert("오류발생!!");
						// 					}
						// 				},
						// 				error : function(request, status, error) {
						// 					alert(" error = " + request, status, error);
						// 				}

						// 			});// ajax

						// 			return false;
						// 						});

						//=====================================================================================================//

						// 				$('.image-gallery').lightSlider({
						// 					isthumb : false, // 이 부분이 제가 추가한 옵션 true 이면 썸네일을 표시하고, false 이면 표시하지 않습니다
						// 					gallery : true,
						// 					item : 1,
						// 					thumbItem : 9,
						// 					slideMargin : 0,
						// 					speed : 1000,
						// 					pause : 4000,
						// 					auto : true,
						// 					loop : true,
						// 					addClass : $('.clearfix'),
						// 					onSliderLoad : function() {
						// 						$('.image-gallery').removeClass('cS-hidden');
						// 					}
						// 				});

						//검색탭
						// 				slideImage();

						var isMenu1 = false;
						$("#menu_1").on(
								"click",
								function() {

									if (!isMenu1) {
										$("#subtbl_1").css("display", "block");
										$("#subtbl_1").siblings().css(
												"display", "none");
									} else {
										$("#subtbl_1").css("display", "none");
									}
									isMenu1 = !isMenu1;
									isMenu2 = false;
									isMenu3 = false;
								});

						var isMenu2 = false;
						$("#menu_2").on(
								"click",
								function() {
									if (!isMenu2) {
										$("#subtbl_2").css("display", "block");
										$("#subtbl_2").siblings().css(
												"display", "none");
									} else {
										$("#subtbl_2").css("display", "none");
									}
									isMenu2 = !isMenu2;
									isMenu1 = false;
									isMenu3 = false;
								});

						var isMenu3 = false;
						$("#menu_3").on(
								"click",
								function() {
									if (!isMenu3) {
										$("#subtbl_3").css("display", "block");
										$("#subtbl_3").siblings().css(
												"display", "none");
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
							$('.petHotelList').empty();
							i = 0;
						});

						var breaker = 0;
						function ajaxSucessLoading(phList) {

							console.log("성겅!");
							for (i; breaker < 8; i++) {
								console.log(i);
								if (breaker < 7) {

									var petHotelDiv = $('<div class="petHotel" onclick="location.href=\'${contextPath}/petHotel/petHotelView?ph_num='
											+ phList[i].ph_num
											+ '\'\"style="border: 1px solid; margin: 50px; height: 355px;">');
									//				asdasd	var petHotelDiv = $('<div class="petHotel" style="border: 1px solid; margin: 50px; height: 350px;">');
									var petHotelDiv2 = $('<div style="width: auto; display: inline-block display:inline; float: left; "> ');
									petHotelDiv.append(petHotelDiv2);
									var itemDiv = $('<div class="item" style="heigth:350;width:350px">');
									petHotelDiv2.append(itemDiv);
									var clearfixDiv = $('<div class="clearfix" style="max-width: 350px;">');
									itemDiv.append(clearfixDiv);
									var imagegalleryDiv = $('<ul style="width:350px;">');
									clearfixDiv.append(imagegalleryDiv);

									for ( var a in phList[i].ph_filesName) {
										// 								var fileName = ('<li data-thumb="${contextPath}/petHotel/image?fileName='+(d[i].ph_filesName)[a]+'>');
										// 								var fileName= $('<li data-thumb="${contextPath}/petHotel/image?fileName='+(d[i].ph_filesName)[a]+'>');
										var imgli = $("<li data-thumb='${contextPath}/petHotel/image?fileName="
												+ phList[i].ph_filesName[a]
												+ "'>");
										imagegalleryDiv.append(imgli);
										$(
												"<img style='width: 350px; height: 350px;' src='${contextPath}/petHotel/image?fileName="
														+ phList[i].ph_filesName[a]
														+ "'/>")
												.appendTo(imgli);

										// 								fileName
										// 								fileName += (d[i].ph_filesName)[a];
										// 								fileName += '></li>';
										// 								fileList.append(fileName);
										// 								fileName.appendTo(fileList);
										// 								table += fileName;

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
											imagegalleryDiv
													.removeClass('cS-hidden');
										}
									});

									var aArDiv = $('<div style="">');
									$('<span>').text(phList[i].ph_name)
											.appendTo(aArDiv);
									$('<div>' + phList[i].ph_address
													+ phList[i].ph_d_address
													+ '</div>').appendTo(aArDiv);
									var minAndMaxPrice = $('<div>');
									$('<span>').text(phList[i].ph_minPrice*1)
									.appendTo(minAndMaxPrice);
									$('<span>').text(phList[i].ph_maxPrice*1)
									.appendTo(minAndMaxPrice);
									console.log("minPrice: "+phList[i].ph_minPrice*1);
									console.log("maxPrice: "+phList[i].ph_maxPrice*1);
									minAndMaxPrice.appendTo(aArDiv);
									var reviewDiv = $('<div>');
									$('<span>').text(
											'후기: ' + phList[i].ph_c_count
													+ '개 '
													+ phList[i].ph_avgStar)
											.appendTo(reviewDiv);
									reviewDiv.appendTo(aArDiv);
									aArDiv.appendTo(petHotelDiv);
									$('.petHotelList').append(petHotelDiv);
									breaker = breaker + 1;
								} else {
									breaker = 0;
									break;
								}
							}
						}

						// 					var sForm=$('<div class="selectForm" style="text-align:center">');
						// 						$('<label>').text("방: ").appendTo(sForm);
						// 						var roomSelectBox = $('<select class="rSelect">');

						// 						roomSelectBox.on("change",function(){
						// 							$('.drawResForm').remove();

						// 							if ($('.rSelect option:selected').val() == "required") {

						// 							} else {
						// 								var roomNum = $('.rSelect option:selected').val();
						//qwewqewqewqewqewq
						loadingPage();
						function loadingPage() {
							var detailParam = $("form").serialize();
							var stateParam = $('input[name=ph_address]:checked')
									.serialize();
							var petHotelListDiv = $('.petHotelList');

							$
									.ajax({
										url : "${contextPath}/petHotel/petHotelListLoading",
										data : stateParam + '&' + detailParam
												+ '&searchSwitch='
												+ searchSwitch,
										dataType : "JSON",
										success : function(phList) {
											var phListLenghth = phList
											if (phListLenghth.length == 0) {
												$('<span>')
														.text(
																"검색결과가 없슴둥..힝구 (이미지)")
														.appendTo(
																$('.petHotelList'));
											}

											ajaxSucessLoading(phList);
										},
										error : function(request, status, error) {
											console.log(" error = " + request,
													status, error);
										}
									})

						}

						// 								//search ajax
						// 								function searchPageLoading(){
						// 									var detailParam = $("form").serialize();
						// 									var stateParam = $('input[name=ph_address]:checked').serialize();
						// 									$.ajax({
						// 										url : "${contextPath}/petHotel/petHotelSearch",
						// 										data : stateParam + '&' + detailParam,
						// 										dataType : "JSON",

						// 									success : function(phList) {
						// 										alert("성공!");
						// 										ajaxSucessLoading(phList);
						// 									},
						// 									error : function() {
						// 										alert("데이터를 불러오는데 실패했습니다.")
						// 									}
						// 								})

						// 								}	

						// 							pet_max = (data.phrm_p_max)-(data.rcount); 
						// 								var resForm=$('<div>');
						// 								var PriceAndSize=$('<div class="PriceAndSize" style="text-align:center">');

						// 								$('<label for="color" style="display:none;">color</label>').appendTo(PriceAndSize);
						// 								resForm.addClass('drawResForm');
						// //		 						var selectbox = $('<select>');
						// 		 						var size=(data.phrm_pet_size).split(',');
						// //		 						for(var i=0;i<size.length; i++){
						// //		 						    console.log(i+":"+size[i]);
						// //		 						}
						// //		 						<label style="text-align: left">(1박 가격)</label><span>(kg선택)</span>
						// 							$('<br>').appendTo(resForm);
						// 								var selectbox = $('<select class="sizeSelect" style="text-align:center" onchange="sizePriceSetter('+data.phrm_price+','+data.phrm_m_price+','+data.phrm_l_price+')">');
						// 		 						$('<label class="oneNightPrice" style="text-align:center;font-size:20px">').text(numberWithCommas(data.phrm_price)).appendTo(PriceAndSize);
						// 		 						PriceAndSize.append('&nbsp;');
						// 		 						PriceAndSize.append('&nbsp;');
						// 		 						PriceAndSize.append('&nbsp;');
						// 		 						PriceAndSize.append('&nbsp;');
						// 								for(var i=0;i<size.length; i++){
						// 									if(size[i]=="소형견"){
						// 		 						$("<option value='"+size[i]+"'>소형견(5kg이하)</option>").appendTo(selectbox);
						// 									}else if(size[i]=="중형견"){
						// 		 						$("<option value='"+size[i]+"'>중형견(5~10kg)</option>").appendTo(selectbox);
						// 									}else{
						// 		 						$("<option value='"+size[i]+"'>대형견(15kg이상)</option>").appendTo(selectbox);
						// 									}
						// 								}
						// 								PriceAndSize.append(selectbox);
						// 		 						resForm.append(PriceAndSize);
						// 		 						$('<br>').appendTo(resForm);
						// 		 						//소형견 대형견 ,로 나눠서 3개로 만든다음에 select으로 만들어야함,,
						// 		 						$('<hr>').appendTo(resForm);
						// 		 						var nightCount=$('<div class="night" style="display:inline-block">');
						// 		 						$('<div class="nightCount" style="text-align:left; float:left">').text(days+"박: ").appendTo(nightCount);
						// 		 						var countPrice = $('<div class="countPrice" style="float:right">');
						// 		 						$('<span class="nightCountPrice">').text(numberWithCommas(data.phrm_price*days)).appendTo(countPrice);
						// 		 						$('<span>').text("원").appendTo(countPrice);

						// 		 						resForm.append(nightCount);
						// 		 						resForm.append(countPrice);
						// 		 						$('<hr>').appendTo(resForm);
						// 		 						var petCount=$('<div class="petCount" style="display:inline-block">');
						// 		 						$('<span>').text("반려견 추가: ").appendTo(petCount);

						// 		 						var pmButtonDiv=$('<div class="input-group">');
						// 		 						var minusButton = $('<input type="button" value="-" class="button-minus" data-field="quantity" >').appendTo(pmButtonDiv);
						// 		 						$('<input type="number" step="1" max="" value="0" name="quantity" class="quantity-field" readonly>').appendTo(pmButtonDiv);
						// 		 						var plusButton = $('<input type="button" value="+" class="button-plus" data-field="quantity">').appendTo(pmButtonDiv);
						// //		 						<div class="input-group">
						// //		 					  <input type="button" value="-" class="button-minus" data-field="quantity">
						// //		 					  <input type="number" step="1" max="" value="1" name="quantity" class="quantity-field">
						// //		 					  <input type="button" value="+" class="button-plus" data-field="quantity">
						// //		 						</div>
						// 							pmButtonDiv.on('click', '.button-plus', function(e) {
						// 							  incrementValue(e);
						// 							});

						// 							pmButtonDiv.on('click', '.button-minus', function(e) {
						// 							  decrementValue(e);
						// 							});
						// 		 						var petCountPrice = $('<div class="petCountPrice" style="float:right;height:66px;display:flex;">');
						// 		 						//추가하는거
						// 		 						$('<span class="petAddPrice" style="margin-top:30px;">').text("0").appendTo(petCountPrice);
						// 		 						$('<span style="margin-top:30px;">').text("원").appendTo(petCountPrice);
						// 		 						petCount.append(pmButtonDiv);
						// 		 						resForm.append(petCount);
						// 		 						resForm.append(petCountPrice);

						// 		 						$('<hr>').appendTo(resForm);

						// 		 						var total=$('<div class="total" style="display:inline-block">');
						// 		 						$('<span>').text("총 합계: ").appendTo(total);

						// 		 						var totalPrice = $('<div class="totalPriceDiv" style="float:right">');
						// 		 						$('<span class="totalPrice">').text(numberWithCommas(data.phrm_price*days)).appendTo(totalPrice);
						// 		 						$('<span>').text("원").appendTo(totalPrice);
						// 		 						resForm.append(total);
						// 		 						resForm.append(totalPrice);

						// 		 						$('<hr>').appendTo(resForm);

						// 		 						var reserButton=$('<div class="reserButton">');
						// 		 						$('<button id="test_btn1">예 약 하 기</button>').appendTo(reserButton);
						// 		 						resForm.append(reserButton);

						// 		 						$(".reservationForm").append(resForm);
						// 										$('#test').prev().css("color", "aqua");

						$(window).scroll(
								function() { //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
									if ($(window).scrollTop() >= $(document)
											.height()
											- $(window).height()) {
										loadingPage();
									}
								});
					});

	$(".petHotel").click(function() {
		location.href = '/index.do'
	});
</script>
<!-- 애견호텔 목록 -->
</head>
<body class="container">
	    <div class="container">
        <header>
            <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
            <br>
            <div class="header_Btn"> <a class="btn_Login" href="${contextPath}/loginForm">로그인</a> <a class="btn_Join" href="${contextPath}/member/joinForm">회원가입</a> </div>
        </header>
    </div>
    <nav>
        <div class='menu'>
            <ul style="">
                <li class='active sub'><a href='${contextPath}/sitter/main'>SITTER</a>
                    <ul>
                        <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a>
                            <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      -->
                        </li>
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
	<div>

		<form>
			<div>
				<a href="${contextPath}/petHotel/petHotelList" id="menu_0" class="btn btn-my" id="menu_0"
					style="text-align: center;">전체</a> <a href="#" class="btn btn-my"
					style="text-align: center;" id="menu_1">서울</a> <a href="#"
					class="btn btn-my" style="text-align: center;" id="menu_2">경기</a> <a
					href="#" class="btn btn-my" style="text-align: center;" id="menu_3">인천</a>
				<div>
					<div id="subtbl_0" style="display: none">
						<table>
							<tr>
								<td><input type="checkbox" name="ph_address" value="서울">
									<input type="checkbox" name="ph_address" value="경기"> <input
									type="checkbox" name="ph_address" value="인천"></td>
							</tr>
						</table>
					</div>
					<div id="subtbl_1" style="display: none; border: 1px solid">
						<table>
							<tr class="">
								<td id="check_container"><input type="checkbox"
									name="ph_address" id="state1" value="강남구"> <label
									for="state1">강남구</label> <input type="checkbox"
									name="ph_address" id="state2" value="강동구"> <label
									for="state2">강동구</label> <input type="checkbox"
									name="ph_address" id="state3" value="강북구"> <label
									for="state3">강북구</label> <input type="checkbox"
									name="ph_address" id="state4" value="강서구"> <label
									for="state4">강서구</label> <input type="checkbox"
									name="ph_address" id="state5" value="관악구"> <label
									for="state5">관악구</label> <input type="checkbox"
									name="ph_address" id="state6" value="광진구"> <label
									for="state6">광진구</label> <input type="checkbox"
									name="ph_address" id="state7" value="구로구"> <label
									for="state7">구로구</label> <input type="checkbox"
									name="ph_address" id="state8" value="금천구"> <label
									for="state8">금천구</label> <br> <input type="checkbox"
									name="ph_address" id="state9" value="노원구"> <label
									for="state9">노원구</label> <input type="checkbox"
									name="ph_address" id="state10" value="도봉구"> <label
									for="state10">도봉구</label> <input type="checkbox"
									name="ph_address" id="state11" value="동대문구"> <label
									for="state11">동대문구</label> <input type="checkbox"
									name="ph_address" id="state12" value="동작구"> <label
									for="state12">동작구</label> <input type="checkbox"
									name="ph_address" id="state13" value="마포구"> <label
									for="state13">마포구</label> <input type="checkbox"
									name="ph_address" id="state14" value="서대문구"> <label
									for="state14">서대문구</label> <input type="checkbox"
									name="ph_address" id="state15" value="서초구"> <label
									for="state15">서초구</label> <input type="checkbox"
									name="ph_address" id="state16" value="성동구"> <label
									for="state16">성동구</label> <br> <input type="checkbox"
									name="ph_address" id="state17" value="성북구"> <label
									for="state17">성북구</label> <input type="checkbox"
									name="ph_address" id="state18" value="송파구"> <label
									for="state18">송파구</label> <input type="checkbox"
									name="ph_address" id="state19" value="양천구"> <label
									for="state19">양천구</label> <input type="checkbox"
									name="ph_address" id="state20" value="영등포구"> <label
									for="state20">영등포구</label> <input type="checkbox"
									name="ph_address" id="state21" value="용산구"> <label
									for="state21">용산구</label> <input type="checkbox"
									name="ph_address" id="state22" value="은평구"> <label
									for="state22">은평구</label> <input type="checkbox"
									name="ph_address" id="state23" value="종로구"> <label
									for="state23">종로구</label> <input type="checkbox"
									name="ph_address" id="state24" value="중구"> <label
									for="state24">중구</label>  <input type="checkbox"
									name="ph_address" id="state25" value="중랑구"> <label
									for="state24">중랑구</label></td>
							</tr>
							<tr>
								<td>
									<input type="button"  class="search" value="찾기">
									<button type="reset">초기화</button>
								</td>
							</tr>
						</table>
					</div>
					<div id="subtbl_2" style="display: none; border: 1px solid" >
						<table>
							<tr>
								<td id="check_container"><input type="checkbox"
									name="ph_address" id="state26" value="고양시"><label
									for="state26">고양시</label> <input
									type="checkbox" name="ph_address" id="state27" value="과천시">
									<label
									for="state27">과천시</label>
									<input type="checkbox" name="ph_address" id="state28"
									value="광명시"><label
									for="state28">광명시</label> <input type="checkbox"
									name="ph_address" id="state29" value="광주시"><label
									for="state29">광주시</label> <input
									type="checkbox" name="ph_address" id="state30" value="구리시"><label
									for="state30">구리시</label>
									<input type="checkbox" name="ph_address" id="state31"
									value="군포시"><label
									for="state31">군포시</label> <input type="checkbox"
									name="ph_address" id="state32" value="김포시">
									<label
									for="state32">김포시</label> <input
									type="checkbox" name="ph_address" id="state33" value="남양주시">
									<label
									for="state33">남양주시</label>
									<input type="checkbox" name="ph_address" id="state34"
									value="동두천시"><label
									for="state33">동두천시</label> <input type="checkbox"
									name="ph_address" id="state35" value="부천시"><label
									for="state35">부천시</label> <br><input
									type="checkbox" name="ph_address" id="state36" value="성남시">
									<label
									for="state36">성남시</label>
									<input type="checkbox" name="ph_address" id="state37"
									value="수원시"><label
									for="state37">수원시</label> <input type="checkbox"
									name="ph_address" id="state38" value="시흥시"><label
									for="state37">시흥시</label> <input
									type="checkbox" name="ph_address" id="state39" value="안산시"><label
									for="state39">안산시</label>
									<input type="checkbox" name="ph_address" id="state40"
									value="안성시"><label
									for="state40">안성시</label> <input type="checkbox"
									name="ph_address" id="state41" value="안양시"><label
									for="state41">안양시</label> <input
									type="checkbox" name="ph_address" id="state42" value="양주시">
									<label
									for="state42">양주시</label>
									<input type="checkbox" name="ph_address" id="state43"
									value="여주시"><label
									for="state43">여주시</label> <input type="checkbox"
									name="ph_address" id="state44" value="오산시">
									<label
									for="state44">오산시</label> <input
									type="checkbox" name="ph_address" id="state45" value="용인시">
									<label
									for="state45">용인시</label>
									<input type="checkbox" name="ph_address" id="state46"
									value="의왕시"><br>
									<label
									for="state46">의왕시</label> <input type="checkbox"
									name="ph_address" id="state47" value="의정부시">
									<label
									for="state47">의정부시</label> <input
									type="checkbox" name="ph_address" id="state48" value="이천시">
									<label
									for="state48">이천시</label>
									<input type="checkbox" name="ph_address" id="state49"
									value="파주시">
									<label
									for="state49">파주시</label> <input type="checkbox"
									name="ph_address" id="state50" value="평택시">
									<label
									for="state50">평택시</label> <input
									type="checkbox" name="ph_address" id="state51" value="포천시">
									<label
									for="state51">포천시</label>
									<input type="checkbox" name="ph_address" id="state52"
									value="하남시"><label
									for="state52">하남시</label> <input type="checkbox"
									name="ph_address" id="state53" value="화성시"><label
									for="state53">화성시</label> <input
									type="checkbox" name="ph_address" id="state54" value="가평군"><label
									for="state54">가평군</label>
									<input type="checkbox" name="ph_address" id="state55"
									value="양평군"><label
									for="state55">양평군</label> <input type="checkbox"
									name="ph_address" id="state56" value="연천군"><label
									for="state56">연천군</label></td>
							</tr>
							<tr>
								<td>
									<input type="button"  class="search" value="찾기">
									<button type="reset">초기화</button>
								</td>
							</tr>
						</table>
					</div>
					<div id="subtbl_3" style="display: none; border: 1px solid">
<!-- 					<div id="subtbl_3"  class="custom-control custom-checkbox"> -->
						<table>
							<tr>
								<td id="check_container">
								

								<input type="checkbox"
									name="ph_address" id="state57" value="계양구"><label
									for="state57">계양구</label>
									 <input
									type="checkbox" name="ph_address" id="state58" value="남동구">
									<label
									for="state58">남동구</label>
									<input type="checkbox" name="ph_address" id="state59"
									value="동구"><label
									for="state59">동구</label> <input type="checkbox" name="ph_address"
									id="state60" value="미추홀구"><label
									for="state60">미추홀구</label> <input type="checkbox"
									name="ph_address" id="state61" value="부평구">
									<label
									for="state61">부평구</label> <input
									type="checkbox" name="ph_address" id="state62" value="서구">
									<label
									for="state62">서구</label>
									<input type="checkbox" name="ph_address" id="state63"
									value="연수구"><label
									for="state63">연수구</label> <input type="checkbox"
									name="ph_address" id="state64" value="중구"><label
									for="state64">중구</label> <input
									type="checkbox" name="ph_address" id="state65" value="강화군">
									<label
									for="state65">강화군</label>
									<input type="checkbox" name="ph_address" id="state66"
									value="옹진군"><label
									for="state66">옹진군</label></td>
							</tr>
							<tr>
								<td>
								<br>
								<br>
								<br>
									<input type="button"  class="search" value="찾기">
									<button type="reset">초기화</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div>
<!-- 				<table> -->
<!-- 					<tr> -->
<!-- 						<td><select name="listOption" -->
<!-- 							style="width: 100px; height: 25px;"> -->
<!-- 								<option value="star">별점순</option> -->
<!-- 								<option value="comments">후기순</option> -->
<!-- 						</select></td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
<br>
<br>

				<div class="main-wrap no-profile">
					<table>
						<tr class="col-dates">
							<th>예약일</th>
							<td><input type="text" class="pull-left" placeholder="시작 날짜"
								readonly="readonly" name="phr_chkin" /> <span>&gt;</span> <input
								type="text" class="pull-right" placeholder="마침 날짜"
								readonly="readonly" name="phr_chkout" /></td>
						</tr>

						<tr class="col-size">
							<th>반려견 크기</th>
							<td><select name="ph_pet_size" data-width="130px">
									<option value="" selected disabled hidden>==선택하세요==</option>
									<option title="소형견" value="소형견">소형견 (0~4.9kg)</option>
									<option title="중형견" value="중형견">중형견 (5~14.9kg)</option>
									<option title="대형견" value="대형견">대형견 (15kg 이상)</option>
							</select></td>
						</tr>
						<tr class="col-btn">
							<td>
								<input type="button"  class="search" value="찾기">
								<button type="reset">초기화</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>

		<div class="petHotelList">

			<%-- 			<c:forEach var="phList" items="${phList}"> --%>
			<%-- 				<div class="petHotel" onclick="location.href='${contextPath}/petHotel/petHotelView?ph_num=${phList.ph_num}'"style="border: 1px solid; margin: 50px; height: 350px;"> --%>
			<!-- 					<div style="width: auto; display: inline-block display:inline; float: left;"> -->
			<!-- 						<div class="item"> -->
			<!-- 							<div class="clearfix" style="max-width: 350px;"> -->
			<!-- 								<ul class="image-gallery" class="gallery list-unstyled cS-hidden"> -->
			<%-- 									<c:forEach items="${phList.ph_filesName}" var="fn"> --%>
			<%-- 										<li data-thumb="${contextPath}/petHotel/image?fileName=${fn}"><img src="${contextPath}/petHotel/image?fileName=${fn}" style="width: 350px; height: 350px;" /></li> --%>
			<%-- 									</c:forEach> --%>
			<!-- 								</ul> -->
			<!-- 							</div> -->
			<!-- 						</div> -->

			<!-- 						<br> -->

			<!-- 					</div> -->
			<!-- 					<div style=""> -->
			<%-- 						<span></span> <br> <a href="${contextPath}/petHotel/petHotelView?ph_num=${phList.ph_num}">${phList.ph_name}</a> <br> --%>
			<%-- 						<div>${phList.ph_address}${phList.ph_d_address}</div> --%>
			<!-- 						<div> -->
			<%-- 							<fmt:formatNumber value="${phList.ph_minPrice }" pattern="#,###" /> --%>
			<!-- 							~ -->
			<%-- 							<fmt:formatNumber value="${phList.ph_maxPrice }" pattern="#,###" /> --%>
			<!-- 						</div> -->
			<!-- 						<div> -->
			<%-- 							후기:${phList.ph_c_count}개 <br> ${phList.ph_avgStar } --%>
			<!-- 						</div> -->
			<!-- 					</div> -->


			<!-- 				</div> -->


			<%-- 			</c:forEach> --%>


		</div>
	</div>
   <div class="bottom-left alert" id="plusfriend-chat-button"></div>
	
</body>
</html>