<%-- 
    Document   : get_stock_data
    Created on : Feb 22, 2014, 2:19:24 PM
    Author     : Nitin Vavdiya
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="javax.sound.midi.Soundbank"%>
<%@page import="util.DBConnector"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="util.ResultSetWrapper"%>
<%@page import="org.json.JSONArray"%>
<%@page import="util.DataHelper"%>
<%@page import="com.sun.xml.internal.ws.encoding.DataHandlerDataSource"%>
<%@page import="java.util.HashMap"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../pagejs/get_stock_data.js"></script>
        <style>
            td{
                text-align: center;
                padding: 10px;
                
            }
            
        </style>
    </head>
    <body>
        <%
            String receiptno = request.getParameter("receiptno");
            String clientname = request.getParameter("clientname");
            String checkindate = request.getParameter("checkindate");
            ResultSetWrapper resultSetWrapper = new ResultSetWrapper();
            System.out.println(receiptno);
            System.out.println(clientname);
            System.out.println(checkindate);
            //boolean rf = true, cf = true;
            if (receiptno.equalsIgnoreCase("all")) {
                receiptno = "%";
                //  rf = false;
            }
            if (clientname.equalsIgnoreCase("all")) {
                //  cf = false;
                clientname = "%";
            }
            if (checkindate.equalsIgnoreCase("all")) {
                checkindate = "%";
            }
            String query = "receiptno=" + receiptno + "clientname=" + clientname + "checkindate=" + checkindate;
            //  out.println(query+"<br/>");
            //geting map data
            HashMap<String, String> chartMap = DataHelper.getKeyIdMap("tblchart");
            HashMap<String, String> colourMap = DataHelper.getKeyIdMap("tblcolor");
            HashMap<String, String> clientMap = DataHelper.getKeyIdMap("tblclient");
            String masterQuery = "select * from tblmasterstock where client_id like '" + clientname + "' and reciptno like '" + receiptno + "' and checkindate like '" + checkindate + "';";
            JSONArray masterStock = DataHelper.convert(resultSetWrapper.executeQuery(masterQuery));
            System.out.println("Master Stock json---" + masterStock);
            int masterStockLength = masterStock.length();
        %>
        <br/>
        <!--
        <div align="center">
        <table class="col-md-10" align="center">
            <tr>
                <td class="col-md-2"><h3>Search</h3></td>
                <td class="col-md-8"><input type="text" class="form-control" id="semp" name="semp" placeholder="Enter Key word to search"/></td>
            </tr>
        </table>
        </div>
       <br/>
        -->
        <div class="" align="center" >
            <table  id="masterStock"  class="table table-hover table-hover" border="1" style="border: 1px solid black;">
                <thead>
                <tr style="text-align: center" class="success">
                    <th class="" style="text-align: center">Receipt No</th>
                    <th class="" style="text-align: center">Client Name</th>
                    <th class="" style="text-align: center">Checkin Date</th>
                    <th class="" style="text-align: center">Checkout Date</th>
                    
                    <th class="" style="text-align: center">Total Meter</th>
                    <th class="" style="text-align: center">Total Cuts</th>
                    <th class="" style="text-align: center">Total Waste(in meter)</th>
                    <th class="" style="text-align: center">Status</th>
                    <td class=""></td>
                </tr>
                </thead>
                <%
                    for (int i = 0; i < masterStockLength; i++) {
                        JSONObject stock = masterStock.getJSONObject(i);
                        String masterStockId = stock.getString("id");
                        System.out.println("for master stock id---" + stock.getString("id"));
                        if (DBConnector.hasLumpStock(stock.getString("id")) && DBConnector.hasCutsStock(stock.getString("id"))) {
                            System.out.println("lump and cuts stock found");
                            JSONObject lumpStock = DBConnector.getLumpStockSummery(stock.getString("id"));
                            JSONObject cutsStock = DBConnector.getCutsStockSummery(stock.getString("id"));
                            String receiptNo = stock.getString("reciptno");
                            String clientName = clientMap.get(stock.getString("client_id"));
                            String checkInDate = stock.getString("checkindate");
                            String checkOutDate = stock.getString("checkoutdate");
                            String status = stock.getString("status");
                            String[] date = checkOutDate.split("-");
                            System.out.println("date-token--" + date[0] + "---" + date[1] + "--" + date[2]);
                            java.util.Date outDate = new java.util.Date(Integer.parseInt(date[2]) - 1900, Integer.parseInt(date[1]) - 1, Integer.parseInt(date[0]));
                            java.util.Date tempDate = new java.util.Date();
                            java.util.Date currentDate = new java.util.Date(tempDate.getYear(), tempDate.getMonth(), tempDate.getDate());
                            System.out.println("outdate----" + outDate);
                            System.out.println("current date---" + currentDate);
                            int temp = outDate.compareTo(currentDate);
                            System.out.println("tempp------:" + temp);
                            String fontcolor = "";
                            if (status.equals("1")) {
                                status = "In process";
                                if (temp < 0) {
                                    status = "Not Delivaerd in time";
                                    fontcolor = "red";
                                } else if (temp > 0) {
                                    System.out.println("test1----------------------------");
                                    fontcolor = "#0000ff";
                                } else if (temp == 0) {
                                    status = "Today is delivary date";
                                    fontcolor = "red";
                                }
                            } else {
                                status = "Deliverd";
                                fontcolor = "green";
                            }

                            String length = lumpStock.getString("length");
                            String lumpcuts = lumpStock.getString("lumpcuts");
                            String waste = lumpStock.getString("waste");
                            String cutscuts = cutsStock.getString("cutscuts");
                %>
                <tr>
                    <td class="" rowspan="2"><%=receiptNo%></td>
                    <td class="" rowspan="2"><%=clientName%></td>
                    <td class="" rowspan="2"><%=checkInDate%></td>
                    <td class="" rowspan="2"><%=checkOutDate%></td>

                    <td class=""><%=length%></td>
                    <td class=""><%=lumpcuts%></td>
                    <td class=""><%=waste%></td>
                    <td class="" rowspan="2"><font color="<%=fontcolor%>"><%=status%></td>
                    <td class="" rowspan="2"><a href="view_stock_details.jsp?id=<%=masterStockId%>"><input type="button" class="btn-success btn" value="View Details"/></a></td>
                </tr>
                <tr>
                    <td class="">-</td>
                    <td class=""><%=cutscuts%></td>
                    <td class="">-</td>
                </tr>


                <%
                } else if (DBConnector.hasLumpStock(stock.getString("id")) && !DBConnector.hasCutsStock(stock.getString("id"))) {
                    System.out.println("only lump stock found");
                    JSONObject lumpStock = DBConnector.getLumpStockSummery(stock.getString("id"));
                    String receiptNo = stock.getString("reciptno");
                    String clientName = clientMap.get(stock.getString("client_id"));
                    String checkInDate = stock.getString("checkindate");
                    //String checkindate=DataHelper.chngeDate();
                    String checkOutDate = stock.getString("checkoutdate");
                    String status = stock.getString("status");

                    String[] date = checkOutDate.split("-");
                    System.out.println("date-token--" + date[0] + "---" + date[1] + "--" + date[2]);
                    java.util.Date outDate = new java.util.Date(Integer.parseInt(date[2]) - 1900, Integer.parseInt(date[1]) - 1, Integer.parseInt(date[0]));
                    java.util.Date tempDate = new java.util.Date();
                    java.util.Date currentDate = new java.util.Date(tempDate.getYear(), tempDate.getMonth(), tempDate.getDate());
                    System.out.println("outdate----" + outDate);
                    System.out.println("current date---" + currentDate);
                    int temp = outDate.compareTo(currentDate);
                    System.out.println("tempp------:" + temp);
                    String fontcolor = "";
                    if (status.equals("1")) {
                        status = "In process";
                        if (temp < 0) {
                            status = "Not Delivaerd in time";
                            fontcolor = "red";
                        } else if (temp > 0) {
                            System.out.println("test1----------------------------");
                            fontcolor = "#0000ff";
                        } else if (temp == 0) {
                            status = "Today is delivary date";
                            fontcolor = "red";
                        }
                    } else {
                        status = "Deliverd";
                        fontcolor = "green";
                    }

                    String length = lumpStock.getString("length");
                    String lumpcuts = lumpStock.getString("lumpcuts");
                    String waste = lumpStock.getString("waste");

                %>
                <tr>
                    <td class=""><%=receiptNo%></td>
                    <td class=""><%=clientName%></td>
                    <td class=""><%=checkInDate%></td>
                    <td class="" ><%=checkOutDate%></td>

                    <td class=""><%=length%></td>
                    <td class=""><%=lumpcuts%></td>
                    <td class=""><%=waste%></td>
                    <td class="" ><font color="<%=fontcolor%>"><%=status%></td>
                    <td class=""><a href="view_stock_details.jsp?id=<%=masterStockId%>"><input type="button" class="btn-success btn" value="View Details"/></a></td>
                </tr>
                <%
                } else if (DBConnector.hasCutsStock(stock.getString("id")) && !DBConnector.hasLumpStock(stock.getString("id"))) {
                    System.out.println("only cuts stock found");
                    JSONObject cutsStock = DBConnector.getCutsStockSummery(stock.getString("id"));
                    String receiptNo = stock.getString("reciptno");
                    String clientName = clientMap.get(stock.getString("client_id"));
                    String checkInDate = stock.getString("checkindate");
                    String checkOutDate = stock.getString("checkoutdate");
                    String status = stock.getString("status");
                    String[] date = checkOutDate.split("-");
                    System.out.println("date-token--" + date[0] + "---" + date[1] + "--" + date[2]);
                    java.util.Date outDate = new java.util.Date(Integer.parseInt(date[2]) - 1900, Integer.parseInt(date[1]) - 1, Integer.parseInt(date[0]));
                    java.util.Date tempDate = new java.util.Date();
                    java.util.Date currentDate = new java.util.Date(tempDate.getYear(), tempDate.getMonth(), tempDate.getDate());
                    System.out.println("outdate----" + outDate);
                    System.out.println("current date---" + currentDate);
                    int temp = outDate.compareTo(currentDate);
                    System.out.println("tempp------:" + temp);
                    String fontcolor = "";
                    if (status.equals("1")) {
                        status = "In process";
                        if (temp < 0) {
                            status = "Not Delivaerd in time";
                            fontcolor = "red";
                        } else if (temp > 0) {
                            System.out.println("test1----------------------------");
                            fontcolor = "#0000ff";
                        } else if (temp == 0) {
                            status = "Today is delivary date";
                            fontcolor = "red";
                        }
                    } else {
                        status = "Deliverd";
                        fontcolor = "green";
                    }

                    String cutscuts = cutsStock.getString("cutscuts");
                %>
                <tr>
                    <td class=""><%=receiptNo%></td>
                    <td class=""><%=clientName%></td>
                    <td class=""><%=checkInDate%></td>
                    <td class="" ><%=checkOutDate%></td>

                    <td class="">-</td>
                    <td class=""><%=cutscuts%></td>
                    <td class="">-</td>
                    <td class="" ><font color="<%=fontcolor%>"><%=status%></td>
                    <td class=""><a href="view_stock_details.jsp?id=<%=masterStockId%>"><input type="button" class="btn-success btn" value="View Details"/></a></td>
                </tr>
                <%
                    } else {
                        System.out.println("No data match");
                    }
                %>


                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>