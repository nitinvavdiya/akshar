/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package my;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import util.DBConnector;
import util.ResultSetWrapper;

/**
 *
 * @author Nitin Vavdiya
 */
@WebServlet(name = "ClientMgnt", urlPatterns = {"/ClientMgnt"})
public class ClientMgnt extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject json = new JSONObject();
        //1-add
        //2-update
        //3=delete
        //4-read
        ResultSetWrapper resultSetWrapper = new ResultSetWrapper();
        try {
            String action = request.getParameter("action");
            if(action!=null){
                 int actiontype = Integer.parseInt(request.getParameter("action"));
                 if(actiontype==1){
                     //add
                     String name = request.getParameter("name");
                     String mobile  = request.getParameter("mobile");
                     String address = request.getParameter("address");
                     String query="insert into tblclient values (NULL,'"+name+"','"+mobile+"','"+address+"')";
                     int ans = DBConnector.insertData(query);
                     if(ans>=0){
                         json.put("msg", "client added");
                        // out.println(json);
                         
                         response.sendRedirect(request.getContextPath()+"/jsp/client_mgnt.jsp");
                     }
                 }else if(actiontype==4){
                     //read
                     String query="select * from tblclient where client_id="+request.getParameter("client_id");
                     ResultSet rs = resultSetWrapper.executeQuery(query);
                     JSONObject color = new JSONObject();
                     if(rs.next()){
                         color.put("client_id", rs.getString(1));
                         color.put("name",rs.getString(2));
                          color.put("mobile",rs.getString(3));
                           color.put("address",rs.getString(4));
                     }
                     out.println(color);
                 }else if(actiontype==2){
                     //update cliemt
                     System.out.println("update client");
                     //String id = request.getParameter("chart_id");
                     String query="UPDATE `tblclient` SET `name`='"+request.getParameter("name") +"',`mobile`='"+request.getParameter("mobile") +"',`address`='"+request.getParameter("address") +"' WHERE client_id="+request.getParameter("client_id");
                     int ans=resultSetWrapper.executeUpdate(query);
                     System.out.println("test1---"+ans);
                     response.sendRedirect(request.getContextPath()+"/jsp/client_mgnt.jsp");
                 }
                 
            }
           
        }catch(Exception e){
        }finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
