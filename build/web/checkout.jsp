<%-- 
    Document   : checkout
    Created on : Oct 25, 2014, 6:24:01 PM
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
        <title>Checkout Page</title>
       
        <script>
            function isNumber(n) {
                return !isNaN(parseFloat(n)) && isFinite(n);
            }
            
            function validate(form){
                console.log("In validate");
                var status = true;
                var numStat = true;
                var codStat = true;
                if (form.name.value === "") {
                    document.getElementById("nameError").innerHTML = "Field Empty";
                    status = false;
                }
                else {
                    document.getElementById("nameError").innerHTML = "";
                }
                if (form.num.value === "") {
                    document.getElementById("numError").innerHTML = "Field Empty";
                    status = false;
                    numStat = false;
                }
                else {
                    document.getElementById("numError").innerHTML = "";
                }
                if (!isNumber(form.num.value) && numStat) {
                    document.getElementById("numNANError").innerHTML = "Number Required";
                    status = false;
                    numStat = false;
                }
                else {
                    document.getElementById("numNANError").innerHTML = "";
                }
                if (form.num.value.length !== 16 && numStat) {
                    document.getElementById("numAmError").innerHTML = "16-digit Number Required";
                    status = false;
                }
                else {
                    document.getElementById("numAmError").innerHTML = "";
                }
                if (form.code.value === "") {
                    document.getElementById("codeError").innerHTML = "Field Empty";
                    status = false;
                    codStat = false;
                }
                else {
                    document.getElementById("codeError").innerHTML = "";
                }
                if (!isNumber(form.code.value) && codStat) {
                    document.getElementById("codeNANError").innerHTML = "Number Required";
                    status = false;
                }
                else {
                    document.getElementById("codeNANError").innerHTML = "";
                }
                if (status) {
                    form.submit();
                }
            }
        </script>
    </head>
    <body class="background">
        <div class="container">
         <div class="background">
            <div class="container">

                <%@include file="includes/header.jsp" %>

                <div class="content">
            <h1>Checkout</h1>
            
            <p>Your total is: <fmt:formatNumber type="currency" value="${sessionScope.cart.totalAmount}"/></p>
            
            <table border="1" align="center" cellpadding="20" cellspacing="0">
                <tbody>
                    <c:forEach var="LineItem" items="${sessionScope.cart.items}">
                    <tr>
                        <td>${LineItem.itemName}</td>
                        <td>Discounted price: <fmt:formatNumber type="currency" value="${LineItem.discountedPrice}"/></td>
                        <td>Quantity: ${LineItem.quantity}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <p>Enter payment information:</p>
         
            First name: ${sessionScope.customer.firstName}<br>
            Last name: ${sessionScope.customer.lastName}<br><br>
            Order number: ${sessionScope.cart.orderNumber}<br>
            Order date: ${sessionScope.cart.orderDate}<br>
            
            <form action="PaymentServlet" method="post">
                <table>
                    <tbody>
                        <tr>
                            <td><img src="images/cards.png" width="168" height="25"/></td>
                        </tr>
                        <tr>
                            <td>Name on Card:</td>
                            <td><input type="text" name="name" autocomplete="off"/></td>
                            <td> <span id="nameError" class="error"></span></td>
                        </tr>
                        <tr>
                            <td>Card Number:</td>
                            <td><input type="text" name="num" autocomplete="off"/></td>
                            <td> <span id="numError" class="error"></span></td>
                            <td> <span id="numNANError" class="error"></span></td>
                            <td> <span id="numAmError" class="error"></span></td>
                        </tr>
                        <tr>
                            <td>Security Code:</td>
                            <td><input type="text" name="code" autocomplete="off"/></td>
                            <td> <span id="codeError" class="error"></span></td>
                            <td> <span id="codeNANError" class="error"></span></td>
                        </tr>
                    </tbody>
                </table>
               
                <input type="button" value="Place Order" onclick="validate(this.form)"/>
            </form>
            
   <!-- end .content --></div>
                    <%@include file="includes/footer.jsp" %>
                <!-- end .container --></div>
            <!-- end background --></div> 
        </div>
</html>