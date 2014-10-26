<%-- 
    Document   : index
    Created on : Oct 25, 2014, 6:22:20 PM
    Author     : Ashley, Yonas, Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet"> 
        <title>Item Page</title>
    </head>
    <body>
        <h1>Pick an item to add to your cart</h1>
        <form action="cart.jsp" method="post">
            <table cellspacing="0" cellpadding="20" border="1">
                <tbody>
                    <tr>
                        <td><image src="images/spaceman.jpg" width="50" height="50"></td>
                        <td class="label">Space Man</td>
                        <td class="label">Quantity:<input type="text" value="0" name="item1" autocomplete="off"/></td>
                    </tr>
                    <tr>
                        <td><image src="images/nikesymbol.jpg" width="50" height="50"></td>
                        <td class="label">Nike Symbol</td>
                        <td class="label">Quantity:<input type="text" value="0" name="item2" autocomplete="off"/></td>
                    </tr>
                    <tr>
                        <td><image src="images/shape.jpg" width="50" height="50"></td>
                        <td class="label">Diamond</td>
                        <td class="label">Quantity:<input type="text" value="0" name="item3" autocomplete="off"/></td>
                    </tr>
                </tbody>
            </table>
            <br><input type="submit" value="Add to Cart"/>
        </form>
    </body>
</html>
