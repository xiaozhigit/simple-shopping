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
    <link href="<%=path%>/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="<%=path%>/static/bootstrap/admin/css/sb-admin-2.css" rel="stylesheet">

</head>
<body>
<div class="row">
    <div class="col-md-6">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">${title}</h6>
            </div>
            <div class="card-body">
                ${MESSAGE==null?"":MESSAGE}
                <form  method="post" id="form" enctype="multipart/form-data" onsubmit="return false">

                    <c:if test="${order!=null}">
                        <div class="form-group">
                        <input  type="hidden" name="id" value="${order.id}">
                        <label><strong>Order Status</strong></label>
                        <select class="form-control"   name="orderNotes" id="orderNotes">
                            <option ${order.orderNotes=="1"?"selected":''}  value="1">Paid</option>
                            <option ${order.orderNotes=="0"?"selected":''}  value="0">Unpaid</option>
                            <option ${order.orderNotes=="-1"?"selected":''}  value="-1">Cancelled</option>
                        </select>
                        </div>
                        <div class="form-group">
                        <label><strong>Order Total</strong></label>
                        <input type="number" name="total"  value="${order.total}" class="form-control">
                        </div>
                        <div class="form-group">
                        <label><strong>Order Taxes</strong></label>
                        <input type="number" name="taxes" value="${order.taxes}" class="form-control">
                        </div>
                        <div class="form-group">
                        <label><strong>Customer Name</strong></label>
                        <input type="text" name="name" value="${order.name}" class="form-control">
                        </div>
                        <div class="form-group">
                        <label><strong>Customer E-Mail</strong></label>
                        <input type="email" name="email" value="${order.email}" class="form-control">
                        </div>
                        <div class="form-group">
                        <label><strong>Customer Company</strong></label>
                        <input type="text" name="company" value="${order.company}" class="form-control">
                        </div>
                        <div class="form-group">
                        <label><strong>Order Address</strong></label>
                        <input type="text" name="address" value="${order.address}" class="form-control">
                        </div>
                        <div class="form-group">
                        <label><strong>Order Notes</strong></label>
                        <textarea  name="orderNotes" class="form-control" rows="3">${order.orderNotes}</textarea>
                        </div>
                        <div class="form-group">
                        <label><strong>Order Time</strong></label>
                        <input type="text" name="createTime" value="${order.createTime}" class="form-control">
                        </div>
                    </c:if>
                    <c:if test="${product!=null}">
                        <div class="form-group">
                        <input  type="hidden" name="id" value="${product.id}">
                        <label><strong>Category</strong></label>
                        <select class="form-control"   name="category" id="category">
                            <c:forEach items="${categories}" var="category">
                                <option ${product.category==category.id?"selected":''}  value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                        </div>
                        <div class="form-group">
                        <label><strong>Product Name</strong></label>
                        <input type="text" name="name" class="form-control" value="${product.name}">
                        </div>
                        <div class="form-group">
                        <label><strong>Producer</strong></label>
                        <input type="text" name="producer" class="form-control" value="${product.producer}">
                        </div>
                        <div class="form-group">
                        <label><strong>Product Image</strong></label>
                            <img src="<%=path%>/${product.image}" style="width:60px;height:60px" id="product_image" >
                            <input type="hidden" name="image"  value="${product.image}" >
                            <button type="button" class="layui-btn" id="test1">上传图片</button>
                        </div>
                        <div class="form-group">
                        <label><strong>Product Price</strong></label>
                        <input type="number" name="price" class="form-control" value="${product.price}">
                        </div>
                        <div class="form-group">
                        <label><strong>Product Tax</strong></label>
                        <input type="number" name="tax" class="form-control" value="${product.tax}">
                        </div>
                        <div class="form-group">
                        <label><strong>Product Status</strong></label>
                        <select class="form-control"   name="active" >
                                <option ${product.active=="Y"?"selected":''}  value="Y">Active</option>
                                <option ${product.active=="N"?"selected":''}  value="N">Passive</option>
                        </select>
                        </div>
                    </c:if>
                    <c:if test="${category!=null}">
                        <div class="form-group">
                        <input  type="hidden" name="id" value="${category.id}"/>
                        <label><strong>Category Name</strong></label>
                        <input type="text" name="name" class="form-control" value="${category.name}"/>
                        </div>
                        <div class="form-group">
                        <label><strong>Category Status</strong></label>
                        <select class="form-control"   name="active" id="active">
                            <option ${category.active=="Y"?"selected":''}  value="Y">Active</option>
                            <option ${category.active=="N"?"selected":''}  value="N">Passive</option>
                        </select>
                         </div>
                    </c:if>
                    <c:if test="${orderItem!=null}">
                        <div class="form-group">
                            <input  type="hidden" name="id" value="${orderItem.id}"/>
                            <label><strong>OrderId</strong></label>
                            <input type="text" readonly="readonly" class="form-control" value="${orderItem.orderid}"/>
                        </div>
                        <div class="form-group">
                            <label><strong>ProductName</strong></label>
                            <input type="text" readonly="readonly" class="form-control" value="${orderItem.productName}"/>
                        </div>
                        <div class="form-group">
                            <label><strong>Price</strong></label>
                            <input type="text" readonly="readonly" name="price" class="form-control" value="${orderItem.price}"/>
                        </div>
                        <div class="form-group">
                            <label><strong>Quantity</strong></label>
                            <input type="text" name="quantity" class="form-control" onchange="changeQuantity(this)" value="${orderItem.quantity}"/>
                        </div>
                        <div class="form-group">
                            <label><strong>Tax</strong></label>
                            <input type="text" name="tax" class="form-control" value="${orderItem.tax}"/>
                        </div>
                        <div class="form-group">
                            <label><strong>SubTotal</strong></label>
                            <input type="text" name="subTotal" class="form-control" value="${orderItem.subTotal}"/>
                        </div>
                        <div class="form-group">
                            <label><strong>TotalTax</strong></label>
                            <input type="text" name="totalTax" class="form-control" value="${orderItem.totalTax}"/>
                        </div>
                        <div class="form-group">
                            <label><strong>Total</strong></label>
                            <input type="text" name="total" class="form-control" value="${orderItem.total}"/>
                        </div>
                    </c:if>

                    <button class="btn btn-success btn-block" onclick="updateData()">Edit Record</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/bootstrap/alertify.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/bootstrap/ea_order.js"></script>
