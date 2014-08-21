<%-- 
    Document   : chart_mgnt
    Created on : Feb 20, 2014, 3:23:56 AM
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
        <script type="text/javascript" src="../js/jquery-ui.js"></script>
        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../pagejs/chart_mgnt.js"></script>
        <link href="../css/jquery-ui.css" rel="stylesheet"></link>
    </head>
    <body>

        <div class="container">
            <div class="constants" align="center">
                <form method="post" action="../ChartMgnt?action=1">
                    <table class="table-responsive col-md-12">
                        <tr>
                            <td>
                                <input type="text" name="chartname" id="chartname" class="col-md-8 form-control" placeholder="Enter Chart Name" required/>
                            </td>
                            <td>
                                <input type="submit" value="Add Chart Name" class="col-md-4 btn-success btn-block btn"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div style="height:30px"></div>
            <div class="constants" align="center" id="chart_update" style="display: none">
                <form method="post" action="../ChartMgnt?action=2">
                    <table class="table-responsive col-md-12">
                        <tr>
                            <td>
                                <input type="hidden" name="chart_id" id="chart_id"/>
                                <input type="text" name="chartname" id="update_chartname" class="col-md-12 form-control" placeholder="Enter Chart Name" required/>
                            </td>
                            <td>
                                <input type="submit" value="Update Chart Name" class=" btn-success btn btn-block"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <br>
            <br>
            <div style="height:30px"></div>
            <div class="">
                <%
                    ResultSetWrapper rs = new ResultSetWrapper();
                    String query = "select * from tblchart";
                    ResultSet resultSet = rs.executeQuery(query);
                    // rs.close();
                    ResultSetMetaData rms = resultSet.getMetaData();
                    int cols = rms.getColumnCount();
                    System.out.println("total cols = " + cols);
                %>


                <table  id="chart_table" class="display">
                    <thead> 

                    <th>Chart Id</th>
                    <th>Chart Name</th>
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
                            <td ><input type="button" value="Update" id="<%=resultSet.getString(1)%>" class="btn-block" onclick="UpadteChart(this.id)"/></td>
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
