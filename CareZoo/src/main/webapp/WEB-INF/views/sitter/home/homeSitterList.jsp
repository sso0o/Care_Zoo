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
	//전체 도시 검색 버튼 선택/해제
	$('#state_check_all').click(function() {
		if($('#state_check_all').prop("checked")){
			$("input[name=hsl_address]").prop('checked', true);
			console.log("checked 실행");
		}else{
			$("input[name=hsl_address]").prop('checked', false);
		}
	})
	//검색탭
	var isOpen = false;
	$("#menu_1").on("click", function(){
		if(!isOpen){
			$("#subtbl_1").css("display","block");
		}else{
			$("#subtbl_1").css("display","none");
		}
		isOpen = !isOpen
	});
	$("#menu_2").on("click", function(){
		if(!isOpen){
			$("#subtbl_2").css("display","block");
		}else{
			$("#subtbl_2").css("display","none");
		}
		isOpen = !isOpen
	});
	$("#menu_3").on("click",function(){
		if(!isOpen){
			$("#subtbl_3").css("display","block");
		}else{
			$("#subtbl_3").css("display","none");
		}
		isOpen = !isOpen
	});
	//datepicker동작
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
	
	//detail 검색 폼 전달
// 	var detailParam = $("#detail_form").on("submit", function(){
// 		var dtParam = $(this).serialize();
// 		$.ajax({
// 			url:"${contextPath}/home/search",
// 			data:dtParam,
// 			type:"get",
// 			dataType:"json",
// 			success:function(result){
// 				if(result){
// 					alert("등록완료");
// 					console.log("result : "+result);
					
// 				}else{
// 					alert("오류발생!!");
// 				}
// 			},
// 			error:function(request,status,error){
// 				alert(" error = " + error);
// 			}
// 		});// ajax
// 		return false;
// 	});
	//state 검색 폼 전달
	$("form").on("submit",function(){
		event.preventDefault();
		var stateParam = $('input[name=hsl_address]:checked').serialize();
// 		var detailParam = $("#detail_form").on("submit", function(){$(this).serialize()});
		var detailParam = $("#detail_form").serialize();
// 		document.write("st: "+stateParam+" //dt: "+detailParam);
		var dateStart = moment(datepickerStart.datepicker('getDate'));
		var dateEnd = moment(datepickerEnd.datepicker('getDate'));
		if (dateStart.isValid() && dateEnd.isValid()) {
			detailParam.hsl_chkin = dateStart.format('YYYY-MM-DD');
			detailParam.hsl_chkout = dateEnd.format('YYYY-MM-DD');
		}
		console.log("form submit : " +stateParam);
		$.ajax({
			url:"${contextPath}/home/search",
			data:stateParam+'&'+detailParam,
// 			data:stateParam,
			type:"get",
			dataType:"json",
			success:function(d){
				if(d){
					alert("등록완료");
					console.log("result : "+d);
					for(var i in d){
						var tr = $('<tr style="border: 1px">');
						$('<td>)').text(d[i].HSL_FILENAME).appendTo(tr);
						$('<td>)').text(d[i].HSL_ADDRESS).appendTo(tr);
						$('<td>)').text(d[i].HSL_CHKIN).appendTo(tr);
						$('<td>)').text(d[i].HSL_CHKOUT).appendTo(tr);
						$('<td>)').text(d[i].HS_NAME).appendTo(tr);
						$("#search_result").append(tr);
					}					
				}else{
					alert("오류발생!!");
				}
			},
			error:function(request,status,error){
				alert(" error = " + error);
			}
		});// ajax
		return false;
	});
});
</script>
</head>
<body>
<!-- 지역 검색 -->
<div>
    <table style="width:420px;">
        <tr>
            <td colspan="3" class="top_space"></td>
        </tr>
        <tr>
        	<td class="td_left_right_space"></td>
            <td>
                <table id="maintable"style="width:100%; height:30px">
	                <tr>
	                    <td id="menu_0" class="td_mainmenubox_Off"  style="cursor:hand"><a href="#">전체</a></td>
	                    <td id="menu_1" class="td_mainmenubox_Off"  style="cursor:hand"><a href="#">서울</a></td>
	                    <td id="menu_2" class="td_mainmenubox_Off"  style="cursor:hand"><a href="#">경기</a></td>
	                    <td id="menu_3" class="td_mainmenubox_Off"  style="cursor:hand"><a href="#">인천</a></td>
	                </tr>
                </table>
            </td>
            <td class="td_left_right_space"></td>
        </tr>
    </table>
    <div>
