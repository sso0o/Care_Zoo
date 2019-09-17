<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
<!-- 로그인폼 -->
</head>
<body>
	<form action="${contextPath }/login" method="post">
<%-- 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
		<fieldset>
			<legend>로그인</legend>
			<table>
				<tr>
					<td><input type="radio" name="user" value="customer" checked="checked">고객</td>
					<td><input type="radio" name="user" value="visit">방문시터</td>
					<td><input type="radio" name="user" value="home">가정시터</td>
					<td><input type="radio" name="user" value="admin">관리자</td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td><input type="text" name="userid" placeholder="이메일을 입력해주세요"></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="로그인"> 
					<input type="button" onclick="location.href='join'" value="회원가입">
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
	
		<h3>
			<c:if test='${param.login eq "false"}'>
				로그인 후 이용하세요.
			</c:if>
			<c:if test='${param.login eq "fail"}'>
				로그인에 실패하였습니다.
			</c:if>
		</h3>	
</body>
</html>