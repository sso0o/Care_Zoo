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

<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/jquery-ui.multidatespicker.css'/><!-- multidatePicker -->
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/><!-- dateTimePicker -->
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- datePicker -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script><!-- datePicker -->
<script src="${contextPath}/resources/js/jquery-ui.multidatespicker.js" type="text/javascript" ></script><!-- multidatePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>   <!-- dateTimePicker -->


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
		var hs_email = $("#email").val();
		console.log(hs_email)
		if(regExp.test(hs_email)){
			console.log('이거 동작?')
			$.ajax({
	            async: true,
	            type : 'POST',
	            data : {hs_email : hs_email},
	            url : "${contextPath}/home/idCheck",
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
	
	//Disable date & time
	$('#chisTime').timepicker({
		minTime:'07:00' ,
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30,
		onSelect:  function() {
            $('#chieTime').timepicker('option', 'minTime', $(this).val());
        }
    });
	$('#chieTime').timepicker({
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30
    });
	$('#chosTime').timepicker({
		minTime:'07:00' ,
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30,
		onSelect:  function() {
            $('#choeTime').timepicker('option', 'minTime', $(this).val());
        }
    });
	$('#choeTime').timepicker({
		minTime:'07:00' ,
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30
    });
	
	
	$('#disabledate').multiDatesPicker({
		minDate: 0, // today
		maxDate: 90		
	});
// 	$('#calendar').multiDatesPicker({
// 		minDate: 0, // today
// 		maxDate: 30,
// 		onSelect: function(selected) {
// 			var dateVal = $('#hsd_disabledate').val(selected);
// 			dateVal += dateVal == "" ? dateVal : ","
// 			console.log(dateVal);
// 		}
// 	});
// 		onSelect: function(selected) {
// 			$('.hsd_disabledate').val(selected);
// 			console.log($('.hsd_disabledate').val(selected));
// 		}
// 		onSelect: function (selected) {
// 			$('.hsd_disabledate').val(selected);
// 			console.log(multiDates(selected))
// 		}
// 	});
// 	        multiDates(selected);
// 			dateVal += dateVal == "" ? $('.hsd_disabledate').val(selected) : ","
					
// 			var div = $('input [name="hsd_disabledate"]');
// 	        var inputBox = $('<input type="text" class="hsd_disabledate" name="hsd_disabledate">').append(div);
// 	        inputBox.val(selected);
// 	function multiDates(selected) {
	
// 		var div = $('input [name=hsd_disabledate]');
//         var inputBox = $('<input type="text" class="hsd_disabledate" name="hsd_disabledate">');
//         var dateVal = inputBox.val(selected);
//         div.append(inputBox);
//         dateVal += dateVal == "" ? inputBox.val(selected) : ",";
//         console.log('dd'+inputBox.val());
//         console.log(div.append(inputBox))
// 	}
// 	$("#hsd_disabledate").datepicker({
// 		multiDatesPicker: 
// 		onSelect: function() {
// 			var date = $(this).val();
			
// 			console.log(date);
// 		}
// 	});
// 	$("#hsd_disabledate").each(function(){ $(this).datepicker(); });

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
<title>Insert title here</title>
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
				<li class='last'><a href='#' style="font-size: 17px">MY PAGE</a></li>
				<li class='last'><a href='#' style="font-size: 17px">Q&A</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="content">
		<h2>홈시터 게시글 등록을 위한 회원정보를 정확하게 입력해 주세요.</h2>
		<hr>
		<form action="${contextPath }/home/join" method="post" name="homesitterInfo" onsubmit="return checkValue()">
			<%-- 			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"> --%>
			<div class="main">
					<div class="form-group">
						<label for="hsd_disabledate">불가능한 날짜를 선택하여 주세요.(매 90일마다 갱신) </label><br>
<!-- 							<div id="calendar"></div> -->
						<input type="text" class="form-control" id="disabledate" name="hsd_disabledate"  placeholder="불가능한 날을 모두 선택해 주세요." autocomplete=off >
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