<%-- 
    Document   : cart
    Created on : Oct 25, 2014, 6:22:40 PM
    Author     : Ashley, Yonas, Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet" type="text/css"/>
        <title>Shopping Cart</title>
    </head>
    <body>
        <% 
            String firstItem = request.getParameter("item1");
            firstItem = firstItem == null ? "0" : firstItem;
            
            String secondItem = request.getParameter("item2");
            secondItem = secondItem == null ? "0" : secondItem;
            
            String thirdItem = request.getParameter("item3");
            thirdItem = thirdItem == null ? "0" : thirdItem;
        %>
        <h1>Your Cart</h1>
        <form action="checkout.jsp" method="post">
            <table cellspacing="0" cellpadding="20" border="1">
                <tbody>
                    <tr>
                        <% if (!(firstItem.equals("0"))) { %>
                            <td><image src="images/spaceman.jpg" width="50" height="50"></td>
                            <td class="label">Space Man</td>
                            <td class="label">Quantity:<input type="text" value=<%= firstItem %> name="item1" autocomplete="off"/></td>
                        <%}%>
                    </tr>
                    <tr>
                        <% if (!(secondItem.equals("0"))) { %>
                            <td><image src="images/nikesymbol.jpg" width="50" height="50"></td>
                            <td class="label">Nike Symbol</td>
                            <td class="label">Quantity:<input type="text" value=<%= secondItem %> name="item2" autocomplete="off"/></td>
                        <%}%>
                    </tr>
                    <tr>
                        <% if (!(thirdItem.equals("0"))) { %>
                            <td><image src="images/shape.jpg" width="50" height="50"></td>
                            <td class="label">Diamond</td>
                            <td class="label">Quantity:<input type="text" value=<%= thirdItem %> name="item3" autocomplete="off"></td>
                        <%}%>
                    </tr>
                </tbody>
            </table>
            <br><input type="submit" value="Checkout"/>
        </form>
        <form action="index.jsp" method="post">
            <tr>
                <td><br><input type="button" value="Continue Shopping" onclick="form.submit()"/></td>
            </tr>
        </form>
    </body>
</html>
