<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>펫 호텔 추가</title>

<!-- Custom fonts for this template-->
<link
	href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<title>addPetHotelForm</title>
<style type="text/css">
img {
	width: 200px;
	height: 200px;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script>
	// 	new daum.Postcode({asdas
	// 		oncomplete : function(data) {
	// 			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	// 			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
	// 		}
	// 	}).open();
</script>
<script src="https://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}

	$(function() {

// 		console.log($("#phone1").val().length);
// 		if ($("#phone1").val().length < 2 || $("#phone1").val().length > 4) {
// 			alert("핸드폰번호를 정확하게 입력해주세요.");
// 			return false;
// 		}
// 		if ($("#phone2").val().length < 2 || $("#phone2").val().length > 4) {
// 			alert("핸드폰번호를 정확하게 입력해주세요.");
// 			return false;
// 		}

		$("#email")
				.change(
						function() {
							var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							var c_email = $("#email").val();
							if (regExp.test(c_email)) {
							} else {
								$("#idchk_val").removeClass('green');
								$("#idchk_val").addClass('red');
							}
						});

	});
	function submitFunction() {
		$(".addPetHotelForm").submit();
	}
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작asqwewqeqeqwewqdasdasdsaasdasdsadasdsa성하는 부분.

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

<script type="text/javascript">
	// 이미지 정보들을 담을 배열
	var index = 1;
	var s = 0;
	$(function() {
		var count = 0;

		$('#delRoom').click(function() {
			if (count > 0) {
				$('#mytable:last > tr:last').remove();
				count--;
			}

		})
  
		//방추가하기 버튼 클릭시asdsa
		$("#roomAddButton")
				.click(
						function() {
							s++;
							var roomDiv = $(".roomAddForm");
							roomDiv.append($("<hr>"));
							roomDiv
									.append($("<label>방이름</label>     &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<input type='text' name='phrm_name' style='position: relative; left: 3px;''><br>"));
							roomDiv
									.append($("<label>소형견 가격</label>   &nbsp; &nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp; <input type='text' name='phrm_price'>  &nbsp; &nbsp;"));

							roomDiv
									.append($(" <label> 중형견 가격</label> <input type='text' name='phrm_m_price'> &nbsp; &nbsp;"));

							roomDiv
									.append($(" <label> 대형견 가격</label>  <input type='text' name='phrm_l_price'><br>"));
							roomDiv
									.append($("<label>최대 가능 펫 수</label>  &nbsp; &nbsp; &nbsp;<input class='form-control-sm' type='number' min='1' max='15' name='phrm_p_max' id='pet_max' value='1'><br>"));
							roomDiv
									.append($("<label>가능한 펫 사이즈</label> &nbsp; 	<div style='display:inline-flex'><div class='form-check'> <label class='form-check-label'> <input type='checkbox' class='form-check-input' value='소형견' name='phrm_pet_size"+s+"'>소형견</label></div>&nbsp;&nbsp;<div class='form-check'><label class='form-check-label'> <input type='checkbox' class='form-check-input' value='중형견' name='phrm_pet_size"+s+"'>중형견</label></div>&nbsp;&nbsp;<div class='form-check'><label class='form-check-label'> <input type='checkbox' class='form-check-input' value='대형견' name='phrm_pet_size"+s+"'>대형견</label></div></div><br>"));

							roomDiv
									.append($(" <label>호텔 환경</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style='display:inline-flex ;position: relative; left: 3px;'> <div class='form-check'> <label class='form-check-label'> <input type='checkbox' class='form-check-input' value='노령견케어' name='phrm_option"+s+"'>노령견케어</label></div>&nbsp;&nbsp;<div class='form-check'><label class='form-check-label'> <input type='checkbox' class='form-check-input' value='환자견케어'name='phrm_option"+s+"''>환자견케어</label></div>&nbsp;&nbsp;<div class='form-check'><label class='form-check-label'> <input type='checkbox' class='form-check-input' value='투약가능'name='phrm_option"+s+"'>투약가능</label></div>&nbsp;&nbsp;<div class='form-check'><label class='form-check-label'> <input type='checkbox' class='form-check-input' value='자격증보유' name='phrm_option"+s+"'>자격증보유</label></div>&nbsp;&nbsp;<div class='form-check'><label class='form-check-label'> <input type='checkbox' class='form-check-input' value='응급처치' name='phrm_option"+s+"'>응급처치 </label></div>&nbsp;&nbsp;<div class='form-check'><label class='form-check-label'> <input type='checkbox' class='form-check-input' value='수제간식' name='phrm_option"+s+"'>수제간식</label></div></div><br>"));
							// 			<br>qwewqeweqweqweㅂㅈㄷㅇㅁㄴㅇasdasdsdsadsadas
							// 			<label>방이름</label>     &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbqweqweqwesp; &nbsp; &nbsp;<input type="text" name="phrm_name"><br>
							// 			<label>소형견 가격</label>   &nbsp; &nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp; <input type="text" name="phrm_price">  &nbsp; &nbsp;
							// 			<label>중형견 가격</label> <input type="text" name="phrm_m_price"> &nbsp; &nbsp;
							// 			<label>대형견 가격</label>  <input type="text" name="phrm_l_price"><br>
							// 			<label>최대 가능 펫 수</label>  &nbsp; &nbsp; &nbsp;<input type="text" name="phrm_p_max"><br>
							// 			<label>가능한 펫 사이즈</label> &nbsp; <input type="text" name="phrm_pet_size">

						});

		// 		옵션추가 버튼 클릭시
		$("#addItemBtn")
				.click(
						function() {
							console.log("addItem의 index:" + index);
							console.log("file개수세기:" + $(".fileClass").length);
							if ($(".fileClass").length > 0) {
								console.log("img개수세기:"
										+ $(".selProductFile").length);
								var file = document.getElementById('file'
										+ ($(".fileClass").length));
								// 								var file = $("#file"+(index-1));
								console.log("file의length:" + file.files.length);
								if (file.files.length == 0) {
									console.log("length 실행!");
									console.log($("#file" + (parseInt(index))));
									// 									$("#file" + (parseInt(index))).remove();
									$(file).remove();
								}
							}
							//파일 선택란을 보여준다.
							//             $("tr#item1").show();
							// tr태그의 마지막 번째를 구해 id="item"의 형태로 만들어 lastItemNo에 대입
							//새로 추가 할 경우 두번째 tr 값을 복사하여 newitem변수에 대입
							// 			var newitem = $("#file"+lastItemNo).clone();
							var newfile = "<input type='file' id='file"
									+ (parseInt(index))
									+ "'name='file' class='fileClass'  style='display: none' accept='.jpg,.jpeg,.png,.gif,.bmp' />";

							if ($(".selProductFile").length == 8) {
								//그리고 해당 아이템은 5개 이상 생성할수 없도록 제한
								alert("8개까지 가능합니다.");
							} else {
								$("#example").append(newfile);

							}
							//아이템 추가시 id="item" 값에 넘버를 추가해 준다.               
							// 			newitem.attr("id", "file" + (parseInt(lastItemNo) + 1));

							$("#file" + (parseInt(index))).trigger('click');

							//file형식의 그것의 취소버튼을 눌렀을 때.

							//onclick=\"deleteImageAction("+index+")\"
							$("#file" + (parseInt(index))).on("change",
									handleImgFileSelect);

							console.log("add가끝난뒤 index:" + index);

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
		console.log("handleImg때의 index:" + index);
		// 이미지 정보들을 초기화
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					var reader = new FileReader();
					reader.onload = function(e) {

						var html = "<img src=\""
								+ e.target.result
								+ "\" data-file='"
								+ f.name
								+ "' id='preImg"
								+ (index - 1)
								+ "' class='selProductFile' title='Click to remove' style='width:250px, height:250px'></a>";
						$(".imgs_wrap").append(html);

						// 						var newButton = "<input type='button' id='deleteButton"+(index-1)+"'  onclick='deleteImageAction("
						// 								+ index + ")' value='삭제'>&nbsp;";
						// 						var newButton = "<button class='dButton' id='deleteButton" 
						// 								+ (index - 1)
						// 								+ "' style='position:relative;top:84'  onclick='deleteImageAction("
						// 								+ index
						// 								+ ")' >&times;</button>&nbsp;";

						var newButton = "<a  href= 'javascript:void(0)'   class='btn btn-danger btn-icon-split' id='deleteButton"
								+ (index - 1)
								+ "' style='position:relative;top:84px;'  onclick='deleteImageAction("
								+ index
								+ ")' > <span class='icon text-white-50'><i class='fas fa-trash'></i></span></a>&nbsp;&nbsp;";

						// 				                  <a  href= "${contextPath}/admin/petHotelDelete?ph_num=${ph.ph_num }"   class="btn btn-danger btn-icon-split">
						// 				                    <span class="icon text-white-50">
						// 				                      <i class="fas fa-trash"></i>
						// 				                    </span>
						// 				                    <span class="text">삭제</span>
						// 				                  </a>   

						$(".imgs_wrap").append(newButton);
					}
					reader.readAsDataURL(f);
				});
		index++;
	}

	function deleteImageAction(fileIndex) {
		console.log("delete start!");
		var file = document.getElementById('file' + (fileIndex - 1));
		var img = document.getElementById('preImg' + (fileIndex - 1));
		var dButton = document.getElementById('deleteButton' + (fileIndex - 1));
		$(file).remove();
		$(img).remove();
		$(dButton).remove();
		index--;
		console.log("index=" + index);
	}
</script>
</head>
<body>


	<!-- Page Wrapper -->

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="${contextPath}/admin/memberList">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">관리자 페이지</div>
			</a>

			<br>
			<!-- Divider -->
			<!-- 			<hr class="sidebar-divider my-0"> asd-asdasdaasdsaasdsadsaasdsdadsdsad->

<!-- 			<!-- Nav Item - Dashboard -->
			<!-- 			<li class="nav-item active"><a class="nav-link" -->
			<%-- 				href="${contextPath}/admin/main"> <i --%>
			<!-- 					class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li> -->
			<!-- 			<!-- Divider -->
			<!-- 			<hr class="sidebar-divider"> -->

			<!-- Heading -->
			<div class="sidebar-heading">Member</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="${contextPath}/admin/memberList"> <i
					class="fas fa-fw fa-cog"></i> <span>멤버관리</span>
			</a> <!--         <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> -->
				<!--           <div class="bg-white py-2 collapse-inner rounded"> -->
				<!--             <h6 class="collapse-header">호텔목록</h6> --> <!--             <a class="collapse-item" href="buttons.html"></a> -->
				<!--             <a class="collapse-item" href="cards.html">Cards</a> -->
				<!--           </div> --> <!--         </div> --></li>
			<hr class="sidebar-divider">
			<div class="sidebar-heading">Hotel</div>
			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item active"><a class="nav-link collapsed"
				href="${contextPath}/admin/petHotelList"> <i
					class="fas fa-fw fa-cog"></i> <span>호텔 관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/admin/resPetHotelList"> <i
					class="fas fa-fw fa-table"></i> <span>호텔예약 리스트</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Sitter</div>

			<!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${contextPath}/admin/hsList">
          <i class="fas fa-fw fa-cog"></i>
          <span>가정 시터정보 관리</span>
        </a>
      </li>
      
            <li class="nav-item">
        <a class="nav-link collapsed" href="${contextPath}/admin/vsList">
          <i class="fas fa-fw fa-cog"></i>
          <span>방문 시터정보 관리</span>
        </a>
      </li>

			<!-- Nav Item - Charts -->
			<!--       <li class="nav-item"> -->
			<!--         <a class="nav-link" href="charts.html"> -->
			<!--           <i class="fas fa-fw fa-chart-area"></i> -->
			<!--           <span>시터게시글관리</span></a> -->
			<!--       </li> -->

			<!-- Nav Item - Tables -->


			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>




						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"
									onclick="logoutCheck()"></i> Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-4 text-gray-800">호텔추가</h1>

					<div class="row">

						<div class="col-lg-6">

							<!-- Circle Buttons -->
							<div class="card shadow mb-4" style="width: 1200px;">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary"></h6>
								</div>
								<div class="card-body">


									<div>
										<fieldset>
											<form action="${contextPath}/admin/addPetHotel" method="post"
												enctype="multipart/form-data" class="addPetHotelForm">
												<table>

													<tr>
														<th>호텔이름</th>
														<td><input type="text" name="ph_name"><br></td>

													</tr>
													<tr>
														<td><br></td>
													</tr>
													<tr>
														<th>주소</th>
														<td><input type="hidden" id="sample4_postcode"
															placeholder="우편번호"> <a href="javascript:void(0)"
															onclick="sample4_execDaumPostcode()"
															class="btn btn-success btn-icon-split"> <span
																class="text">우편번호찾기</span>
														</a> <!-- 															 <input type="button" onclick="saㅁㄴㅇㅁㄴmple4_exㅁㄴㅇㄴㅇeㅁㄴㅇㅇㅁㄴcDaumPostcode()" -->
															<!-- 															value="우편번호 찾기">  --> <input
															type="text" id="sample4_roadAddress" name="ph_address"
															placeholder="도로명주소"> <input type="hidden"
															id="sample4_jibunAddress" placeholder="지번주소"></td>
														<td><input type="text" id="c_d_address"
															name="ph_d_address" placeholder="상세주소 입력해주세요"> <span
															id="guide" style="color: #999"></span><br></td>
													</tr>
													<tr>
														<td><br></td>
													</tr>
													<tr>
														<th>email</th>
														<td><input type="email" class="" id="email"
															name="ph_email"> <span id="idchk_val"></span><br></td>
													</tr>
													<tr>
														<td><br></td>
													</tr>

													<tr>

														<th>연락처</th>
														<td> <select name="phone">
																<option value="010" selected="selected">010</option>
																<option value="011">011</option>
																<option value="016">016</option>
																<option value="017">017</option>
																<option value="02">02</option>
																<option value="031">031</option>
																<option value="032">032</option>
														</select> - <input type="text" name="phone1" id="phone1" maxlength="4"
															style="width: 55px;height:26px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> - 
															<input type="text" maxlength="4"name="phone2" id="phone2" style="width: 55px;height:26px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
  
															<br></td>
													</tr>

													<tr>
														<th>사진</th>
														<td><br> <a href="javascript:void(0)"
															id="addItemBtn" class="btn btn-success btn-icon-split">
																<span class="text">사진추가</span>
														</a> <!-- 														<input type="buasdasdtton" id="addItasdsaemBtn"ㅁㄴㅇㅁㄴ -->
															<!-- 															class="my_button" value="사진추가"> -->


															<div id="example"></div> <br></td>
												</table>
												<br>
												<div>
													<div class="imgs_wrap"
														style="border: 1px solid; padding: 20px"></div>
												</div>
												<hr>
												<br>
												<div class="roomAddForm">
													<div style="font-size: 20px">
														방 추가하기 &nbsp; &nbsp; <a href="javascript:void(0)"
															id="roomAddButton" class="btn btn-success btn-icon-split">
															<span class="text">+</span>
														</a>

														<!-- asdsad -->
													</div>
													<br> <label>방이름</label> &nbsp;&nbsp; &nbsp; &nbsp;
													&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<input
														type="text" name="phrm_name"
														style="position: relative; left: 3px;"><br> <label>소형견
														가격</label> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input
														type="text" name="phrm_price"> <label> 중형견
														가격</label> <input type="text" name="phrm_m_price"> <label>
														대형견 가격</label> <input type="text" name="phrm_l_price"><br>
													<label>최대 가능 펫 수</label> &nbsp; &nbsp; &nbsp;<input
														class="form-control-sm" type="number" min="1" max="15"
														name="phrm_p_max" id="pet_max" value="1"><br>
													<label>가능한 펫 사이즈</label> &nbsp;
													<!-- ㄴㅁㅇㅁasdasd -->
													<div style="display: inline-flex">
														<div class="form-check">
															<label class="form-check-label"> <input
																type="checkbox" class="form-check-input" value="소형견"
																name="phrm_pet_size0">소형견
															</label>
														</div>
														&nbsp;&nbsp;
														<div class="form-check">
															<label class="form-check-label"> <input
																type="checkbox" class="form-check-input" value="중형견"
																name="phrm_pet_size0">중형견

															</label>
														</div>
														&nbsp;&nbsp;
														<div class="form-check">
															<label class="form-check-label"> <input
																type="checkbox" class="form-check-input" value="대형견"
																name="phrm_pet_size0">대형견
															</label>
														</div>
													</div>
													<br> <label>호텔 환경</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<!-- ㄴㅁㅇasdsㅁasdasaasdssdassadasdsaddsd -->
													<div
														style="display: inline-flex; position: relative; left: 3px;">
														<div class="form-check">
															<label class="form-check-label"> <input
																type="checkbox" class="form-check-input" value="노령견케어"
																name="phrm_option0">노령견케어
															</label>
														</div>
														&nbsp;&nbsp;
														<div class="form-check">
															<label class="form-check-label"> <input
																type="checkbox" class="form-check-input" value="환자견케어"
																name="phrm_option0">환자견케어
															</label>
														</div>
														&nbsp;&nbsp;
														<div class="form-check">
															<label class="form-check-label"> <input
																type="checkbox" class="form-check-input" value="투약가능"
																name="phrm_option0">투약가능

															</label>
														</div>
														&nbsp;&nbsp;
														<div class="form-check">
															<label class="form-check-label"> <input
																type="checkbox" class="form-check-input" value="자격증보유"
																name="phrm_option0">자격증보유
															</label>
														</div>
														&nbsp;&nbsp;
														<div class="form-check">
															<label class="form-check-label"> <input
																type="checkbox" class="form-check-input" value="응급처치"
																name="phrm_option0">응급처치
															</label>
														</div>
														&nbsp;&nbsp;
														<div class="form-check">
															<label class="form-check-label"> <input
																type="checkbox" class="form-check-input" value="수제간식"
																name="phrm_option0">수제간식
															</label>
														</div>

													</div>



												</div>
												<br>
												<hr>
												<br>
												<div style="text-align: center">
													<a href="javascript:void(0)"
														class="btn btn-info btn-icon-split"
														onclick="submitFunction()"> <span class="text">추가</span>
													</a>
												</div>

											</form>
										</fieldset>
									</div>





								</div>
							</div>

							<!-- Brand Buttons -->


						</div>


					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>



	<!-- Bootstrap core JavaScript-->
	<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${contextPath}/resources/js/sb-admin-2.min.js"></script>



</body>
</html>