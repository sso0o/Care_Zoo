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

<title>petHotelResForm</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<link href="${contextPath }/resources/css/minical.css" rel="stylesheet"
	type="text/css">

<style>
ul, li {
	list-style: none;
}
</style>




</head>
<body>

	<div>
		<h2>펫호텔 예약</h2>
		<fieldset>
			<legend>예약 정보 입력</legend>

			<form action="${contextPath }/petHotel/petHotelRes" method="post">

				<table>
					<tr>

					</tr>

					<tr>
						<td>체크인</td>
						<td><input type="text" name="in"></td>
						<td>체크아웃</td>
						<td><input type="text" name="out"></td>
					</tr>
					<tr>
						<td>반려견 정보</td>
						<td>
							<select name="petInfo">
								<option value="a">a</option>
								<option value="b">b</option>
								<option value="c">c</option>
								<option value="d">d</option>
							</select>
						</td>
					</tr>
					


					<tr>
						<td><input type="submit" value="예약하기"></td>
					</tr>
				</table>
			</form>
		</fieldset>


	</div>

	<script src="${contextPath}/resources/js/minical.js"></script>
	<script type="text/javascript">
		$("input[name='in']").minical();
		$("input[name='out']").minical();
	</script>


</body>
</html>