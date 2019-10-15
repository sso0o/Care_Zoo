<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:set var = "contextPath" value ="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	if("${msg}" != ""){
		alert("${msg}");
	}
});

</script>
<style type="text/css">
body{
   font-family: 'Noto Sans KR', sans-serif;
}
.btn-ok{
    width: 5%;
    border: none;
    background-color: #1BBC9B;
    border-radius: 5px;
    font-size: 14px;
    padding: 10px;
    margin-bottom: 30px;
    color: white;
    position: absolute;
    left: 1015px;

}
</style>
<title>회원탈퇴</title>
</head>
<body>
<br><br><br><br><br>
<h2 style="text-align:center;">회원탈퇴가 완료되었습니다</h2>
<input type="button" value="확인" onclick="location.href='${contextPath}/logout'" class="btn btn-ok">
</body>
</html>