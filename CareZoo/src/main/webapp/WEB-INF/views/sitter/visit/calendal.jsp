<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
	
<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>

<!--  link for DogMate datepicker css -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>

<!-- script for datepicker -->
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script>
<script >
//로그아웃확인 <--모든페이지에 필수
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}

// function checkValue(dateVal) {
// 	console.log("DDDDDDDDD="+dateVal);
// 	if(dateVal == null){
// 		alert("날자를 선택해주세요");
// 		return false;
// 	}return true;
// }
	if("${msg}" != ""){
		alert("${msg}");
	}

$(function() { //문서가 로딩되면 실행할 함수
	
})

// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!

// })

// 기본적으로 세션에 저장된 정보
var user_numtype = "<%=session.getAttribute("user_numtype")%>"
var user_num = "<%=session.getAttribute("user_num")%>"
var user_name = "<%=session.getAttribute("user_name")%>"


$(function(){
	
	$("#cal").datepicker({
		dateFormat:'yy-mm-dd',
		minDate:0,
		regional:"ko",
 		beforeShowDay: function(date){
			//선택한 요일 값 가져오기..
			var day = date.getDay();

			var result = false;
			$(".vsr_day").each(function(){
				var selDay = $(this).val();
				console.log(selDay);
				if(day == selDay){
					result = true;
				}
			});
			return [result,,];
			
		},
		onSelect : function() {
			var dateVal = $(this).val();
//				var dateId = "";
//				if (dateVal != $(this).val()) {
//					//처음의 값이 ""이면 $(this).val()이고 아니면 ,$(this).val() 호출
//					dateVal += dateVal == "" ? $(this).val() : ","
//							+ $(this).val()
//				}
			
//				$("#week").prop('value', dateVal);
			console.log("click한값: "+dateVal);
			
// 			checkValue(dateVal);
			
			var date = new Date(dateVal);
			console.log("date:"+date);
			var newdate = new Date(date);
			console.log("newdate:"+newdate); 
			date.setDate(newdate.getDate()+7);
			console.log("result"+date.toDateString());
			var result = new Date(); 
			result = getFormatDate(date);
			console.log(result);	
		
			
			var date2 = new Date(date);
			var newdate2 = new Date(date2);
			date2.setDate(newdate2.getDate()+7);
			var result2 = new Date(); 
			result2 = getFormatDate(date2);
			
			var date3 = new Date(date2);
			var newdate3 = new Date(date3);
			date3.setDate(newdate3.getDate()+7);
			var result3 = new Date(); 
			result3 = getFormatDate(date3);
			
				//인풋요소 생성
				//있는지 확인하고 없으면 추가 
				//있는지 확인하고 있으면 삭제
				var tmpDate = $("#"+dateVal);
				var tmpResult = $("#"+result);
				var tmpResult2 = $("#"+result2);
				var tmpResult3 = $("#"+result3);

			if(dateVal){
					
			//그전에 선택된 인풋요소 삭제  
			$(".vsr_chkin").each(function(){
				var selDay = $(this).val();
				console.log(selDay);
				var tmpTest = $("#"+selDay);

				tmpTest.remove();
			});
					
					var selDate = $("<input type='hidden' class='vsr_chkin' name ='vsr_chkin'>").val(dateVal);
					selDate.attr("id",dateVal);
					selDate.attr("value",dateVal);

					var test = $("<input type='hidden' class='vsr_chkin' name ='vsr_chkin'>").val(result);
					//id값을 dateVal값으로 유일값으로 다르게 준다
					
					test.attr("id",result);
					test.attr("value",result);
					

					
					var test2 = $("<input type='hidden' class='vsr_chkin' name ='vsr_chkin'>").val(result2);
					test2.attr("id",result2);
					test2.attr("value",result2);
					

					
					var test3 = $("<input type='hidden' class='vsr_chkin' name ='vsr_chkin'>").val(result3);
					test3.attr("id",result3);
					test3.attr("value",result3);

				
				$("#cal").append(selDate);
				$("#cal").append(test);
				$("#cal").append(test2);
				$("#cal").append(test3);
			}else{
				
				var selDate = $("<input type='hidden' class='vsr_chkin' name ='vsr_chkin'>").val(dateVal);
				selDate.attr("id",dateVal);
				selDate.attr("value",dateVal);

				var test = $("<input type='hidden' class='vsr_chkin' name ='vsr_chkin'>").val(result);
				//id값을 dateVal값으로 유일값으로 다르게 준다
				
				test.attr("id",result);
				test.attr("value",result);
				

				
				var test2 = $("<input type='hidden' class='vsr_chkin' name ='vsr_chkin'>").val(result2);
				test2.attr("id",result2);
				test2.attr("value",result2);
				

				
				var test3 = $("<input type='hidden' class='vsr_chkin' name ='vsr_chkin'>").val(result3);
				test3.attr("id",result3);
				test3.attr("value",result3);

			
			$("#cal").append(selDate);
			$("#cal").append(test);
			$("#cal").append(test2);
			$("#cal").append(test3);
		}		
			
		}

	});
	
});
//yyy-mm-dd형식으로 바꾸는 함수
function getFormatDate(date)
{ var year = date.getFullYear();
//yyyy 
var month = (1 + date.getMonth()); 
//M 
month = month >= 10 ? month : '0' + month; 
//month 두자리로 저장 
var day = date.getDate(); 
//d 
day = day >= 10 ? day : '0' + day; 
//day 두자리로 저장
return year + '-' + month + '-' + day; }


