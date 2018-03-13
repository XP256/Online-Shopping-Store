<html>
<#include "../partials/_header.ftl">
<body>
<div class="container ">
    <#include "../partials/_nav.ftl">
    <h1 align="center" class="display-4 mb-5">My Cart</h1>

<#--Cart Detail Table-->
    <table class="table table-striped text-center">
        <thead>
        <tr>
            <th scope="col">Photo</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Subtotal</th>
            <th scope="col">Action</th>

        </tr>
        </thead>
        <tbody>
        <#list items as item>
        <tr>
            <th class="align-middle" scope="row">
                <img height="100px" src="${item.getProductInfo().getProductIcon()}">
            </th>
            <td class="align-middle">${item.getProductInfo().getProductName()}</td>
            <td class="align-middle">${"$" + item.getProductInfo().getProductPrice()}</td>
            <td class="align-middle">
                <a href="/cart/change?product_id=${item.getProductInfo().getProductId()}&quantity=${item.getQuantity()-1}"><i
                        class="fas fa-minus"></i></a>
                <input min="1" id="${item.getProductInfo().getProductId()}"
                       max="${(productInfo.getProductStock())!"1"}" type="text" size="5" value="${item.getQuantity()}"
                       name='count' onkeyup="change(this)">
                <a href="/cart/change?product_id=${item.getProductInfo().getProductId()}&quantity=${item.getQuantity()+1}">
                    <i class="fas fa-plus"></i></a>
            </td>
            <td class="align-middle">${"$" + item.getProductInfo().getProductPrice() * item.getQuantity()}</td>
            <td class="align-middle">
                <a href="/cart/remove?product_id=${item.getProductInfo().getProductId()}">Remove</a>
            </td>

        </tr>
        </#list>
        </tbody>
    </table>

<#--Check Out -->
    <#if items?has_content >
        <div>
            <h5 style="display: inline;">Total: $${total}</h5>
            <a class="btn btn-warning float-right" href="/cart/checkout">Checkout</a>
        </div>
    <#else>
    <#--Empty Cart-->
        <div>
            <h4 class="text-muted text-center">Cart is empty. Go to get something! :)</h4>
        </div>
    </#if>

    <p id="demo"></p>

</div>
</body>
<script>
    var timeout = null;
    function change(element)
    {   clearTimeout(timeout);
        var quantity = element.value;
        var id = element.id;
        var theUrl = "/cart/change?product_id=" + id + "&quantity=" + quantity;
        timeout = setTimeout(function(){location.href = theUrl} , 1000);
    }
</script>
</html>