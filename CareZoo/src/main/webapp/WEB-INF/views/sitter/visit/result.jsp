<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("${msg}");
	location.href="${url}"; // 이거 자체가 redirect 브라우저가 loaction한테 요청을 만들어내라는 느낌...
</script>    