<!--     	<form> -->
<!-- 			<input type="hidden" name="hsl_address" value="서울"> -->
<!-- 			<input type="hidden" name="hsl_address" value="경기"> -->
<!-- 			<input type="hidden" name="hsl_address" value="인천" > -->
<!--     	</form> -->
	    <form>
			<table id="subtbl_1" style="display:none">
				<tr class="state_seoul">
					<td id="check_container">
						<input type="checkbox" name="hsl_address" id="state1" value="강남구">
						<label for="state1">강남구</label>
						<input type="checkbox" name="hsl_address" id="state2" value="강동구">
						<label for="state2">강동구</label>
						<input type="checkbox" name="hsl_address" id="state3" value="강북구">
						<label for="state3">강북구</label>
						<input type="checkbox" name="hsl_address" id="state4" value="강서구">
						<label for="state4">강서구</label>
						<input type="checkbox" name="hsl_address" id="state5" value="관악구">
						<label for="state5">관악구</label>
						<input type="checkbox" name="hsl_address" id="state6" value="광진구">
						<label for="state6">광진구</label>
						<input type="checkbox" name="hsl_address" id="state7" value="구로구">
						<label for="state7">구로구</label>
						<input type="checkbox" name="hsl_address" id="state8" value="금천구">
						<label for="state8">금천구</label>
						<input type="checkbox" name="hsl_address" id="state9" value="노원구">
						<label for="state9">노원구</label>
						<input type="checkbox" name="hsl_address" id="state10" value="도봉구">
						<label for="state10">도봉구</label>
						<input type="checkbox" name="hsl_address" id="state11" value="동대문구">
						<label for="state11">동대문구</label>
						<input type="checkbox" name="hsl_address" id="state12" value="동작구">
						<label for="state12">동작구</label>
						<input type="checkbox" name="hsl_address" id="state13" value="마포구">
						<label for="state13">마포구</label>
						<input type="checkbox" name="hsl_address" id="state14" value="서대문구">
						<label for="state14">서대문구</label>
						<input type="checkbox" name="hsl_address" id="state15" value="서초구">
						<label for="state15">서초구</label>
						<input type="checkbox" name="hsl_address" id="state16" value="성동구">
						<label for="state16">성동구</label>
						<input type="checkbox" name="hsl_address" id="state17" value="성북구">
						<label for="state17">성북구</label>
						<input type="checkbox" name="hsl_address" id="state18" value="송파구">
						<label for="state18">송파구</label>
						<input type="checkbox" name="hsl_address" id="state19" value="양천구">
						<label for="state19">양천구</label>
						<input type="checkbox" name="hsl_address" id="state20" value="영등포구">
						<label for="state20">영등포구</label>
						<input type="checkbox" name="hsl_address" id="state21" value="용산구">
						<label for="state21">용산구</label>
						<input type="checkbox" name="hsl_address" id="state22" value="은평구">
						<label for="state22">은평구</label>
						<input type="checkbox" name="hsl_address" id="state23" value="종로구">
						<label for="state23">종로구</label>
						<input type="checkbox" name="hsl_address" id="state24" value="중구">
						<label for="state24">중구</label>
						<input type="checkbox" name="hsl_address" id="state25" value="중랑구">
						<label for="state24">중랑구</label>
					</td>                                       
				</tr>
				<tr>
			     	<td>
			     		<button type="submit" >검색</button>
			     		<button type="reset">초기화</button>
			     	</td>
			     </tr>
			</table>
		</form>
		<form>
			<table id="subtbl_2" style="display:none">
				<tr>
					<td id="check_container">
						<input type="checkbox" name="hsl_address" id="state26" value="고양시">고양시
						<input type="checkbox" name="hsl_address" id="state27" value="과천시">과천시
						<input type="checkbox" name="hsl_address" id="state28" value="광명시">광명시
						<input type="checkbox" name="hsl_address" id="state29" value="광주시">광주시
						<input type="checkbox" name="hsl_address" id="state30" value="구리시">구리시
						<input type="checkbox" name="hsl_address" id="state31" value="군포시">군포시
						<input type="checkbox" name="hsl_address" id="state32" value="김포시">김포시
						<input type="checkbox" name="hsl_address" id="state33" value="남양주시">남양주시
						<input type="checkbox" name="hsl_address" id="state34" value="동두천시">동두천시
						<input type="checkbox" name="hsl_address" id="state35" value="부천시">부천시
						<input type="checkbox" name="hsl_address" id="state36" value="성남시">성남시
						<input type="checkbox" name="hsl_address" id="state37" value="수원시">수원시
						<input type="checkbox" name="hsl_address" id="state38" value="시흥시">시흥시
						<input type="checkbox" name="hsl_address" id="state39" value="안산시">안산시
						<input type="checkbox" name="hsl_address" id="state40" value="안성시">안성시
						<input type="checkbox" name="hsl_address" id="state41" value="안양시">안양시
						<input type="checkbox" name="hsl_address" id="state42" value="양주시">양주시
						<input type="checkbox" name="hsl_address" id="state43" value="여주시">여주시
						<input type="checkbox" name="hsl_address" id="state44" value="오산시">오산시
						<input type="checkbox" name="hsl_address" id="state45" value="용인시">용인시
						<input type="checkbox" name="hsl_address" id="state46" value="의왕시">의왕시
						<input type="checkbox" name="hsl_address" id="state47" value="의정부시">의정부시
						<input type="checkbox" name="hsl_address" id="state48" value="이천시">이천시
						<input type="checkbox" name="hsl_address" id="state49" value="파주시">파주시
						<input type="checkbox" name="hsl_address" id="state50" value="평택시">평택시
						<input type="checkbox" name="hsl_address" id="state51" value="포천시">포천시
						<input type="checkbox" name="hsl_address" id="state52" value="하남시">하남시
						<input type="checkbox" name="hsl_address" id="state53" value="화성시">화성시
						<input type="checkbox" name="hsl_address" id="state54" value="가평군">가평군
						<input type="checkbox" name="hsl_address" id="state55" value="양평군">양평군
						<input type="checkbox" name="hsl_address" id="state56" value="연천군">연천군
					</td>
				</tr>
				<tr>
			     	<td>
			     		<button type="submit" >검색</button>
			     		<button type="reset">초기화</button>
			     	</td>
			     </tr>
			</table>
		</form>
		<form>
			<table id="subtbl_3" style="display:none">
				<tr>
					<td id="check_container">
						<input type="checkbox" name="hsl_address" id="state57" value="계양구">계양구
						<input type="checkbox" name="hsl_address" id="state58" value="남동구">남동구
						<input type="checkbox" name="hsl_address" id="state59" value="동구">동구
						<input type="checkbox" name="hsl_address" id="state60" value="미추홀구">미추홀구
						<input type="checkbox" name="hsl_address" id="state61" value="부평구">부평구
						<input type="checkbox" name="hsl_address" id="state62" value="서구">서구
						<input type="checkbox" name="hsl_address" id="state63" value="연수구">연수구
						<input type="checkbox" name="hsl_address" id="state64" value="중구">중구
						<input type="checkbox" name="hsl_address" id="state65" value="강화군">강화군
						<input type="checkbox" name="hsl_address" id="state66" value="옹진군">옹진군
					</td>                                        
				</tr>
				<tr>
			     	<td>
			     		<button type="submit" >검색</button>
			     		<button type="reset">초기화</button>
			     	</td>
			     </tr>
			</table>
		</form>
	</div>                                        
