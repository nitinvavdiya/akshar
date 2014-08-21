/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Vector;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Nitin Vavdiya
 */
public class DBConnector {
    
    private static  String query;
   
    
    //all static method goes here
    
    public static int insertData(String query){
        try {
             ResultSetWrapper rs = new ResultSetWrapper();
            return rs.executeUpdate(query);
        } catch (Exception e) {
            return 0;
        }
    }
    
    public static boolean hasLumpStock(String id){
        try {
           ResultSetWrapper resultSetWrapper = new ResultSetWrapper();
           ResultSet resultSet = resultSetWrapper.executeQuery("select * from tbllumsummery where masterstock_id="+id);
           if(resultSet.next()){
               return true;
           }else{
               return false;
           }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public static  boolean  hasCutsStock(String id){
        try {
           ResultSetWrapper resultSetWrapper = new ResultSetWrapper();
           ResultSet resultSet = resultSetWrapper.executeQuery("select * from tblcutsummmery where masterstock_id="+id);
           if(resultSet.next()){
               return true;
           }else{
               return false;
           }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public static JSONObject getLumpStockSummery(String id){
        JSONObject stock = new JSONObject();
        ResultSetWrapper resultSetWrapper = new ResultSetWrapper();
        try {
            ResultSet resultSet = resultSetWrapper.executeQuery("select * from tbllumsummery where masterstock_id="+id);
           while(resultSet.next()){
                stock.put("length", resultSet.getString(3));
                stock.put("lumpcuts", resultSet.getString(4));
                stock.put("waste",resultSet.getString(5));
           }
           return stock;
        } catch (Exception e) {
            e.printStackTrace();
            return stock;
        }
    }
    public static JSONObject getCutsStockSummery(String id){
        JSONObject stock = new JSONObject();
        ResultSetWrapper resultSetWrapper = new ResultSetWrapper();
        try {
            ResultSet resultSet = resultSetWrapper.executeQuery("select * from tblcutsummmery where masterstock_id="+id);
           while(resultSet.next()){
                stock.put("cutscuts", resultSet.getString(3));
           }
           return stock;
        } catch (Exception e) {
            e.printStackTrace();
            return stock;
        }
    }
}