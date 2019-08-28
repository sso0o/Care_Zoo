<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeSitterPosting</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript">
// window.onload=function(){	  
// 	var file = document.getElementById('file');
// 	var image = document.getElementById('image');
// 	file.onchange = function (event) {
// 		var target = event.currentTarget;
// 		var xmlHttpRequest = new XMLHttpRequest();
// 		xmlHttpRequest.open('GET', 'https://api.imgur.com/3/image/', true);
// 		xmlHttpRequest.setRequestHeader("Authorization", "a67e5c2cedd7a3e");
// 		xmlHttpRequest.onreadystatechange = function () {
// 		  if (xmlHttpRequest.readyState == 4) {
// 		    if (xmlHttpRequest.status == 200) {
// 		      var result = JSON.parse(xmlHttpRequest.responseText);
// 		      image.src = result.data.link;
// 		      console.log(result);
// 		    }
// 		    else {
// 		    	alert("업로드 실패");
// 		    	image.src = "http://dy.gnch.or.kr/img/no-image.jpg";
// 		    }
// 		  }
// 		};		
// 	xmlHttpRequest.send(target.file);
// 	image.src = "https://nrm.dfg.ca.gov/images/image-loader.gif";
// 	};	
// }
var regex = new  RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; //5MB
function checkExtension(fileName, fileSize){
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과")
		return false;
	}
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.")
		return false;
	}
	return true;
}
$(document).ready(function(){
	$("#uploadBtn").on("click",function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		//add fileData to formdata
		for(var i =0; i<files.length;i++){
			formData.append("uploadFile", files[i]);
		}
		$.ajax({
			url:'${contextPath}/home/uploadAjaxAction',
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			success:function(result){
				alert("Uploaded");
				console.log(result);
				showUploadedFile(result);
				$('.uploadDiv').html(cloneObj.html());
			}
		}); //$.ajax
	});
});
var uploadResult=$(".uploadResult ul");
function showUploadedFile(uploadResultArr){
	var str ="";
	$(uploadResultArr).each(function(i,obj){
		if(!obj.image){
			str += "<li><img src='/resources/img/attach.png'>"+obj.fileName+"</li>";
		} else{			
// 		str += "<li>"+obj.fileName +"<li>";
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
			str += "<li><img src = '/display?fileName="+fileCallPath+"'><li>"
		}
	});
	uploadResult.append(str);
}
</script>
</head>
<body>
	<div class="uploadDiv">
<!-- 		<img id=image src="http://dy.gnch.or.kr/img/no-image.jpg"> -->
		<input type="file" name="uploadFile" multiple="multiple">
	</div>
	<button id="uploadBtn">Upload</button>
	<div class="uploadResult">
		<ul>
		
		</ul>
	</div>
	<div>
		<form action="">
			<table>
				<tr>
					<th></th>
					<td>
					</td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>