</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
.ui-datepicker{ font-size: 30px; width: 1100px; height:500px;}
.ui-datepicker select.ui-datepicker-month{ width:50%; font-size: 100px; height:50%; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 100px; height:50%;  }
.ui-datepicker td span, .ui-datepicker td a{ font-size:38px;}
.btn-chk{
	background-color: #40bf9f;
	color: white;
	border-color: #40bf9f;
	margin: 15px;
	width: 200px;
	font-weight: bold;
} 	
#visit{
	text-align:center;
}
</style>
<meta charset="UTF-8">
<title>정기적인 요일 시작일 고르기</title>
</head>
<body class="container">
    <div class="container">
        <header>
			<a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
			<br>
		<div class="header_Btn" id="sessioncheck">
			<sec:authorize access="isAnonymous()">
				<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
				<a class="btn_Join" href="${contextPath}/member/joinForm">회원가입</a>
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
                        <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a>
                            <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      -->
                        </li>
                        <li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
					<ul>
						<li class='last'><a
							href='${contextPath}/petHotel/petHotelList'>펫호텔</a></li>

						<!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->

					</ul>
				</li>
                <li class='last'><a href='${contextPath}/member/myPage' style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
	<div class="container" id="visit">
		<form action="getDate" method="post">
			<input type="hidden" name="vsr_count" value="${vsr_count}"> <input
				type="hidden" name="c_num" value="${c_num}">
			<c:forEach items="${p_num}" var="p">
				<input type="hidden" name="p_num" value="${p}">
			</c:forEach>
			<c:forEach items="${vsr_day}" var="day">
				<input type="hidden" class="vsr_day" name="vsr_day" value="${day}">
				<div class="test"></div>
			</c:forEach>
			<c:forEach items="${vsr_num}" var="vsr_num">
				<input type="hidden" name="vsr_num" value="${vsr_num}">
			</c:forEach>
			<c:forEach items="${list}" var="li">
				<input type="hidden" value="${li.vsr_hour}" name="vsr_hour">
				<input type="hidden" value="${li.vsr_hAdd}" name="vsr_hAdd">
			</c:forEach>
			<!-- 달력 -->
			<div id="cal"></div>
			<!-- input value로 줘서 넘기기.. vsr_num -->
			<div>
				<input type="submit" class="btn btn-chk" value="확인">
			</div>
		</form>
	</div>
</body>
</html>