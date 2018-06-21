<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<% 
Connection g3_conexion=null;
String driver1="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/bd compras";
String usuario="humberto";
String clave1="manuelpacheco";
String mensaje="";
ResultSet rspr=null;

String numero=request.getParameter("numero");

try{
    Class.forName(driver1);
    g3_conexion=DriverManager.getConnection(url,usuario,clave1);

    PreparedStatement stmt = g3_conexion.prepareStatement("UPDATE regcotiza SET estado=0 where regcotiza.numreg="+numero);
    stmt.executeUpdate();
    stmt.close();
    
}
catch(Exception ex)
{
    mensaje=ex.toString();
    
    }
%>
