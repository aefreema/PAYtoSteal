<%-- 
    Document   : products
    Created on : Oct 25, 2014, 6:22:20 PM
    Author     : Ashley, Yonas, Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet" type="text/css"/>
        <title>Item Page</title>
        
        <% 
            int itemListLimit = Integer.parseInt(request.getParameter("txtNumber"));
            
            //3 is the maximum available items we've currently.
            String[] item = new String[3];
            item[0] = "<tr>"
                        + "<td><image src='images/spaceman.jpg' width='50' height='50'></td>"
                        + "<td class='label'>Space Man</td>"
                        + "<td class='label'>Quantity:<input type='text' value='0' name='item1' autocomplete='off'/></td>"
                    + "</tr>";
            item[1] = "<tr>"
                        + "<td><image src='images/nikesymbol.jpg' width='50' height='50'></td>"
                        + "<td class='label'>Nike Symbol</td>"
                        + "<td class='label'>Quantity:<input type='text' value='0' name='item2' autocomplete='off'/></td>"
                    + "</tr>";
            item[2] = "<tr>"
                        + "<td><image src='images/shape.jpg' width='50' height='50'></td>"
                        + "<td class='label'>Diamond</td>"
                        + "<td class='label'>Quantity:<input type='text' value='0' name='item3' autocomplete='off'/></td>"
                    + "</tr>";
        %>
        
    </head>
    <body>
        <h1>Pick an item to add to your cart</h1>
        <form action="cart.jsp" method="post">
            <table cellspacing="0" cellpadding="20" border="1">
                <tbody>
                    <%
                        //now display products per the list limit submitted from
                        //index page.
                        //itemListLimit can not be greater than the number of 
                        //products we've so. if itemListLimit is larger than item[]
                        //take the size of the item[] array.
                        //and show a message to the customer.
                        String msg = "";
                        if(itemListLimit > item.length)
                        {
                            itemListLimit = item.length;
                            msg = "You requested " + itemListLimit + " items to be listed. </br>"
                                     + "Sorry, we only have "+ item.length +" this time. Check us back soon!";
                                
                        }                       
                        
                        
                        for(int i = 0; i< itemListLimit; i++)
                        {
                            %>
                                <%= item[i]%>
                            <%
                        }
                    %>
                </tbody>
            </table>
                <span class="error">
                    <%= msg%>
                </span>
                    
            <br><input type="submit" value="Add to Cart"/>
        </form>
    </body>
</html>
