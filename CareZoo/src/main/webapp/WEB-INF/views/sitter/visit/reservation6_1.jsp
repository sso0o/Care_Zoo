
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript">
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

			var check = $("#cal").val();
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
</script>
<!-- 달력이벤트 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
	$(function() {
		//   $( "#datepicker1" ).datepicker({
		//     dateFormat: 'yy-mm-dd',
		//     minDate:0
		//   });

		
		$("#cal").datepicker(
				
				{
					minDate : 0,
					dateFormat : 'yy-mm-dd',
					onSelect : function() {
						var dateVal = $(this).val();
// 						var dateId = "";
// 						if (dateVal != $(this).val()) {
// 							//처음의 값이 ""이면 $(this).val()이고 아니면 ,$(this).val() 호출
// 							dateVal += dateVal == "" ? $(this).val() : ","
// 									+ $(this).val()
// 						}
						
// 						$("#week").prop('value', dateVal);
						//인풋요소 생성
						//있는지 확인하고 없으면 추가 
						//있는지 확인하고 있으면 삭제
						var tmpDate = $("#"+dateVal);
						if(tmpDate.val()){
							//인풋요소 삭제 
							tmpDate.remove();
						}else{
							var selDate = $("<input type='text' name ='vsr_chkin'>").val(dateVal);
							//id값을 dateVal값으로 유일값으로 다르게 준다
							selDate.attr("id",dateVal);
							selDate.attr("value",dateVal);
							$("#cal").append(selDate);
						}
						
					
						
					}
				});
	});
</script>
<meta charset="UTF-8">
<title>방문 펫시터 예약</title>
</head>
<body>
	<form action="complete11" method="post" name="checkForm" id="checkForm">
		<input type="hidden" name="c_num" value="${c_num}">
		<c:forEach items="${p_num}" var="p">
			<input type="hidden" name="p_num" value="${p}">
		</c:forEach>
		<c:forEach items="${p_name}" var="n">
			<input type="hidden" name="p_name" value="${n.p_name}">
		</c:forEach>
		<table>
			<tr>
				<td>
					<div id="cal">
<!-- 						<input type="text" id="week" name="pd_week"> -->
					</div>
				</td>
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
			<input type="submit" id="btn" value="다음">
		</div>
	</form>
</body>
</html>