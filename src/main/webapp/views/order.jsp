<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<!--
        Multi Product Order Form v2.7

		Coder	: Evrim Altay KOLUACIK
		Help	: https://support.rimtay.com/
		
        All rights are reserved
        Purchase The Script And Start Using Today: https://git.rimtay.com/index.php?id=11
-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="<%=path%>/static/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/bootstrap/lightbox.min.css">
    <link rel="stylesheet" href="<%=path%>/static/bootstrap/style.css?v=44">
    <link rel="stylesheet" href="<%=path%>/static/css/iconfont.css?v=44">

    <link rel="apple-touch-icon" sizes="57x57" href="<%=path%>/static/bootstrapfavicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<%=path%>/static/bootstrap/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<%=path%>/static/bootstrap/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<%=path%>/static/bootstrap/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<%=path%>/static/bootstrap/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<%=path%>/static/bootstrap/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="<%=path%>/static/bootstrap/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<%=path%>/static/bootstrap/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<%=path%>/static/bootstrap/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="<%=path%>/static/bootstrap/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<%=path%>/static/bootstrap/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="<%=path%>/static/bootstrap/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<%=path%>/static/bootstrap/favicon/favicon-16x16.png">
    <link rel="manifest" href="<%=path%>/static/bootstrap/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="<%=path%>/static/bootstrap/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
</head>

