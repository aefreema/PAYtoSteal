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
        
        <script>
            function validate(form){
                
                var isValid = true;
          
                //Check if quantity is set
                if((form.item1.value + form.item2.value + form.item3.value )==0){
                    //show error
                    document.getElementById("errNumber").innerHTML = "Please set quantity for the product you'd like to add to the cart.";
                    isValid = false;
                } 
                
                if(isValid)
                    form.submit(); 
               
            }
            
        </script>
        
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
        <%@ page import="product.*"%>
        <% 
            int itemListLimit = Integer.parseInt(request.getParameter("txtNumber"));
            
            Item[] items = {new Item("images/iphone.jpg","Apple iPhone","199.99"), 
                            new Item("images/textbook.jpg","Textbook","100.00"),
                            new Item("images/fan.jpg","Desk Fan","23.99")};
            
            String[] name = {"item1", "item2", "item3"};
            String[] price = {"price1","price2","price3"};
        
        %>
        
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
                        if(itemListLimit > items.length)
                        {
                            //itemListLimit = items.length; yonas: moved this down as the message below needs 
                            //to display the original #of products the user requested to view.
                            msg = "You requested " + itemListLimit + " items to be listed. </br>"
                                     + "Sorry, we only have "+ items.length +" this time. Check us back soon!";
                                
                        }                       
                        
                        
                        itemListLimit = items.length;
                        for(int i = 0; i< itemListLimit; i++)
                        {
                            %>
                            <tr>
                                <td><image src='<%= items[i].getImgSrc()%>' width='75' height='75'></td>
                                <td class='label'><%= items[i].getItemName() %></td>
                                <td class='label'>Price: $<%= items[i].getPrice() %> <input type='hidden' value='<%= items[i].getPrice() %>' name='<%= price[i]%>'/></td>
                                <td class='label'>Quantity:<input type='text' value='0' name=<%= name[i] %> autocomplete='off'/></td>
                            </tr>
                            <%
                        }
                    %>
                </tbody>
            </table>
                <span id="errNumber" class="error">
                    <%= msg%>
                </span>
                                  
            <br><input type='button' value="Add to Cart" onclick="validate(this.form)"/>
        </form>
        <!-- end .content --></div>
      <div class="footer">
        <p>&nbsp;</p>
        <!-- end .footer --></div>
      <!-- end .container --></div>
    </body>
</html>
