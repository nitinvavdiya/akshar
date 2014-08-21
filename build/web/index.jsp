<%-- 
    Document   : index
    Created on : Feb 2, 2014, 11:58:30 AM
    Author     : Nitin Vavdiya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        response.sendRedirect(request.getContextPath()+"/jsp/home.jsp");
    %>
    </body>
</html>
