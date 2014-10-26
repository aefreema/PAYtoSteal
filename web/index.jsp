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
        <h1>Welcome to our store!</h1>
       
        Please type the number of products you'd like to view.
        
        <form action='products.jsp' method="post">
            
            <table border='0'>
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
        
    </body>
</html>
