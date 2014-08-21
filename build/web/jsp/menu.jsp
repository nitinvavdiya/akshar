<%-- 
    Document   : menu
    Created on : Feb 22, 2014, 11:42:34 AM
    Author     : Nitin Vavdiya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>AksharArt</title>
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
</head>

<body>
	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
                    <div class="navbar-brand" style="font-size: 40px;padding-left: 40px;padding-right: 40px">
                        <label>AksharArt</label><br />
			</div>
			
			
                    <B>
                    <div class="collapse navbar-collapse navHeaderCollapse" style="font-size: 18px">
				<ul class="nav navbar-nav">
					<li><a href="home.jsp">Home</a></li>
					<li class="dropdown">
						<a href="" class="dropdown-toggle" data-toggle="dropdown">Stock Management <b class="caret"></b></a>
						<ul class="dropdown-menu">
                                                    <li><a href="add_stock.jsp" style="font-size: 20px">Add Stock</a></li>
							<li><a href="view_stock.jsp" style="font-size: 20px">View Stock</a></li>
							
						</ul>
					</li>
					<li><a href="client_mgnt.jsp">Client Management</a></li>
					<li><a href="color_mgnt.jsp">Colour Management</a></li>
					<li><a href="chart_mgnt.jsp">Chart Management</a></li>
				</ul>
			</div>
                        </B>

		</div>
	</div><!-- End of Nav Bar -->
</body>
</html>