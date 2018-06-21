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

    Statement stproductos=g3_conexion.createStatement();
    rspr=stproductos.executeQuery("SELECT  * from regcotiza where numreg="+numero);
}
catch(Exception ex)
{
    mensaje=ex.toString();
    
    }
%>
<script language="javascript">
 function anulando(x)
{ 
switch(x){
case 0:
    window.alert("el estado ya esta desbilitado ");
    
    
    
    break;
case 1:
       
       
       window.alert("se desabilito el estado ");
       

    
    break;
    }


} 

</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width='850'  border='0' cellspacing='0' cellpadding='0' >
           
            <% 
            while (rspr.next())
                { %>
                    <tr bgcolor='#F0F0F0'>   
                        
                   
                        <td width="127"><div align='center'><a value='<% out.print(String.valueOf(rspr.getInt(1))); %>'><span class='Estilo14'><% out.print(String.valueOf(rspr.getInt(1))); %></span></a></div></td>
                        <td width="102"><div align='center'><a value='<% out.print(String.valueOf(rspr.getInt(1))); %>'><span class='Estilo14'><% out.print(rspr.getString(2)); %></span></a></div></td>
                        <td width="113"><div align='center'><a value='<% out.print(String.valueOf(rspr.getInt(1))); %>'><span class='Estilo14'><% out.print(rspr.getString(3)); %></span></a></div></td>
                        <td width="164"><div align='center'><a value='<% out.print(String.valueOf(rspr.getInt(1))); %>'><span class='Estilo14'><% out.print(String.valueOf(rspr.getDouble(4))); %></span></a></div></td>
                        <td width="81"><div align='center'><a value='<% out.print(String.valueOf(rspr.getInt(1))); %>'><span class='Estilo14'><% out.print(String.valueOf(rspr.getInt(5))); %></span></a></div></td>
                        <td width="175"><div align='center'><a value='<% out.print(String.valueOf(rspr.getInt(1))); %>'><span class='Estilo14'><% out.print(String.valueOf(rspr.getInt(6))); %></span></a></div></td>
                        <td bordercolor="#F3F3F3" bgcolor="#F7F7F7" ><span class="Estilo51">
                    <label>
                        <input type="submit" name="Submit" value="" align="right"  style="background-image:url(imagnes/X.png);background-repeat:no-repeat;height:20px;width:20px;background-position:center;" onclick="anulando(<% out.print(String.valueOf(rspr.getInt(5))); %>);"></label>
                    
                         </span></td>
                    </tr>
            <% } %>
        </table>
    </body>
</html>