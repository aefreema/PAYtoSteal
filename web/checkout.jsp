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
    </body>
</html>
