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
	var maxCount=${p_num}.length;
	console.log(maxCount);

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
	$("#totalPay").append(result+"원");
});

</script>
<title>방문 펫시터 예약(일반)</title>
</head>
<body>
<h3>예약 확인 및 결제정보를 등록해주세요.</h3>
<form action="payment" method="post">
	<table>
		<tr>
			<td><input type="hidden" name="c_num" value="${c_num}"></td>
			<td><c:forEach items="${p_num}" var="p">
					<input type="hidden" name="p_num" value="${p}">
				</c:forEach></td>
			<td><c:forEach items="${vsr_hAddList}" var="li" >
				<input type="hidden" id="hAdd" class="hAdd" value="${li.vsr_hAdd}">
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
			<th>결제 예정 금액</th>
			<td><div id="totalPay"></div></td>
			</tr>
		<tr>
			<td><input type="submit" value="요금 세부 정보 보기"></td>
		</tr>
	</table>
	
</form>	
<button onclick="location.href='${contextPath}/visit/end'">예약완료하기</button> 
</body>
</html>