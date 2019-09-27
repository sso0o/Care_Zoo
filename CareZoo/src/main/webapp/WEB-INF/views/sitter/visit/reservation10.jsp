<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	var maxCount=$("input[name=p_num]").length;
	console.log(maxCount);

	var chkin =$("input[name=vsr_chkin]").length;
	console.log(chkin);
	
	var total = "";
	if($("#hAdd").val()=="0"){
		 total = 0*maxCount;
	}else if($("#hAdd").val()=="1"){
		total = 15000*maxCount;
	}else if($("#hAdd").val()=="2"){
		total = 30000*maxCount;
	}else if($("#hAdd").val()=="3"){
		total = 45000*maxCount;
	}else if($("#hAdd").val()=="4"){
		total = 60000*maxCount;
	}
	console.log(total);
	
	var totals = (28000*1)+((maxCount-1)*5000);
	console.log(totals);
	
	var result = Number(total) + Number(totals);
	console.log(result);
	
	var totalResult = Number(result)*Number(chkin);
	console.log(totalResult);
	$("#totalPay").append("<input type='hidden' name='vsr_totalPrice' value='"+result+"'>"+result+"원");
	
	
});

</script>
<title>방문 펫시터 예약(일반)</title>
</head>
<body>
<h3>예약 확인 및 결제정보를 등록해주세요.</h3>
<form action="end" method="post">
	<table>
		<tr>
			<td><input type="hidden" name="c_num" value="${c_num}"></td>
			<td><c:forEach items="${p_num}" var="p" >
					<input type="text" name="p_num" value="${p}" name="p_num">
				</c:forEach></td>
			<td><c:forEach items="${vsr_hAddList}" var="li" >
				<input type="hidden" id="hAdd" class="hAdd" value="${li.vsr_hAdd}">
				<input type="hidden" id="chkin" name="vsr_chkin" value="${li.vsr_chkin}">
				<input type="hidden" name="vsr_num" value="${li.vsr_num}">
			</c:forEach></td>
		</tr>
		<tr>
			<th>맡기실 반려 동물 </th>
			<td><c:forEach items="${nameList}" var="li">
				${li.p_name}
			</c:forEach></td>
		</tr>
		<tr>
			<th>방문 주소</th>
			<td>${address.c_address} ${address.c_d_address}</td>
		</tr>
		<tr>
			<th>결제 예정 금액(1박 기준)</th>
			<td><div id="totalPay"></div></td>
		</tr>
		<tr>
			<td>
			<input type="button" onclick="location.href='${contextPath}/visit/payment?c_num=${c_num}'" value="요금 세부 정보 보기">
			</td>
		</tr>
	</table>
	<input type="submit" value="예약완료하기">
</form>	

</body>
</html>