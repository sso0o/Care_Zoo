<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addHotelForm</title>
<style type="text/css">
img {
	width: 200px;
	height: 200px;
}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// 	new daum.Postcode({
	// 		oncomplete : function(data) {
	// 			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	// 			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
	// 		}
	// 	}).open();
</script>
<script src="https://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	var index = 1;
	$(function() {
		var count = 0;

		$('#addRoom')
				.click(
						function() {
							var tab = $("#mytable");
							var tr = $("<tr>");

							var r_name = $("<td><input type=\"text\" placeholder=\"방이름\" name=\"r_name"+count+"\">")
							var r_adult = $("<td><input type=\"number\" placeholder=\"가능어른수\" name=\"r_adult"+count+"\">")
							var r_child = $("<td><input type=\"number\" placeholder=\"가능어른수\" name=\"r_child"+count+"\">")
							var r_p_count = $("<td><input type=\"number\" placeholder=\"동반가능펫수\" name=\"r_p_count"+count+"\">")
							var r_price = $("<td><input type=\"number\" placeholder=\"가격\" name=\"r_price"+count+"\">")

							// 			$('#mytable').append('<tr><td>ㅁ</td><td>ㅁ</td><td>ㅁ</td><td>ㅁ</td><td>ㅁ</td><td>ㅁ</td></tr>');
							count++;
							tr.append(r_name);
							tr.append(r_adult);
							tr.append(r_child);
							tr.append(r_p_count);
							tr.append(r_price);
							tr.append(r_img);
							tr.appendTo(tab);
						});

		$('#delRoom').click(function() {
			if (count > 0) {
				$('#mytable:last > tr:last').remove();
				count--;
			}

		})

		// 		옵션추가 버튼 클릭시
		$("#addItemBtn")
				.click(
						function() {
							if (index > 1) {
								
								var file = document.getElementById('file'+ (index - 1));
// 								var file = $("#file"+(index-1));
								console.log(file.files.length);
								if (file.files.length == 0) {
									console.log("length 실행!");
									console.log($("#file" + (parseInt(index))));
// 									$("#file" + (parseInt(index))).remove();
									$(file).remove();
									index--;
								}
							}
							//파일 선택란을 보여준다.
							//             $("tr#item1").show();
							// tr태그의 마지막 번째를 구해 id="item"의 형태로 만들어 lastItemNo에 대입
							//새로 추가 할 경우 두번째 tr 값을 복사하여 newitem변수에 대입
							// 			var newitem = $("#file"+lastItemNo).clone();
							var newitem = "<input type='file' id='file"
									+ (parseInt(index))
									+ "'name='file'  style='display: none' accept='.jpg,.jpeg,.png,.gif,.bmp' />";
							if (index == 5) {
								//그리고 해당 아이템은 5개 이상 생성할수 없도록 제한
								alert("5개 이상 파일 추가 하실 수 없습니다.");
							} else {
								$("#example").append(newitem);
							}
							//아이템 추가시 id="item" 값에 넘버를 추가해 준다.               
							// 			newitem.attr("id", "file" + (parseInt(lastItemNo) + 1));

							$("#file" + (parseInt(index))).trigger('click');

							//file형식의 그것의 취소버튼을 눌렀을 때.

							//onclick=\"deleteImageAction("+index+")\"
							$("#file" + (parseInt(index))).on("change",
									handleImgFileSelect);
							console.log(index);

							index++;

						});

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
</script>


</head>
<body>
	<div>
		<fieldset>
			<legend>호텔 정보 입력</legend>
			<form action="${contextPath}/dongbanHotel/addHotel"
				enctype="multipart/form-data">
				<table>
					<tr>
						<th>호텔이름</th>
						<td><input type="text" name="h_name"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="hidden" id="sample4_postcode"
							placeholder="우편번호"> <input type="button"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <input
							type="text" id="sample4_roadAddress" name="h_address"
							placeholder="도로명주소"> <input type="hidden"
							id="sample4_jibunAddress" placeholder="지번주소"></td>
						<td><input type="text" id="h_d_address" name="h_d_address"
							placeholder="상세주소 입력해주세요"> <span id="guide"
							style="color: #999"></span></td>
					</tr>
					<tr>
						<th>room 추가</th>
						<td><input type="button" id="addRoom" value="추가"> <input
							type="button" id="delRoom" value="삭제"></td>
					</tr>
					<tbody id="mytable">
						<tr>
							<th>방이름</th>
							<th>가능어른수</th>
							<th>가능어린이수</th>
							<th>동반가능펫수</th>
							<th>가격</th>
						</tr>
						<tr>
							<td><input type="text" placeholder="방이름" name="r_name"></td>
							<td><input type="number" placeholder="가능어른수" name="r_adult"></td>
							<td><input type="number" placeholder="가능어린이수" name="r_child"></td>
							<td><input type="number" placeholder="동반가능펫수"
								name="r_p_count"></td>
							<td><input type="number" placeholder="가격" name="r_price"></td>


						</tr>


					</tbody>
					<tr>
						<th>사진</th>
						<td><input type="button" id="addItemBtn" class="my_button"
							value="파일추가">
							<div id="example"></div></td>
					<tr>
						<td></td>
					<tfoot>
						<tr>
							<td></td>
						</tr>
					</tfoot>
				</table>
				<div class="imgs_wrap"></div>
				<input type="submit" value="제출">
			</form>
		</fieldset>

	</div>



</body>
</html>