<script>
    layui.use('upload', function(){
        var $ = layui.jquery
        ,upload = layui.upload;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '<%=path%>/admin/upload'
            ,accept:'images'
            ,done: function(res){
                //如果上传失败
                if(res.code ==200){
                    $("input[name='image']").val(res.data);
                    $("#product_image").attr("src", "<%=path%>/"+res.data);
                }
            }
            ,error: function(e){
                alert(e)
            }
        });
    });

    function updateData() {
        let url="<%=path%>/${TABLE_NAME}/update";

        if(${orderItem!=null}){
            url="<%=path%>/${TABLE_NAME}/updateOrderItem";
        }

        $.ajax({
            url:url,
            type:"post",
            data:new FormData(document.getElementById("form")),
            processData:false,
            contentType:false,
            success:function(data){
                if(data.code==200){
                    alertify.success("succeeded");

                    if(${orderItem!=null}){
                        window.location.href="<%=path%>/${TABLE_NAME}/view_orderItem?id=${orderItem.orderid}";
                    }else{
                        window.location.href="<%=path%>/${TABLE_NAME}/list";
                    }
                }
            },
            error:function(e){
                alertify.error(e);
            }
        });
    }
    //订单项数量改变同步变订单项总金额
    function changeQuantity(obj) {
        debugger
        let quantity=$(obj).val();
       let price=$("input[name=price]").val();
        $("input[name=subTotal]").val(floatMul(quantity,price));
    }
</script>
</body>
</html>