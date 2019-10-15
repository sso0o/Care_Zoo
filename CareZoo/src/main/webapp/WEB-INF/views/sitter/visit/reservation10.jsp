<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
    
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
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

$(function(){
	var maxCount=$("input[name=p_num]").length;
	console.log(maxCount);

	var chkin =$("input[name=vsr_chkin]").length;
	console.log(chkin);
	
	var hAddLength = $("input[name=hAdd]").length;
	console.log("hAdd: "+hAddLength);
	for(var i =0;i<hAddLength;i++){
		console.log($(".hAdd")[i].value);
		var hAddVal=$(".hAdd")[i].value;
		
		var pay = "";
		if(hAddVal=="0"){
			 pay = 0
		}else if(hAddVal=="1"){
			pay = 15000
		}else if(hAddVal=="2"){
			pay = 30000
		}else if(hAddVal=="3"){
			pay = 45000
		}else if(hAddVal=="4"){
			pay = 60000
		}
		var total = $("<input type='hidden' id='hAdds' class='hAdds' name ='hAdds'>").val(pay);
		$("#tmpTotal").append(total);
	}
	
	var tmpTotalLength = $("input[name=hAdds]").length;
	console.log(tmpTotalLength);
	
	var sum = 0;
	
	for(var i =0;i<tmpTotalLength;i++){
		var caculation=$(".hAdds")[i].value;
		sum += Number(caculation)
	}	
	console.log("sum: "+sum);
	var totals = (28000*1)+((maxCount-1)*5000);
	console.log(totals);
	
	var result = Number(sum) + Number(totals);
	console.log("sum+total: "+result);
	
	var totalResult = Number(result)*Number(chkin);
	
	console.log("total:"+totalResult);
	$("#totalPay").append(result+"원");
	$("#result").append("<input type='hidden' name='vsr_totalPrice' value='"+totalResult+"'>"+totalResult+"원");
	$("#days").append(chkin+"박");
});

</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
#visit{
	text-align:center;
}
</style>
<title>방문 펫시터 예약(일반)</title>
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
		<h3>예약 확인 및 결제정보를 등록해주세요.</h3>
		<form action="end" method="post">

			<input type="hidden" name="c_num" value="${c_num}">
			<c:forEach items="${p_num}" var="p">
				<input type="hidden" name="p_num" value="${p}" name="p_num">
			</c:forEach>
			<c:forEach items="${vsr_hAddList}" var="li">
				<input type="hidden" id="hAdd" class="hAdd" name="hAdd" value="${li.vsr_hAdd}"> 
				<input type="hidden" id="chkin" name="vsr_chkin"
					value="${li.vsr_chkin}">
				<input type="hidden" name="vsr_num" value="${li.vsr_num}">
			</c:forEach>

			<table class="table table-striped table-bordered table-hover">

				<tr>
					<th>맡기실 반려 동물</th>
					<td><c:forEach items="${nameList}" var="li">
				${li.p_name}
			</c:forEach></td>
				</tr>
				<tr>
					<th>방문 주소</th>
					<td>${address.c_address}${address.c_d_address}</td>
				</tr>
				<tr>
					<th>결제 예정 금액(1박 기준)</th>
					<td><div id="tmpTotal"></div>
					<div id="totalPay"></div></td>
				</tr>
				<tr>
					<th>숙박 일수</th>
					<td><div id="days"></div></td>
				</tr>
				<tr>
					<th>총 결제 금액</th>
					<td><div id="result"></div></td>
				</tr>
			</table>
			<input type="submit" value="예약완료하기">
		</form>
	</div>   
</body>
</html>