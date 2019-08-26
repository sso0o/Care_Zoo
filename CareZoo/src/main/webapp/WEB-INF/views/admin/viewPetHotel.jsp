<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewPetHotel</title>
</head>
<body>
	<div>
		<fieldset>
			<legend>펫호텔 정보</legend>
			<form action="${contextPath }/admin/modifyPetHotel", method="post">
				<table>
					<tr>
						<input type="hidden" name="ph_num" value="${ph.ph_num }">
						<th>호텔이름</th>
						<td><input type="text" name="ph_name" value="${ph.ph_name }"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="hidden" id="sample4_postcode" placeholder="우편번호"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> 
						<input type="text" id="sample4_roadAddress" name="ph_address" value="${ph.ph_address }"> 
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"></td>
						<td>
							<input type="text" id="c_d_address" name="ph_d_address" value="${ph.ph_d_address }"> 
							<span id="guide" style="color: #999"></span>
						</td>
					</tr>
					<tr>
						<th>가능한 펫 마리수</th>
						<td><input type="number" name="ph_p_count" value="${ph.ph_p_count }"></td>
					</tr>

					<tr>
						<td><input type="submit" value="제출"></td>
					</tr>
			</form>
		</fieldset>
	</div>

</body>
</html>