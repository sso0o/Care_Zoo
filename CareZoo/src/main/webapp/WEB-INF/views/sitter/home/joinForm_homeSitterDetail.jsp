<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script type="text/javascript">
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}

function cancleCheck() {
	if (confirm("취소하시면 작성한 양식이 날라갑니다.\n그래도 취소하시겠습니까?") == true) {
		location.href = '${contextPath}'
	} else {
		return false;
	}
}


function checkValue() {
	if($("#email").val() ==""){
		alert("아이디(이메일)을 입력해주세요");
		return false;
	}
	
	if($("#pw2").val() ==""){
		alert("비밀번호를 입력해 주세요");
		return false;
	}
	
	if($("#name").val() ==""){
		alert("이름을 입력해 주세요");
		return false;
	}
	
	if($("#birth").val() ==""){
		alert("생년월일을 입력해 주세요");
		return false;
	}
	
	if($("#sex").val() ==""){
		alert("성별을 입력해 주세요");
		return false;
	}
	
	if($("#address").val() ==""){
		alert("주소를 입력해 주세요");
		return false;
	}
	
	if($("#d_address").val() ==""){
		alert("상세주소를 입력해주세요");
		return false;
	}
	
	if($("#contact").val() ==""){
		alert("연락처를 입력해주세요");
		return false;
	}
}

var index = 1;
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
$(function() {
	$("#email").change(function() {
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var c_email = $("#email").val();
		if(regExp.test(c_email)){
			$.ajax({
	            async: true,
	            type : 'POST',
	            data : {c_email : c_email},
	            url : "${contextPath}/member/idCheck",
	            dataType : "json",
	            success : function(data) {
	                if (data.cnt > 0) {   
	                	$("#idchk_val").removeClass('green');
	                	$("#idchk_val").addClass('red');
	                	$("#idchk_val").text("사용 불가능한 아이디 입니다")

	                } else {
	                	$("#idchk_val").removeClass('red');
	                	$("#idchk_val").addClass('green');
	                	$("#idchk_val").text("사용 가능한 아이디 입니다")
	                    
	                }
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	            }
	        });
		} else{
			$("#idchk_val").removeClass('green');
        	$("#idchk_val").addClass('red');
        	$("#idchk_val").text("이메일 형식에 맞지 않습니다.")
		}
		
	}); //email체크함수
	
	$("#pw2").change(function() {
		var pw = $("#pw").val(); 
		var pw2 = $("#pw2").val(); 
// 		console.log(pw)
// 		console.log(pw2)
		
		if(pw==pw2 ){
			$("#pwchk_val").removeClass('red');
        	$("#pwchk_val").addClass('green');
        	$("#pwchk_val").text("비밀번호가 동일합니다!")
		} else{
			$("#pwchk_val").removeClass('green');
        	$("#pwchk_val").addClass('red');
        	$("#pwchk_val").text("비밀번호가 다릅니다!")
		}
		
	});//pw체크함수
	
	
});


 
</script>

<style type="text/css">
.content{
	width: 900px;
	margin: 0 auto;
}

legend{
	text-align: center;
}

.content fieldset {
	padding: 25px;
}

.main{
	width: 500px;
	margin: 40px auto;
}

.space{
	width: 70px;
}

.auth{
    background-color: #40bf9f;
    color: white;
    border-color: #40bf9f;
    width: 200px;
    display: inline;
    font-weight: bold;
}

.phone{
	display: inline;
	width: 295px;
}

.red{
	color: red;
	font-size: 10px;
}
.green{
	color: green;
	font-size: 10px;
}

.btnGroup{
	text-align: center;
	margin: 35px;
}

.btn-submit,
.btn-cancle{
	background-color: #40bf9f;
    color: white;
    border-color: #40bf9f;
    margin: 15px;
    width: 70px;
    font-weight: bold;
}


</style>
<meta charset="UTF-8">
<title>가정시터 글등록을 위한 상세내용</title>
</head>
<body>
<!-- 네비게이션 -->
<div>
	<div class="container">
        <header>
            <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
         
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
                <li class='active sub'><a href='${contextPath}/sitter/main'>SITTER</a>
         
                    <ul>
                        <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a></li>
                        <li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
                    <ul>
                        <li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='#'>REVIEW</a>
                    <ul>
                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
                        <li class='last'><a href='#'>시터</a></li>
                        <li class='last'><a href='#'>호텔</a></li>
                    </ul>
                </li>
                <li class='last'><a href='#' style="font-size: 17px">MY PAGE</a></li>
                <li class='last'><a href='${contextPath}/admin/qna' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
</div>	
<!-- 칸 띄우기 위함 -->
<br><br><br><br><br>

<!-- 		여기다 내용을 작성하시면 됩니다 -->
<div class="container">
		<form action="${contextPath }/home/write" method="post" enctype="multipart/form-data">
		<h1>가정용펫시터 글 등록페이지</h1>
		<table>
			<tr>
				<th>글제목**</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>글내용**</th>
				<td>
					Q. 왜 도그메이트 펫시터를 하게 되었나요?
					<input type="text">
				</td>
				<td>
					Q. 반려견을 키운 경험에 대해 알려주세요. 현재 반려견을 키우고 계시다면 자세히 소개해주세요!
					<input type="text">
				</td>
				<td>
					Q. 애견호텔이 아닌 저에게 맡겨주시면 아래와 같은 내용을 약속드립니다.
					<input type="text">
				</td>
				<td>
					※ 아래 유형의 아이들은 돌봄이 어려울 수 있습니다.
					<input type="text">
				</td>
			</tr>
			<tr>
				<th>돌봄 공간의 사진을 올려주세요**</th>
