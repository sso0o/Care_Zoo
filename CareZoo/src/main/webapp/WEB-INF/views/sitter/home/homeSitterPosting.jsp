<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeSitterPosting</title>
</head>
<body>
<div>
	<form action="home/write" method="post" enctype="multipart/form-data">
		<h1>가정용펫시터 글 등록페이지</h1>
		<table>
			<tr>
				<th>글제목**</th>
				<td></td>
			</tr>
			<tr>
				<th>글내용**</th>
				<td>Q. 왜 도그메이트 펫시터를 하게 되었나요?<textarea rows="5" cols="10"></textarea> </td>
				<td>Q. 반려견을 키운 경험에 대해 알려주세요. 현재 반려견을 키우고 계시다면 자세히 소개해주세요!<textarea rows="5" cols="10"></textarea></td>
				<td>Q. 애견호텔이 아닌 저에게 맡겨주시면 아래와 같은 내용을 약속드립니다.<textarea rows="5" cols="10"></textarea></td>
				<td>※ 아래 유형의 아이들은 돌봄이 어려울 수 있습니다.<textarea rows="5" cols="10"></textarea></td>
			</tr>
			<tr>
				<th>돌봄 공간의 사진을 올려주세요**</th>
				<td><input type="file" name="hsl_filename"></td>
			</tr>
			<tr>
				<th>펫을 돌볼 수 있는 날짜를 선택해 주세요**</th>
				<td></td>
			</tr>
			<tr>
				<th>체크인 가능 시간의 범위를 지정해 주세요</th>
				<td></td>
			</tr>
			<tr>
				<th>체크아웃 가능 시간의 범위를 지정해 주세요</th>
				<td></td>
			</tr>
			<tr>
				<th>돌봄 가능한 강아지의 크기를 선택해 주세요</th>
				<td></td>
			</tr>
			<tr>
				<th>돌봄 가능한 강아지의 나이를 선택해 주세요</th>
				<td></td>
			</tr>
			<tr>
				<th>현재 키우고 있는 펫 크기를 선택해주세요</th>
				<td></td>
			</tr>
		</table>
		<h1>돌봄 환경에 대해 자세히 알려주세요</h1>
		<table>
			<tr>
				<th>돌봄공간</th>
				<td></td>
			</tr>
			<tr>
				<th>인근 지하철역</th>
				<td></td>
			</tr>
			<tr>
				<th>마당유무</th>
				<td></td>
			</tr>
			<tr>
				<th>14세미만 아동 거주 유무</th>
				<td></td>
			</tr>
			<tr>
				<th>가족 동거 유무</th>
				<td></td>
			</tr>
			<tr>
				<th>다른 동물 유무</th>
				<td></td>
			</tr>
			<tr>
				<th>강아지 사진</th>
				<td></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기">
					<input type="button" value="돌아가기" onclick="location.href='${contextPath}/home/main">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>