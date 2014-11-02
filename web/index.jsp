<%-- 
    Document   : products
    Created on : Oct 26, 2014, 12:12:53 PM
    Author     : Ashley, Yonas, Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet" type="text/css"/>
        <title>Welcome!</title>
        <script>
            function validate(form){
                
                var isValid = true;
          
                //Check if input is empty
                if(form.txtNumber.value === ""){
                    //show error
                    document.getElementById("errNumber").innerHTML = "Number is required.";
                    isValid = false;
                } 
                
                //Check if input is non 0 or negative
                //Append error message (if there was already one).
                else if(form.txtNumber.value <= 0){
                    //show error
                    document.getElementById("errNumber").innerHTML = "Minimum is 1.";
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
        
 
            <div class="content">
            <h1>Welcome to our store!</h1>
       
            <p>Please type the number of products you'd like to view.</p>
        
            <form action='products.jsp' method="post">
            
            <table border='0' align="center" cellpadding="2" cellspacing="2">
                <tr>
                    <td>Type number:</td>
                    <td ><input type='text' name='txtNumber' autocomplete="off" />  
                        <span id='errNumber' class='error'/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type='button' value="Display products" onclick="validate(this.form)"/></td>
                </tr>
            </table>
            
        </form>
            <!-- end .content --></div>
            <div class="footer"> copyright@ Phat Ashley Yonas            <!-- end .footer --> (try replacing with snippet)      </div>
    <!-- end .container --></div>

    </body>
</html>
