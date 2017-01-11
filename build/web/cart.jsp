<%-- 
    Document   : cart
    Created on : Oct 25, 2014, 6:22:40 PM
    Author     : Ashley, Yonas, Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet" type="text/css"/>
        <title>Shopping Cart</title>
    </head>

    <body class="background">
            <div class="container">

                <%@include file="includes/header.jsp" %>

                <div class="content">

                    <h1>Your Cart</h1>

                    <%--table border 0 align center put for loop in one column--%>
                    <c:forEach var="LineItem" items="${sessionScope.cart.items}">
                        <form action="CartServlet" method="post">
                            <table border="1" align="center" cellpadding="20" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td width="300px">${LineItem.itemName}</td>
                                        <td width="100px">Discounted price: <fmt:formatNumber type="currency" value="${LineItem.discountedPrice}"/></td>
                                        <td width="100px">Quantity: <input type="text" name="txtQuantity" value="${LineItem.quantity}" style="width: 30px;"/></td>
                                <input type="hidden" name="hidAction" value="update" />
                                <input type="hidden" name="hidSku" value="${LineItem.itemSku}" />
                                <td><input type="submit" name="btnUpdate" value="Update"/> </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                    </c:forEach>

                    <p>Set quantity to 0 to remove item from cart.</p>


                    <%-- yonas: to facilitate the submission for bthUpdate, i've moved btnCheckout into a separate form
                    we'll get the cart details from the session variable.--%>
                    <form action="CheckoutServlet" method="post">
                        <input type="submit" name="btnCheckout" value="Checkout"/>
                    </form>

                    <form action="IndexServlet" method="post">
                        <input type="submit" value="Continue Shopping"/>
                    </form>
                    <!-- end .content --></div>
                    <%@include file="includes/footer.jsp" %>
                <!-- end .container --></div>
    </body>
</html>