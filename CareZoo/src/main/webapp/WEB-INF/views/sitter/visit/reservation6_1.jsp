
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
	<!-- 메인 상단바 툴 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- css -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
	<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>
	<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>
	
	<!-- js -->
	
	<!-- <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" ></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script> -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript" ></script> -->
	<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script> -->
	 
<%--     <script src="${contextPath}/resources/js/index.js" type="text/javascript" ></script> --%>
<%--     <script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> --%>
	<%-- <script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script> --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js" type="text/javascript"></script>

<script type="text/javascript">

//로그아웃확인 <--모든페이지에 필수
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}

$(function() { //문서가 로딩되면 실행할 함수

})

// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!

// })

// 기본적으로 세션에 저장된 정보
var user_numtype = "<%=session.getAttribute("user_numtype")%>"
var user_num = "<%=session.getAttribute("user_num")%>"
var user_name = "<%=session.getAttribute("user_name")%>"

	function oneCheckbox(a) {
		var chk2 = document.getElementsByName("vsr_hour");
		for (var i = 0; i < chk2.length; i++) {
			if (chk2[i] != a) {
				chk2[i].checked = false;
			}
		}
	}
	function oneCheckbox1(a) {
		var chk3 = document.getElementsByName("vsr_hAdd");
		for (var i = 0; i < chk3.length; i++) {
			if (chk3[i] != a) {
				chk3[i].checked = false;
			}
		}
	}

	$(function() {
		$("#btn").on("click", function() {

			var check = $("#vsr_chkin").val();
			var check2 = $("#checkContainer2").children().is(":checked");
			var check3 = $("#checkContainer3").children().is(":checked");
			alert(check)
			if (!(check && check2 && check3)) {
				alert("체크해주세요");
				return false;
			}
			alert("완료")
			return true;
		});
	});
	
	//datepicker
	$(function(){
		$('#datepicker').datepicker({
			minDate:0,
			startDate: new Date(),
		    multidate: true,
		    format: "yyyy-mm-dd",

		}).datepicker('show');
	});
</script>

<script>
// 	$(function() {
// // 		$('.ui-datepicker td span, .ui-datepicker td a').css('background-color','gray');

	
// 		$("#cal").datepicker(
				
// 				{
// 					multidate: true,
// 					minDate : 0,
// 					dateFormat : 'yy-mm-dd',
// 					onSelect : 
// 					function() {
// 						var dateVal = $(this).val();
// 						console.log(dateVal);

						
// // 						var dateId = "";
// // 						if (dateVal != $(this).val()) {
// // 							//처음의 값이 ""이면 $(this).val()이고 아니면 ,$(this).val() 호출
// // 							dateVal += dateVal == "" ? $(this).val() : ","
// // 									+ $(this).val()
// // 						}
						
// // 						$("#week").prop('value', dateVal);
// // 						$(this).find(".ui-datepicker td span, .ui-datepicker td a").css("background-color", "gray");

// 						//인풋요소 생성
// 						//있는지 확인하고 없으면 추가 
// 						//있는지 확인하고 있으면 삭제
// 						var tmpDate = $("#"+dateVal);
// 						if(tmpDate.val()){
// 							//인풋요소 삭제 
// 							tmpDate.remove();
// 						}else{
// 							//$(this).find('.ui-datepicker td span, .ui-datepicker td a').css("background-color", "gray");
// 							//$(".ui-state-default ui-state-active").css("background-color", "gray");
// 							
// 							//id값을 dateVal값으로 유일값으로 다르게 준다
// 							selDate.attr("id",dateVal);
// 							selDate.attr("value",dateVal);
// 							$("#cal").append(selDate);
// 							//return[true,"Highlighted",dateVal];
// 						}

// 					}

// 				});
		
// 	});
		if("${msg}" != ""){
			alert("${msg}");
		}
