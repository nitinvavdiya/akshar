/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package my;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import util.DataHelper;
import util.ResultSetWrapper;

/**
 *
 * @author Nitin Vavdiya
 */
@WebServlet(name = "GetStockData", urlPatterns = {"/GetStockData"})
public class GetStockData extends HttpServlet {

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
        ResultSetWrapper resultSetWrapper = new ResultSetWrapper();
        JSONObject json = new JSONObject();
        try {
           JSONArray clientinfo = DataHelper.convert(resultSetWrapper.executeQuery("select * from tblclient"));
           JSONArray colourinfo = DataHelper.convert(resultSetWrapper.executeQuery("select * from tblcolor"));
           JSONArray chartinfo = DataHelper.convert(resultSetWrapper.executeQuery("select * from tblchart"));
           json.put("clientinfo", clientinfo);
           json.put("colourinfo", colourinfo);
           json.put("chartinfo", chartinfo);
            System.out.println(json.toString());
            out.println(json);
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
