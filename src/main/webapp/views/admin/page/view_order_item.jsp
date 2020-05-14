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
    <link href="<%=path%>/static/bootstrap/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/bootstrap/alertify/alertify.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/bootstrap/alertify/themes/default.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="<%=path%>/static/bootstrap/admin/css/sb-admin-2.css" rel="stylesheet">

</head>
<body>
<div class="row">
    <div class="col-md-12">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">${title}</h6>
            </div>
            <div class="card-body">
                ${MESSAGE==null?"":MESSAGE}
                    <c:if test="${order!=null}">
                        <c:if test="${order.orderItems!=null}">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <tr>
                                <td>OrderItemId</td><td>OrderId</td><td>productId</td> <td>productName</td><td>quantity</td>
                                <td>price</td><td>tax</td><td>subTotal</td><td>totalTax</td><td>total</td><td>ACTION</td>
                                </tr>
                                <c:forEach var="orderItem" items="${order.orderItems}">
                                    <tr>
                                        <td>${orderItem.id}</td><td>${orderItem.orderid}</td> <td>${orderItem.productId}</td>
                                        <td>${orderItem.productName}</td><td>${orderItem.quantity}</td><td>${orderItem.price}</td>
                                        <td>${orderItem.tax}</td><td>${orderItem.subTotal}</td><td>${orderItem.totalTax}</td>
                                        <td>${orderItem.total}</td>
                                        <td>
                                            <a href="<%=path%>/${TABLE_NAME}/edit_order_item?id=${orderItem.id}" title="edit" target="_self">
                                                <i class="fas fa-edit fa-fw"></i></a>
                                            </a>
                                            <a  onclick="removeConfirm(${orderItem.id});"  title="delete">
                                                <i class="fas fa-trash-alt fa-fw"></i></a>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>

                        </c:if>
                    </c:if>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/bootstrap/alertify.min.js"></script>
<script>
    function removeConfirm(id){
        alertify.confirm("Delete Confirm?", "Do you confirm to delete this record?",
            function () {
                $.ajax({
                    url:"<%=path%>/${TABLE_NAME}/deleteOrderItem?id="+id,
                    success:function(data){
                        debugger
                        if(data.code==200){
                            alertify.success("succeeded");
                            window.location.href="<%=path%>/${TABLE_NAME}/view_orderItem?id=${order.id}";
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