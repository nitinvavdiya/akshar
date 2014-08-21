/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Nitin Vavdiya
 */
public class DataHelper {
    private static int OTP;
    public static void setOTP(int otp){
        OTP=otp;
    }
    public static int getOTP(){
        return OTP;
    }
    public static JSONArray convert(ResultSet rs) throws SQLException,
        JSONException {
    JSONArray json = new JSONArray();
    ResultSetMetaData rsmd = rs.getMetaData();
    int numColumns = rsmd.getColumnCount();
    while (rs.next()) {

        JSONObject obj = new JSONObject();

        for (int i = 1; i < numColumns + 1; i++) {
            String column_name = rsmd.getColumnName(i);

            if (rsmd.getColumnType(i) == java.sql.Types.ARRAY) {
                obj.put(column_name, rs.getArray(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.BIGINT) {
                obj.put(column_name, rs.getLong(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.REAL) {
                obj.put(column_name, rs.getFloat(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.BOOLEAN) {
                obj.put(column_name, rs.getBoolean(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.BLOB) {
                obj.put(column_name, rs.getBlob(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.DOUBLE) {
                obj.put(column_name, rs.getDouble(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.FLOAT) {
                obj.put(column_name, rs.getDouble(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.INTEGER) {
                obj.put(column_name, rs.getInt(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.NVARCHAR) {
                obj.put(column_name, rs.getNString(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.VARCHAR) {
                obj.put(column_name, rs.getString(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.CHAR) {
                obj.put(column_name, rs.getString(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.NCHAR) {
                obj.put(column_name, rs.getNString(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.LONGNVARCHAR) {
                obj.put(column_name, rs.getNString(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.LONGVARCHAR) {
                obj.put(column_name, rs.getString(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.TINYINT) {
                obj.put(column_name, rs.getByte(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.SMALLINT) {
                obj.put(column_name, rs.getShort(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.DATE) {
                obj.put(column_name, rs.getDate(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.TIME) {
                obj.put(column_name, rs.getTime(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.TIMESTAMP) {
                obj.put(column_name, rs.getTimestamp(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.BINARY) {
                obj.put(column_name, rs.getBytes(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.VARBINARY) {
                obj.put(column_name, rs.getBytes(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.LONGVARBINARY) {
                obj.put(column_name, rs.getBinaryStream(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.BIT) {
                obj.put(column_name, rs.getBoolean(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.CLOB) {
                obj.put(column_name, rs.getClob(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.NUMERIC) {
                obj.put(column_name, rs.getBigDecimal(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.DECIMAL) {
                obj.put(column_name, rs.getBigDecimal(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.DATALINK) {
                obj.put(column_name, rs.getURL(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.REF) {
                obj.put(column_name, rs.getRef(column_name));
            } else if (rsmd.getColumnType(i) == java.sql.Types.STRUCT) {
                obj.put(column_name, rs.getObject(column_name)); // must be a custom mapping consists of a class that implements the interface SQLData and an entry in a java.util.Map object.
            } else if (rsmd.getColumnType(i) == java.sql.Types.DISTINCT) {
                obj.put(column_name, rs.getObject(column_name)); // must be a custom mapping consists of a class that implements the interface SQLData and an entry in a java.util.Map object.
            } else if (rsmd.getColumnType(i) == java.sql.Types.JAVA_OBJECT) {
                obj.put(column_name, rs.getObject(column_name));
            } else {
                obj.put(column_name, rs.getString(i));
            }
        }

        json.put(obj);
    }

    return json;
}
    public static boolean sendPasswordOnMobile(String mobile,String password){
        System.out.println("in side send pass  mobile-->"+mobile+"    password---->"+password);
        return true;
    }

    public static int getRandomNo() {
        int a=(int)(Math.random()*9999)+1000;
        if(a>9999){
            a=a-1000;
        }
        if(a<1000){
            a=a+1000;
        }
        return 1111;
    }

    public static void sendMsg(String moblie,String msg) {
        System.out.println("inside send msg");
        System.out.println("inside send msg  mobile -> "+moblie);
        System.out.println("inside send msg msg ->"+msg);
        try{
    //Your authentication key
            String authkey = "62790APSpb3EcLh52e75788";
            //Multiple mobiles numbers seperated by comma
            String mobiles = moblie;
            //Sender ID,While using route4 sender id should be 6 characters long.
            String senderId = "VADTAL";
            //Your message to send, Add URL endcoding here.
            String message = msg;
            //define route
            String route="4";

            //Prepare Url
            URLConnection myURLConnection=null;
            URL myURL=null;
            BufferedReader reader=null;

            //encoding message 
            String encoded_message=URLEncoder.encode(message);

            //Send SMS API
            String mainUrl="http://control.msg91.com/sendhttp.php?";

            //Prepare parameter string 
            StringBuilder sbPostData= new StringBuilder(mainUrl);
            sbPostData.append("authkey="+authkey); 
            sbPostData.append("&mobiles="+mobiles);
            sbPostData.append("&message="+encoded_message);
            sbPostData.append("&route="+route);
            sbPostData.append("&sender="+senderId);

            //final string
            mainUrl = sbPostData.toString();
            try
            {
                    //prepare connection
                    myURL = new URL(mainUrl);
                    myURLConnection = myURL.openConnection();
                    myURLConnection.connect();
                    reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
                    //reading response 
                    String response;
                    while ((response = reader.readLine()) != null) 
                    //print response 
                    System.out.println(response);

                    //finally close connection
                    reader.close();
                     System.out.println("msg sent moblie-->"+moblie);
                    System.out.println("msg sent msg-->"+msg);
            } 
            catch (Exception e) 
            { 
                    e.printStackTrace();
            } 
    }catch(Exception e){
        
    }
    }
    public static String generatePassword(){
        String uuid = UUID.randomUUID().toString();
        String password = uuid.substring(0,6);
        System.out.println("password--->"+password);
        return password;
    }
    
    public static HashMap<String,String> getKeyIdMap(String tableName){
        try {
            ResultSetWrapper resultSetWrapper  = new ResultSetWrapper();
            ResultSet rs = resultSetWrapper.executeQuery("select * from "+tableName);
            HashMap<String,String> map = new HashMap<String, String>();
            while(rs.next()){
                map.put(rs.getString(1), rs.getString(2));
            }
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