<!-- 					<td> -->
<!-- 						<input type="file" name="hsl_filename"> -->
<!-- 						<div id="example"></div> -->
<!-- 					</td> -->
				<td>
					<input type="button" id="addItemBtn" class="my_button" value="파일추가" name="hsl_img_filename"> 
					<div id="example"></div>
				</td> 
			</tr>
			<tr>
				<th>펫을 돌볼 수 있는 날짜를 선택해 주세요**</th>
				<td>
					<select name="hsl_service_type">
						<option title="24시간 돌봄" value="24시간돌봄">24시간 돌봄</option>
						<option title="데이케어" value="데이케어">데이케어</option>
					</select>			
				</td>
			</tr>
			<tr>
				<td>여기는 disable date 로 받기</td>
				<th>체크인 가능 시간의 범위를 지정해 주세요</th>
				<td><input type="date" name="hsl_chkin"></td>
			</tr>
			<tr>
				<th>체크아웃 가능 시간의 범위를 지정해 주세요</th>
				<td><input type="date" name="hsl_chkout"></td>
			</tr>
			<tr>
				<th>돌봄 가능한 강아지의 크기를 선택해 주세요</th>
				<td>
					<select name="hsl_size" data-width="130px">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option title="s" value="소형견">소형견 (0~4.9kg)</option>
						<option title="m" value="중형견">중형견 (5~14.9kg)</option>
						<option title="l" value="대형견">대형견 (15kg 이상)</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>돌봄 가능한 강아지의 나이를 선택해 주세요</th>
				<td>
					<select name="hsl_pet_age" data-width="130px">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option title="puppy" value="강아지">강아지 (1살 이하)</option>
						<option title="dog" value="성견">성견 (2~6살)</option>
						<option title="agedDog" value="노령견">노령견 (7살 이상)</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>현재 키우고 있는 펫 크기를 선택해주세요</th>
				<td>
					<select name="" data-width="130px">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option title="s" value="소형견">소형견 (0~4.9kg)</option>
						<option title="m" value="중형견">중형견 (5~14.9kg)</option>
						<option title="l" value="대형견">대형견 (15kg 이상)</option>
					</select>
				</td>
			</tr>
		</table>
		<h1>돌봄 환경에 대해 자세히 알려주세요</h1>
		<table>
			<tr>
				<th>돌봄공간</th>
				<td>
					<select name="" data-width="130px">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option value="아파트">아파트 </option>
						<option value="빌라">빌라</option>
						<option value="주택">주택</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>인근 지하철역</th>
				<td></td>
			</tr>
			<tr>
				<th>마당유무</th>
				<td>
					<input type='radio' name='' value='있습니다.' />있습니다.
 					<input type='radio' name='' value='없습니다.' checked/>없습니다.	
 				</td>
			</tr>
			<tr>
				<th>14세미만 아동 거주 유무</th>
				<td>
					<input type='radio' name='' value='있습니다.' />있습니다.
 					<input type='radio' name='' value='없습니다.' checked/>없습니다.	
 				</td>
			</tr>
			<tr>
				<th>가족 동거 유무</th>
				<td>
					<input type='radio' name='' value='있습니다.' />있습니다.
 					<input type='radio' name='' value='없습니다.' checked/>없습니다.	
 				</td>
			</tr>
			<tr>
				<th>다른 동물 유무</th>
				<td>
					<input type='radio' name='' value='있습니다.' />있습니다.
 					<input type='radio' name='' value='없습니다.' checked/>없습니다.	
 				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th>강아지 사진</th> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
		</table>
		<div class="imgs_wrap"></div>
		<table>
			<tr>
				<td>
					<input type="submit" value="등록"> <input type="reset" value="다시쓰기"> <input type="button" value="돌아가기" onclick="location.href='${contextPath}/home/main">
				</td>
			</tr>
		</table>
	</form>
	<form action="${contextPath }/home/write" method="post" name="userInfo" onsubmit="return checkValue()">
		<div class="main">
			<div class="form-group">
				<label for="c_email">아이디</label>
				<input type="email" class="form-control" id="email" placeholder="이메일을 입력해 주세요" name="c_email">
				<span id="idchk_val"></span>
			</div>
			<div class="form-group">
				<label for="c_sex">성별</label><label class="space"></label>
				<select id="sex" name="c_sex" class="form-control" >
					<option value="" selected="selected">성별</option>
					<option value="1">여자</option>
					<option value="2">남자</option>
				</select>
			</div>
			<div class="form-group">
				<label for="address">주소</label><label class="space"></label>
<!-- 				<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-outline-success" value="우편번호 찾기"> -->
				<input type="text" class="form-control" id="address" placeholder="도로명 주소" name="c_address" readonly="readonly" onclick="getAddress()">
				<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
				<input type="text" class="form-control" id="d_address" placeholder="상세주소를 입력해 주세요" name="c_d_address" style="margin-top: 5px">
				<span id="guide" style="color: #999"></span>
			</div>
			<div class="form-group">
				<label for="c_contact">휴대전화</label>
				<div class="mobile-area" >
				<input type="tel" class="form-control phone" id="contact" placeholder="숫자만 입력해 주세요" name="c_contact">
				<input type="button" class="form-control auth" value="인증번호 받기">
				<input type="text" class="form-control phone" id="contact_chk" placeholder="인증번호를 입력해 주세요" style="margin-top: 5px;">
				<input type="button" class="form-control auth" value="인증번호 확인">
				</div>
			</div>
			<div class="btnGroup">
				<input type="submit" class="btn btn-submit" value="가입">
				<input type="button" class="btn btn-cancle" value="취소" onclick="cancleCheck()">
			</div>
		</div>
	</form>
</div>
</body>
</html>