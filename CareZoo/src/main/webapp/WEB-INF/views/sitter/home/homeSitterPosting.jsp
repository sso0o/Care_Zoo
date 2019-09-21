<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>homeSitterPosting</title>
<script type="text/javascript">
$(function(){
	var index = 1;
	//옵션추가 버튼 클릭시
	$("#addItemBtn").click(function() {
		if (index > 1) {
			var file = document.getElementById('file'+ (index - 1));
			console.log(file.files.length);
			if (file.files.length == 0) {
				console.log("length 실행!");
				console.log($("#file" + (parseInt(index))));
				$(file).remove();
				index--;
			}
		}
		var newitem = "<input type='file' id='file"
				+ (parseInt(index))
				+ "'name='file'  style='display: none' accept='.jpg,.jpeg,.png,.gif,.bmp' />";
		if (index == 5) {
			alert("5개 이상 파일 추가 하실 수 없습니다.");
		} else {
			$("#example").append(newitem);
		}
		$("#file" + (parseInt(index))).trigger('click');
		$("#file" + (parseInt(index))).on("change",
				handleImgFileSelect);
		console.log(index);

		index++;
	});
	// 이미지 정보들을 담을 배열
	var sel_files = [];
	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#file1").trigger('click');
	}
	var sel_file;
	function handleImgFileSelect(e) {
		console.log("handleImg");
		// 이미지 정보들을 초기화
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' style='width:250px, height:250px'></a>";
						$(".imgs_wrap").append(html);
					}
					reader.readAsDataURL(f);
				});
	}
	$(function(id, file, func) {
		$('#' + id).ajaxForm({
			contentType : false,
			processData : false,
			enctype : "multipart/form-data",
			dataType : "POST",
			dataType : 'json',
			beforeSubmit : function(data, form, option) {
				var fileSize = file.length;
				if (fileSize > 0) {
					for (var i = 0; i < fileSize; i++) {
						var obj = {
							name : "files[]",
							value : file[k],
							type : "file"
						};
						console.log(obj);
						data.push = obj;
					}
				}
				console.log('beforeSubmit');
				console.log(file);
				console.log(data);
				console.log(form);
				console.log(option);
			},
			success : function(returnData) {
				console.log("returnData : " + returnData);
				func(returnData);
			},
			error : function(x, e) {
				console.log("[AF]ajax status : " + x.status);
				console.log(e);
			},
		});
	});

	$(document).on('click', '#removeImg', function() {
		const fileIndex = $(this).parent().index();
		fileBuffer.splice(fileIndex, 1);
		$('.fileList>div:eq(' + fileIndex + ')').remove();
	});
	
});
</script>
</head>
<body>
	<div>
		<form action="home/write" method="post" enctype="multipart/form-data">
			<h1>가정용펫시터 글 등록페이지</h1>
			<table>
				<tr>
					<th>글제목**</th>
					<td></td>
				</tr>
				<tr>
					<th>글내용**</th>
					<td>
						Q. 왜 도그메이트 펫시터를 하게 되었나요?
						<textarea rows="5" cols="10"></textarea>
					</td>
					<td>
						Q. 반려견을 키운 경험에 대해 알려주세요. 현재 반려견을 키우고 계시다면 자세히 소개해주세요!
						<textarea rows="5" cols="10"></textarea>
					</td>
					<td>
						Q. 애견호텔이 아닌 저에게 맡겨주시면 아래와 같은 내용을 약속드립니다.
						<textarea rows="5" cols="10"></textarea>
					</td>
					<td>
						※ 아래 유형의 아이들은 돌봄이 어려울 수 있습니다.
						<textarea rows="5" cols="10"></textarea>
					</td>
				</tr>
				<tr>
					<th>돌봄 공간의 사진을 올려주세요**</th>
<!-- 					<td> -->
<!-- 						<input type="file" name="hsl_filename"> -->
<!-- 						<div id="example"></div> -->
<!-- 					</td> -->
					<td>
						<input type="button" id="addItemBtn" class="my_button" value="파일추가">
						<div id="example"></div>
					</td> 
				</tr>
				<tr>
					<th>펫을 돌볼 수 있는 날짜를 선택해 주세요**</th>
					<td></td>
				</tr>
				<tr>
					<th>체크인 가능 시간의 범위를 지정해 주세요</th>
					<td></td>
				</tr>
				<tr>
					<th>체크아웃 가능 시간의 범위를 지정해 주세요</th>
					<td></td>
				</tr>
				<tr>
					<th>돌봄 가능한 강아지의 크기를 선택해 주세요</th>
					<td></td>
				</tr>
				<tr>
					<th>돌봄 가능한 강아지의 나이를 선택해 주세요</th>
					<td></td>
				</tr>
				<tr>
					<th>현재 키우고 있는 펫 크기를 선택해주세요</th>
					<td></td>
				</tr>
			</table>
			<h1>돌봄 환경에 대해 자세히 알려주세요</h1>
			<table>
				<tr>
					<th>돌봄공간</th>
					<td></td>
				</tr>
				<tr>
					<th>인근 지하철역</th>
					<td></td>
				</tr>
				<tr>
					<th>마당유무</th>
					<td></td>
				</tr>
				<tr>
					<th>14세미만 아동 거주 유무</th>
					<td></td>
				</tr>
				<tr>
					<th>가족 동거 유무</th>
					<td></td>
				</tr>
				<tr>
					<th>다른 동물 유무</th>
					<td></td>
				</tr>
				<tr>
					<th>강아지 사진</th>
					<td></td>
				</tr>
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
	</div>
</body>
</html>