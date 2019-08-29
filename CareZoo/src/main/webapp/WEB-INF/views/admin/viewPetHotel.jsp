<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewPetHotel</title>
<script type="text/javascript">
	function removeCheck() {
		if (confirm("정말 삭제할건지?") == true) {
			location.href = '${contextPath}/admin/delPetHotel?ph_num=${ph.ph_num}'
		} else {
			return false;
		}
	}
	$(function(){ //문서가 로딩되면 실행할 함수
		var fileName = getOriginFileName('${pethotel.ph_fileName}');
		$("#attach_file").text(fileName);
	});
</script>

</head>
<body>
	<div>
		<fieldset>
			<legend>펫호텔 정보</legend>
			<form action="${contextPath }/admin/modifyPetHotel" method="post">
				<table>
					<tr>
						<td><input type="hidden" name="ph_num" value="${pethotel.ph_num }"></td>
						<th>호텔이름</th>
						<td><input type="text" name="ph_name" value="${pethotel.ph_name }"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="hidden" id="sample4_postcode"
							placeholder="우편번호"> <input type="button"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <input
							type="text" id="sample4_roadAddress" name="ph_address"
							value="${pethotel.ph_address }"> <input type="hidden"
							id="sample4_jibunAddress" placeholder="지번주소"></td>
						<td><input type="text" id="c_d_address" name="ph_d_address"
							value="${pethotel.ph_d_address }"> <span id="guide"
							style="color: #999"></span></td>
					</tr>
					<tr>
						<th>가능한 펫 마리수</th>
						<td><input type="number" name="ph_p_count"
							value="${pethotel.ph_p_count }"></td>
					</tr>

					<tr>
						<td><input type="submit" value="수정"></td>
						<td><input type="button" value="삭제" onclick="removeCheck()"></td>
					</tr>
					<tr>
<!-- 						<th>첨부파일</th> -->
<%-- 						<td><a href="download?ph_num=${pethotel.ph_num}" id="attach_file"></a></td> --%>
						<td><img width="200px" height="200px" src="${contextPath}/petHotel/image?ph_num=${pethotel.ph_num}"/></td>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
</body>
</html>