<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation3</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">

var upload = document.getElementsById('p_name')[0],
    holder = document.getElementById('holder');

upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};

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
					<input type="file" name="p_img" id="p_img">
					<div id="holder"></div>
					
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
		<button onclick="location.href='${contextPath}/visit/petList?c_num=${c_num}'">기존 반려견으로 할래요!</button>
</body>
</html>