</div> 
<!-- 홈시터 검색필터 설정부분 -->
<div class="main-wrap no-profile">
	<form id="detail_form">
		<table>
			<tr>
				<td>
					<input type="hidden" name="hsl_address" value="서울">
					<input type="hidden" name="hsl_address" value="경기">
					<input type="hidden" name="hsl_address" value="인천" >
				</td>
			</tr>
			<tr class="col-type">
				<th>서비스</th>
				<td>
					<select name="hsl.hsl_service_type" >
						<option title="24시간 돌봄" value="allday" selected="selected">24시간 돌봄</option>
						<option title="데이케어" value="daycare">데이케어</option>
					</select>
				</td>
			</tr>
			<tr class="col-dates">
				<th>예약일</th>
				<td >
					<input type="text" class="pull-left" placeholder="시작 날짜" readonly="readonly" name="hsl.hsl_chkin"/>
					<span>&gt;</span>
					<input type="text" class="pull-right" placeholder="마침 날짜" readonly="readonly" name="hsl.hsl_chkout"/>
				</td>
			</tr>
			<tr class="col-age">
				<th>반려견 나이</th>
				<td>
					<select name="hsl.hsl_pet_age" data-width="130px">
						<option title="강아지" value="puppy">강아지 (1살 이하)</option>
						<option title="성견" value="dog">성견 (2~6살)</option>
						<option title="노령견" value="agedDog">노령견 (7살 이상)</option>
					</select>
				</td>
			</tr>
			<tr class="col-size">
				<th>반려견 크기</th>
				<td>
					<select name="hsl.hsl_size" data-width="130px">
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
<!-- 		<a href="#" role="button" aria-label="Delete item 1">초기화</a>  -->
	</form>
</div>
<div>	
	<table id="search_result">
		<tr style="border: 1px">
			<td>사진, 주소</td>
			<td>제목</td>
			<td>작성자</td>
			<td>고객후기 개수</td>
			<td>펫시터총점</td>
		</tr>
	</table>
</div>                                                  
</body>                                                  
</html>                                                                                                      
                                                       