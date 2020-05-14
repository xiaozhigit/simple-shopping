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
    <link href="<%=path%>/static/bootstrap/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/bootstrap/alertify/alertify.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/bootstrap/alertify/themes/default.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="<%=path%>/static/bootstrap/admin/css/sb-admin-2.css" rel="stylesheet">
</head>
<body>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">${TABLE_NAME}</h6>
    </div>
    <div class="card-body">
        ${MESSAGE==null?"":MESSAGE}
        <div class="table-responsive">
            <div id="dataTable_wrapper"  class="dataTables_wrapper dt-bootstrap4">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <div class="dataTables_length" id="dataTable_length">
                            <label>Show <select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select> entries</label>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <div id="dataTable_filter" class="dataTables_filter">
                            <label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable"></label>
                        </div>
                    </div>
                </div>
                <div  class="row">
                    <div class="col-sm-12">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <c:forEach var="COLUMN" items="${COLUMNS}"  varStatus="s">
                                        <th><c:out value="${COLUMN}" /></th>
                                    </c:forEach>
                                    <th>
                                        Actions
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="RECORD" items="${RECORDS}"  varStatus="s">
                                <tr>
                                    <td> <c:out value="${RECORD.id}"/></td>
                                    <c:forEach var="DATA" items="${RECORD.data}"  varStatus="s">
                                        <td> <c:out value="${DATA}"/></td>
                                    </c:forEach>
                                    <td>
                                        <a href="<%=path%>/${TABLE_NAME}/edit?id=${RECORD.id}" title="edit" target="_self">
                                            <i class="fas fa-edit fa-fw"></i></a>
                                        </a>
                                        <c:if test="${TABLE_NAME=='orders'}">
                                            <a href="<%=path%>/${TABLE_NAME}/view_orderItem?id=${RECORD.id}" title="edit" target="_self">
                                                查看订单项
                                            </a>
                                        </c:if>
                                        <a  onclick="removeConfirm(${RECORD.id});"  title="delete">
                                            <i class="fas fa-trash-alt fa-fw"></i></a>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-5">
                        <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing ${pageInfo.pageSize} to ${pageInfo.total} of ${pageInfo.pages} entries</div>
                    </div>
                    <div class="col-sm-12 col-md-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                        <ul class="pagination">
                            <li class="paginate_button page-item previous disabled" id="dataTable_previous">
                                <a href="<%=path%>/${TABLE_NAME}/list?page=${pageInfo.pageNum-1}&size=10" target="_self" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                            </li>
                            <li class="paginate_button page-item active">
                                <a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${pageInfo.pageNum}</a>
                            </li>
                            <li class="paginate_button page-item next disabled" id="dataTable_next">
                                <a href="<%=path%>/${TABLE_NAME}/list?page=${pageInfo.pageNum+1}&size=10" target="_self" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">Next</a>
                            </li>
                        </ul>
                    </div>
                    </div>
                </div>
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
<script>

    function removeConfirm(id){
        alertify.confirm("Delete Confirm?", "Do you confirm to delete this record?",
            function () {
                $.ajax({
                    url:"<%=path%>/${TABLE_NAME}/delete?id="+id,
                    success:function(data){
                        debugger
                        if(data.code==200){
                            alertify.success("succeeded");
                            window.location.href="<%=path%>/${TABLE_NAME}/list";
                        }
                    },
                    error:function(e){
                        alertify.error(e);
                    }
                })
            },
            function () {
                alertify.error('Delete Error');
            });
    }
</script>
</body>
</html>