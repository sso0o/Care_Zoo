<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeSitterList</title>
<!-- 가정용 펫시터 리스트 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script>
<script type="text/javascript"> 
	$(function () {
		$('.status .btn').click(function () {
			location.href = location.pathname;
		});	
		var datepickerStart = $('.col-dates .pull-left').datepicker({
			dateFormat: 'yy-mm-dd', 
			minDate: moment('yy-mm-dd').toDate(),
			onSelect: function (selected) {
				datepickerEnd.datepicker('option', 'minDate', selected);
	
				if (datepickerEnd.prop('disabled')) {
					datepickerEnd.datepicker('setDate', selected);
				} else if (!datepickerEnd.val()) {
					setTimeout($.proxy(datepickerEnd.datepicker, datepickerEnd, 'show'), 50);
				}
			}
		});
		var datepickerEnd = $('.col-dates .pull-right').datepicker({
			dateFormat: 'yy-mm-dd', 
			minDate: moment('yy-mm-dd').toDate()
		});
	
	
		var filters = $('.filters').submit(function (e) {
			e.preventDefault();
	
			$search();
			$('.col-btn .btn').button('loading');
		});
	
//      상세 검색결과 리스트로 띄우기
		$search = function (wholeStates) {
			var href = '${contextPath}/home/search';
			var dateStart = moment(datepickerStart.datepicker('getDate'));
			var dateEnd = moment(datepickerEnd.datepicker('getDate'));
	
			var param = {};
			var arr = [];
	
			if (dateStart.isValid() && dateEnd.isValid()) {
				param.hsl_chkin = dateStart.format('YYYY-MM-DD');
				param.hsl_chkout = dateEnd.format('YYYY-MM-DD');
			}
	
			$('.selectpick', filters).each(function () {
				var v = $(this).val();
				if (v && v.length) {
					param[this.name] = typeof v == 'object' ? v.join() : v;
				}
			});
						
			for (var idx in param) {
				var v = param[idx];
				arr.push(idx + '=' + encodeURI(typeof v == 'object' ? v.join() : v));
			}
			location.href = href + (arr.length ? '?' + arr.join('&') : '');
		}
	});
</script>
</head>
<body>
<!-- 홈시터 검색필터 설정부분 -->
<div class="main-wrap no-profile">
	<form class="filters inner">
		<table class="clearfix">
			<tr class="col-type">
					<th>서비스</th>
					<td>
						<select class="selectpick hidden-xs" name="hsl_service_type" data-width="120px">
							<option title="24시간 돌봄" value="allday" selected="selected">24시간 돌봄</option>
							<option title="데이케어" value="daycare">데이케어</option>
						</select>
					</td>
			</tr>
			<tr class="col-dates">
					<th>예약일</th>
					<td class="clearfix text-center">
						<input type="text" class="pull-left" placeholder="시작 날짜" readonly="readonly" id="hsl_chkin"/>
						<span>&gt;</span>
						<input type="text" class="pull-right" placeholder="마침 날짜" readonly="readonly" id="hsl_chkout"/>
					</td>
			</tr>
			<tr class="col-age">
					<th>반려견 나이</th>
					<td>
						<select class="selectpick hidden-xs" name="hsl_pet_age" data-width="130px">
							<option title="강아지" value="puppy">강아지 (1살 이하)</option>
							<option title="성견" value="dog">성견 (2~6살)</option>
							<option title="노령견" value="agedDog">노령견 (7살 이상)</option>
						</select>
					</td>
			</tr>
			<tr class="col-size">
					<th>반려견 크기</th>
					<td>
						<select class="selectpick hidden-xs" name="hsl_size" data-width="130px">
							<option title="소형견" value="S">소형견 (0~4.9kg)</option>
							<option title="중형견" value="M">중형견 (5~14.9kg)</option>
							<option title="대형견" value="L">대형견 (15kg 이상)</option>
						</select>
					</td>
			</tr>
			<tr class="col-btn">
					<td>
						<button class="btn hidden-xs">찾기</button>
						<button type="reset" class="btn">초기화</button>
					</td>
			</tr>
		</table>
	</form>
</div>

<!-- 지역 검색 -->
<div>
	<table>
		<tr>
			<th>전체</th>
			<td>
				<select name="">
					<option title="" value=""></option>
				</select>
			</td>
		<tr>
		<tr>
			<th>서울</th>
			<td>
				<select name="">
					<option title="" value=""></option>
				</select>
			</td>
		<tr>
		<tr>
			<th>경기</th>
			<td>
				<select name="">
					<option title="" value=""></option>
				</select>
			</td>
		<tr>
		<tr>
			<th>인천</th>
			<td>
				<select name="">
					<option title="" value=""></option>
				</select>
			</td>
		<tr>
	</table>
</div>
</body>
</html>
