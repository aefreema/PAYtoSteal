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
                            <td><image src="images/iphone.jpg" width="75" height= "75"></td>
                            <td class="label">Textbook</td>
                            <td class='label'>Price: $<%= request.getParameter("price1")%> <input type='hidden' value='<%= request.getParameter("price1")%>' name='price1'/></td>
                            <td class="label">Quantity:<input type="text" value=<%= firstItem %> name="item1" autocomplete="off"/></td>
                        <%}
                        else { %>
                            <input type="hidden" value="0" name="item1"/>
                            <input type="hidden" value="0" name="price1"/>
                        <%}%>
                    </tr>
                    <tr>
                        <% if (!(secondItem.equals("0"))) { %>
                            <td><image src="images/textbook.jpg" width="75" height= "75"></td>
                            <td class="label">Textbook</td>
                            <td class='label'>Price: $<%= request.getParameter("price2")%> <input type='hidden' value='<%= request.getParameter("price2")%>' name='price2'/></td>
                            <td class="label">Quantity:<input type="text" value=<%= secondItem %> name="item2" autocomplete="off"/></td>
                        <%}
                        else { %>
                            <input type="hidden" value="0" name="item2"/>
                            <input type="hidden" value="0" name="price2"/>
                        <%}%>
                    </tr>
                    <tr>
                        <% if (!(thirdItem.equals("0"))) { %>
                            <td><image src="images/fan.jpg" width="75" height="75"></td>
                            <td class="label">Desk Fan</td>
                            <td class='label'>Price: $<%= request.getParameter("price3")%> <input type='hidden' value='<%= request.getParameter("price3")%>' name='price3'/></td>
                            <td class="label">Quantity:<input type="text" value=<%= thirdItem %> name="item3" autocomplete="off"></td>
                        <%}
                        else { %>
                            <input type="hidden" value="0" name="item3"/>
                            <input type="hidden" value="0" name="price3"/>
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
