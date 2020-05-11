<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
 .add-on{
	width: 20px;
    height: 20px;
 }
 </style>
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
        <c:forEach var="categorie" items="${categories}" begin="3" end="4" step="1" varStatus="s">
            <tr class="categories">
                <td class="categories text-center text-primary" colspan="5"><c:out value="${categorie.name}" /></td>
            </tr>
            <c:forEach var="product" items="${categorie.products}" begin="3" end="4" step="1" varStatus="s">
                <tr class="rimproducts">
                    <td class="rimproducts">
                        <div class="rimImageBox d-none d-sm-block">
                          <img src="${product.image}" class="rimProductImage img-thumbnail rounded" title="${product.name}" />
                        </div>
                          ${product.name}
                    </td>
                    <td class="rimproducts">
                        <input type="number" name="tax-${product.id}" readonly="readonly" value="${product.tax}" class="quantity form-control form-control-sm text-center">
                    </td>
                    <td class="rimproducts">
                        <input type="number" name="price-${product.id}" readonly="readonly" value="${product.price}" class="quantity form-control form-control-sm text-center">
                    </td>
                    <td class="rimproducts">
                        <input type="button"  class="add-on" οnclick="chgNum(this,'del');" ><i class="icon-minus"></i></input>

                        <input class="text-center" style="width: 30px" id="appendedPrependedInput" disabled="disabled" type="text" value="0">

                        <input type="button" class="add-on" οnclick="chgNum(this,'add');"><i class="icon-plus"></i></input>
                    </td>
                    <td class="rimproducts">
                        <input type="number" name="total-${product.id}" readonly="readonly" value="0.00" class="rimtotal form-control form-control-sm text-center">
                    </td>
                </tr>
            </c:forEach>
         </c:forEach>

            <tr class="products2">
                <td class="rimproducts">&nbsp;</td>
                <td class="rimproducts">&nbsp;</td>
                <td class="rimproducts">&nbsp;</td>
                <td class="rimproducts rim-col-total"><span class="subtotal-text">Total: </span></td>
                <td class="rimproducts rim-col-total"><input type="number" name="subtotal" readonly="readonly" value="0" class="subtotal form-control form-control-sm text-center">
                </td>
            </tr>
        </tbody>
    <script type="text/javascript">


        /** 加减商品数量**/
        function chgNum(obj, opr){
            debugger
            var index=0;
            //  var index= $(obj).parent().find(".text-center").val();
            console.log(index)
            // var index= parseInt($('#appendedPrependedInput').val());

            // var price = $('.price').html().substring(1);
            if(opr=='del'){

                if(index == 0){
                    alert("不能减了！");
                    return ;
                }
                // $("#appendedPrependedInput"+ndid).val(index - 1);
                index = index - 1;
            }else if(opr=='add'){
                if(index == 99){
                    alert('不能加了！');
                    return ;
                }
                // $("#appendedPrependedInput"+ndid).val(index + 1);
                index = index + 1;

            }
            // $('.nums').html(index);
            // $('.total').html(index*price+'元')
        }
    </script>
</table>

