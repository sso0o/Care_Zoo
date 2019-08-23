<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeSitterList</title>
<!-- 가정용 펫시터 리스트 -->


</head>
<body>
<div >
		<form action="search" method="get">
			<div>
				<label>전체</label>
				<input type="checkbox" name="local" value="l0">
				<label>서울</label>
				<input type="checkbox" name="local" value="l0">
				<label>경기</label>
				<input type="checkbox" name="local" value="l0">
				<label>인천</label>
				<input type="checkbox" name="local" value="l0">
			</div>
			<div>
				<label>서비스</label>
				<select  name = "" title=""  id="" >
					<option value="allday">24시간 돌봄</option>
					<option value="daycare">데이케어</option>
				</select>
				
				<label>예약일</label>
				<input type="date" id="start" value="시작 날짜">
				<input type="date" id="end" value="마침 날짜">
				
				<label>반려견 나이</label>
				<select  name = "" title=""  id="" >
					<option>강아지 (1살 이하)</option>
					<option>성견 (2~6살)</option>
					<option>노령견 (7살)</option>
				</select>
				
				<label>반려견 크기</label>
				<select  name = "" title="" id="" >
					<option>소형견 (0~4.9kg)</option>
					<option>중형견 (5~14.9kg)</option>
					<option>대형견 (15kg)</option>
				</select>
			
	<!-- 					<label>펫시터 등급</label> -->
	<!-- 					<select  name = "" title="" id="" > -->
	<!-- 						<option>우수 펫시터</option> -->
	<!-- 						<option>일반 펫시터</option> -->
	<!-- 						<option>신규 펫시터</option> -->
	<!-- 					</select> -->
				<input type="submit" value="찾기">
			</div>
			<div>
				<input type="reset" value = "검색 설정 초기화">
			</div>
		</form>
</div>
</body>
</html>