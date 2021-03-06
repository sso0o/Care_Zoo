<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html >

<head>
 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>펫호텔 리스트</title>

  <!-- Custom fonts for this template -->
  <link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="${contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}
</script>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${contextPath}/admin/memberList">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">관리자 페이지 </div>
      </a>
<br>
      <!-- Divider -->
<!--       <hr class="sidebar-divider my-0"> -->

<!--       Nav Item - Dashboard -->
<!--       <li class="nav-item "> -->
<%--         <a class="nav-link" href="${contextPath}/admin/main"> --%>
<!--           <i class="fas fa-fw fa-tachometer-alt"></i> -->
<!--           <span>Dashboard</span></a> -->
<!--       </li> -->

<!--       Divider -->
<!--       <hr class="sidebar-divider"> -->

      <!-- Heading -->
      <div class="sidebar-heading">
        Member
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item ">
        <a class="nav-link collapsed" href="${contextPath}/admin/memberList">
          <i class="fas fa-fw fa-cog"></i>
          <span>멤버 관리</span>
        </a>
<!--   qweewq      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> -->
<!--           <div class="bg-white py-2 collapse-inner rounded"> -->
<!--             <h6 class="collapse-header">호텔목록</h6> -->
<!--             <a class="collapse-item" href="buttons.html"></a> -->
<!--             <a class="collapse-item" href="cards.html">Cards</a> -->
<!--           </div> -->
<!--         </div> -->
      </li>
      <hr class="sidebar-divider">
            <div class="sidebar-heading">
        Hotel
      </div>
      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item" >
        <a class="nav-link collapsed" href="${contextPath}/admin/petHotelList">
          <i class="fas fa-fw fa-cog"></i>
          <span>호텔 관리</span>
        </a>
      </li>
            <li class="nav-item">
        <a class="nav-link" href="${contextPath}/admin/resPetHotelList">
          <i class="fas fa-fw fa-table"></i>
          <span>호텔예약 리스트</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Sitter
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${contextPath}/admin/hsList">
          <i class="fas fa-fw fa-cog"></i>
          <span>가정 시터정보 관리</span>
        </a>
      </li>
      
            <li class="nav-item active">
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




            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
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
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal" onclick="logoutCheck()">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->
<br>
<br>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">방문시터 관리</h1>
<br>
<br>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>시터 고유 번호</th>
                      <th>시터 이름</th>
                      <th>시터 아이디(이메일)</th>
                      <th>시터 주소</th>
                      <th>시터 번호</th>
                      <th style="width:80px" id="soso">강제 탈퇴</th>
                    </tr>
                  </thead>
<!--                   <tfoot> -->
<!--                     <tr> -->
<!--                       <th>Name</th> -->
<!--                       <th>Position</th> -->
<!--                       <th>Office</th> -->
<!--                       <th>Age</th> -->
<!--                       <th>Start date</th> -->
<!--                       <th>Salary</th> -->
<!--                     </tr> -->
<!--                   </tfoot> -->
                  <tbody>
<!--                     <tr> -->
<!--                       <td>Tiger Nixon</td> -->
<!--                       <td>System Architect</td> -->
<!--                       <td>Edinburgh</td> -->
<!--                       <td>61</td> -->
<!--                       <td>2011/04/25</td> -->
<!--                       <td>$320,800</td> -->
<!--                     </tr> -->
			<c:forEach items="${vsList }" var="vs">
				<tr>
					<td>${vs.vs_num }</td>
					<td>${vs.vs_name }</td> 
					<td>${vs.vs_email }</td>
					<td>${vs.vs_address } ${vs.vs_d_address }</td>
					<td>${vs.vs_contact }</td>
<!-- 					<td><div class="my-2">     -->
 <%-- 					<input type="hidden" class="ph_num" name="ph_num" value="${phL.ph_num }"> --%> 
<!-- 					</div> -->
<!--                   <a href="#" class="btn btn-secondary btn-icon-split"> -->
<!--                     <span class="icon text-white-50"> -->
<!--                       <i class="fas fa-arrow-right"></i> -->
<!--                     </span> -->
<!--                     <span class="text">수정</span> -->
<!--                   </a></td> -->
					<td>
					  <div class="my-2"></div>
                  <a 
                  href= "${contextPath}/admin/vsDelete?vs_num=${vs.vs_num }"  
                  class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-trash"></i>
                    </span>
                    <span class="text">탈퇴</span>
                  </a>                  
                  </td>
				</tr>
			</c:forEach>
                    
                  </tbody>
                </table>

          </div>

        </div>
        <!-- /.container-fluidㅂㅈㄷㅈㅂㄷ ㅂㅈㄷㅂㅈㄷㅈㅂㄷ-->

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



  <!-- Bootstrap core JavaScript-->
  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${contextPath}/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${contextPath}/resources/js/demo/datatables-demo.js"></script>

</body>

</html>

<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>petHotelList</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<div> -->
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<th>ph_num</th> -->
<!-- 				<th>ph_name</th>	 -->
<!-- 				<th>ph_address</th> -->
<!-- 			</tr> -->
<%-- 			<c:forEach items="${phL }" var="ph" > --%>
<!-- 				<tr> -->
<%-- 					<td>${ph.ph_num}</td> --%>
<%-- 					<td><a href="viewPetHotel?ph_num=${ph.ph_num}">${ph.ph_name}</a></td> --%>
<%-- 					<td>${ph.ph_address}</td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table> -->
<!-- 	</div> -->

<!-- </body> -->
<!-- </html> -->