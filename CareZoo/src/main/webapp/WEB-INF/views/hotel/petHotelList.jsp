<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petHotelList</title>
<!-- 애견호텔 목록 -->
</head>
<body>
	<div>

		<div>
			<fieldset>
				<legend>호텔 옵션 선택</legend>
				aa<input type="checkbox" name="asdf" value="aaa"><br>
				p_num = <input type="text" name="p_num" value="${p_num }"><br>
				체크인<input type="text" name="in" value="${in }"><br>
				체크아웃<input type="text" name="out" value="${out }"><br>

			</fieldset>
		</div>

		<div>
			<table>
				<tr>
					<td></td>
					<td><select name="listOption"
						style="width: 100px; height: 25px;">
							<option value="star">별점순</option>
							<option value="comments">후기순</option>
					</select></td>
				</tr>

			</table>
		</div>
		

		<div class="pethotelList">
			<c:forEach var="phList" items="${phList}">

				<div style="border:1px solid; margin:50px">
				<span></span>
				<a
					href="${contextPath}/petHotel/petHotelView?ph_num=${phList.ph_num}">${phList.ph_name}</a>
				<br>
				${phList.ph_address}&nbsp;${phList.ph_d_address}
					)
				<c:forEach items="${phList.filesName}" var="fn">
					<div>
						<img src="${contextPath}/petHotel/image?fileName=${fn}"
							data-sizes="100vw" data-srcset=""
							style="width: 100px; height: 100px;">
							<fmt:formatNumber value="${price }" pattern="#,###" />
					</div>
				</c:forEach>
				</div>

				<!-- 				<p> -->
				<%-- 					<c:out value="${boardMap.title}" /> --%>
				<!-- 				</p> -->
				<!-- 					사진:<br> -->
				<!-- 					<img width="200px" height="200px" -->
				<%-- 						src="${contextPath}/image?fileName=NAVER.jpg" /> --%>
			</c:forEach>
		</div>
	</div>

</body>
</html>