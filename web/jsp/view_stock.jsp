<%-- 
    Document   : view_stock
    Created on : Feb 22, 2014, 1:24:06 PM
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
    <style>
        #filter th{
            padding: 20px;
        }
    </style>
    </head>
    <body>
        <div class="container" align="center">
            <div class="constants">
                <table class="table-responsive" id="filter">
                        <tr style="text-align: center">
                            <th class="" style="text-align: center">Receipt No:&nbsp</th>
                            <td class="">
                                <input type="text" name="receiptno" id="receiptno" class="form-control" required/>
                            </td>
                            <th class="" style="text-align: center">Client Name:</th>
                            <td class="">
                                <select id="clientname" name="clientname" class="form-control"></select>
                            </td>
                            <th class="" style="text-align: center">Check in date:&nbsp;</th>
                            <td class="">
                                <input type="text" name="address" id="checkindate" class="form-control" required/>
                            </td>
                            <td class="">
                                <input type="submit" class="btn-success btn" value="Get Stock" onclick="getFilteredStock()"/>
                            </td>
                            <tr>
                            
                        </tr>
                        <tr>
                            <td colspan="7">
                                <input type="submit" class="btn-success btn btn-block" value="Get All Stock" onclick="getAllStock()"/>
                            </td>
                        </tr>
                        
                        
                    </table>
            </div>
        </div>
        <br/>
        <h1 style="text-align: center">Stock Details</h1>
        <div align="center" id="stock">
            
        </div>
        <div>
        <footer style=" left:0px; right:0px; bottom:0px;background:rgb(255,255,255); text-align:center;">
            <hr>
            <p>&copy;ThinkSoft-Nitin Vavdiya</p>
        </footer>
    </div> 
    </body>
</html>
