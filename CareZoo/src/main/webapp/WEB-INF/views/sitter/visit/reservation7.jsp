<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!--     <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script> -->
    <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}

$(function() { //문서가 로딩되면 실행할 함수
	
})

// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!

// })

// 기본적으로 세션에 저장된 정보
var user_numtype = "<%=session.getAttribute("user_numtype")%>"
var user_num = "<%=session.getAttribute("user_num")%>"
var user_name = "<%=session.getAttribute("user_name")%>"

//삭제버튼 클릭했을 때 작동되는 함수
function petDeleteOpen(c_num,vsr_num,vsr_count){	
			var c_num = c_num;
			var vsr_num = vsr_num;
			var vsr_count =vsr_count;
			console.log(c_num);
			console.log(vsr_num);
			console.log(vsr_count);
			//삭제로직 실행
			$.ajax({
				url:"${contextPath}/visit/delete1",
				data:{"vsr_num":vsr_num},
				type:"post",
				success:function(result){
					console.log(result);
					if(result){
						alert("삭제완료");
						//삭제되고 남은 pd_hAdd를 보여줘야하잔하....
						location.href="${contextPath}/visit/complete1?c_num="+c_num+"&vsr_num="+vsr_num+"&vsr_count="+vsr_count;
					}else{
						alert("삭제실패");
					}
				},error:function(r,s,e){
					console.log("r:"+r+"s:"+s+"e:"+e);
				}
			});
			
}

$( document ).ready( function() {
	var originHour = document.getElementById("vsr_hour").value;
	console.log(originHour);
	var sum = Number(originHour)+3;
	console.log(sum);
	//id로 가져오면 값 하나만 출력하기 때문에 class로 줘서 사용해야한다.
		$('.hour').append(originHour+"시~"+sum.toString()+"시");
		
	//chkin 요일이름으로 변환!!
		var chkin = $("input[name=vsr_day]").length;
		var value =document.getElementsByClassName("vsr_day")[0].value;
		console.log(value);
		
	var result = "";
	for(var i=0;i<chkin;i++){
		console.log(value);
		if(document.getElementsByClassName("vsr_day")[i].value=="1"){
			result = "월";
		}else if(document.getElementsByClassName("vsr_day")[i].value=="2"){
			result = "화";	
		}else if(document.getElementsByClassName("vsr_day")[i].value=="3"){
			result = "수";
		}else if(document.getElementsByClassName("vsr_day")[i].value=="4"){
			result = "목";
		}else if(document.getElementsByClassName("vsr_day")[i].value=="5"){
			result = "금";
		}else if(document.getElementsByClassName("vsr_day")[i].value=="6"){
			result = "토";
		}else if(document.getElementsByClassName("vsr_day")[i].value=="0"){
			result = "일";
		}
		console.log(result);
		//.부터가져오는거기 때문에 속성에[i]값을 붙여준다!!
		$('.day')[i].append("매주"+result+"요일");
	}
	
  } );
</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
#visit{
	text-align:center;
}
.btn-chk{
	background-color: #40bf9f;
	color: white;
	border-color: #40bf9f;
	margin: 15px;
	width: 200px;
	font-weight: bold;
}
.btn-cancle, .btn-add{
	background-color: white;
	color: #40bf9f;
	border-color:#40bf9f;
	margin: 15px;
	width: 50;
	font-weight: bold;
}
</style>
<meta charset="UTF-8">
<title>예약내용 확인 폼</title>
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
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>펫호텔</a></li>

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
	<h1>예약 변경을 원할 경우 추가/변경을 눌러주세요</h1>
<!-- <h3>강아지 한마리를 선택하면 전체 강아지의 시간이 '변경' 또는 '삭제' 됩니다^^</h3> -->

	<form action="complete2" method="post">
				
					<input type="hidden" name="c_num" value="${c_num}"> 
					<c:forEach items="${p_num}" var="pn">
						<input type="hidden" name="p_num" value="${pn}">
					</c:forEach>
				
		<div>
			<table class="table table-striped table-bordered table-hover">

				<tr>
				<c:forEach items="${list}" var="li">
				<input type="hidden" name="vsr_count" value="${li.vsr_count}">
				<input type="hidden" id="vsr_num" name="vsr_num" value="${li.vsr_num}">
				<input type="hidden" id="vsr_hour" name ="vsr_hour" value="${li.vsr_hour}">
				<input type="hidden" name="vsr_day" id="vsr_day" class="vsr_day" value="${li.vsr_day}">	
					<tr><th colspan="2"><div class="day">	
					<input type="button" class="btn btn-cancle" onclick="petDeleteOpen(${c_num},${li.vsr_num},${li.vsr_count})" value="x">
					</div>
					</th></tr>
					<tr><td class="hour"></td><td>+${li.vsr_hAdd}시간
					<input type="button" class="btn btn-add" onclick="location.href='${contextPath}/visit/addForm2?vsr_day=${li.vsr_day}&vsr_hour=${li.vsr_hour}&vsr_hAdd=${li.vsr_hAdd}&c_num=${c_num}&vsr_num=${li.vsr_num}&vsr_count=${li.vsr_count}'" value="변경">
					</td></tr>	
				</c:forEach>				

			</table>
		</div>
		<div>
			<input type="submit" class="btn btn-chk" value="다음">
		</div>
	</form>
	</div>

</body>
</html>