<%@include file="menu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Lump</title>
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery-ui.js"></script>
        <script type="text/javascript" src="../pagejs/lump.js"></script>
        <link href="../css/jquery-ui.css" rel="stylesheet"></link>
    </head>

    <body >
        <DIV style="height: 10px" align="center">
            <label id="status" style="padding: 10px;text-align: center"></label>
        </DIV>
        <br />
        <h2 style="text-align:center" class="text-success">Fill stock details</h2>

        <div class="container">

            <div class="container">
                <table class="table-responsive col-md-10">
                    <tr>
                        <th class="col-md-2" style="text-align:right">Client Name:</th>
                        <td class="col-md-3"><select name="client_name" id="client_name" class="form-control"><option>Name</option></select></td>
                        <th class="col-md-2" style="text-align:right">Receipt No:</th>
                        <td class="col-md-3"><input type="text" name="receipt_no" id="receipt_no" class="form-control" required/></td>
                    </tr>
                    <tr>
                        <th class="col-md-2">Check in Date:</th>
                        <td class="col-md-3"><input type="text" name="checkindate" id="checkindate" class="form-control" required/></td>
                        <th class="col-md-2">Check out Date:</th>
                        <td class="col-md-3"><input type="text" name="checkoutdate" id="checkoutdate" class="form-control" required/></td>
                    </tr>
                </table>
            </div>
            <br /><br />
            <div class="container" id="lumpsHeader" style="display:none">
                <table class="table-responsive col-md-12" style="text-align: center">
                    <tr>
                        <th class="col-md-2" style="text-align: center">Chart Name</th>
                        <th class="col-md-2" style="text-align: center">Color</th>
                        <th class="col-md-2" style="text-align: center">Length(m)</th>
                        <th class="col-md-2" style="text-align: center">Piece Length(m)</th>
                        <th class="col-md-2" style="text-align: center">Cuts</th>
                        <th class="col-md-2" style="text-align: center">Waste(m)</th>
                    </tr>
                </table>
            </div>
            <span id="newPiece">
            </span>
            <div class="container">
                <table class="col-md-2">
                    <tr>
                        <td class="col-md-2"><input type="button" class="btn btn-block" onclick="addPiece()" value="Add New Lump"/></td>
                    </tr>
                </table>
            </div>
            <div class="container" style="display:none" id="totalLumpsDiv">
                <table class="table-responsive col-md-12">
                    <tr>
                        <td class="col-md-2"><input type="button" value="Total" class="btn btn-block" onclick="countTotal()"/></td>
                        <td class="col-md-2"></td>
                        <td class="col-md-2"><input type="text" id="total_length" class="form-control" readonly/></td>
                        <td class="col-md-2"><input type="text" id="pieces_length" class="form-control" disabled/></td>
                        <td class="col-md-2"><input type="text" id="total_cuts" class="form-control" disabled/></td>
                        <td class="col-md-2"><input type="text" id="total_waste" class="form-control" disabled/></td>
                    </tr>
                </table>
            </div>
            <br />
            <br />
            <div class="container" id="cutsHeader" style="display:none">
                <table class="table-responsive col-md-6" >
                    <tr>
                        <th class="col-md-2" style="text-align: center">Chart Name</th>
                        <th class="col-md-2" style="text-align: center">Color</th>
                        <th class="col-md-2" style="text-align: center">Cuts</th>
                    </tr>
                </table>
            </div>
            <span id="newCuts">
            </span>
            <div class="container">
                <table class="col-md-2">
                    <tr>
                        <td class="col-md-2"><input type="button" class="btn btn-block" onclick="addCut()" value="Add New Cut"/></td>
                    </tr>
                </table>
            </div>
            <div class="container" style="display:none" id="totalCutsDiv">
                <table class="table-responsive col-md-6">
                    <tr>
                        <td class="col-md-2"><input type="button" value="Total" class="btn btn-block" onclick="cuts_countTotal()"/></td>
                        <td class="col-md-2"></td>
                        <td class="col-md-2"><input type="text" id="cuts_total" name="cuts_total" class="form-control" disabled/></td>
                    </tr>
                </table>
            </div>
            <br />
            <div class="container">
                <input type="button" name="Save" class="btn btn-success col-md-12" onclick="generateJson()" value="Save Stock"/>
            </div>
        </div>
        <div>
            <footer style=" left:0px; right:0px; bottom:0px;background:rgb(255,255,255); text-align:center;">
                <hr>
                    <p>&copy;ThinkSoft-Nitin Vavdiya</p>
            </footer>
        </div> 
    </body>
</html>