<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css'
	href='${contextPath}/resources/css/datepicker.css' />
<link rel='stylesheet' type='text/css'
	href='${contextPath}/resources/css/homeSitter.css' />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/index.css">

<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel='stylesheet'
	href='${contextPath}/resources/css/phReservation_modal.css' />

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/moment.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/index.js"></script>


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

.slider {
	width: 200px;
	margin: 50px auto;
}

.slick-slide {
	margin: 10px;
}

.slick-slide img {
	width: 80%;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.slick-slide {
	margin-left: 0;
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: .5;
}

.slick-current {
	opacity: 1;
}

.lazy slider slick-initialized slick-slider slick-dotted {
	margin-left: 0;
}

.review {
	float: left;
	width: 50%;
	margin: auto 0;
}

.review .fieldview .subReview {
	display: inline-block;
	width: 45%;
	margin: auto 0;
	min-height: 400px;
	border: none;
}

.review .fieldview {
	border: 5px solid #ddd;
	border-radius: 5px;
	padding: 5px;
	min-height: 200px;
}

.modal-table {
	height: auto;
	margin-top: -300px;
}

.review .fieldview legend {
	background: #40bf9f;
	color: #fff;
	padding: 5px 10px;
	font-size: 20px;
	border-radius: 5px;
	box-shadow: 0 0 0 5px #ddd;
	margin-left: 20px;
}

.review.review .fieldview p {
	text-align: right;
	padding-right: 10px;
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

.inputGroup {
	font-family: "Fira Sans", sans-serif;
	background-color: cornsilk;
	display: block;
	margin: 10px 0;
	position: relative;
}

.inputGroup label {
	padding: 12px 30px;
	width: 100%;
	display: block;
	text-align: left;
	color: #3c454c;
	cursor: pointer;
	position: relative;
	z-index: 2;
	transition: color 200ms ease-in;
	overflow: hidden;
}

.inputGroup label:before {
	width: 10px;
	height: 10px;
	border-radius: 50%;
	content: "";
	background-color: #40bf9f;
	position: absolute;
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%) scale3d(1, 1, 1);
	transform: translate(-50%, -50%) scale3d(1, 1, 1);
	transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
	opacity: 0;
	z-index: -1;
	box-sizing: inherit;
}

.inputGroup label:after {
	width: 40px;
	height: 40px;
	content: "";
	border: 2px solid #d1d7dc;
	background-color: #fff;
	background-image:
		url("data:image/svg+xml,%3Csvg width='32' height='32' viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M5.414 11L4 12.414l5.414 5.414L20.828 6.414 19.414 5l-10 10z' fill='%23fff' fill-rule='nonzero'/%3E%3C/svg%3E ");
	background-repeat: no-repeat;
	background-position: 6px 6px;
	border-radius: 50%;
	z-index: 2;
	position: absolute;
	right: 30px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	cursor: pointer;
	transition: all 200ms ease-in;
}

.inputGroup input:checked ~ label {
	color: #fff;
}

.inputGroup input:checked ~ label:before {
	-webkit-transform: translate(-50%, -50%) scale3d(56, 56, 1);
	transform: translate(-50%, -50%) scale3d(56, 56, 1);
	opacity: 1;
	box-sizing: inherit;
}

.inputGroup input:checked ~ label:after {
	background-color: #54e0c7;
	border-color: #54e0c7;
	box-sizing: inherit;
}

.inputGroup input {
	width: 32px;
	height: 32px;
	order: 1;
	z-index: 2;
	position: absolute;
	right: 30px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	cursor: pointer;
	visibility: hidden;
}

.radioForm {
	padding: 0 16px;
	max-width: 550px;
	margin: 50px auto;
	font-size: 18px;
	font-weight: 600;
	line-height: 36px;
}

*, *::before, *::after {
	box-sizing: inherit;
}

.modal-modify {
	box-sizing: border-box;
}
</style>

<script type="text/javascript">

// //=========펫선택=====================================
// function petSelect(){
// 	// 화면에서 지우기
// 		$("#reply-modal").hide();
// 		$("#starRev").children('span').removeClass('on');
// 		$("#modal-name").val("");
// 		$("#modal-contact").val("");
// 		$("#modal-star").val("");
// 		$("#modal-img").attr("src","${contextPath}/resources/img/aa.jpg");
// 	//=====================
//         var radioName = $('input[name="radio"]:checked');
//         radioId= radioName.attr('id');
// 	    var rasioNm = $("label[for='"+radioId+"']").text();
// 	    petLoading();
// 	alert(rasioNm);
// }

	$(function() {
		
// 			initialize();
		var paramsArr = [];
		function petLoading(){
		}

		// //=========펫선택버튼=========
		$('.petSelectButton').click(function() {
			if($('input[name="radio"]:checked').val() ==null){
				alert("펫을 선택해주세요.");
			}else{
				// 화면에서 지우기
				$("#reply-modal").hide();
				$("#starRev").children('span').removeClass('on');
				$("#modal-name").val("");
				$("#modal-contact").val("");
				$("#modal-star").val("");
				$("#modal-img").attr("src","${contextPath}/resources/img/aa.jpg");
			//=====================
				
		        var radioName = $('input[name="radio"]:checked');
		        radioId= radioName.attr('id');
			    var rasioNm = $("label[for='"+radioId+"']").text();
				$('.petInfo').text(rasioNm);
				$('<label class="petCount">'+rasioNm+'</label>').appendTo($('.petList'));
				$('<br>').appendTo($('.petList'));
			}
		});
// 		=========모달!!=============================================
			$('.pSmodalButton').click(function() {
				if($("label[class=petCount]").length<($('.quantity').val()*1)){
				modalOpen();					
				}else{
					alert(($('.quantity').val()*1)+"마리만 선택할 수 있습니다.");
				}
			});
			//나이 구하기

			function modalOpen() {
				console.log($("#groupid").val()+"=="+$("#number").val())
				var urll = "";
				if($("#groupid").val()=="phr_num"){
					urll = "getModalPH";
				} else if($("#groupid").val()=="hsr_num"){
					urll = "getModalHS";
				}else if($("#groupid").val()=="vsr_num"){
					urll = "getModalVS";
				} else if($("#groupid").val()=="c_num"){
					urll = "getModalC";
				}
				console.log(urll)
				
				$.ajax({
					url: "${contextPath}/comment/"+urll ,
					data:{
						num: $("#number").val()
					},
					dataTpe:"JSON",
					success: function(data) {
						console.log(data)				
						$("#modal-name").val(data.name);
						$("#modal-contact").val(data.contact);
						if(data.star != null){
							$("#starTr").show();
							$("#modal-star").val(data.star+"점");
						} else{
							$("#starTr").hide();
							$("#reviewTr").hide();
						}
						rstnum = data.number;
						if(data.fileName != null){
							$("#modal-img").attr("src","${contextPath}/comment/image?fileName="+data.filename)
						} else{
							$("#modal-img").attr("src","${contextPath}/resources/img/aa.jpg")
						}
						var rststar = parseInt(data.star /0.5) 
						console.log(rststar)
						$("#star"+rststar).addClass('on').prevAll('span').addClass('on');
						
						if(data.address != null){
							$("#addressTr").show();
							document.getElementById("modal-address").innerHTML=(data.address);
						} else{
							$("#addressTr").hide();
						}
						
						
						$("#atag").on('click', function() {
							if($("#groupid").val()=="phr_num"){
								$("#atag").attr('href',"${contextPath}/petHotel/petHotelView?ph_num="+rstnum)
							} else if($("#groupid").val()=="hsr_num"){
								////여기 채우기ㅣㅣㅣ**********************************************
							}else if($("#groupid").val()=="vsr_num"){
								////여기 채우기ㅣㅣㅣ**********************************************
							}
						})
						
					},error: function() {
			
					}
				})
				$("#reply-modal").show();

				$("#modal-close").on("click", function() {
					$("#reply-modal").hide();
					$("#starRev").children('span').removeClass('on');
					$("#modal-name").val("");
					$("#modal-contact").val("");
					$("#modal-star").val("");
					$("#modal-img").attr("src","${contextPath}/resources/img/aa.jpg");
					document.getElementById("modal-address").innerHTML=("");
				});
			}
			//=========모달!!=============================================
		
		//datepicker
		var datepickerStart = $('#chkin')
				.datepicker(
						{
							dateFormat : 'yy년mm월dd일',
							minDate : moment('yy-mm-dd').toDate(),
							onSelect : function(selected) {
								datepickerEnd.datepicker('option', 'minDate',
										selected);

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
		var datepickerEnd = $('#chkout').datepicker({
			dateFormat : 'yy년mm월dd일',
			minDate : moment('yy-mm-dd').toDate()
		});

		
		var user_num = <%=session.getAttribute("user_num") %>		
// 		$.ajax({
// 			url : "${contextPath}/petHotel/petchk",
// 			data : {
// 				c_num : user_num
// 			},
// 			dataType : "json",
// 			success : function(data) { 
// 				$("#petL").find("option").remove();
// 				for ( var i in data.pL) {
// 				// 						alert(data.pL[i].p_num)
// 				var op = '<option value=\"'
// 				op += (data.pL[i].p_num)
// 				op += '\" title=\"'
// 				op += (data.pL[i].p_name)
// 				op += '\">'
// 				op += (data.pL[i].p_name)
// 				op += '</option>'
// 				$(op).appendTo("#petL");
// 				}
// 			},
// 			error : function() {
// 				alert("실패");
// 			}
// 		});

		var phnum = <%=request.getParameter("ph_num")%>
		$.ajax({
			url : "${contextPath}/petHotel/phchk",
			data : {
				ph_num : phnum
			},
			dataType : "json",
			success : function(data) {
				var inputp_num = '<input type="text" id="ph_name" value="'+ data.ph_name +'">'
				
				$(inputp_num).appendTo("#rrrr");
			},
			error : function() {
				alert("실패");
			}
		});
		
	

		//추가버튼
		$("#addBtn").on("click", function() {
			var detailParam = $(this).parent().parent().serialize();
			var dateStart = moment(datepickerStart.datepicker('getDate'));
			var dateEnd = moment(datepickerEnd.datepicker('getDate'));
			if (dateStart.isValid() && dateEnd.isValid()) {
				detailParam.chkin = dateStart.format('YYYY-MM-DD');
				detailParam.chkout = dateEnd.format('YYYY-MM-DD');
			}
			add(dateStart, dateEnd);
		})
		

		//제출버튼(예약)
		$("#btnSubmit").on("click",function() {
			$("#rst tr").not('tr:first').each(
					function() {
						var param = {};
						param.c_num = <%=session.getAttribute("user_num") %>
	param.p_num = $(this)
														.find('td')
														.find(
																"input[id='p_num']")
														.val();
												param.ph_num = $(this).find(
														'td').find(
														"input[id='ph_num']")
														.val();
												param.phr_chkin = $(this)
														.find('td')
														.find(
																"input[id='phr_chkin']")
														.val();
												param.phr_chkout = $(this)
														.find('td')
														.find(
																"input[id='phr_chkout']")
														.val();
												console.log(param)
												paramsArr.push(param);
											})

							var arrData = JSON.stringify(paramsArr)

							console.log(arrData)
							$.ajax({
								url : "${contextPath}/petHotel/resPetHotel",
								data : {
									"str" : arrData
								},
								type : "post",
								dataType : "JSON",
								success : function(rst) {
									alert("예약성공")
								},
								error : function(rst) {
									alert("중복되는 예약이 있습니다 다시 확인해주세요:)")
								}
							});
						});
	})

	var count = 0;
	function add(dateStart, dateEnd) {
		var ds = dateStart.format('YYYY-MM-DD')
		var de = dateEnd.format('YYYY-MM-DD')
		// 		var cname = $("#cnum").find("option:selected").attr("title");
		var pname = $("#petL").find("option:selected").attr("title");

		var table = $("#rst");
		var tr = $("<tr>");

		var td3 = $("<td>").append(
				'<input type="hidden" id="p_num" value="' + $("#petL").val()
						+ '">' + pname);
		var td5 = $("<td>").append(
				'<input type="hidden" id="ph_num" value="' + $("#phnum").val()
						+ '">' + $("#ph_name").val());
		var td7 = $("<td>").append(
				'<input type="text" id="phr_chkin" value="'+ ds + '">');
		var td8 = $("<td>").append(
				'<input type="text" id="phr_chkout" value="'+ de + '">');
		var btn = $("<button>삭제</button>")

		tr.append(td3);
		tr.append(td5);
		tr.append(td7);
		tr.append(td8);
		tr.append($("<td>").append(btn));
		(function() {
			btn.on("click", function() {
				$(this).parent().parent().remove();
			})
		})();
		table.append(tr);
	}
</script>

<title>petHotelResForm</title>

</head>
<body>
	<div class="container">
		<header>
			<a href="#"><img src="${contextPath}/resources/img/logo.jpg"
				class="anchor_logo"></a>

			<div class="header_Btn" id="sessioncheck">
				<sec:authorize access="isAnonymous()">
					<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
					<a class="btn_Join" href="${contextPath}/member/join">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<label id="principal" style="display: none;"><sec:authentication
							property="principal" /></label>

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
				<li class='last'><a href='#' style="font-size: 17px">MY
						PAGE</a></li>
				<li class='last'><a href='#' style="font-size: 17px">Q&A</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container" >
		<div
			style="margin: 100px; border: 2px solid darkgray; padding: 50px; border-radius: 4px;">
<div style="text-align: center">
			<div style="font-size: 20px; display: inline-block">
				<div
					style="text-align: left; float: left; border: 1px solid darkgray; border-radius: 4px; padding: 15px; margin-right: 50px">
					<label style="font-weight: bold;">체크인: </label>&nbsp;<label
						class="chkin">${phr_chkin} </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label style="font-weight: bold">체크아웃: </label>&nbsp;<label
						class="chkout">${phr_chkout }&nbsp;&nbsp;</label> &nbsp;&nbsp; <label
						class="totalDays" style="">(총 ${totalDays}박)</label>&nbsp;&nbsp;
				</div>
				<div
					style="text-align: left; float: left; border: 1px solid darkgray; border-radius: 4px; padding: 15px;">
					<label class="totalDays" style="float: right">반려견
						${quantity} 마리</label>
				</div>
			</div>
			<br> <br>
			<div class="petAddForm">

				<br>
				<div class="PriceAndSize" style="">
					<div
						style="width: 400px; margin-left: 160px; border: 1px solid; border-radius: 4px; padding: 30px; height: auto;">
				<div>
					<button class="pSmodalButton">펫선택</button>
				</div>
				<br>
				<div class="petList"></div>
						<br>
						<div class="night" style="display: inline-block; width: 350px">
							<div class="nightCount" style="text-align: left; float: left">${oneNightValue}원
								X ${totalDays}</div>
							<div class="countPrice" style="float: right">
								<span class="nightCountPrice">${nightCountValue }</span>
							</div>
						</div>
						<hr style="width: 400px">
						<div class="night" style="display: inline-block; width: 350px">
							<div class="nightCount" style="text-align: left; float: left">반려견
								추가</div>
							<div class="countPrice" style="float: right">
								<span class="nightCountPrice">${petAddValue }</span>
							</div>
						</div>
						<hr style="width: 400px">
						<div class="night" style="display: inline-block; width: 350px">
							<div class="nightCount" style="text-align: left; float: left">총
							</div>
							<div class="countPrice" style="float: right">
								<span class="nightCountPrice">${totalValue }</span>
							</div>
						</div>
					</div>
				</div>
			</div>
</div>
			<%-- 			<div ><label style="font-weight: bold">호텔명:</label> &nbsp; <label>${ph.ph_name} ${phrm.phrm_name }</label></div> asdasd--%>
<br>
<br>
		<div>
			<h4>예약요청 전 꼭 확인해주세요!</h4>
			<ul>
				<li>* 예약을 위해 강아지에 대한 내용을 돌보미에게 상세히 적어주세요.</li>
				<li>* 예약완료를 위해 돌보미의 결제요청 후 2시간 이내로 입금해주셔야합니다. (늦어질 경우 도그메이트
					고객센터로 연락주세요.)</li>
				<li>* 사전만남은 예약 완료 후 진행하실 수 있으며, 환불은 예약 3일전까지 100% 가능합니다.</li>
				<li>* 개인 연락처를 공유하지마세요. 예약이 완료되면 돌보미의 연락처를 확인하실 수 있습니다.</li>
				<li>* 메시지 내용은 안전거래 등의 목적으로 회사가 열람, 수집할 수 있습니다.</li>
			</ul>
		</div>
		<textarea name="hsr_message"
			placeholder="김수연 돌보미에게 예약요청을 위해 메시지를 남겨주세요." maxlength="4000"
			id="txtMESSAGE" style="margin: 0px; width: 700px; height: 126px;"></textarea>
			<br>
		<div>
			<div style="margin-bottom:15px">도그메이트를 이용하시는 이유에 대해 알려주세요!</div>
			<div>
				<select name="hsr_purpose">
					<option value="여행">여행</option>
					<option value="출장">출장</option>
					<option value="회사업무 (워크샵, 야근 등등)">회사업무 (워크샵, 야근 등등)</option>
					<option value="집안행사">집안행사</option>
					<option value="혼자 있는 시간동안 잠시 맡기기 위해">혼자 있는 시간동안 잠시 맡기기 위해</option>
					<option value="기타">기타</option>
				</select>
			</div>
		</div>
		<ul>
			<li>요청 시 잘못된 정보를 전달할 경우 이로인해 발생되는 문제에 대한 책임은 의뢰인 본인에게 있습니다.</li>
			<li>'예약 요청'을 클릭하면 서비스 총액을 지불하는 것과 서비스 약관, 환불정책에 동의하는 것입니다.</li>
			<li>돌보미가 예약 요청을 수락해야 결제를 진행 할 수 있으며, 24시간 이내에 돌보미가 요청에 대한 응답을 할
				것 입니다.</li>
		</ul>
			<br>
			<hr>
			<div>
				<button id="btnSubmit">예약요청</button>
			</div>
		</div>


		<!-- ///////////////////////////////////////////////////////////////모달 -->
		<div class="modal-modify" id="reply-modal">
			<!-- css 적용 하기 위한 경우 class -->

			<!-- 스크립트 요소를 직접 조작해야 하는경우 id -->
			<div class="modal-table" id="modal-table">
				<div class="close" id="modal-close">&times;</div>
				<div class="radioForm">
					<c:forEach items="${petList}" var="pL" varStatus="pLstatus">
						<%-- 									<li data-thumb="${contextPath}/petHotel/image?fileName=${fn}"><img src="${contextPath}/petHotel/image?fileName=${fn}" style="width: 680px; height: 580px;" /></li> --%>
						<input type="hidden" value="${pL.p_num}">
						<input type="hidden" value="${quantity}" class="quantity">
						<div class="inputGroup">
							<input id="radio${pLstatus.count}" name="radio" type="radio" />
							<label class="petListLabel" for="radio${pLstatus.count}">${pL.p_name}
								${pL.p_sex} ${pL.p_weight} ${pL.age}살 </label>
						</div>
					</c:forEach>
					<input type="button" value="선택" class="petSelectButton">
				</div>
			</div>
		</div>
	</div>
</body>
</html>