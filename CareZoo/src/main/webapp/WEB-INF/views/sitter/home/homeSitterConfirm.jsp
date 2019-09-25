<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoosthness/jquery-ui.css" /> -->
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script>          
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script> 
<meta charset="UTF-8">
<title>homeSitterConfirm</title>
<!-- 가정시터 예약확인창 -->
<script type="text/javascript">

</script>
</head>
<body>
<input value="${params.hsl_num }"> 
<input name="c_num" value="${c_num}">
<input value="${params.hs_num}" >

<div>
	<div>
		<dl>
<%-- 			<fmt:form value="${params.hsr_chkin}"  pattern="yyyy년 MM월 dd일"></fmt:formatDate> --%>
			<dt><strong>${params.hs_name}</strong>님에게 예약요청 메시지를 보냅니다.</dt>
			<dd>아래 예약 내역을 확인 후 돌보미에게 문의하세요!</dd>
		</dl>
	</div>
	<form action="">
		<div>
			<ul>
				<li>
					<dl>
						<dt>체크인</dt>
						<dd id="checkIn">${params.hsr_chkin}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>체크아웃</dt>
						<dd id="checkOut">${params.hsr_chkout}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>반려견</dt>
						<dd>1마리</dd>
					</dl>
				</li>
			</ul>
			<h2>예약내역 상세보기</h2>
			<dl>
				<dt>20,000원 X 1 day</dt>
				<dd>20,000원</dd>
				<dt>8시간 초과 금액</dt>
				<dd>0원</dd>
				<dt>부가세 10%</dt>
				<dd>2,000원</dd>
				<dt>최종금액</dt>
				<dd>22,000원</dd>
			</dl>
		</div>
		<div>
			<h4>예약요청 전 꼭 확인해주세요!</h4>
			<ul>
				<li>* 예약을 위해 강아지에 대한 내용을 돌보미에게 상세히 적어주세요.</li>
				<li>* 예약완료를 위해 돌보미의 결제요청 후 2시간 이내로 입금해주셔야합니다. (늦어질 경우 도그메이트 고객센터로 연락주세요.)</li>
				<li>* 사전만남은 예약 완료 후 진행하실 수 있으며, 환불은 예약 3일전까지 100% 가능합니다.</li>
				<li>* 개인 연락처를 공유하지마세요. 예약이 완료되면 돌보미의 연락처를 확인하실 수 있습니다.</li>
				<li>* 메시지 내용은 안전거래 등의 목적으로 회사가 열람, 수집할 수 있습니다.</li>
			</ul>
		</div>
		<textarea placeholder="김수연 돌보미에게 예약요청을 위해 메시지를 남겨주세요." maxlength="4000" id="txtMESSAGE"></textarea>
		<dl>
			<dt>사전만남 가능 일자를 알려주세요!</dt>
			<dd>
				<strong>* 사전만남이란?</strong> 돌봄 전 돌보미와 의뢰인, 의뢰인의 반려견이 사전에 만나 체크리스트를 작성하고 미리 시간을 함께 보내는 것으로, 최소 예약 3~5일 전까지 진행하시는 것을 권장하며 첫거래시에만 필수로 진행하고 있습니다. 사전만남없이 돌봄을 진행할 경우 돌보미에 따라 예약이 불가할 수 있습니다.
			</dd>
			<dd><input type="text" placeholder="사전만남 가능 일자를 최대 5개 까지 입력해주세요 ^.^"></dd>
			<dd>달력띄우기***********************</dd>
		</dl>
		<dl>
			<dt>도그메이트를 이용하시는 이유에 대해 알려주세요!</dt>
			<dd>
				<select>
					<option value="">맡기시는 이유는 무엇인가요?</option>
					<option value="여행">여행</option>
					<option value="출장">출장</option>
					<option value="회사업무 (워크샵, 야근 등등)">회사업무 (워크샵, 야근 등등)</option>
					<option value="집안행사">집안행사</option>
					<option value="혼자 있는 시간동안 잠시 맡기기 위해">혼자 있는 시간동안 잠시 맡기기 위해</option>
					<option value="기타">기타</option>
				</select>
			</dd>
		</dl>
		<ul>
			<li>요청 시 잘못된 정보를 전달할 경우 이로인해 발생되는 문제에 대한 책임은 의뢰인 본인에게 있습니다.</li>
			<li>'예약 요청'을 클릭하면 서비스 총액을 지불하는 것과 서비스 약관, 환불정책에 동의하는 것입니다.</li>
			<li>돌보미가 예약 요청을 수락해야 결제를 진행 할 수 있으며, 24시간 이내에 돌보미가 요청에 대한 응답을 할 것 입니다.</li>
		</ul>
		<input type="button" name="" value="예약 요청 보내기">
	</form>
</div>
</body>
</html>