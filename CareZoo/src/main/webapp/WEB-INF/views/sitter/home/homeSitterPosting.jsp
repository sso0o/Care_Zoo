<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
img {
    margin: 1em 0;
    display: block;
    background: rgb(240, 240, 240);
    border: 1px solid rgb(0,0,0);
}
</style>
<title>homeSitterPosting</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript">
	window.onload=function(){
		var file = document.querySelector('#getfile');
		
		file.onchange = function () { 
		    var fileList = file.files ;
		    
		    // 읽기
		    var reader = new FileReader();
		    reader.readAsDataURL(fileList [0]);
		
		    //로드 한 후
		    reader.onload = function  () {
		        //로컬 이미지를 보여주기
		        document.querySelector('#preview').src = reader.result;
		        
		        //썸네일 이미지 생성
		        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
		        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
		        tempImage.onload = function() {
		            //리사이즈를 위해 캔버스 객체 생성
		            var canvas = document.createElement('canvas');
		            var canvasContext = canvas.getContext("2d");
		            
		            //캔버스 크기 설정
		            canvas.width = 100; //가로 100px
		            canvas.height = 100; //세로 100px
		            
		            //이미지를 캔버스에 그리기
		            canvasContext.drawImage(this, 0, 0, 100, 100);
		            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
		            var dataURI = canvas.toDataURL("image/jpeg");
		            
		            //썸네일 이미지 보여주기
		            document.querySelector('#thumbnail').src = dataURI;
		            
		            //썸네일 이미지를 다운로드할 수 있도록 링크 설정
		            document.querySelector('#download').href = dataURI;
		        };
		    }; 
		}; 
	};
</script>
</head>
<body>
	<h3>로컬에 있는 이미지를 바로 브라우저에 표시</h3>
	<img id="preview" src="" width="700" alt="로컬에 있는 이미지가 보여지는 영역">
	<a id="download" download="thumbnail.jpg" target="_blank"> 
		<img id="thumbnail" src="" width="100" alt="썸네일영역 (클릭하면 다운로드 가능)">
	</a>
	<input type="file" id="getfile" accept="image/*">
	<div>
		<form action="">
		<h1>가정용펫시터 글 등록페이지</h1>
			<table>
				<tr>
					<th>글제목</th>
					<td></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td></td>
				</tr>
				<tr>
					<th>현재 키우는 펫 크기를 선택해주세요</th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>