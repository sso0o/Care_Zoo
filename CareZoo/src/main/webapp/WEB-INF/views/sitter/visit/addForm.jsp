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
	var hour = $("#pd_hour").val();
	var hAdd = $("#pd_hAdd").val();
	console.log(hour);
	console.log(hAdd);
	
	var hours = ['9시~12시','12시~15시','15시~18시','18시~21시'];
	var str="";
	
	var hAdds = ['없음','+1시간','+2시간','+3시간','+4시간'];
	var str2="";
	
	for(var i=0;i<hours.length;i++){
		 str =$("<input type='checkbox' class='box' name='pd_hour' id='pd_hour' value=>"+hours[i]+"<br>").val(hours[i]);	
		if(str.val()==hour){
			str.attr("checked", 'checked');
		}
		 $("#hours"+i).append(str);
		 for(var j=0;j<hAdds.length;j++){
				str2 =$("<input type='checkbox' class='box1' name='pd_hAdd' id='pd_hAdd' value=>"+hAdds[j]+"<tr>").val(hAdds[j]);
				if(str2.val()==hAdd && str.val()==hour){
					str2.attr("checked",'checked');
				}
				$("#hAdds"+i).append(str2);
			}
		 
		

	}
// 	$(".box").on("click",function(){
// 		console.log("assadddddddddddd")
		

// 	})

	//hAdd의 값 중복되지 않게 check해주기
	//id로 하면 한개의 값만 가져오기 때문에 
	//class의 값을 주고  siblings로 자매들값을 불러 prop 해준다..
		$(".box1").on("click",function(){
			console.log("box1");
			$(this).siblings().prop("checked",false);
			var isClicked = $(this).prop("checked");
			
			if(isClicked){
				$(this).closest("tr").prev().find("input").prop("checked",true);	
				console.log($(this).closest("tr").prev().find("input").val())
			}else{
				$(this).closest("tr").prev().find("input").prop("checked",false);
			}
			//삼항연산자로도 가능
// 			$(this).prop("checked") 
// 			? $(this).closest("tr").prev().find("input").prop("checked",true) :
// 			  $(this).closest("tr").prev().find("input").prop("checked",false);
		})
		
		$(".box").on("click",function(){
			console.log("box");
			//true로 떨어지면 if문으로 만들거임!!
			console.log($(this).prop("checked"));
			var isClicked2 = $(this).prop("checked");
			
			if(isClicked2){
				$(this).closest("tr").next().find("input").first().prop("checked",true);
				console.log($(this).closest("tr").next().find("input").first().val());
			}else{
				$(this).closest("tr").next().find("input").prop("checked",false);
			}
			
		});

	
	
	
	$("#btn").on("click", function() {

		//checkbox 갯수 구하기(pd_hour)
		var count = $("input:checkbox[name=pd_hour]:checked").length;
		console.log(count);
		
		
		if (count>0) {
			alert("완료");
			return true;
		}
		alert("체크해주세요")
		return false;
 	});	

});
</script>
<title>추가/변경 Form</title>
</head>
<body>
<h1>선택한 시간대에 펫시터가 방문 합니다.<br></h1>
<h2>(중복선택 가능/기본 1시간 돌봄)</h2>
<form action="adds" method="post">
	<input type="hidden" value="${pd_week}" name="pd_week" id="pd_week">
	<input type="hidden" value="${pd_hour}" name="pd_hour" id="pd_hour">
	<input type="hidden" value="${pd_hAdd}" name="pd_hAdd" id="pd_hAdd">
	<input type="hidden" value="${c_num}" name="c_num">
		<table>
			<tr>
				<th><div id="hours0"></div></th>
			</tr>
			<tr>
				<td><div id="hAdds0"></div></td>
			</tr>		
				<tr>
				<th><div id="hours1"></div></th>
			</tr>
			<tr>
				<td><div id="hAdds1"></div></td>
			</tr>
					<tr>
				<th><div id="hours2"></div></th>
			</tr>
			<tr>
				<td><div id="hAdds2"></div></td>
			</tr>
					<tr>
				<th><div id="hours3"></div></th>
			</tr>
			<tr>
				<td><div id="hAdds3"></div></td>
			</tr>
			
		</table>
					

	<div>
		<input type="submit" value="확인" id="btn">
	</div>
</form>
</body>
</html>