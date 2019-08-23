<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeSitterList</title>
<!-- 가정용 펫시터 리스트 -->
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

</script>
</head>
<body>
<div >
	<form action="search" method="post">
		<div>
			<ul>
				<li>
					<dl>
						<dt>서비스</dt>
						<dd>
							<select name="service_type" data-width="120px">
								<option title="24시간 돌봄" value="allday" selected="selected">24시간 돌봄</option>
								<option title="데이케어" value="daycare">데이케어</option>
							</select>
							<input type="radio" id="service-type-allday" class="radiobox" name="service_type" value="allday" checked="checked"/>
							<label for="service-type-0" >24시간 돌봄</label>
							<input type="radio" id="service-type-daycare" class="radiobox" name="service_type" value="daycare"/>
							<label for="service-type-1" >Day Care</label>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예약일</dt>
						<dd>
							<input type="text" placeholder="시작 날짜" readonly="readonly" name="hss_start_date"/>
							<span>&gt;</span>
							<input type="text" placeholder="마침 날짜" readonly="readonly" name="hss_end_date"/>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>반려견 나이</dt>
						<dd>
							<select multiple title="모든 연령" name="hss_pet_age" data-width="130px">
								<option title="강아지" value="puppy" selected="selected">강아지 (1살 이하)</option>
								<option title="성견" value="dog">성견 (2~6살)</option>
								<option title="노령견" value="agedDog">노령견 (7살 이상)</option>
							</select>
							<input type="checkbox" id="ages-0" class="checkbox" name="hss_pet_age" value="puppy" checked="checked"/>
							<label for="ages-0" >강아지 (1살 이하)</label>
							<input type="checkbox" id="ages-1" class="checkbox" name="hss_pet_age" value="dog"/>
							<label for="ages-1" >성견 (2~6살)</label>
							<input type="checkbox" id="ages-2" class="checkbox" name="hss_pet_age" value="agedDog"/>
							<label for="ages-2" >노령견 (7살 이상)</label>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>반려견 크기</dt>
						<dd>
							<select multiple title="모든 크기" name="hss_pet_size" data-width="130px">
								<option title="소형견" value="s">소형견 (0~4.9kg)</option>
								<option title="중형견" value="m" selected="selected">중형견 (5~14.9kg)</option>
								<option title="대형견" value="l">대형견 (15kg 이상)</option>
							</select> 
							<input type="checkbox" id="sizes-0" class="checkbox" name="hss_pet_size" value="s"/>
							<label for="sizes-0" >소형견 (0~4.9kg)</label>
							<input type="checkbox" id="sizes-1" class="checkbox" name="hss_pet_size" value="m" checked="checked"/>
							<label for="sizes-1" >중형견 (5~14.9kg)</label>
							<input type="checkbox" id="sizes-2" class="checkbox" name="sizes" value="l"/>
							<label for="sizes-2" >대형견 (15kg 이상)</label>
						</dd>
					</dl>
				</li>
			</ul>
<!-- 			<label for ="service">서비스</label> -->
<!-- 			<select  name = "hss_service_type" id="service" > -->
<!-- 				<option value="allday">24시간 돌봄</option> -->
<!-- 				<option value="daycare">데이케어</option> -->
<!-- 			</select> -->
			
<!-- 			<label>예약일</label> -->
<!-- 			<input type="date" id="start" > -->
<!-- 			<input type="date" id="end" > -->
			
<!-- 			<label for="pet_age">반려견 나이</label> -->
<!-- 			<select  name = "hss_pet_age" id="pet_age" > -->
<!-- 				<option value="puppy">강아지 (1살 이하)</option> -->
<!-- 				<option value="dog">성견 (2~6살)</option> -->
<!-- 				<option value="aged_dog">노령견 (7살)</option> -->
<!-- 			</select> -->
			
<!-- 			<label for="pet_size">반려견 크기</label> -->
<!-- 			<select  name = "hss_pet_size" id="pet_size" > -->
<!-- 				<option value="S">소형견 (0~4.9kg)</option> -->
<!-- 				<option value="M">중형견 (5~14.9kg)</option> -->
<!-- 				<option value="L">대형견 (15kg)</option> -->
<!-- 			</select> -->

			<input type="submit" value="찾기">
		</div>
		<div>
			<input type="reset" value = "검색 설정 초기화">
		</div>
	</form>
</div>
</body>
</html>
