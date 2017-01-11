<%-- 
    Document   : products
    Created on : Oct 26, 2014, 12:12:53 PM
    Author     : Ashley, Yonas, Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/styles.css" rel="stylesheet" type="text/css"/>
        <script src="includes/countdown.js" type="text/javascript"></script>
        <title>Welcome!</title>
    </head>
    <body class="background">
            <div class="container">

                <%@include file="includes/header.jsp" %>

                <div class="content">

                    <script>;
                        /*more info on this script 
                         https://blog.smalldo.gs/2013/12/create-simple-countdown/
                         */
                        function startCountdown(placeHolder, year, month, day, hour, minute) {
                            // alert("y:" + year + " M:" + month + " d:" + day + " h:" + hour + " m:" + minute);
                            month = month - 1; //appears month starts at current month + 1. Need to reset it back.
                            var clock = document.getElementById(placeHolder)
                                    , targetDate = new Date(year, month, day, hour, minute, 00, 000);
                            //new Date(year, month, day, hours, minutes, seconds, milliseconds)
                            clock.innerHTML = 'Discount expires in: ' + countdown(targetDate).toString();
                            setInterval(function () {
                                clock.innerHTML = 'Discount expires in: ' + countdown(targetDate).toString();
                            }, 1000);
                        }
                    </script>

                    <c:forEach var="item" items="${requestScope.items}">
                        <form action="CartServlet" method="post">

                            <table border="1" align="center" cellpadding="10" cellspacing="0" class="animated fadeInLeftBig">
                                <tbody>
                                    <tr>
                                        <td rowspan="2" style="width:80px;"><image src="images/${item.imgSrc}" width="75" height="75"></td>
                                        <td style="width:550px; text-align:left;" colspan="2"><a href="ProdPgServlet?itmSku=${item.sku}"</a>${item.itemName}</a>
                                            <input type="hidden" name="hidSku" value="${item.sku}"/>
                                            <input type="hidden" name="hidAction" value="add"/></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:left;">
                                <strike>Price: <fmt:formatNumber type="currency" value="${item.price}"/></strike><br>
                                Discount: <fmt:formatNumber type="percent" value="${item.discount/100}"/><br>
                                Discounted price: <fmt:formatNumber type="currency" value="${item.discountedPrice}"/><br>

                                <%--Unique placeholder id for each item. ignore the
                                    bad value warning for the div below. --%>
                                <div class="timer" id="lblCountdown${item.sku}"></div> 
                                <script>
                                    startCountdown('${"lblCountdown"}${item.sku}',
                                    <fmt:formatDate value="${item.discountEndTime}" pattern="yyy" />
                                    , <fmt:formatDate value="${item.discountEndTime}" pattern="M" />
                                    , <fmt:formatDate value="${item.discountEndTime}" pattern="d" />
                                    , <fmt:formatDate value="${item.discountEndTime}" pattern="h" />
                                    , <fmt:formatDate value="${item.discountEndTime}" pattern="m" />);
                                </script>

                                </td>
                                <td style="width:80px; vertical-align:bottom;">
                                    <input type="submit"  value="Add to cart"/></td>
                                </tr>
                                </tbody>
                            </table>

                        </form>
                    </c:forEach>

                    <!-- end .content --></div>
                    <%@include file="includes/footer.jsp" %>
                <!-- end .container --></div>
    </body>
</html>