<body>
    <form  method="post" οnsubmit="return false;">
        <div class="container-fluid mt-5">
            <div class="row justify-content-center">
                <div class="col-12 col-md-12 col-lg-8 mb-5">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Products</h5>
                            <table class="table table-sm">
                                <thead>
                                <tr class="rimproducts">
                                    <th class="rimproducts rim-col-product"><strong> Product Name</strong></th>
                                    <th class="rimproducts rim-col-tax-price"><strong> Tax (%)</strong></th>
                                    <th class="rimproducts rim-col-quantity"><strong>Single Price ($)</strong></th>
                                    <th class="rimproducts rim-col-tax-price"><strong>	Quantity</strong></th>
                                    <th class="rimproducts rim-col-total"><strong> Total</strong></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="categorie" items="${categories}"  varStatus="s">
                                    <tr class="categories">
                                        <td class="categories text-center text-primary" colspan="5"><c:out value="${categorie.name}" /></td>
                                    </tr>
                                    <c:forEach var="product" items="${categorie.products}"  varStatus="s">
                                        <tr class="rimproducts">
                                            <td class="rimproducts">
                                                <div class="rimImageBox d-none d-sm-block">
                                                    <img src="${product.image}" class="rimProductImage img-thumbnail rounded"  style="width:60px;height:60px" title="${product.name}" />
                                                </div>
                                                    ${product.name}
                                            </td>
                                            <td class="rimproducts">
                                                <input type="number" name="tax-${product.id}"  id="tax-${product.id}" readonly="readonly" value="${product.tax}" class="quantity form-control form-control-sm text-center">
                                            </td>
                                            <td class="rimproducts">
                                                <input type="number" name="price-${product.id}"  id="price-${product.id}" readonly="readonly" value="${product.price}" class="quantity form-control form-control-sm text-center">
                                            </td>
                                            <td class="rimproducts">
                                                <span class="iconfont icon-iconless"  onclick="chgNum(this,'del',${product.id})" style="visibility: hidden;" ></span>
                                                <input class="text-center product-number" style="width: 30px"  name="quantity-${product.id}" disabled="disabled" type="text" value="0">
                                                <span class="iconfont icon-add" onclick="chgNum(this,'add',${product.id})"></span>
                                            </td>
                                            <td class="rimproducts">
                                                <input type="number" name="total-${product.id}"  id="total-${product.id}" readonly="readonly" value="0.00" class="rimtotal form-control form-control-sm text-center item-total">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:forEach>

                                <tr class="products2">
                                    <td class="rimproducts">&nbsp;</td>
                                    <td class="rimproducts">&nbsp;</td>
                                    <td class="rimproducts">&nbsp;</td>
                                    <td class="rimproducts rim-col-total"><span class="subtotal-text">Total: </span></td>
                                    <td class="rimproducts rim-col-total"><input type="number" id="totalPrice" name="subtotal" readonly="readonly" value="0" class="subtotal form-control form-control-sm text-center">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-12 col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Order Informations</h5>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" value="" name="name" id="name" placeholder="Please Enter Your Name">
                            </div>
                            
                            <div class="form-group">
                                <label for="email">E-Mail</label>
                                <input type="email" class="form-control" value=""  name="email" id="email" placeholder="Please Enter Your E-Mail Address">
                            </div>
                            
                            <div class="form-group">
                                <label for="buyer">Company</label>
                                <input type="text" class="form-control" value="" name="Company" id="Company" placeholder="Please Enter Your Company">
                            </div>
                            
                            <div class="form-group">
                                <label for="dealer-phone">Phone</label>
                                <input type="tel" class="form-control" value=""  name="dealer-phone" id="dealer-phone" placeholder="Please Enter Your Phone Number">
                            </div>
                            
                            <div class="form-group">
                                <label for="shipping-option">Shipping Option</label>
                                <select id="shipping-option" name="shipping-option" class="custom-select">
                                    <option value="Ground" >Ground</option>
                                    <option value="NextDayPriority" >NextDayPriority</option>
                                    <option value="NextDayStandart" >NextDayStandart</option>
                                    <option value="2Days" >2 Days Later</option>
                                    <option value="3Days" >3 Days Later</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="notes">Order Notes</label>
                                <textarea class="form-control"  name="notes" placeholder="You can write your notes here." id="notes"
                                    rows="3"></textarea>
							</div>
                            <button onclick="submitData()" class="btn btn-primary btn-lg btn-block">Send the Order</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
 <script type="text/javascript" src="<%=path%>/static/bootstrap/ea_order.js"></script>
    <script src="<%=path%>/static/bootstrap/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        var yEdition=false;
        //提交订单
       function submitData(){
          if($("input[name=subtotal]").val()<80){
              alert("订单总金额小于80,不能提交订单");
              return
          }
           debugger;
           let goods=[];
           $(".product-number").each(function () {
              let goodsNum=parseInt($(this).val());
              if(goodsNum>0){
                  let goodsId=$(this).attr("id").substring(7);
                  let price=$(this).parent().parent().find("#price-"+goodsId).val();
                  let tax=$(this).parent().parent().find("#tax-"+goodsId).val();
                  let subTotal=floatMul(price,goodsNum);
                  let totalTax=floatMul(subTotal,tax);
                  goods.push({productId:parseInt(goodsId),quantity:goodsNum,price:price,tax:tax,
                      subTotal:subTotal,totalTax:totalTax,total:floatAdd(subTotal,totalTax)})
              }
           });
           console.log(goods);
           let totalTaxes=0;
           if(goods.length<=0){
               alert("Please select at least one item");
               return;
           }else{
               for(let k=0;k<goods.length;k++){
                   totalTaxes=floatAdd(totalTaxes,goods[k].totalTax);
               }
           }
           //表单信息校验
           validateFrom();
          let data={name:$("#name").val(),email:$("#email").val(),company:$("#Company").val(),phone:$("#dealer-phone").val(),
               shippingOption:$("#shipping-option").val(),orderNotes:$("#notes").val(),
              taxes: totalTaxes,total:$("#totalPrice").val(),orderItems:goods};

           $.ajax({
               type: "POST",//方法类型
               url:  "<%=path%>/orders/add",
               async: false,
               data: JSON.stringify(data),
               contentType:"application/json",
               success: function (result) {
                   if(result.code==200){
                      window.open("/orders/detail?id="+result.data);
                   }
               },
               error : function(response) {
                   console.log(response)
               }
           });
           return false;
        }

        /** 加减商品数量**/
        function chgNum(obj, opr,id){
            //debugger
            let numberObj=$(obj).parent().find(".text-center");
            let cureentNumber= parseInt($(numberObj).val());
            //console.log(cureentNumber);

            if(opr=='del'){
                if(cureentNumber == 0){
                    alert("不能减了！");
                    return ;
                }
                $(numberObj).val(cureentNumber - 1);
                cureentNumber = cureentNumber - 1;
                getPrice(id);
            }else if(opr=='add'){
                if(cureentNumber == 99){
                    alert('不能加了！');
                    return ;
                }
                $(numberObj).val(cureentNumber + 1);
                cureentNumber = cureentNumber + 1;
                getPrice(id);
            }
            if(cureentNumber>0){
                $(obj).parent().find(".icon-iconless").css('visibility','visible');
                $(obj).parent().parent().addClass("tr_back_color")
            }else{
                $(obj).parent().find(".icon-iconless").css('visibility','hidden');
                $(obj).parent().parent().removeClass("tr_back_color");
            }
        }


        // /** 加减商品数量**/
        // function chgNum(obj, opr,id){
        //    // debugger
        //     let numberObj=$(obj).parent().find(".text-center");
        //     let cureentNumber= parseInt($(numberObj).val());
        //     //console.log(cureentNumber);
        //
        //      let price = $("#price-"+id).val();
        //     if(opr=='del'){
        //         if(cureentNumber == 0){
        //             alert("不能减了！");
        //             return ;
        //         }
        //          $(numberObj).val(cureentNumber - 1);
        //         cureentNumber = cureentNumber - 1;
        //     }else if(opr=='add'){
        //         if(cureentNumber == 99){
        //             alert('不能加了！');
        //             return ;
        //         }
        //          $(numberObj).val(cureentNumber + 1);
        //         cureentNumber = cureentNumber + 1;
        //     }
        //         let itemTotal=cureentNumber*price;
        //      $("#total-"+id).val(itemTotal.toFixed(2));
        //     //item-total
        //     let totalPrice=0.00;
        //     $(".item-total").each(function () {
        //         totalPrice+=parseFloat($(this).val());
        //     });
        //     $("#totalPrice").val(totalPrice.toFixed(2));
        // }
        //校验表单信息
        function validateFrom() {
            if($("#name").val()==""){
                alert("Pls fill your name in");
                $("#name").focus();
                return false;
            }
            if($("#email").val()==""){
                alert("Pls fill your email in");
                $("#email").focus();
                return false;
            }
            if($("#dealer-phone").val()==""){
                alert("Pls fill your phone in");
                $("#dealer-phone").focus();
                return false;
            }
        }
    </script>
    <script src="<%=path%>/static/bootstrap/lightbox.min.js"></script>
    <script src="<%=path%>/static/bootstrap/bootstrap.min.js"></script>

</body>
</html>