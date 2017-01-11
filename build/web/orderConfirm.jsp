<%-- 
    Document   : orderConfirm
    Created on : Nov 20, 2014, 9:21:20 PM
    Author     : Ashley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet" type="text/css"/>
        <title>Order Confirm</title>
    </head>
    <body class="background">
        <div class="container">

        <div class="header"><a href="IndexServlet"><img src="images/StoreLogo.png" alt="Store Logo Here" name="Store_logo" width="342" height="123" id="Store_logo" style="background: #FFF; display:block;" /></a>
        <!-- end .header --></div> 
        
        <div class="content">
            
        <h1>Your order has been placed!</h1>
        <p>Thank you for shopping with us!</p>
        <p>${requestScope.emailConfirmation}</p>
        <div class='theEnd'>
            <h1>Now Leave</h1>
            <img src="images/noThief.gif" name="thEnd" width="342" />
            
        </div>
        
   <!-- end .content --></div>
                    <%@include file="includes/footer.jsp" %>
                <!-- end .container --></div>
    </body>
</html>