</script>
<style>
 .ui-datepicker{ font-size: 30px; width: 1100px; height:500px;}
 .ui-datepicker select.ui-datepicker-month{ width:50%; font-size: 100px; height:50%; } 
 .ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 100px; height:50%;  } 
 .ui-datepicker td span, .ui-datepicker td a{ font-size:38px;} 
 .ui-datepicker-week-end{color:red;}
 .ui-datepicker-week-end .ui-state-default{color:red;} 
 
#visit{
	text-align:center;
}
.btn-chk{
	background-color: #40bf9f;
	color: white;
	border-color: #40bf9f;
	margin: 15px;
	width: 200px;
	font-weight: bold;
}
.datepicker {
  padding: 4px;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  direction: ltr;
}
.datepicker-inline {
  width: 220px;
}
.datepicker.datepicker-rtl {
  direction: rtl;
}
.datepicker.datepicker-rtl table tr td span {
  float: right;
}
.datepicker-dropdown {
  top: 0;
  left: 0;
}
.datepicker-dropdown:before {
  content: '';
  display: inline-block;
  border-left: 7px solid transparent;
  border-right: 7px solid transparent;
  border-bottom: 7px solid #999999;
  border-top: 0;
  border-bottom-color: rgba(0, 0, 0, 0.2);
  position: absolute;
}
.datepicker-dropdown:after {
  content: '';
  display: inline-block;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-bottom: 6px solid #ffffff;
  border-top: 0;
  position: absolute;
}
.datepicker-dropdown.datepicker-orient-left:before {
  left: 6px;
}
.datepicker-dropdown.datepicker-orient-left:after {
  left: 7px;
}
.datepicker-dropdown.datepicker-orient-right:before {
  right: 6px;
}
.datepicker-dropdown.datepicker-orient-right:after {
  right: 7px;
}
.datepicker-dropdown.datepicker-orient-bottom:before {
  top: -7px;
}
.datepicker-dropdown.datepicker-orient-bottom:after {
  top: -6px;
}
.datepicker-dropdown.datepicker-orient-top:before {
  bottom: -7px;
  border-bottom: 0;
  border-top: 7px solid #999999;
}
.datepicker-dropdown.datepicker-orient-top:after {
  bottom: -6px;
  border-bottom: 0;
  border-top: 6px solid #ffffff;
}
.datepicker > div {
  display: none;
}
.datepicker table {
  margin: 0;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
.datepicker td,
.datepicker th {
  text-align: center;
  width: 20px;
  height: 20px;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  border: none;
}
.table-striped .datepicker table tr td,
.table-striped .datepicker table tr th {
  background-color: transparent;
}
.datepicker table tr td.day:hover,
.datepicker table tr td.day.focused {
  background: #eeeeee;
  cursor: pointer;
}
.datepicker table tr td.old,
.datepicker table tr td.new {
  color: #999999;
}
.datepicker table tr td.disabled,
.datepicker table tr td.disabled:hover {
  background: none;
  color: #999999;
  cursor: default;
}
.datepicker table tr td.highlighted {
  background: #d9edf7;
  border-radius: 0;
}
.datepicker table tr td.today,
.datepicker table tr td.today:hover,
.datepicker table tr td.today.disabled,
.datepicker table tr td.today.disabled:hover {
  background-color: #fde19a;
  background-image: -moz-linear-gradient(to bottom, #fdd49a, #fdf59a);
  background-image: -ms-linear-gradient(to bottom, #fdd49a, #fdf59a);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fdd49a), to(#fdf59a));
  background-image: -webkit-linear-gradient(to bottom, #fdd49a, #fdf59a);
  background-image: -o-linear-gradient(to bottom, #fdd49a, #fdf59a);
  background-image: linear-gradient(to bottom, #fdd49a, #fdf59a);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fdd49a', endColorstr='#fdf59a', GradientType=0);
  border-color: #fdf59a #fdf59a #fbed50;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
  color: #000;
}
.datepicker table tr td.today:hover,
.datepicker table tr td.today:hover:hover,
.datepicker table tr td.today.disabled:hover,
.datepicker table tr td.today.disabled:hover:hover,
.datepicker table tr td.today:active,
.datepicker table tr td.today:hover:active,
.datepicker table tr td.today.disabled:active,
.datepicker table tr td.today.disabled:hover:active,
.datepicker table tr td.today.active,
.datepicker table tr td.today:hover.active,
.datepicker table tr td.today.disabled.active,
.datepicker table tr td.today.disabled:hover.active,
.datepicker table tr td.today.disabled,
.datepicker table tr td.today:hover.disabled,
.datepicker table tr td.today.disabled.disabled,
.datepicker table tr td.today.disabled:hover.disabled,
.datepicker table tr td.today[disabled],
.datepicker table tr td.today:hover[disabled],
.datepicker table tr td.today.disabled[disabled],
.datepicker table tr td.today.disabled:hover[disabled] {
  background-color: #fdf59a;
}
.datepicker table tr td.today:active,
.datepicker table tr td.today:hover:active,
.datepicker table tr td.today.disabled:active,
.datepicker table tr td.today.disabled:hover:active,
.datepicker table tr td.today.active,
.datepicker table tr td.today:hover.active,
.datepicker table tr td.today.disabled.active,
.datepicker table tr td.today.disabled:hover.active {
  background-color: #fbf069 \9;
}
.datepicker table tr td.today:hover:hover {
  color: #000;
}
.datepicker table tr td.today.active:hover {
  color: #fff;
}
.datepicker table tr td.range,
.datepicker table tr td.range:hover,
.datepicker table tr td.range.disabled,
.datepicker table tr td.range.disabled:hover {
  background: #eeeeee;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
}
.datepicker table tr td.range.today,
.datepicker table tr td.range.today:hover,
.datepicker table tr td.range.today.disabled,
.datepicker table tr td.range.today.disabled:hover {
  background-color: #f3d17a;
  background-image: -moz-linear-gradient(to bottom, #f3c17a, #f3e97a);
  background-image: -ms-linear-gradient(to bottom, #f3c17a, #f3e97a);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f3c17a), to(#f3e97a));
  background-image: -webkit-linear-gradient(to bottom, #f3c17a, #f3e97a);
  background-image: -o-linear-gradient(to bottom, #f3c17a, #f3e97a);
  background-image: linear-gradient(to bottom, #f3c17a, #f3e97a);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f3c17a', endColorstr='#f3e97a', GradientType=0);
  border-color: #f3e97a #f3e97a #edde34;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
}
.datepicker table tr td.range.today:hover,
.datepicker table tr td.range.today:hover:hover,
.datepicker table tr td.range.today.disabled:hover,
.datepicker table tr td.range.today.disabled:hover:hover,
.datepicker table tr td.range.today:active,
.datepicker table tr td.range.today:hover:active,
.datepicker table tr td.range.today.disabled:active,
.datepicker table tr td.range.today.disabled:hover:active,
.datepicker table tr td.range.today.active,
.datepicker table tr td.range.today:hover.active,
.datepicker table tr td.range.today.disabled.active,
.datepicker table tr td.range.today.disabled:hover.active,
.datepicker table tr td.range.today.disabled,
.datepicker table tr td.range.today:hover.disabled,
.datepicker table tr td.range.today.disabled.disabled,
.datepicker table tr td.range.today.disabled:hover.disabled,
.datepicker table tr td.range.today[disabled],
.datepicker table tr td.range.today:hover[disabled],
.datepicker table tr td.range.today.disabled[disabled],
.datepicker table tr td.range.today.disabled:hover[disabled] {
  background-color: #f3e97a;
}
.datepicker table tr td.range.today:active,
.datepicker table tr td.range.today:hover:active,
.datepicker table tr td.range.today.disabled:active,
.datepicker table tr td.range.today.disabled:hover:active,
.datepicker table tr td.range.today.active,
.datepicker table tr td.range.today:hover.active,
.datepicker table tr td.range.today.disabled.active,
.datepicker table tr td.range.today.disabled:hover.active {
  background-color: #efe24b \9;
}
.datepicker table tr td.selected,
.datepicker table tr td.selected:hover,
.datepicker table tr td.selected.disabled,
.datepicker table tr td.selected.disabled:hover {
  background-color: #9e9e9e;
  background-image: -moz-linear-gradient(to bottom, #b3b3b3, #808080);
  background-image: -ms-linear-gradient(to bottom, #b3b3b3, #808080);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#b3b3b3), to(#808080));
  background-image: -webkit-linear-gradient(to bottom, #b3b3b3, #808080);
  background-image: -o-linear-gradient(to bottom, #b3b3b3, #808080);
  background-image: linear-gradient(to bottom, #b3b3b3, #808080);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#b3b3b3', endColorstr='#808080', GradientType=0);
  border-color: #808080 #808080 #595959;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
  color: #fff;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
}
.datepicker table tr td.selected:hover,
.datepicker table tr td.selected:hover:hover,
.datepicker table tr td.selected.disabled:hover,
.datepicker table tr td.selected.disabled:hover:hover,
.datepicker table tr td.selected:active,
.datepicker table tr td.selected:hover:active,
.datepicker table tr td.selected.disabled:active,
.datepicker table tr td.selected.disabled:hover:active,
.datepicker table tr td.selected.active,
.datepicker table tr td.selected:hover.active,
.datepicker table tr td.selected.disabled.active,
.datepicker table tr td.selected.disabled:hover.active,
.datepicker table tr td.selected.disabled,
.datepicker table tr td.selected:hover.disabled,
.datepicker table tr td.selected.disabled.disabled,
.datepicker table tr td.selected.disabled:hover.disabled,
.datepicker table tr td.selected[disabled],
.datepicker table tr td.selected:hover[disabled],
.datepicker table tr td.selected.disabled[disabled],
.datepicker table tr td.selected.disabled:hover[disabled] {
  background-color: #808080;
}
.datepicker table tr td.selected:active,
.datepicker table tr td.selected:hover:active,
.datepicker table tr td.selected.disabled:active,
.datepicker table tr td.selected.disabled:hover:active,
.datepicker table tr td.selected.active,
.datepicker table tr td.selected:hover.active,
.datepicker table tr td.selected.disabled.active,
.datepicker table tr td.selected.disabled:hover.active {
  background-color: #666666 \9;
}
.datepicker table tr td.active,
.datepicker table tr td.active:hover,
.datepicker table tr td.active.disabled,
.datepicker table tr td.active.disabled:hover {
  background-color: #006dcc;
  background-image: -moz-linear-gradient(to bottom, #0088cc, #0044cc);
  background-image: -ms-linear-gradient(to bottom, #0088cc, #0044cc);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
  background-image: -webkit-linear-gradient(to bottom, #0088cc, #0044cc);
  background-image: -o-linear-gradient(to bottom, #0088cc, #0044cc);
  background-image: linear-gradient(to bottom, #0088cc, #0044cc);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0088cc', endColorstr='#0044cc', GradientType=0);
  border-color: #0044cc #0044cc #002a80;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
  color: #fff;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
}
.datepicker table tr td.active:hover,
.datepicker table tr td.active:hover:hover,
.datepicker table tr td.active.disabled:hover,
.datepicker table tr td.active.disabled:hover:hover,
.datepicker table tr td.active:active,
.datepicker table tr td.active:hover:active,
.datepicker table tr td.active.disabled:active,
.datepicker table tr td.active.disabled:hover:active,
.datepicker table tr td.active.active,
.datepicker table tr td.active:hover.active,
.datepicker table tr td.active.disabled.active,
.datepicker table tr td.active.disabled:hover.active,
.datepicker table tr td.active.disabled,
.datepicker table tr td.active:hover.disabled,
.datepicker table tr td.active.disabled.disabled,
.datepicker table tr td.active.disabled:hover.disabled,
.datepicker table tr td.active[disabled],
.datepicker table tr td.active:hover[disabled],
.datepicker table tr td.active.disabled[disabled],
.datepicker table tr td.active.disabled:hover[disabled] {
  background-color: #0044cc;
}
.datepicker table tr td.active:active,
.datepicker table tr td.active:hover:active,
.datepicker table tr td.active.disabled:active,
.datepicker table tr td.active.disabled:hover:active,
.datepicker table tr td.active.active,
.datepicker table tr td.active:hover.active,
.datepicker table tr td.active.disabled.active,
.datepicker table tr td.active.disabled:hover.active {
  background-color: #003399 \9;
}
.datepicker table tr td span {
  display: block;
  width: 23%;
  height: 54px;
  line-height: 54px;
  float: left;
  margin: 1%;
  cursor: pointer;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
}
.datepicker table tr td span:hover {
  background: #eeeeee;
}
.datepicker table tr td span.disabled,
.datepicker table tr td span.disabled:hover {
  background: none;
  color: #999999;
  cursor: default;
}
.datepicker table tr td span.active,
.datepicker table tr td span.active:hover,
.datepicker table tr td span.active.disabled,
.datepicker table tr td span.active.disabled:hover {
  background-color: #006dcc;
  background-image: -moz-linear-gradient(to bottom, #0088cc, #0044cc);
  background-image: -ms-linear-gradient(to bottom, #0088cc, #0044cc);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
  background-image: -webkit-linear-gradient(to bottom, #0088cc, #0044cc);
  background-image: -o-linear-gradient(to bottom, #0088cc, #0044cc);
  background-image: linear-gradient(to bottom, #0088cc, #0044cc);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0088cc', endColorstr='#0044cc', GradientType=0);
  border-color: #0044cc #0044cc #002a80;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
  color: #fff;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
}
.datepicker table tr td span.active:hover,
.datepicker table tr td span.active:hover:hover,
.datepicker table tr td span.active.disabled:hover,
.datepicker table tr td span.active.disabled:hover:hover,
.datepicker table tr td span.active:active,
.datepicker table tr td span.active:hover:active,
.datepicker table tr td span.active.disabled:active,
.datepicker table tr td span.active.disabled:hover:active,
.datepicker table tr td span.active.active,
.datepicker table tr td span.active:hover.active,
.datepicker table tr td span.active.disabled.active,
.datepicker table tr td span.active.disabled:hover.active,
.datepicker table tr td span.active.disabled,
.datepicker table tr td span.active:hover.disabled,
.datepicker table tr td span.active.disabled.disabled,
.datepicker table tr td span.active.disabled:hover.disabled,
.datepicker table tr td span.active[disabled],
.datepicker table tr td span.active:hover[disabled],
.datepicker table tr td span.active.disabled[disabled],
.datepicker table tr td span.active.disabled:hover[disabled] {
  background-color: #0044cc;
}
.datepicker table tr td span.active:active,
.datepicker table tr td span.active:hover:active,
.datepicker table tr td span.active.disabled:active,
.datepicker table tr td span.active.disabled:hover:active,
.datepicker table tr td span.active.active,
.datepicker table tr td span.active:hover.active,
.datepicker table tr td span.active.disabled.active,
.datepicker table tr td span.active.disabled:hover.active {
  background-color: #003399 \9;
}
.datepicker table tr td span.old,
.datepicker table tr td span.new {
  color: #999999;
}
.datepicker .datepicker-switch {
  width: 145px;
}
.datepicker .datepicker-switch,
.datepicker .prev,
.datepicker .next,
.datepicker tfoot tr th {
  cursor: pointer;
}
.datepicker .datepicker-switch:hover,
.datepicker .prev:hover,
.datepicker .next:hover,
.datepicker tfoot tr th:hover {
  background: #eeeeee;
}
.datepicker .cw {
  font-size: 10px;
  width: 12px;
  padding: 0 2px 0 5px;
  vertical-align: middle;
}
.input-append.date .add-on,
.input-prepend.date .add-on {
  cursor: pointer;
}
.input-append.date .add-on i,
.input-prepend.date .add-on i {
  margin-top: 3px;
}
.input-daterange input {
  text-align: center;
}
.input-daterange input:first-child {
  -webkit-border-radius: 3px 0 0 3px;
  -moz-border-radius: 3px 0 0 3px;
  border-radius: 3px 0 0 3px;
}
.input-daterange input:last-child {
  -webkit-border-radius: 0 3px 3px 0;
  -moz-border-radius: 0 3px 3px 0;
  border-radius: 0 3px 3px 0;
}
.input-daterange .add-on {
  display: inline-block;
  width: auto;
  min-width: 16px;
  height: 18px;
  padding: 4px 5px;
  font-weight: normal;
  line-height: 18px;
  text-align: center;
  text-shadow: 0 1px 0 #ffffff;
  vertical-align: middle;
  background-color: #eeeeee;
  border: 1px solid #ccc;
  margin-left: -5px;
  margin-right: -5px;
}



</style>
<meta charset="UTF-8">
<title>방문 펫시터 예약</title>
</head>
<body>
    <div class="container">
        <header>
			<a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

		<div class="header_Btn" id="sessioncheck">
			<sec:authorize access="isAnonymous()">
				<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
				<a class="btn_Join" href="${contextPath}/member/joinForm">회원가입</a>
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
                <li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
                    <ul>
                        <li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='${contextPath}/comment/hscList'>REVIEW</a>
                    <ul>
                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='#'>가정시터</a></li>
						<li class='last'><a href='#'>방문시터</a></li>
						<li class='last'><a href='#'>펫호텔</a></li>
                    </ul>
                </li>
                <li class='last'><a href='${contextPath}/member/myPage' style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
    <div class="container" id="visit">
		<form action="complete11" method="post" name="checkForm" id="checkForm">
			<input type="hidden" name="c_num" value="${c_num}">
			<c:forEach items="${p_num}" var="p">
				<input type="hidden" name="p_num" value="${p}">
			</c:forEach>
			<c:forEach items="${p_name}" var="n">
				<input type="hidden" name="p_name" value="${n.p_name}">
			</c:forEach>
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<th>
						<!-- <div id="cal">

						</div> -->
						
						<div class="input-group date form-group" id="datepicker" >
						
  <input type="text" class="form-control" id="vsr_chkin" name="vsr_chkin" placeholder="날자를 골라주세요!" required />
  <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i><span class="count"></span></span>
</div>
					</th>
				</tr>
	
				<!-- datepicker가 날자가 요일로 들어가게끔! -->
				<!-- 			<tr> -->
				<!-- 				<td>날자선택: <input type="text" id="datepicker1" name="pd_week"> -->
				<!-- 				</td> -->
				<!-- 			</tr> -->
	
				<tr>
					<th>시간대 선택(선택한 시간대에 펫시터가 방문합니다)</th>
				</tr>
				<tr>
					<td id="checkContainer2">
					<input type="checkbox" name="vsr_hour"id="one" value="9" 
					onclick="oneCheckbox(this)">9시~12시
					<input type="checkbox" name="vsr_hour" id="two" value="12"
					onclick="oneCheckbox(this)">12시~15시 
					<input type="checkbox" name="vsr_hour" id="three" value="15"
					onclick="oneCheckbox(this)">15시~18시 
					<input type="checkbox" name="vsr_hour" id="four" value="18"
					onclick="oneCheckbox(this)">18시~21시</td>
				</tr>
				<tr>
					<th>시간 추가(기본 1시간 돌봄)</th>
				</tr>
				<tr>
					<td id="checkContainer3">
					<input type="checkbox" name="vsr_hAdd" id="0" value="0" 
					onclick="oneCheckbox1(this)">없음
					<input	type="checkbox" name="vsr_hAdd" id="1" value="1"
					onclick="oneCheckbox1(this)">+1시간
					<input type="checkbox" name="vsr_hAdd" id="2" value="2"
					 onclick="oneCheckbox1(this)">+2시간
					<input type="checkbox" name="vsr_hAdd" id="3" value="3"
					onclick="oneCheckbox1(this)">+3시간 
					<input type="checkbox" name="vsr_hAdd" id="4" value="4" 
					onclick="oneCheckbox1(this)">+4시간
					</td>
				</tr>
			</table>
			<div>
				<input type="submit" id="btn" class="btn btn-chk"  value="다음">
			</div>
		</form>
	</div>
</body>
</html>