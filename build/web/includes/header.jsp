<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="styles/animate.css" rel="stylesheet" type="text/css"/>


<table border="0" align="right">
    <tr>
        <td>
            <c:if test="${sessionScope.cart.items.size()>0}">
                <p>${sessionScope.cart.items.size()} 
                    <c:if test="${sessionScope.cart.items.size()>1}">
                        items
                    </c:if>
                    <c:if test="${sessionScope.cart.items.size()==1}">
                        item
                    </c:if>
                    <br>
                    <a href="CartServlet"><img src="images/cart.png" alt="cart" width="40" height="40" longdesc="cart" align="right"></a></p>
                    </c:if>
        </td>
        <td>
            <c:if test="${customer == null}">
                <form name="formLogin" method="post" action="CustomerServlet"><!--if valid, make table invisible-->  
                    <table> 
                        <tr style="width:400px;">
                            <td>Email</td>
                            <td>
                                <input type="text" name="acctName" id="acctName">
                            </td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="password" id="password">
                                </br>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="hidden" name="hidAction" value="Login"/>
                                <input type='submit' value="Login" />

                            </td>
                            <td>

                                <a href="customer.jsp"> Create Account</a>

                            </td>
                        </tr>
                    </table>  
                </form> </c:if>

            <c:if test="${customer != null}">
                <table>
                    <tr style="width:400px;">
                        <td>
                            Welcome, ${customer.firstName}!
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="customer.jsp"> View Account</a>
                        </td>
                    </tr>
                </table>
            </c:if>
            <div class="error">
                ${requestScope.msg}
            </div>
        </td>
    </tr>
</table>

<div class="Header"><a href="IndexServlet">
        <img src="images/StoreLogo.png" class="animated slideInRight" alt="Store Logo Here" name="Store_logo" width="342" height="123" id="Store_logo" style="background: #FFF; display:block;" /></a>
</div>