<%-- 
    Document   : productsPg
    Created on : Nov 20, 2014, 8:51:03 PM
    Author     : Ashley, Yonas, Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet" type="text/css"/>
        <title>${requestScope.item.itemName}</title>
    </head>
    <body class="background">
            <div class="container">

                <%@include file="includes/header.jsp" %>

                <div class="content">
        
        <h1>${requestScope.item.itemName}</h1>
        <form action="CartServlet" method="post">
            <table>
                <tbody>
                    <tr>
                        <td><image src="images/${requestScope.item.imgSrc}" width="200" height="200"></td>
                    </tr>
                    <tr>
                        <td>Price: <s><fmt:formatNumber type="currency" value="${requestScope.item.price}"/></s></td>
                    </tr>
                    <tr>
                        <td> Discount: <fmt:formatNumber type="percent" value="${requestScope.item.discount/100}"/></td>
                    </tr>
                    <tr>
                        <td>Discounted price: <fmt:formatNumber type="currency" value="${requestScope.item.discountedPrice}"/></td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td>Description:</td>
                    </tr>
                    <tr>
                        <td>${requestScope.item.description}</td>
                        <input type="hidden" name="hidSku" value="${item.sku}"/>
                        <input type="hidden" name="hidItemName" value="${item.itemName}"/>
                        <input type="hidden" name="hidItemPrice" value="${item.price}"/>
                        <input type="hidden" name="hidAction" value="add"/>
                    </tr>
                </tbody>
            </table>
            <br><input type="submit" value="Add to Cart"/>
        </form>
                    
           <!-- end .content --></div>
                    <%@include file="includes/footer.jsp" %>
                <!-- end .container --></div>
    </body>
</html>