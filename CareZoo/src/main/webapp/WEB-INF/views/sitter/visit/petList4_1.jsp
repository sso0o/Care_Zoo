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

    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
    
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
// 로그아웃확인 <--모든페이지에 필수
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

function test_checkbox(){
	var flag = false;
	//checkbox 접근 후 체크된 개수 파악
	var values = document.getElementsByName("p_num");
	//배열길이
	//alert(values.length); 
	for(var i=0;i<values.length;i++){
		if(values[i].checked){
			//alert(values[i].value);
			flag= true;
		}
	}
	return flag;
}
//삭제버튼 클릭했을 때 작동되는 함수
function petDeleteOpen(p_num,c_num){	
	console.log(p_num);
	console.log(c_num);
			var p_num = p_num;
 			var c_num = c_num;
			//삭제로직 실행
			$.ajax({
				url:"${contextPath}/visit/delete",
				data:{"p_num":p_num,"c_num":c_num},
				type:"post",
				success:function(result){
					console.log(result);
					if(result){
						if(confirm("정말 삭제하시겠습니까?")){
							alert("삭제완료");
							location.href="${contextPath}/visit/petList?c_num="+c_num
						}
					}else{
						alert("삭제실패");
					}
				},error:function(r,s,e){
					console.log("r:"+r+"s:"+s+"e:"+e);
				}
			});

}
</script>
<meta charset="UTF-8">
<style type="text/css">
.btn-submit, .btn-add{
	background-color: #40bf9f;
	color: white;
	border-color: #40bf9f;
	margin: 15px;
	width: 200px;
	font-weight: bold;
}
 .btn-cancle {
 background-color: #40bf9f;
	color: white;
	border-color: #40bf9f;
	margin: 10px;
	width: 30px;
	font-weight: bold;
 }
 #visit{
 	text-align:center;
 }
</style>
<title>petList</title>
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
                        <li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='${contextPath}/comment/hscList'>REVIEW</a>
                    <ul>
                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='#'>가정시터</a></li>
						<li class='last'><a href='#'>방문시터</a></li>
						<li class='last'><a href='#'>펫호텔</a></li>
                    </ul>
                </li>
                <li class='last'><a href='${contextPath}/member/myPage' style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
    
	<div class="container" id="visit"> 
		<h3>돌봄을 신청하는 반려동물을 선택해 주세요</h3>
		반려견이름(무게/생일) <br>
		
		<form action="petList1" method="post">

				<c:forEach items="${petList}" var="pet">
					<div>

						<div><input type="hidden" name="c_num" value="${c_num}">
							<input type="checkbox" name="p_num" value="${pet.p_num}" >
							${pet.p_name}(${pet.p_weight},${pet.p_birth}) <input
							type="button" name="p_num"
							onclick="petDeleteOpen(${pet.p_num},${c_num})"
							class="btn btn-cancle" value="x"></div>
					</div>
				</c:forEach>
								<input type="submit" class="btn btn-submit" value="다음"
						onclick="return test_checkbox()">
					<!-- return: 클릭했을 때 함수호출
				true: action 수행, false: action수행 안함 -->
		</form>

	
						<button
					onclick="location.href='${contextPath}/visit/nomalapply?c_num=${c_num}'"
					class="btn btn-add">새로운 반려견 등록</button>


	</div>   
</body>
</html>