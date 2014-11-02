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
                        + "<td><image src='images/iphone.jpg' width='75' height='75'></td>"
                        + "<td class='label'>Apple iPhone</td>"
                        + "<td class='label'>Price: $199.99 <input type='hidden' value='199.99' name='price1'/></td>"
                        + "<td class='label'>Quantity:<input type='text' value='0' name='item1' autocomplete='off'/></td>"
                    + "</tr>";
            item[1] = "<tr>"
                        + "<td><image src='images/textbook.jpg' width='75' height='75'></td>"
                        + "<td class='label'>Textbook </td>"
                        + "<td class='label'>Price: $100.00 <input type='hidden' value='100.00' name='price2'/></td>"
                        + "<td class='label'>Quantity:<input type='text' value='0' name='item2' autocomplete='off'/></td>"
                    + "</tr>";
            item[2] = "<tr>"
                        + "<td><image src='images/fan.jpg' width='75' height='75'></td>"
                        + "<td class='label'>Desk Fan</td>"
                        + "<td class='label'>Price: $23.99 <input type='hidden' value='23.99' name='price3'/></td>"
                        + "<td class='label'>Quantity:<input type='text' value='0' name='item3' autocomplete='off'/></td>"
                    + "</tr>";
        %>
        
    </head>
    <body>

    <div class="container">
        <table width="100" border="0" align="right">
            <tr>
              <td>Account</td>
              <td><form name="form1" method="post" action="">
                <input type="text" name="acctName" id="acctName">
              </form></td>
            </tr>
            <tr>
              <td>Password</td>
              <td><form name="form2" method="post" action="">
                <input type="text" name="password" id="password">
              </form></td>
            </tr>
          </table>
          <div class="header"><a href="index.jsp"><img src="images/StoreLogo.png" alt="Store Logo Here" name="Store_logo" width="342" height="123" id="Store_logo" style="background: #FFF; display:block;" /></a>

        <!-- end .header --></div>
      <div class="content">
        <h1>&nbsp;</h1>
        <h1>Pick an item to add to your cart</h1>
        <form action="cart.jsp" method="post">
            <table border="1" align="center" cellpadding="20" cellspacing="0">
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
        <!-- end .content --></div>
      <div class="footer">
        <p>&nbsp;</p>
        <!-- end .footer --></div>
      <!-- end .container --></div>
    </body>
</html>
