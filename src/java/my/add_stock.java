/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package my;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import util.ResultSetWrapper;

/**
 *
 * @author Nitin Vavdiya
 */
@WebServlet(name = "add_stock", urlPatterns = {"/add_stock"})
public class add_stock extends HttpServlet {

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
         org.json.JSONObject msgArray = new org.json.JSONObject();
        try {
            /* TODO output your page here. You may use following sample code. */
            String jsonString = request.getParameter("jsondata");
            // String jsonString="";
            ResultSetWrapper resultSetWrapper = new ResultSetWrapper();
            System.out.println(jsonString);
            int masterSockId = 0;
           
            try {
                Map<String, String> map = new HashMap<String, String>();
                ObjectMapper mapper = new ObjectMapper();
                map = mapper.readValue(jsonString, new TypeReference<HashMap<String, String>>() {
                });
                System.out.println("-----map is------" + map);
                JSONParser parser = new JSONParser();
                // JSONObject clientJson= (JSONObject)parser.parse(map.get("clintinfo"));
                org.json.JSONObject clientJson = new org.json.JSONObject(map.get("clintinfo"));
                System.out.println("------client json---" + clientJson);

                org.json.JSONObject lumpJson = new org.json.JSONObject(map.get("lumpinfo"));
                org.json.JSONArray lumpArray = lumpJson.getJSONArray("lumps");
                System.out.println("lump array-----" + lumpArray);

                org.json.JSONObject cutsjson = new org.json.JSONObject(map.get("cutsinfo"));
                org.json.JSONArray cutsArray = cutsjson.getJSONArray("cuts");
                System.out.println("cuts json array --- " + cutsArray);
                org.json.JSONObject lumpsum = new org.json.JSONObject(map.get("lumpsummery"));
                System.out.println("lump summery----" + lumpsum);
                org.json.JSONObject cutsum = new org.json.JSONObject(map.get("cutssummmery"));
                System.out.println("cuts sum-----" + cutsum);
                if ((cutsArray.length() > 0 || lumpArray.length() > 0)) {
                    System.out.println("data found in request now seving in database");
                    String query = "insert into tblmasterstock values (NULL,'" + clientJson.getString("client_name") + "','" + clientJson.getString("receipt_no") + "','" + clientJson.getString("checkindate") + "','" + clientJson.getString("checkoutdate") + "');";
                    masterSockId = resultSetWrapper.insertStockAndGetKey(clientJson.getString("client_name"), clientJson.getString("receipt_no"), clientJson.getString("checkindate"), clientJson.getString("checkoutdate"));
                    System.out.println("next primary key for stock is--->" + masterSockId);

                    if (masterSockId > 0 && cutsArray.length() > 0) {
                        System.out.println("adding cuts data in database");
                        for (int i = 0; i < cutsArray.length(); i++) {
                            org.json.JSONObject temp = cutsArray.getJSONObject(i);
                            System.out.println("cuts json---" + temp);
                            String cutsquery = "insert into tblcutsstock values(NULL,'" + masterSockId + "','" + temp.getString("chart") + "','" + temp.getString("color") + "','" + temp.getString("cuts") + "')";
                            resultSetWrapper.executeUpdate(cutsquery);
                            System.out.println("cuts added--" + i);
                        }
                        String cutQuery = "insert into tblcutsummmery values (NULL,'" + masterSockId + "','" + cutsum.getString("totalcuts") + "')";
                        resultSetWrapper.executeUpdate(cutQuery);
                        System.out.println("cut data added ");
                    }
                    if (masterSockId > 0 && lumpArray.length() > 0) {

                        System.out.println("adding lump data in database");
                        for (int i = 0; i < lumpArray.length(); i++) {
                            org.json.JSONObject temp = lumpArray.getJSONObject(i);
                            System.out.println("temp json----->" + temp);
                            String lumpQuery = "insert into tbllumpstock values(NULL,'" + masterSockId + "','" + temp.getString("chart") + "','" + temp.getString("color") + "','" + temp.getString("lumplength") + "','" + temp.getString("piecelength") + "','" + temp.getString("cuts") + "','" + temp.getString("waste") + "')";
                            resultSetWrapper.executeUpdate(lumpQuery);
                            System.out.println("lump added--->" + i);
                        }
                        String lumpQuery = "insert into tbllumsummery values  (NULL,'" + masterSockId + "','" + lumpsum.getString("total_length") + "','" + lumpsum.getString("total_cuts") + "','" + lumpsum.getString("total_waste") + "')";
                        resultSetWrapper.executeUpdate(lumpQuery);
                        System.out.println("lump data added");
                    }
                    msgArray.put("status", 200);
                } else {
                    System.out.println("request is empty");
                    msgArray.put("status", 300);
                }

                
            } catch (Exception e) {
                e.printStackTrace();
                try {
                    msgArray.put("status", 500);
                } catch (Exception ee) {
                    ee.printStackTrace();
                }
            }
        } finally {
            out.println(msgArray);
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
