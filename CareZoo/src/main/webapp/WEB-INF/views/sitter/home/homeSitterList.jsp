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
//      검색된 리스트 띄우기
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
	
		$search = function (wholeStates) {
			var href = '${contextPath}/sitter/home/search';
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
		<ul class="clearfix">
			<li class="col-type">
				<dl>
					<dt>서비스</dt>
					<dd>
						<select class="selectpick hidden-xs" name="hsl_service_type" data-width="120px">
							<option title="24시간 돌봄" value="allday" selected="selected">24시간 돌봄</option>
							<option title="데이케어" value="daycare">데이케어</option>
						</select>
					</dd>
				</dl>
			</li>
			<li class="col-dates">
				<dl>
					<dt>예약일</dt>
					<dd class="clearfix text-center">
						<input type="text" class="pull-left" placeholder="시작 날짜" readonly="readonly" id="hsl_chkin"/>
						<span>&gt;</span>
						<input type="text" class="pull-right" placeholder="마침 날짜" readonly="readonly" id="hsl_chkout"/>
					</dd>
				</dl>
			</li>
			<li class="col-age">
				<dl>
					<dt>반려견 나이</dt>
					<dd>
						<select class="selectpick hidden-xs" name="hsl_pet_age" data-width="130px">
							<option title="강아지" value="puppy">강아지 (1살 이하)</option>
							<option title="성견" value="dog">성견 (2~6살)</option>
							<option title="노령견" value="agedDog">노령견 (7살 이상)</option>
						</select>
					</dd>
				</dl>
			</li>
			<li class="col-size">
				<dl>
					<dt>반려견 크기</dt>
					<dd>
						<select class="selectpick hidden-xs" name="hsl_size" data-width="130px">
							<option title="소형견" value="S">소형견 (0~4.9kg)</option>
							<option title="중형견" value="M">중형견 (5~14.9kg)</option>
							<option title="대형견" value="L">대형견 (15kg 이상)</option>
						</select>
					</dd>
				</dl>
			</li>
			<li class="col-btn">
				<dl>
					<dd>
						<button class="btn hidden-xs">찾기</button>
					</dd>
				</dl>
			</li>
		</ul>
	</form>
</div>
</body>
</html>
