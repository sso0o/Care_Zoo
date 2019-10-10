<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript">


</script>
<title>임시비밀 번호를 보냈음!</title>
<style type="text/css">
	img { display: block; margin: 0px auto; width:25%; height:25%;}
</style>
</head>
<body>
<h3 style="text-align:center;">임시비밀번호를 보내드렸습니다. 메일을 확인해 주세요:)</h3>
<img src="${contextPath}/resources/img/mailDog.png">
</body>
</html>