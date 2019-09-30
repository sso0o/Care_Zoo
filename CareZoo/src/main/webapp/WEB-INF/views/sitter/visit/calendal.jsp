<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script >

$(function(){
	
	$("#cal").datepicker({
		 
		dateFormat:'yy-mm-dd',
		minDate:0,
		regional:"ko",
 		beforeShowDay: function(date){
			//선택한 요일 값 가져오기..
			var day = date.getDay();
			var result = false;
			$(".vsr_day").each(function(){
				var selDay = $(this).val();
				console.log(selDay);
				if(day == selDay){
					result = true;
				}
			});
			return [result,,];
		},
		onSelect : function() {
			var dateVal = $(this).val();
//				var dateId = "";
//				if (dateVal != $(this).val()) {
//					//처음의 값이 ""이면 $(this).val()이고 아니면 ,$(this).val() 호출
//					dateVal += dateVal == "" ? $(this).val() : ","
//							+ $(this).val()
//				}
			
//				$("#week").prop('value', dateVal);
			console.log("dddddddd"+dateVal);
		

			
			//인풋요소 생성
			//있는지 확인하고 없으면 추가 
			//있는지 확인하고 있으면 삭제
			var tmpDate = $("#"+dateVal);
			if(tmpDate.val()){
				//인풋요소 삭제 
				tmpDate.remove();
			}else{
				var selDate = $("<input type='text' name ='vsr_chkin'>").val(dateVal);
				selDate.attr("id",dateVal);
				selDate.attr("value",dateVal);
				
					var date = new Date(dateVal);
					console.log("date:"+date);
					var newdate = new Date(date);
					console.log("newdate:"+newdate); 
					date.setDate(newdate.getDate()+7);
					console.log("result"+date.toDateString());
					var result = new Date(); 
					result = getFormatDate(date);
					console.log(result);
					
					
				var test = $("<input type='text' name ='vsr_chkin'>").val(result);
				//id값을 dateVal값으로 유일값으로 다르게 준다
				
				test.attr("id",result);
				test.attr("value",result);
				
				var date2 = new Date(date);
				var newdate2 = new Date(date2);
				date2.setDate(newdate2.getDate()+7);
				var result2 = new Date(); 
				result2 = getFormatDate(date2);
				
				var test2 = $("<input type='text' name ='vsr_chkin'>").val(result2);
				test2.attr("id",result2);
				test2.attr("value",result2);
				
				var date3 = new Date(date2);
				var newdate3 = new Date(date3);
				date3.setDate(newdate3.getDate()+7);
				var result3 = new Date(); 
				result3 = getFormatDate(date3);
				
				var test3 = $("<input type='text' name ='vsr_chkin'>").val(result3);
				test3.attr("id",result3);
				test3.attr("value",result3);
				
				$("#cal").append(selDate);
				$("#cal").append(test);
				$("#cal").append(test2);
				$("#cal").append(test3);
			}
			
		
			
		}
	});
	
});
//yyy-mm-dd형식으로 바꾸는 함수
function getFormatDate(date)
{ var year = date.getFullYear();
//yyyy 
var month = (1 + date.getMonth()); 
//M 
month = month >= 10 ? month : '0' + month; 
//month 두자리로 저장 
var day = date.getDate(); 
//d 
day = day >= 10 ? day : '0' + day; 
//day 두자리로 저장
return year + '-' + month + '-' + day; }




</script>
<meta charset="UTF-8">
<title>정기적인 요일 시작일 고르기</title>
</head>
<body>
<h3></h3>
<form action="getDate" method="post">
	<input type="hidden" name="vsr_count" value="${vsr_count}">
	<input type="hidden" name="c_num" value="${c_num}">
	<c:forEach items="${p_num}" var="p">
		<input type="hidden" name="p_num" value="${p}">
	</c:forEach>
	<c:forEach items="${vsr_day}" var="day">
		<input type="hidden" class="vsr_day" name="vsr_day" value="${day}">
		<div class="test"></div>
	</c:forEach>
	<c:forEach items="${vsr_num}" var="vsr_num">
		<input type="hidden" name="vsr_num" value="${vsr_num}">
	</c:forEach>
	<c:forEach items="${list}" var="li">
		<input type="hidden" value="${li.vsr_hour}" name="vsr_hour">
		<input type="hidden" value="${li.vsr_hAdd}" name="vsr_hAdd">
	</c:forEach>
	<!-- 달력 -->	
	<div id="cal"></div><!-- input value로 줘서 넘기기.. vsr_num -->
	<div>
		<input type="submit" value="확인">
	</div>
</form>	
</body>
</html>