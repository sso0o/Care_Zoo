<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/qnatabstyle.css" />
<script type="text/javascript" src="${contextPath }/resources/js/qnatab.js"></script>
<script type="text/javascript" src="${contextPath }/resources/js/textextands.js"></script>


<script src="https://kit.fontawesome.com/7f18bbcd34.js" crossorigin="anonymous"></script>

<link href="${contextPath }/resources/css/jquery.treemenu.css" rel="stylesheet" type="text/css">
<script src="${contextPath }/resources/js/jquery.treemenu.js"></script> 


<script type="text/javascript">

function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}

	
	
</script>


<title>qna</title>
<!-- QnA -->
</head>
<body>
<div class="container">
		<header>
			<a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

			<div class="header_Btn" id="sessioncheck">
				<sec:authorize access="isAnonymous()">
					<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
					<a class="btn_Join" href="${contextPath}/member/join">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<label id="principal" style="display: none;"><sec:authentication property="principal" /></label>
					<label><%=session.getAttribute("user_name")%>님 반갑습니다!</label>
					<a class="btn_Logout" onclick="logoutCheck()" href="#">로그아웃</a>
				</sec:authorize>
			</div>
		</header>
	</div>
	<nav>
		<div class='menu'>
			<ul style="">
				<li class='active sub'><a href='${contextPath}/sitter/main'>SITTER</a>

					<ul>
						<li class='last'><a href='${contextPath}/home/main'>가정펫시터</a> <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      --></li>
						<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
					</ul></li>
				<li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
					<ul>
						<li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
						<li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
					</ul></li>
				<li class='active sub'><a href='${contextPath}/comment/hscList'>REVIEW</a>
					<ul>
						<!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='${contextPath}/comment/hscList'>가정시터</a></li>
						<li class='last'><a href='${contextPath}/comment/vscList'>방문시터</a></li>
						<li class='last'><a href='${contextPath}/comment/phcList'>펫호텔</a></li>
					</ul></li>
				<li class='last'><a href='${contextPath}/member/myPage' style="font-size: 17px">MY PAGE</a></li>
				<li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">Q&A</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container infoBody">
		<section class="tabs">
			<input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
			<label for="tab-1" class="tab-label-1">방문펫시터</label>
			<input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
			<label for="tab-2" class="tab-label-2">가정펫시터</label>
			<input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
			<label for="tab-3" class="tab-label-3">서비스가격</label>
			<input id="tab-4" type="radio" name="radio-set" class="tab-selector-4" />
			<label for="tab-4" class="tab-label-4">펫시터지원</label>
			<input id="tab-5" type="radio" name="radio-set" class="tab-selector-5" />
			<label for="tab-5" class="tab-label-5">기타</label>


			<div class="clear-shadow"></div>

			<div class="content">
				<div class="content-1">
					<ul class="tree">
						<li><span>방문펫시터 서비스란?</span>
						 	<ul>
						 		<li>믿을 수 있는 전문가가 직접 고객의 집으로 찾아가 반려견을 케어해 드립니다</li>
								<li>산책, 배변정리, 배식</li>
								<li>산책이 어려운 날에는 실내놀이 프로그램</li>
								<li>돌봄 시작부터 종료까지 액션캠으로 돌봄 영상 녹ㅎ화</li>
								<li>서비스 종료 후, 메일로 액션캠 영상 확인</li>
							</ul>
						</li>
						<hr>
						<li><span>방문펫시터 이용요금</span>
						 	<ul>
								<li>1회(1시간)</li>
								<li>시간 당 추가 금액</li>
								<li>마리 추가 금액(15kg미만)</li>
								<li>마리 추가 금액(15kg이상)</li>
								<li>주말 및 공휴일 추가 금액</li>
								<li>명절 추가 금액</li>
							</ul>
						</li>
						<hr>
						<li><span>왜 맡겨주 방문 시터는 믿을 수 있나요?</span>
						 	<ul>
								<li>까다로운 신원검증</li>
								<li>반려경험 보유</li>
								<li>수의사, 훈련사 등 전문가 이론 및 실습 교육 이수</li>
								<li>액션캠을 통해 방문 돌봄 전체내용 녹화 후 공유</li>
							</ul>
						</li>
						<hr>
						<li><span>방문펫시터 정기 서비스란?</span>
						 	<ul>
								<li>주 1~2회</li>
								<li>주 3~4회</li>
								<li>주 5회 이상</li>
							</ul>
						</li>
						<hr>
						<li><span>출입비밀번호 등 정보 유출이 걱정될 때</span>
						 	<ul>
								<li>현관비밀번호는 돌봄 종료 즉시 폐기</li>
								<li>출입문을 열기 전부터 돌봄 종료까지 돌봄 영상 모두 녹화 후 공유</li>
							</ul>
						</li>
						<hr>
						<li><span>방문펫시터 당일 예약</span>
						 	<ul>
								<li>네, 당일 예약도 가능합니다! 그러나 예약을 더욱 안전하게 확정하기 위해서는 최소 1주일 전에 미리 예약하는 것을 추천드립니다.</li>
							</ul>
						</li>
						<hr>
						<li><span>방문펫시터 예약 변경 및 취소</span>
						 	<ul>
								<li>돌봄일 기준 3일 전 까지 100% 환불</li>
								<li>1일 전까지 50% 환불</li>
								<li>돌봄 당일 취소 시 20% 환불</li>
							</ul>
						</li>
					</ul>
				</div>
				
				<div class="content-2">
					<ul class="tree">
						<li><span>가정집펫시터 서비스란?</span>
						 	<ul>
						 		<li>출장이나 여행갈 때, 혼자 남겨진 강아지를 위해 우리집과 비슷한 환경의 가정집에 강아지를 맡기는 서비스 입니다.</li>
								<li>사전만남을 통해 펫시터와 미리 만나보기</li>
								<li>무조건 한 가정의 강아지만 단독 돌봄</li>
								<li>산책은 하루 한 번씩</li>
								<li>사진과 영상 실시간으로 공유</li>
								<li>매일 받아보는 우리 강아지 돌봄일지</li>
							</ul>
						</li>
						<hr>
						<li><span>가정집펫시터 이용요금</span>
						 	<ul>
								<li>데이케어(8시간이내 돌봄) 20,000원 부터~</li>
								<li>스테이(24시간 기준) 30,000원 부터~</li>
							</ul>
						</li>
						<hr>
						<li><span>왜 맡겨주 펫시터는 믿을 수 있나요?</span>
						 	<ul>
								<li>까다로운 신원검증</li>
								<li>반려경험 보유</li>
								<li>수의사, 훈련사 등 전문가 이론 및 실습 교육 이수</li>
								<li>액션캠을 통해 방문 돌봄 전체내용 녹화 후 공유</li>
							</ul>
						</li>
						<hr>
						<li><span>사전만남이란?</span>
						 	<ul>
						 		<li>돌봄 전 반려견과 함께 펫시터의 집에 미리 방문하여 아래의 내용을 진행합니다</li>
								<li>펫시터의 집안 환경 미리 확인</li>
								<li>펫시터와 펫시터의 반려견과의 친화 과정</li>
								<li>원활한 돌봄을 위한 체크리스트 작성</li>
							</ul>
						</li>
						<hr>
						<li><span>펫시터의 집에 맡기기 전 준비물</span>
						 	<ul>
								<li>배변패드, 방석, 장난감, 주인의 냄새가 배어있는옷</li>
								<li>평소 먹던 사료나 간식 또는 약</li>
							</ul>
						</li>
						<hr>
						<li><span>가정집펫시터 예약 변경 및 취소</span>
						 	<ul>
								<li>돌봄일 기준 3일 전 까지 100% 환불</li>
								<li>1일 전까지 50% 환불</li>
								<li>돌봄 당일 취소 시 20% 환불</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="content-3">
					<ul class="tree">
						<li><span>방문펫시터 이용요금</span>
						 	<ul>
								<li>1회(1시간)</li>
								<li>시간 당 추가 금액</li>
								<li>마리 추가 금액(15kg미만)</li>
								<li>마리 추가 금액(15kg이상)</li>
								<li>주말 및 공휴일 추가 금액</li>
								<li>명절 추가 금액</li>
							</ul>
						</li>
						<hr>
						<li><span>가정집펫시터 이용요금</span>
						 	<ul>
								<li>데이케어(8시간이내 돌봄) 20,000원 부터~</li>
								<li>스테이(24시간 기준) 30,000원 부터~</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="content-4">
					<ul class="tree">
						<li><span>방문펫시터 지원하기</span>
						 	<ul>
								<li>반려가구 1,000만시대에 발맞추어 맡겨주와 함께 국내 제일의 반려동물 전문가로성장하기를 희망하시는 분들을 모집하고 있습니다.</li>
							</ul>
						</li>
						<hr>
						<li><span>가정집펫시터 지원하기</span>
						 	<ul>
								<li>집에서 보내는 여유시간이 많다면 가정집 펫시터로 활동해 보세요. 집에서 강아지를 돌보며 부수입을 벌 수 있습니다.</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="content-5">
					<h3>웅앵</h3>
					<p>이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이
						웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이
						웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵</p>
					<h3>Get in touch</h3>
					<p>이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이
						웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이
						웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵</p>
				</div>
			</div>
		</section>
	</div>
	
	<script src="${contextPath }/resources/js/jquery.treemenu.js"></script> 
<script>
$(function(){
        $(".tree").treemenu({delay:300}).openActive();
    });
</script>
</body>
</html>