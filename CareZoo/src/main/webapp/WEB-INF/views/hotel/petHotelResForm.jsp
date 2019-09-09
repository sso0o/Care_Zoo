<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css'
	href='${contextPath}/resources/css/datepicker.css' />
<link rel='stylesheet' type='text/css'
	href='${contextPath}/resources/css/homeSitter.css' />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js"
	type="text/javascript"></script>

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
</style>

<script type="text/javascript">
	$(function() {
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
				thumbItem : 9,
				slideMargin : 0,
				speed : 500,
				auto : true,
				loop : true,
				onSliderLoad : function() {
					$('#image-gallery').removeClass('cS-hidden');
				}
			});
		})
		
		var paramsArr = [];

		//datepicker
		var datepickerStart = $('#chkin')
				.datepicker(
						{
							dateFormat : 'yy-mm-dd',
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
			dateFormat : 'yy-mm-dd',
			minDate : moment('yy-mm-dd').toDate()
		});

// 		$("#pullBtn").on("click", function() {
// 			var c_num = $(this).val();

// 			$.ajax({
// 				url : "${contextPath}/admin/petchk",
// 				data : {
// 					c_num : c_num
// 				},
// 				dataType : "json",
// 				success : function(data) {
// 					// 					console.log(data.pL)
// 					$("#petL").find("option").remove();
// 					for ( var i in data.pL) {
// 						// 						alert(data.pL[i].p_num)
// 						var op = '<option value=\"'
// 						op += (data.pL[i].p_num)
// 						op += '\" title=\"'
// 						op += (data.pL[i].p_name)
// 						op += '\">'
// 						op += (data.pL[i].p_name)
// 						op += '</option>'
// 						$(op).appendTo("#petL");
// 					}
// 				},
// 				error : function() {
// 					alert("실패");
// 				}
// 			});

// 		});

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
		$("#btnSubmit").on(
				"click",
				function() {
					$("#rst tr").not('tr:first').each(
							function() {
								var param = {};
								param.c_num = $(this).find('td').find(
										"input[id='c_num']").val();
								param.p_num = $(this).find('td').find(
										"input[id='p_num']").val();
								param.ph_num = $(this).find('td').find(
										"input[id='ph_num']").val();
								param.phr_chkin = $(this).find('td').find(
										"input[id='phr_chkin']").val();
								param.phr_chkout = $(this).find('td').find(
										"input[id='phr_chkout']").val();
								console.log(param)
								paramsArr.push(param);
							})

					var arrData = JSON.stringify(paramsArr)

					console.log(arrData)
					$.ajax({
						url : "${contextPath}/admin/resPetHotel",
						data : {
							"str" : arrData
						},
						type : "post",
						dataType : "JSON",
						success : function(rst) {
							alert("삽입성공")
						},
						error : function() {
							alert("삽입실패")
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
		var td3 = $("<td>").append('<input type="hidden" id="p_num" value="' + $("#petL").val() + '">'+pname);
		var td5 = $("<td>").append('<input type="hidden" id="ph_num" value="' + $("#phnum").val() + '">'+$("#phname").val());
		var td7 = $("<td>").append('<input type="text" id="phr_chkin" value="' + ds + '">');
		var td8 = $("<td>").append('<input type="text" id="phr_chkout" value="' + de + '">');
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
	<div>
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

	<div>
		<fieldset>
			<legend>예약정보</legend>

			<table id="list">
				<tr>
<!-- 					<th>불러오기</th> -->
					<th>펫</th>
					<th>펫호텔</th>
					<th>체크인</th>
					<th>체크아웃</th>
					<th>추가</th>
				</tr>
				<tr>
<!-- 					<td><input type="button" id="pullBtn" value="불러오기"></td> -->
					<td><select name="p_num" id="petL">
					</select></td>
					<!-- 
					<td><select name="ph_num" id="phnum">
							<c:forEach items="${phL }" var="ph">
								<option value="${ph.ph_num }" title="${ph.ph_name }">${ph.ph_name }</option>
							</c:forEach>
					</select></td>
					 -->
					<td><input type="hidden" id="phnum" name="ph_num" value=""><input type="text" id="phname" value=""></td>
					
					<td><input type="text" placeholder="시작 날짜" readonly="readonly"
						name="phr_chkin" id="chkin"></td>
					<td><input type="text" placeholder="마침 날짜" readonly="readonly"
						name="phr_chkout" id="chkout"></td>
					<td ><input type="button" id="addBtn" value="추가"></td>
				</tr>

			</table>
		</fieldset>
		<div>
			<hr>
		</div>
		<div>
			<fieldset>
				<legend>예약 확인</legend>

				<table id="rst" style="width: 600px">
					<tr>
						<th>펫</th>
						<th>펫호텔</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>삭제</th>
					</tr>
				</table>
			</fieldset>
			<button id="btnSubmit">제출</button>
		</div>
	</div>

</body>
</html>