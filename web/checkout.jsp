<%-- 
    Document   : checkout
    Created on : Oct 25, 2014, 6:24:01 PM
    Author     : Ashley, Yonas, Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet"> 
        <title>Checkout Page</title>
       
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
        <h1>Checkout</h1>
        
        <% 
            int[] items = new int[3];
            items[0] = Integer.parseInt(request.getParameter("item1"));
            items[1] = Integer.parseInt(request.getParameter("item2"));
            items[2] = Integer.parseInt(request.getParameter("item3")); 
            
            double[] price = new double[3];
            price[0] = Double.parseDouble(request.getParameter("price1"));
            price[1] = Double.parseDouble(request.getParameter("price2"));
            price[2] = Double.parseDouble(request.getParameter("price3"));
            
        %>
        
        <p>Your total is: 
            <% 
                double sum = 0;
                for(int i = 0; i < 3; i++) {
                    double cost = items[i] * price[i];
                    sum += cost;
                } 
            %>$<%= Double.toString(sum) %>
        </p>
        <!-- end .content --></div>
        <div class="footer">
        <p>&nbsp;</p>
        <!-- end .footer --></div>
        <!-- end .container --></div>

        
    </body>
</html>
