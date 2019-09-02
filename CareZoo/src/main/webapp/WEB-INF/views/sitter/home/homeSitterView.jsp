<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<script type="text/javascript">
$("form").on("submit",function(){
	event.preventDefault();
//		var params = $(this).serialize();
	var params = $('input:checkbox:checked').serialize();
//		var items = $('hsl_address').is(':checked').serialize();
//		var items = $('input:checkbox[type=checkbox]:checked').map(function (){
//			return this.value;
//			}).get();
	console.log("form submit : " + params);
//		document.write(params);
//		var states = $items.find("[name=hsl_address]").val();
//		var states = $items;
//		console.log(states);
	$.ajax({
		url:"${contextPath}/home/view",
		data:params,
		type:"get",
		dataType:"json",
		success:function(result){
			
		},
		error:function(){
			
		}
	});// ajax
	return false;
});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>
<script type="text/javascript">
    function subTableOpen(strTDNum) {
        var obj = document.getElementById("maintable");
        var ncell_len = obj.rows[0].cells.length;
        for (var i = 0; i < ncell_len; i++) {
            var obj = document.getElementById("menu_" + i);
            if (i == strTDNum) obj.className = "td_mainmenubox_On";
            else obj.className = "td_mainmenubox_Off";
        }
        subTable_in(obj, strTDNum, ncell_len)
    }

    function subTable_in(obj, strTDNum, ncell_len) {
        for (var i = 0; i < ncell_len; i++) {
            if (i == strTDNum) document.getElementById("subtbl_" + i).style.display = "block";
            else document.getElementById("subtbl_" + i).style.display = "none";
        }
    }
	var statesTabs = $('.states-tabs .nav-tabs').empty();
	if (statesTabs.length) {
		$.getJSON('/service/location', function(data) {
			var li = $('<li/>', {role: 'presentation'}).appendTo(statesTabs);
			var whole = $('<a/>', {href: ''}).append('전체').click(function (e) {
				e.preventDefault();
				$('.dropdown', statesTabs).removeClass('active')
					.find(':checkbox:checked').prop('checked', false);
				$search(true);
			}).appendTo(li);

			var countTotal = 0;

			for (var i = 0; i < data.length; i++) {
				var states = data[i].states;
				if (states.length) {
					li = $('<li/>', {role: 'presentation'})
						.addClass('dropdown').appendTo(statesTabs);

					var anchor = $('<a/>', {
						href: '', id: 'stateTabDrop' + i, 'data-toggle': 'dropdown',
						'aria-controls': 'stateTabDrop' + i + '-contents'
					}).addClass('dropdown-toggle').append(data[i].region).appendTo(li);

					var dropdownMenu = $('<div/>', {
						id: 'stateTabDrop' + i + '-contents', 'role': 'menu',
						'aria-controls': 'stateTabDrop' + i
					}).addClass('dropdown-menu').appendTo(li);
					var ul = $('<ul/>').addClass('clearfix').appendTo(dropdownMenu);

					var countRegion = 0;
					var countChecked = 0;

					for (var j = 0; j < states.length; j++) {
						var state = states[j];
						var count = parseInt(state.count_approved_sitter, 10);
						var li2 = $('<li/>').addClass('pull-left').appendTo(ul);

						var checkbox = $('<input/>', {
							type: 'checkbox', name: 'states[]', id: 'state' + state.state_no
						}).addClass('checkbox').val(state.state_no)
							.appendTo(li2).change(function () {
							var self = $(this);
							var dropdown = self.closest('.dropdown');
							if (this.checked) {
								dropdown.addClass('active');
							} else if (!dropdown.find(':checkbox:checked').length) {
								dropdown.removeClass('active');
							}
						});

						$('<label/>', {for: 'state' + state.state_no})
							.append(state.state_name + ' (' + count + ')').appendTo(li2);

						for (var idx in $states) {
							if (state.state_no == $states[idx]) {
								checkbox.prop('checked', true);
								countChecked++;
								break;
							}
						}

						countRegion += count;
					}

					$('<button/>', {type: 'button', 'data-loading': '검색 중...'})
						.addClass('btn btn-mint').append('확인')
						.click(function () {
							$(this).button('loading');
							$search();
						}).appendTo(dropdownMenu);
					$('<button/>', {type: 'button'}).addClass('btn btn-link')
						.append('선택 초기화').click(function () {
							$(this).closest('.dropdown').removeClass('active')
								.find(':checkbox:checked').prop('checked', false);
						}).appendTo(dropdownMenu);

					if (countChecked) {
						li.addClass('active');
					}
					$('<span/>').append(countRegion).appendTo(anchor);
					$('input, label, button', dropdownMenu).click(function (e) {
				    e.stopPropagation();
				  });

					$('<button/>', {type: 'button', 'aria-label': 'Close'})
						.addClass('close visible-xs-block').append(
							$('<span/>', {'aria-hidden' : 'true'}).append('&times;')
						).appendTo(dropdownMenu);

					countTotal += countRegion;
				}
			}
			$('<span/>').append(countTotal).appendTo(whole);
			statesTabs.removeClass('hide').headroom({
				offset: 10, tolerance: {down: 3, up: 10}, onUnpin: function () {
					$(this.elem).find('.open').removeClass('open');
				}
			});
		});
	}
</script>
<head>
<meta charset="UTF-8">
<title>homeSitterView</title>
<!-- 가정집 펫시터 상세내용 -->
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" style="width:420px;">
    <tr>
        <td colspan="3" class="top_space"></td>
    </tr>
    <tr><td class="td_left_right_space"></td>
        <td>
            <table border="0" id="maintable" cellpadding="0" cellspacing="0" style="width:100%; height:30px">
            <tr>
                <td id="menu_0" class="td_mainmenubox_Off" onClick="subTableOpen(0)" style="cursor:hand"><a href="#">전체</a></td>
                <td id="menu_1" class="td_mainmenubox_Off" onClick="subTableOpen(1)" style="cursor:hand"><a href="#">서울</a></td>
                <td id="menu_2" class="td_mainmenubox_Off" onClick="subTableOpen(2)" style="cursor:hand"><a href="#">경기</a></td>
                <td id="menu_3" class="td_mainmenubox_Off" onClick="subTableOpen(3)" style="cursor:hand"><a href="#">인천</a></td>
            </tr>
            </table>
        </td>
        <td class="td_left_right_space"></td>
    </tr>
</table>
<div id="submenu" style="width:420px;">
    <table id="subtbl_0" border="1" cellpadding="0" cellspacing="0" style="display:none">
    <tr>
    	<td>
			
    	</td>
    </tr>    
    </table>
    <table id="subtbl_1" border="1" cellpadding="0" cellspacing="0" style="display:none">
    <tr>
     	<td>
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
    <table id="subtbl_2" border="1" cellpadding="0" cellspacing="0" style="display:none">
    <tr>
     	<td>
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
     		<button type="submit">검색</button>
     		<button type="reset">초기화</button>
     	</td>
     </tr>
    </table>
    <table id="subtbl_3" border="1" cellpadding="0" cellspacing="0" style="display:none">
    <tr>
     	<td>
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
     		<button type="submit">검색</button>
     		<button type="reset">초기화</button>
     	</td>
     </tr>
    </table>
</div>
    <!-- 
<div>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
    <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
  </ul>
  <div class="tab-content">
    Use class "active" for the first active tab
    <div id="home" class="tab-pane fade in active">
      <h3>전체</h3>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>서울</h3>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>경기</h3>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>인천</h3>
    </div>
  </div>
</div>
-->
</body>
</html>