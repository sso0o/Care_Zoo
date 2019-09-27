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
//hour의 값 중복되지 않게 check해주기
function oneCheckbox(a){
    var vsr_hour = document.getElementsByName("vsr_hour");
    var vsr_hAdd = document.getElementsByName("vsr_hAdd");
    
    
    for(var i=0; i<vsr_hour.length; i++){
        if(vsr_hour[i] != a){
        	vsr_hour[i].checked = false;	
        }

    }
    for(var i=0; i<vsr_hAdd.length; i++){
        if(vsr_hAdd[i] != a){
        	vsr_hAdd[i].checked = false;
        }
    }   
}



$(function(){
	
	var hour = $("#vsr_hour").val();
	var hAdd = $("#vsr_hAdd").val();
	console.log(hour);
	console.log(hAdd);
	
	var hours = ['9시~12시','12시~15시','15시~18시','18시~21시'];
	var hourss= ['9','12','15','18'];
	var str="";
	
	var hAdds = ['없음','+1시간','+2시간','+3시간','+4시간'];
	var hAddss = ['0','1','2','3','4']
	var str2="";
	
	for(var i=0;i<hours.length;i++){
		 str =$("<input type='checkbox' class='box' name='vsr_hour' id='vsr_hour' onclick='oneCheckbox(this)' value=>"+hours[i]+"<br>").val(hourss[i]);	
		if(str.val()==hour){
			str.attr("checked", 'checked');
		}
		 $("#hours"+i).append(str);
		 for(var j=0;j<hAdds.length;j++){
				str2 =$("<input type='checkbox' class='box1' name='vsr_hAdd' id='vsr_hAdd' onclick='oneCheckbox(this)' value=>"+hAdds[j]+"<tr>").val(hAddss[j]);
				if(str2.val()=="없음"&& str.val()==hour|| str2.val() == hAdd && str.val()==hour){
					str2.attr("checked",'checked');
				}
				$("#hAdds"+i).append(str2);
			}
		 
	}



	
	
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
		var count = $("input:checkbox[name=vsr_hour]:checked").length;
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
<!-- 체크된거랑 중복되지 않게 데이터만 전달해줄 수 있도록 form에서 빼준다. -->

	<input type="hidden" value="${vsr_hour}" name="vsr_hour" id="vsr_hour">
	


	<input type="hidden" value="${vsr_hAdd}" name="vsr_hAdd" id="vsr_hAdd">


	

<form action="adds" method="post">
	<input type="hidden" value="${vsr_num}" name="vsr_num">
	<input type="hidden" value="${vsr_chkin}" name="vsr_chkin" id="vsr_chkin">
	<input type="hidden" value="${c_num}" name="c_num">
	<c:forEach items="${p_num}" var="pn">
	<input type="hidden" name="p_num" value="${pn}">
	</c:forEach>
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