<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th{
	font-weight:600;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	var maxCount=$("input[name=p_num]").length;
	console.log("count"+maxCount);
$("#count").append(maxCount);

var pay = "";
if($("#hAdd").val()=="0"){
	 pay = 0+"원";
}else if($("#hAdd").val()=="1"){
	pay = 15000+"원 ";
}else if($("#hAdd").val()=="2"){
	pay = 30000+"원 ";
}else if($("#hAdd").val()=="3"){
	pay = 45000+"원 ";
}else if($("#hAdd").val()=="4"){
	pay = 60000 +"원";
}
$(".hdd").append(pay);

var total = "";
if($("#hAdd").val()=="0"){
	 total = 0*maxCount+"원";
}else if($("#hAdd").val()=="1"){
	total = 15000*maxCount+"원 ";
}else if($("#hAdd").val()=="2"){
	total = 30000*maxCount+"원 ";
}else if($("#hAdd").val()=="3"){
	total = 45000*maxCount+"원 ";
}else if($("#hAdd").val()=="4"){
	total = 60000*maxCount+"원";
}
console.log(total);
$("#totalPay").append(total);
	//p_num
// 	var jsonData = ${p_num};
// 	console.log(jsonData);
// 	str="";
// 	for(i in jsonData){
// 		str += i== jsonData.length-1 
// 		? "p_num="+jsonData[i]:"p_num="+jsonData[i]+"&"
// 	}
// 	console.log(str)
//	var json = JSON.stringify(${p_num});
	var json =${list};
	console.log(json);
	
	$.ajax({
		url:"${contextPath}/visit/test",
		type:"post",
		data:json, 
		dataType:"json",
		success:function(data){
			console.log(data);
				var max = $("input[name=p_num]").length-1;
				 var total = 28000+(5000*max)+"원";	
				 $("#total").append(total);
				 	for(var i =0;i<$("input[name=p_num]").length;i++){
			 		if(i>0){
			 			var str = $("<tr><th>한마리 추가</th> <td>5000원</td></tr>");
			 			($("#add").append(str))*i;
			 		}
			 	}
// 			var max = data.length-1;
// 			console.log(max);
// 			var total = 28000+(5000*max)+"원";
// 			$("#total").append(total);
// 			for(var i=0;i<data.length;i++){
// 				if(i>0){
// 					var str = $("<tr><th>한마리 추가</th> <td>5000원</td></tr>");
// 		 			($("#add").append(str))*i;
// 				}
// 			}
		},
		error:function(jqXHR, testStatus, errorTrown){
			alert('mm');
			
		}
			
	});
	
	//vsr_chkin
	var jsonData2 = ${list2};
	console.log(jsonData2);
// 	str2="";
// 	for(i in jsonData2){
// 		str2 += i== jsonData2.length-1 
// 		? "pd_week="+jsonData2[i]:"pd_week="+jsonData2[i]+"&"
// 	}
// 	console.log(str2)
	$.ajax({
		url:"${contextPath}/visit/test2",
		type:"post",
		data:jsonData2,
		dataType:"json",
		success:function(data){
			console.log(data);

				var max = $("input[name=p_num]").length-1;
				 var total1 = 28000+(5000*max)+"원";	
					$.each(data,function(key,value){
						console.log(value);
						 $("#total1").append("<tr><th>"+value+"</th><td>"+total1+"</td><tr>");
					});

		},
		error:function(jqXHR, testStatus, errorTrown){
			alert('mm');
			
		}
			
	});
}); 

</script>
<meta charset="UTF-8">
<title>요금 세부 정보</title>
</head>
<body>
<form action="reservation10" method="post">
<h2>요금 상세 내역</h2>
	<table>
		<tr>
			<td><input type="hidden" name="vsr_count" value="${vsr_count}"></td>
			<td><input type="hidden" name="c_num" value="${c_num}"></td>
			<td><c:forEach items="${p_num}" var="p">
					<input type="hidden" name="p_num" value="${p}">
				</c:forEach></td>
		</tr>
		<tr>
			<th>회당 기본 금액</th>
			<td><div id="total"></div></td>
		</tr>
		<tr>	
			<th>기본 1마리</th>
			<td>28000원</td>
		</tr>
		<tr>
			<td>
				<div id="add">
		
				</div>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>상세 예약 내역</th>
		</tr>

				<tr>
					<td><div id="total1"></div></td>
				</tr>

			<tr>
				<th>추가 시간 내역</th>
				<th>기본 비용</th>
<!-- 				<th>이용 횟수</th> -->
<!-- 				<th>추가비 합계</th> -->
			</tr>
			<c:forEach items="${vsr_hAddList}" var="li" >
			<tr>
				<th>+${li.vsr_hAdd}시간
				<input type="hidden" id="hAdd" value="${li.vsr_hAdd}"></th>
				<td><div id="hdd" class="hdd"></div></td>
<!-- 				<td><div id="count" style="text-align:center"></div></td> -->
			</tr>	
			</c:forEach>
			<tr>
				<th>추가 시간 합계</th>
				<td><div id="totalPay" class="totalPay"></div></td>	
		
			</tr>
	</table>
	<div>
		<input type="submit" value="확인">
	</div>
</form>	
	
	
</body>
</html>