<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addPetHotelForm</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// 	new daum.Postcode({
	// 		oncomplete : function(data) {
	// 			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	// 			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
	// 		}
	// 	}).open();
</script>
<script src="https://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>
<script type="text/javascript">
	if(${msg} != null){
		alert("${msg}");
	}
	
	
</script>
</head>
<body>

	<div>
		<fieldset>
			<legend>호텔 정보 입력</legend>
			<form action="${contextPath}/admin/addPetHotel" method="post">
				<table>
					
					<tr>
						<th>호텔이름</th>
						<td><input type="text" name="ph_name"></td>
					</tr>
					<tr>
						<th>주소 </th>
						<td>
							<input type="hidden" id="sample4_postcode" placeholder="우편번호"> 
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
							<input type="text" id="sample4_roadAddress" name="ph_address" placeholder="도로명주소">
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						</td>
						<td>
							<input type="text" id="c_d_address" name="ph_d_address" placeholder="상세주소 입력해주세요">
							<span id="guide" style="color: #999"></span>
						</td>
					</tr>
					<tr>
						<th>가능한 펫 마리수</th>
						<td><input type="number" name="ph_p_count"></td>
					</tr>
					
					<tr>
						<td><input type="submit" value="제출"></td>
					</tr>

				</table>
			</form>

		</fieldset>

	</div>

</body>
</html>