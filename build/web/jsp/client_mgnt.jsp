<%-- 
    Document   : client_mgnt
    Created on : Feb 20, 2014, 3:44:36 AM
    Author     : Nitin Vavdiya
--%>


<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ResultSetWrapper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="menu.jsp" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Chart Mgnt</title>
        <link rel="stylesheet" href="../css/bootstrap.css" />

        <style type="text/css" title="currentStyle">
            @import "../css/demo_page.css";
            @import "../css/demo_table_jui.css";
            @import "../css/jquery-ui-1.8.4.custom.css";
        </style>
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.method.min.js"></script>
        <script type="text/javascript" src="../js/jquery-ui.js"></script>

        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>

        <script type="text/javascript" src="../pagejs/client_mgnt.js"></script>
        <link href="../css/jquery-ui.css" rel="stylesheet"></link>
    </head>
    <body>
        <div class="container">
            <div class="container" align="center">
                <form method="post" action="../ClientMgnt?action=1" >

                    <div class="container" align="center">
                        <table class="table-responsive ">
                            <tr style="text-align: center">
                                <th class="" style="text-align: center">Client Name</th>
                                <th class="" style="text-align: center">Client Mobile No.</th>
                                <th class="" style="text-align: center">Client Address</th>
                            </tr>
                            <tr>
                                <td class="">
                                    <input type="text" name="name" id="name" class="form-control" required/>
                                </td>
                                <td class="">
                                    <input type="text" name="mobile" id="mobile" class="form-control" onkeypress="return isNumberKey(event)" onblur="validateInput(this.value)" required/>
                                </td>
                                <td class="">
                                    <input type="text" name="address" id="address" class="form-control" required/>
                                </td>
                            </tr>
                            <tr>
                                <td class="" colspan="3">
                                    <input type="submit" class="btn-success btn btn-block" value="Add Client"/>
                                </td>
                            </tr>
                        </table>
                    </div>

                </form>
            </div>
            <br/>
            <div class="constants" align="center" id="client_update" style="display: none">
                <form method="post" action="../ClientMgnt?action=2" >
                    <input type="hidden" id="client_id" name="client_id"/>
                    <div class="container" align="center">
                        <table class="table-responsive ">
                            <tr style="text-align: center">
                                <th class="" style="text-align: center">Client Name</th>
                                <th class="" style="text-align: center">Client Mobile No.</th>
                                <th class="" style="text-align: center">Client Address</th>
                            </tr>
                            <tr>
                                <td class="">
                                    <input type="text" name="name" id="update_name" class="form-control" required/>
                                </td>
                                <td class="">
                                    <input type="text" name="mobile" id="update_mobile" class="form-control" onkeypress="return isNumberKey(event)" onblur="validateInput(this.value)" required/>
                                </td>
                                <td class="">
                                    <input type="text" name="address" id="update_address" class="form-control" required/>
                                </td>
                            </tr>
                            <tr>
                                <td class="" colspan="3">
                                    <input type="submit" class="btn-success btn btn-block" value="Update Client"/>
                                </td>
                            </tr>
                        </table>
                    </div>

                </form>
            </div>


            <h1 style="text-align: center">Client Information</h1>
            <div class="" align="center">
                <%
                    ResultSetWrapper rs = new ResultSetWrapper();
                    String query = "select * from tblclient";
                    ResultSet resultSet = rs.executeQuery(query);
                    // rs.close();
                    ResultSetMetaData rms = resultSet.getMetaData();
                    int cols = rms.getColumnCount();
                    System.out.println("total cols = " + cols);
                %>


                <table  id="chart_table" class="display">
                    <thead> 

                    <th>Client Id</th>
                    <th>Client Name</th>
                    <th>Client Mobile No</th>
                    <th>Client Address</th>
                    <th></th>

                    </tr>
                    </thead><tbody>
                        <%
                            while (resultSet.next()) {
                        %>
                        <tr >
                            <%
                                for (int i = 1; i <= cols; i++) {
                            %>

                            <td >
                                <%=resultSet.getString(i)%> 
                            </td>

                            <%
                                }
                            %>
                            <td ><input type="button" value="Update" id="<%=resultSet.getString(1)%>" class="btn-block" onclick="updateClient(this.id)"/></td>
                                <%
                                %>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

            </div>
            <div>
                <footer style=" left:0px; right:0px; bottom:0px;background:rgb(255,255,255); text-align:center;">
                    <hr>
                    <p>&copy;ThinkSoft-Nitin Vavdiya</p>
                </footer>
            </div> 
        </div>
    </body>
</html>
