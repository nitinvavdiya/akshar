<%-- 
    Document   : get_receipt_list
    Created on : Feb 22, 2014, 1:41:56 PM
    Author     : Nitin Vavdiya
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.ResultSetWrapper"%>
<%@page import="java.sql.ResultSet"%>


<%
    try {
        String s[] = null;
        ResultSetWrapper resultSetWrapper = new ResultSetWrapper();
        String q = "select reciptno from tblmasterstock";
        ResultSet rs = resultSetWrapper.executeQuery(q);
        System.out.println("ajax called");
        List li = new ArrayList();

        while (rs.next()) {
            li.add(rs.getString(1));
        }

        String[] str = new String[li.size()];
        Iterator it = li.iterator();

        int i = 0;
        while (it.hasNext()) {
            String p = (String) it.next();
            str[i] = p;
            i++;
        }

        //jQuery related start
        String query = (String) request.getParameter("q");

        int cnt = 1;
        for (int j = 0; j < str.length; j++) {
            if (str[j].toUpperCase().startsWith(query.toUpperCase())) {
                out.print(str[j] + "\n");
                if (cnt >= 5)// 5=How many results have to show while we are typing(auto suggestions)
                {
                    break;
                }
                cnt++;
            }
        }
        //jQuery related end

        rs.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

//www.java4s.com
%>
