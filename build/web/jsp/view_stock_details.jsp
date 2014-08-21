<%-- 
    Document   : view_stock_details
    Created on : Feb 24, 2014, 2:56:21 PM
    Author     : Nitin Vavdiya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Lump</title>
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.js"></script>
    <script type="text/javascript" src="../js/jquery.autocomplete.min.js"></script>
    <script type="text/javascript" src="../pagejs/view_stock.js"></script> 
    <link type="text/css" href="../css/jquery-ui.css" rel="stylesheet"/>
    <link type="text/css" href="../css/style.css" rel="stylesheet"/>
    <link type="text/css" href="../css/autocomp.css" rel="stylesheet"></link>
    <link href="../css/jquery-ui.css" rel="stylesheet"></link>
    </head>
    <body>
        <%
            String masterStockId=request.getParameter("id");
            //test
        %>
        <br/>
        <h1 style="text-align: center">Ha ha ha, i have your ID=<%=masterStockId%></h1>
    </body>
</html>
