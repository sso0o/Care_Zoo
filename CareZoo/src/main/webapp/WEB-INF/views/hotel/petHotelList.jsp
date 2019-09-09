<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<title>petHotelList</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<link rel="stylesheet"
	href="${contextPath}/resources/css/lightslider.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/index.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style type="text/css">
ul {
	list-style: none outside none;
	padding-left: 0;
	margin: 0;
}

.demo .item {
	margin-bottom: 60px;
}

.content-slider li {
	background-color: #ed3020;
	text-align: center;
	color: #FFF;
}

.content-slider h3 {
	margin: 0;
	padding: 70px 0;
}

.demo {
	width: 800px;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/lightslider.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/index.js"></script>
<script>
	$(document).ready(function() {

		$('.image-gallery').lightSlider({
			isthumb : false, // 이 부분이 제가 추가한 옵션 true 이면 썸네일을 표시하고, false 이면 표시하지 않습니다
			gallery : true,
			item : 1,
			thumbItem : 9,
			slideMargin : 0,
			speed : 1000,
			pause:4000,
			auto : true,
			loop : true,
			addClass : $('.clearfix'),
			onSliderLoad : function() {
				$('.image-gallery').removeClass('cS-hidden');
			}
		});
	});
</script>
<!-- 애견호텔 목록 -->
</head>
<body class=container>
	<div class="container">
		 <header>
            <a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
         
            <div class="header_Btn" id="sessioncheck"> 
            <sec:authorize access="isAnonymous()">
            	<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
            	<a class="btn_Join" href="${contextPath}/member/join">회원가입</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            	<label id="principal" style="display: none;" ><sec:authentication property="principal"/></label>
            	<label><%=session.getAttribute("user_name") %>님 반갑습니다!</label>
            	<a class="btn_Logout" onclick="logoutCheck()" href="#">로그아웃</a>
            </sec:authorize>
             </div>
        </header>
	</div>
	<nav>
		<div class='menu'>
			<ul style="">
				<li class='active sub'><a href='#'>SITTER</a>
					<ul>
						<li class='last'><a href='#'>가정펫시터</a> <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      --></li>
						<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
					</ul></li>
				<li class='active sub'><a href='#'>HOTEL</a>
					<ul>
						<li class='last'><a href='#'>애견동반호텔</a></li>
						<li class='last'><a href='#'>애견호텔(보호자비동반)</a></li>
					</ul></li>
				<li class='active sub'><a href='#'>REVIEW</a>
					<ul>
						<!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='#'>시터</a></li>
						<li class='last'><a href='#'>호텔</a></li>
					</ul></li>
				<li class='last'><a href='#' style="font-size: 17px">MTPAGE</a></li>
				<li class='last'><a href='#' style="font-size: 17px">Q&A</a></li>
			</ul>
		</div>
	</nav>
	<div class='container'></div>
	<br>
	<br>
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
				<div style="border: 1px solid; margin: 50px; height: 350px;">
					<div
						style="width: auto; display: inline-block display:inline; float: left;">
						<div class="item">
							<div class="clearfix" style="max-width: 350px;">
								<ul class="image-gallery"
									class="gallery list-unstyled cS-hidden">
									<c:forEach items="${phList.ph_filesName}" var="fn">
										<li data-thumb="${contextPath}/petHotel/image?fileName=${fn}"
										><img
											src="${contextPath}/petHotel/image?fileName=${fn}"
											style="width: 350px; height: 350px;" /></li>
									</c:forEach>
								</ul>
							</div>
						</div>

						<br>

					</div>
					<div style="">
						<span></span> <br> <a
							href="${contextPath}/petHotel/petHotelView?ph_num=${phList.ph_num}">${phList.ph_name}</a>
						<br> <div>${phList.ph_address} ${phList.ph_d_address}</div>
						<div>
						<fmt:formatNumber value="${phList.ph_minPrice }" pattern="#,###" />
						~
						<fmt:formatNumber value="${phList.ph_maxPrice }" pattern="#,###" />
						</div>
						<div>후기:${phList.ph_c_count}개 <br> ${phList.ph_avgStar }</div>
					</div>

					<!-- 				<p> -->
					<%-- 					<c:out value="${boardMap.title}" /> --%>
					<!-- 				</p> -->
					<!-- 					사진:<br> -->
					<!-- 					<img width="200px" height="200px" -->
					<%-- 						src="${contextPath}/image?fileName=NAVER.jpg" /> --%>
				</div>


			</c:forEach>


		</div>
	</div>

</body>
</html>