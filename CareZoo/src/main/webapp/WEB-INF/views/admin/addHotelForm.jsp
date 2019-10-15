<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title> 펫 호텔 추가</title>

  <!-- Custom fonts for this template-->
  <link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
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


  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item active" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="cards.html">Cards</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="utilities-color.html">Colors</a>
            <a class="collapse-item" href="utilities-border.html">Borders</a>
            <a class="collapse-item" href="utilities-animation.html">Animations</a>
            <a class="collapse-item" href="utilities-other.html">Other</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>

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
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                    <div class="status-indicator"></div>
                  </div>
                  <div>
                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                    <div class="small text-gray-500">Jae Chun · 1d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie Luna</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">Buttons</h1>

          <div class="row">

            <div class="col-lg-6">

              <!-- Circle Buttons -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Circle Buttons</h6>
                </div>
                <div class="card-body">
                  <p>Use Font Awesome Icons (included with this theme package) along with the circle buttons as shown in the examples below!</p>
                  <!-- Circle Buttons (Default) -->
                  <div class="mb-2">
                    <code>.btn-circle</code>
                  </div>
                  <a href="#" class="btn btn-primary btn-circle">
                    <i class="fab fa-facebook-f"></i>
                  </a>
                  <a href="#" class="btn btn-success btn-circle">
                    <i class="fas fa-check"></i>
                  </a>
                  <a href="#" class="btn btn-info btn-circle">
                    <i class="fas fa-info-circle"></i>
                  </a>
                  <a href="#" class="btn btn-warning btn-circle">
                    <i class="fas fa-exclamation-triangle"></i>
                  </a>
                  <a href="#" class="btn btn-danger btn-circle">
                    <i class="fas fa-trash"></i>
                  </a>
                  <!-- Circle Buttons (Small) -->
                  <div class="mt-4 mb-2">
                    <code>.btn-circle .btn-sm</code>
                  </div>
                  <a href="#" class="btn btn-primary btn-circle btn-sm">
                    <i class="fab fa-facebook-f"></i>
                  </a>
                  <a href="#" class="btn btn-success btn-circle btn-sm">
                    <i class="fas fa-check"></i>
                  </a>
                  <a href="#" class="btn btn-info btn-circle btn-sm">
                    <i class="fas fa-info-circle"></i>
                  </a>
                  <a href="#" class="btn btn-warning btn-circle btn-sm">
                    <i class="fas fa-exclamation-triangle"></i>
                  </a>
                  <a href="#" class="btn btn-danger btn-circle btn-sm">
                    <i class="fas fa-trash"></i>
                  </a>
                  <!-- Circle Buttons (Large) -->
                  <div class="mt-4 mb-2">
                    <code>.btn-circle .btn-lg</code>
                  </div>
                  <a href="#" class="btn btn-primary btn-circle btn-lg">
                    <i class="fab fa-facebook-f"></i>
                  </a>
                  <a href="#" class="btn btn-success btn-circle btn-lg">
                    <i class="fas fa-check"></i>
                  </a>
                  <a href="#" class="btn btn-info btn-circle btn-lg">
                    <i class="fas fa-info-circle"></i>
                  </a>
                  <a href="#" class="btn btn-warning btn-circle btn-lg">
                    <i class="fas fa-exclamation-triangle"></i>
                  </a>
                  <a href="#" class="btn btn-danger btn-circle btn-lg">
                    <i class="fas fa-trash"></i>
                  </a>
                </div>
              </div>

              <!-- Brand Buttons -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Brand Buttons</h6>
                </div>
                <div class="card-body">
                  <p>Google and Facebook buttons are available featuring each company's respective brand color. They are used on the user login and registration pages.</p>
                  <p>You can create more custom buttons by adding a new color variable in the <code>_variables.scss</code> file and then using the Bootstrap button variant mixin to create a new style, as demonstrated in the <code>_buttons.scss</code> file.</p>
                  <a href="#" class="btn btn-google btn-block"><i class="fab fa-google fa-fw"></i> .btn-google</a>
                  <a href="#" class="btn btn-facebook btn-block"><i class="fab fa-facebook-f fa-fw"></i> .btn-facebook</a>

                </div>
              </div>

            </div>

            <div class="col-lg-6">

              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Split Buttons with Icon</h6>
                </div>
                <div class="card-body">
                  <p>Works with any button colors, just use the <code>.btn-icon-split</code> class and the markup in the examples below. The examples below also use the <code>.text-white-50</code> helper class on the icons for additional styling, but it is not required.</p>
                  <a href="#" class="btn btn-primary btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-flag"></i>
                    </span>
                    <span class="text">Split Button Primary</span>
                  </a>
                  <div class="my-2"></div>
                  <a href="#" class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-check"></i>
                    </span>
                    <span class="text">Split Button Success</span>
                  </a>
                  <div class="my-2"></div>
                  <a href="#" class="btn btn-info btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-info-circle"></i>
                    </span>
                    <span class="text">Split Button Info</span>
                  </a>
                  <div class="my-2"></div>
                  <a href="#" class="btn btn-warning btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-exclamation-triangle"></i>
                    </span>
                    <span class="text">Split Button Warning</span>
                  </a>
                  <div class="my-2"></div>
                  <a href="#" class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-trash"></i>
                    </span>
                    <span class="text">Split Button Danger</span>
                  </a>
                  <div class="my-2"></div>
                  <a href="#" class="btn btn-secondary btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-arrow-right"></i>
                    </span>
                    <span class="text">Split Button Secondary</span>
                  </a>
                  <div class="my-2"></div>
                  <a href="#" class="btn btn-light btn-icon-split">
                    <span class="icon text-gray-600">
                      <i class="fas fa-arrow-right"></i>
                    </span>
                    <span class="text">Split Button Primary</span>
                  </a>
                  <div class="mb-4"></div>
                  <p>Also works with small and large button classes!</p>
                  <a href="#" class="btn btn-primary btn-icon-split btn-sm">
                    <span class="icon text-white-50">
                      <i class="fas fa-flag"></i>
                    </span>
                    <span class="text">Split Button Small</span>
                  </a>
                  <div class="my-2"></div>
                  <a href="#" class="btn btn-primary btn-icon-split btn-lg">
                    <span class="icon text-white-50">
                      <i class="fas fa-flag"></i>
                    </span>
                    <span class="text">Split Button Large</span>
                  </a>
                </div>
              </div>

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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${contextPath}/resources/js/sb-admin-2.min.js"></script>


</body>
</html>