<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script>

<script type="text/javascript">
	$(function() {
		var paramsArr = [];

		//datepicker
		var datepickerStart = $('#chkin').datepicker({
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
		var datepickerEnd = $('#chkout').datepicker({
			dateFormat: 'yy-mm-dd', 
			minDate: moment('yy-mm-dd').toDate()
		});
			
		$("select[name=c_num]").on("change", function() {
			var c_num = $(this).val();
			
			$.ajax({
				url : "${contextPath}/admin/petchk",
				data : {
					c_num : c_num
				},
				dataType : "json",
				success : function(data) {
					// 					console.log(data.pL)
					$("#petL").find("option").remove();
					for ( var i in data.pL) {
						// 						alert(data.pL[i].p_num)
						var op = '<option value=\"'
						op += (data.pL[i].p_num)
						op += '\" title=\"'
						op += (data.pL[i].p_name)
						op += '\">'
						op += (data.pL[i].p_name)
						op += '</option>'
						$(op).appendTo("#petL");
					}
				},
				error : function() {
					alert("실패");
				}
			});

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
			add(dateStart,dateEnd);
		})
		
		
		//제출버튼(예약)
		$("#btnSubmit").on("click", function() {
			$("#rst tr").not('tr:first').each(function() {
				var param = {};
				param.c_num = $(this).find('td').find("input[id='c_num']").val();
				param.p_num = $(this).find('td').find("input[id='p_num']").val();
				param.ph_num = $(this).find('td').find("input[id='ph_num']").val();
				param.phr_chkin = $(this).find('td').find("input[id='phr_chkin']").val();
				param.phr_chkout = $(this).find('td').find("input[id='phr_chkout']").val();
				console.log(param)
				paramsArr.push(param);
			})
			
			var arrData = JSON.stringify(paramsArr)
		
			console.log(arrData)
			$.ajax({
				url: "${contextPath}/admin/resPetHotel",
				data:{"str":arrData},
				type:"post",
				dataType: "JSON",
				success: function(rst) {
					alert("삽입성공");
				}, error : function() {
					alert("삽입실패")
				}
			});
		});
	})
	
	var count = 0;
	function add(dateStart,dateEnd) {
		var ds = dateStart.format('YYYY-MM-DD')
		var de = dateEnd.format('YYYY-MM-DD')
		var cname = $("#cnum").find("option:selected").attr("title");
		var pname = $("#petL").find("option:selected").attr("title");
		var phname = $("#phnum").find("option:selected").attr("title");

		var table = $("#rst");
		var tr = $("<tr>");
		var td1 = $("<td>").append('<input type="hidden" id="c_num" value="'+$("#cnum").val()+'">');
		var td2 = $("<td>").append(cname)
		var td3 = $("<td>").append('<input type="hidden" id="p_num" value="'+$("#petL").val()+'">');
		var td4 = $("<td>").append(pname)
		var td5 = $("<td>").append('<input type="hidden" id="ph_num" value="'+$("#phnum").val()+'">');
		var td6 = $("<td>").append(phname)
		var td7 = $("<td>").append('<input type="text" id="phr_chkin" value="' + ds + '">');
		var td8 = $("<td>").append('<input type="text" id="phr_chkout" value="' + de + '">');
		var btn = $("<button>삭제</button>")
		tr.append(td1);
		tr.append(td2);
		tr.append(td3);
		tr.append(td4);
		tr.append(td5);
		tr.append(td6);
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

<title>resPetHotelForm</title>
</head>
<body>
	<div>
		<table id="list">
			<tr>
				<th>고객</th>
				<th>펫</th>
				<th>펫호텔</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>추가</th>
			</tr>
			<tr>
				<td><select name="c_num" id="cnum">
						<c:forEach items="${cL }" var="c">
							<option value="${c.c_num }" title="${c.c_name }">${c.c_name }</option>
						</c:forEach>
				</select></td>
				<td><select name="p_num" id="petL">
				</select></td>
				<td><select name="ph_num" id="phnum">
						<c:forEach items="${phL }" var="ph">
							<option value="${ph.ph_num }" title="${ph.ph_name }">${ph.ph_name }</option>
						</c:forEach>
				</select></td>
				<td><input type="text" placeholder="시작 날짜" readonly="readonly" name="phr_chkin" id="chkin"></td>
				<td><input type="text" placeholder="마침 날짜" readonly="readonly" name="phr_chkout" id="chkout"></td>
				<td><input type="button" id="addBtn" value="추가"></td>
			</tr>
		</table>
		<div><hr></div>
		<table id="rst" style="width: 600px">
			<tr>
				<th colspan="2">고객</th>
				<th colspan="2">펫</th>
				<th colspan="2">펫호텔</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>삭제</th>
			</tr>
		</table>
		<button id="btnSubmit">제출</button>
	</div>
</body>
</html>