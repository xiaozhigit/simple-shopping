<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Multi Product Order Form :: Rimtay Software">
    <meta name="author" content="Rimtay Software">
    <title>Multi Product Order Form :: Rimtay Software</title>
    <!-- Custom fonts for this template-->
    <link href="<%=path%>/static/bootstrap/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/bootstrap/alertify/alertify.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/bootstrap/alertify/themes/default.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<%=path%>/static/bootstrap/admin/css/sb-admin-2.css" rel="stylesheet">

</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=path%>/admin">
                <div class="sidebar-brand-icon">
                    <img src="https://destek.rimtay.com/rimtay/favicon-red.png" class="img-fluid" style="max-width: 50%;" />
                </div>
                <div class="sidebar-brand-text mx-3">RIMTAY</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <li class="nav-item"><a class="nav-link" href="<%=path%>/admin/dashboard" target="mainContent">
                <i class="fas fa-fw fa-tachometer-alt"></i><span>Dashboard</span></a>
            </li>
            <li class="nav-item"><a class="nav-link" href="<%=path%>/orders/list" target="mainContent">
                <i class="fas fa-fw fa-file-alt"></i>
                <span>Orders</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsecategories" aria-expanded="true" aria-controls="collapsecategories">
                    <i class="fas fa-fw fa-boxes"></i><span>Categories</span>
                </a>
                <div id="collapsecategories" class="collapse" aria-labelledby="headingcategories" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded"><h6 class="collapse-header">Categories:</h6>
                        <a class="collapse-item" href="<%=path%>/categories/list" target="mainContent">List All</a>
                        <a class="collapse-item" href="<%=path%>/admin/newAdd?type=category" target="mainContent">Add New</a>
                    </div>
                </div>
            </li>
            <li class="nav-item active">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseproducts" aria-expanded="true" aria-controls="collapseproducts">
                    <i class="fas fa-fw fa-box"></i><span>Products</span></a>
                <div id="collapseproducts" class="collapse" aria-labelledby="headingproducts" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded"><h6 class="collapse-header">Products:</h6>
                        <a class="collapse-item" href="<%=path%>/product/list" target="mainContent">List All</a>
                        <a class="collapse-item" href="<%=path%>/admin/newAdd?type=product">Add New</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsecustom_fields" aria-expanded="true" aria-controls="collapsecustom_fields">
                    <i class="fas fa-fw fa-object-group"></i><span>Custom Fields</span></a>
                <div id="collapsecustom_fields" class="collapse" aria-labelledby="headingcustom_fields" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded"><h6 class="collapse-header">Custom Fields:</h6>
                        <a class="collapse-item" href="<%=path%>/admin/custom_fields">List All</a>
                        <a class="collapse-item" href="<%=path%>/admin/cf">Add New</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=path%>/settings">
                    <i class="fas fa-fw fa-cog"></i><span>Settings</span>
                </a>
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
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static/bootstrap-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${userName}</span>
                                <img class="img-profile rounded-circle"
                                    src="<%=path%>/static/bootstrap/no-img.png">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    {{@LANG_ADMIN_201}}
                                </a>
                            </div>
                        </li>

                    </ul>
                </nav>
                <!-- End of Topbar -->
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">${title}</h1>
                    <p class="mb-4">${description}</p>
                    <iframe id="mainContent" name="mainContent" style="width: 100%;height:600px;border: none;"></iframe>
<%--                    <include href="{{'admin/page/'. @PAGE.href}}">--%>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; 2020 Rimtay Software</span>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{@LANG_ADMIN_43}}</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="{{@LANG_ADMIN_44}}">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">{{@LANG_ADMIN_45}}</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">{{@LANG_ADMIN_46}}</button>
                    <a class="btn btn-primary" href="<%=path%>/logout">{{@LANG_ADMIN_47}}</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<%=path%>/static/bootstrap/jquery-3.4.1.min.js"></script>
    <script src="<%=path%>/static/bootstrap/bootstrap.min.js"></script>
    <script src="<%=path%>/static/bootstrap/alertify.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="<%=path%>/static/bootstrap/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="<%=path%>/static/bootstrap/admin/js/sb-admin-2.min.js"></script>

    <check if="{{@DATATABLE}}">

        <script>
            // Call the dataTables jQuery plugin
            $(document).ready(function () {
                $('#dataTable').DataTable(
					{
						language : {
							"decimal": "",
							"emptyTable": "{{@LANG_ADMIN_DT_1}}",
							"info": "{{@LANG_ADMIN_DT_2}}",
							"infoEmpty": "{{@LANG_ADMIN_DT_3}}",
							"infoFiltered": "{{@LANG_ADMIN_DT_4}}",
							"infoPostFix": "",
							"thousands": ",",
							"lengthMenu": "{{@LANG_ADMIN_DT_5}}",
							"loadingRecords": "{{@LANG_ADMIN_DT_6}}",
							"processing": "{{@LANG_ADMIN_DT_7}}",
							"search": "{{@LANG_ADMIN_DT_8}}",
							"zeroRecords": "{{@LANG_ADMIN_DT_9}}",
							"paginate": {
								"first": "{{@LANG_ADMIN_DT_10}}",
								"last": "{{@LANG_ADMIN_DT_11}}",
								"next": "{{@LANG_ADMIN_DT_12}}",
								"previous": "{{@LANG_ADMIN_DT_13}}"
							},
							"aria": {
								"sortAscending": "{{@LANG_ADMIN_DT_14}}",
								"sortDescending": "{{@LANG_ADMIN_DT_15}}"
							}
						}
					}
				);
            });
        </script>
    </check>
    <script>
        $(function () {
            var mainContent = document.getElementById('mainContent');
            <!-- 指定所展示url -->
            mainContent.src = "<%=path%>/admin/dashboard";
        });
	</script>
</body>

</html>