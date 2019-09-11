<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation3</title>
<style type="text/css">
	.img_wrap{
		width:300px;
		margin-top:50px;
	}
	.img_wrap img{
		max-width: 100%;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">

var sel_file;

$(document).ready(function(){
	$("#input_img").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	})
}
</script>
</head>
<body>
<h1>반려동물 등록하기</h1>
<h3>반려견에 대해 알려주세요</h3><br>
	<form action="petjoin" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="c_num" value="${c_num}"></td>
			</tr>
			<%-- 파일 선택하기 위한 input --%>
			<tr>
				<th>이미지등록</th>
				<td>
					<input type="file" name="p_img" id="input_img">
					<div class="img_wrap">
					<img id="img" />
					</div>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="p_name"><br></td>
			</tr>
			<tr>
				<th>종류</th>
				<td><input type="text" name="p_kind"><br></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="p_sex" value="수컷">수컷 <input
					type="radio" name="p_sex" value="암컷">암컷</td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="p_birth"></td>
			</tr>
			<tr>
				<th>무게</th>
				<td><input type="text" name="p_weight">kg</td>
			</tr>
			<tr>
				<th>중성화 유무</th>
				<td><input type="radio" name="p_none_sex" value="유">유 <input
					type="radio" name="p_none_sex" value="무">무</td>
			</tr>
			<tr>
				<th>특이사항을 알려주세요</th>
				<td><input type="text" name="p_notify"></td>
			</tr>
		</table>
		<div>
			<input type="submit" value="등록 완료">
		</div>
	</form>
		<button onclick="location.href='${contextPath}/visit/petList1?c_num=${c_num}'">기존 반려견으로 할래요!</button>
</body>
</html>