<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    Date today = new java.util.Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
%>
&copy; <%= dateFormat.format(today)%> Ashley, Phat, & Yonas