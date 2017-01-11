<%-- 
    Document   : create account
    Created on : Nov 10, 2014, 12:12:53 PM
    Author     : Ashley, Yonas, Phat
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet" type="text/css"/>
        <title>Create Account</title>
        <script>
            function confirmDelete(form) {
                if (confirm("Are you sure you want to delete this customer?"))
                    form.submit();
            }
            function validate(form) {
                var isValid = true;
                //Check if input is empty
                if (form.firstname.value === "") {
                    //show error
                    document.getElementById("errFname").innerHTML = "First Name can not be empty.";
                    isValid = false;
                }
                else
                    document.getElementById("errFname").innerHTML = "";
                if (form.lastname.value === "") {
                    //show error
                    document.getElementById("errLname").innerHTML = "Last Name can not be empty.";
                    isValid = false;
                }
                else
                    document.getElementById("errLname").innerHTML = "";
                if (form.email.value === "") {
                    //show error
                    document.getElementById("errEmail").innerHTML = "Email can not be empty.";
                    isValid = false;
                }
                else
                    document.getElementById("errEmail").innerHTML = "";
                if (form.password1.value === "") {
                    //show error
                    document.getElementById("errPassfield").innerHTML = "Password can not be empty.";
                    isValid = false;
                }
                else
                    document.getElementById("errPassfield").innerHTML = "";
                if (form.password1.value != form.password2.value) {
                    //show error
                    document.getElementById("errMatch").innerHTML = "Passwords do not match.";
                    isValid = false;
                }
                else
                    document.getElementById("errMatch").innerHTML = "";
                if (isValid)
                    form.submit();
            }
        </script>
    </head>
    <body class="background">
            <div class="container">

                <%@include file="includes/header.jsp" %>

                <div class="content">
                    
                    
                    <c:if test="${customer == null}">
                        <h1>New Account</h1>
                        <form action="CustomerServlet" method="post">
                            <table border="0" align="Left">
                                <tbody>
                                    <tr>
                                        <td><p>First Name</p></td>
                                        <td><p><input type="text" name="firstname"></p></td>
                                        <td><span id='errFname' class='error'/></td>
                                    </tr>
                                    <tr>
                                        <td><p>Last Name</p></td>
                                        <td><p><input type="text" name="lastname"></p></td>
                                        <td><span id='errLname' class='error'/></td>
                                    </tr>
                                    <tr>
                                        <td class="label">Country</td>
                                        <td>
                                            <select name='country'>
                                                <option value='United States' selected>United States
                                                <option value="Canada"> Canada
                                                <option value="Mexico">Mexico
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p>Email</p></td>
                                        <td><p><input type="text" name="email"></p></td>
                                        <td><span id='errEmail' class='error'/></td>
                                    </tr>

                                    <!--<tr>
                                        <td><p>Username</p></td>
                                        <td><p><input type="text" name="username"></p></td>
                                        <td><span id='errUname' class='error'/></td>
                                    </tr>-->

                                    <tr>
                                        <td><p>Password</p></td>
                                        <td><p><input type="password" name="password1"></p></td>
                                        <td><span id='errPassfield' class='error'/></td>
                                    </tr>
                                    <tr>
                                        <td><p>Re-type Password</p></td>
                                        <td><p><input type="password" name="password2"></p></td>
                                        <td><span id='errMatch' class='error'/></td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="hidden" name="hidAction" value="Create"/>
                            <input type="button" value="Create" onclick="validate(this.form)"/>
                        </form>
                    </c:if>

                    <c:if test="${customer != null}">
                        <h1>Hello ${customer.firstName}! update your account</h1>
                        <form action="CustomerServlet" method="post">
                            <table border="0" align="Left">
                                <tbody>
                                    <tr>
                                        <td><p>First Name</p></td>
                                        <td><p><input type="text" name="firstname" value="${customer.firstName}"></p></td>
                                        <td><span id='errFname' class='error'/></td>
                                    </tr>
                                    <tr>
                                        <td><p>Last Name</p></td>
                                        <td><p><input type="text" name="lastname" value="${customer.lastName}"></p></td>
                                        <td><span id='errLname' class='error'/></td>
                                    </tr>
                                    <tr>
                                        <td class="label">Country</td>
                                        <td>
                                            <select name='country'>
                                                <option value='United States' ${customer.country.equals("United States") ? "Selected" : "" }>United States</option>
                                                <option value="Canada" ${customer.country.equals("Canada") ? "Selected" : "" }> Canada</option>
                                                <option value="Mexico" ${customer.country.equals("Mexico") ? "Selected" : "" }>Mexico</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p>Email</p></td>
                                        <td><p><input type="text" name="email" value="${customer.email}"></p></td>
                                        <td><span id='errEmail' class='error'/></td>
                                    </tr>


                                    <tr>
                                        <td><p>Password</p></td>
                                        <td><p><input type="password" name="password1" value="${customer.password}" ></p></td>
                                        <td><span id='errPassfield' class='error'/></td>
                                    </tr>

                                    <tr>
                                        <td><p>Re-type Password</p></td>
                                        <td><p><input type="password" name="password2" value="${customer.password}"></p></td>
                                        <td><span id='errMatch' class='error'/></td>
                                    </tr>

                                </tbody>
                            </table>
                            <input type="hidden" name="hidAction" value="Update"/>
                            <input type="button" value="Update" onclick="validate(this.form)"/>
                        </form>

                    </c:if>

                    <c:if test="${customer != null}">
                        <form action="CustomerServlet" method="post">
                            <input type="hidden" name="hidAction" value="Delete"/>
                            <input type="button" value="Delete" onclick="confirmDelete(this.form)"/>
                        </form>
                    </c:if>

                    ${requestScope.msg}


                    <c:if test="${not empty customer.email}">
                        <table cellpadding="4">
                            <tr>
                                <td>Order number </td>
                                <td>Order date</td>
                                <td>Order amount</td>
                            </tr>
                            <c:forEach var="Cart" items="${requestScope.order}">
                                <tr>
                                    <td>${Cart.orderNumber} </td>
                                    <td>${Cart.orderDate}</td>
                                    <td><fmt:formatNumber type="currency" value="${Cart.totalAmount}"/></td>
                                </tr>
                            </c:forEach>

                        </table>
                    </c:if>

                    <!-- end .content --></div>
                    <%@include file="includes/footer.jsp" %>
                <!-- end .container --></div>
    </body>
</html>