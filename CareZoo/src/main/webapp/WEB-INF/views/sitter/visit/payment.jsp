<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
    <!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
	console.log("count"+maxCount);
$("#count").append(maxCount);

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
	$(".hdd")[i].append(pay+"원");
	$("#tmpTotal").append(total);
}

var tmpTotalLength = $("input[name=hAdds]").length;
	console.log(tmpTotalLength);
	
	var sum = 0;
	
	for(var i =0;i<tmpTotalLength;i++){
		var caculation=$(".hAdds")[i].value;
		sum += Number(caculation)
	}
	$("#totalPay").append(sum+"원");	


	//p_num
// 	var jsonData = ${p_num};
// 	console.log(jsonData);
// 	str="";
// 	for(i in jsonData){
// 		str += i== jsonData.length-1 
// 		? "p_num="+jsonData[i]:"p_num="+jsonData[i]+"&"
// 	}
// 	console.log(str)
//	var json = JSON.stringify(${p_num});
	var json =${list};
	console.log(json);
	 
	$.ajax({
		url:"${contextPath}/visit/test",
		type:"post",
		data:json, 
		dataType:"json",
		success:function(data){
			console.log(data);
				var max = $("input[name=p_num]").length-1;
				 var total = 28000+(5000*max)+"원";	
				 $("#total").append(total);
				 	for(var i =0;i<$("input[name=p_num]").length;i++){
			 		if(i>0){
			 			var str = $("<tr><th>한마리 추가</th> <td>5000원</td></tr>");
			 			($("#add").append(str))*i;
			 		}
			 	}
// 			var max = data.length-1;
// 			console.log(max);
// 			var total = 28000+(5000*max)+"원";
// 			$("#total").append(total);
// 			for(var i=0;i<data.length;i++){
// 				if(i>0){
// 					var str = $("<tr><th>한마리 추가</th> <td>5000원</td></tr>");
// 		 			($("#add").append(str))*i;
// 				}
// 			}
		},
		error:function(jqXHR, testStatus, errorTrown){
			alert('mm');
			
		}
			
	});
	
	//vsr_chkin
	var jsonData2 = ${list2};
	console.log("total1"+jsonData2);
// 	str2="";
// 	for(i in jsonData2){
// 		str2 += i== jsonData2.length-1 
// 		? "pd_week="+jsonData2[i]:"pd_week="+jsonData2[i]+"&"
// 	}
// 	console.log(str2)
	$.ajax({
		url:"${contextPath}/visit/test2",
		type:"post",
		data:jsonData2,
		dataType:"json",
		success:function(data){
			console.log(data);

				var max = $("input[name=p_num]").length-1;
				 var total1 = 28000+(5000*max)+"원";	
					$.each(data,function(key,value){
						console.log(value);
						 $("#total1").append("<tr><th>"+value+"</th><td>"+total1+"</td><tr>");
					});

		},
		error:function(jqXHR, testStatus, errorTrown){
			alert('mm');
			
		}
			
	});
	//----카카오 1:1상담
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('d5215a661c44ab13805d6f04adeddadb');
	// 플러스친구 1:1채팅 버튼을 생성합니다.
	Kakao.PlusFriend.createChatButton({
	  container: '#plusfriend-chat-button',
	  plusFriendId: '_QuCiT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
	});
	//]]>
	//----카카오 1:1상담	
}); 

</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
th{
	font-weight:600;
}
#visit{
	text-align:center;
}
/* -------카카오 상담버튼------- */
.bottom-left {
  position: fixed;
  bottom: 0;
  right:0;
}

.alert {
  background: white;
  font-weight: bold;
  padding: 1em;
}
/* -------카카오 상담버튼------- */
</style>
<meta charset="UTF-8">
<title>요금 세부 정보</title>
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
		<form action="reservation10" method="post">
			<h2>요금 상세 내역</h2>

			<input type="hidden" name="vsr_count" value="${vsr_count}"> <input
				type="hidden" name="c_num" value="${c_num}">
			<c:forEach items="${p_num}" var="p">
				<input type="hidden" name="p_num" value="${p}">
			</c:forEach>

			<table class="table table-striped table-bordered table-hover">

				<tr>
					<th>회당 기본 금액</th>
					<td><div id="total"></div></td>
				</tr>
				<tr>
					<th>기본 1마리</th>
					<td>28000원</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="add"></div>
					</td>
				</tr>
			</table>
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<th colspan="2">상세 예약 내역</th>
				</tr>
 
				<tr>
					<td colspan="2"><div id="total1"></div></td>
				</tr>

				<tr>
					<th>추가 시간 내역</th>
					<th>기본 비용</th>
					<!-- 				<th>이용 횟수</th> -->
					<!-- 				<th>추가비 합계</th> -->
				</tr>
				<c:forEach items="${vsr_hAddList}" var="li">
					<tr>
						<th>+${li.vsr_hAdd}시간 <input type="hidden" id="hAdd" class="hAdd" name="hAdd"
							value="${li.vsr_hAdd}"></th>
						<td><div id="hdd" class="hdd"></div></td>
						<!-- 				<td><div id="count" style="text-align:center"></div></td> -->
					</tr>
				</c:forEach>
				<tr>
					<th>추가 시간 합계</th>
					<td>
					<div id="tmpTotal"></div>
					<div id="totalPay" class="totalPay"></div>
						
					</td>

				</tr>
			</table>
			<div>
				<input type="submit" class="btn btn-chk" value="확인">
			</div>
		</form>
	</div>
<div class="bottom-left alert" id="plusfriend-chat-button">
</body>
</html>