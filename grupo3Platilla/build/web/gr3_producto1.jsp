<%@page language="java" import="java.sql.*"%>
<% 
Connection g3_conexion=null;
String driver1="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/bd compras";
String usuario="humberto";
String clave1="manuelpacheco";
String mensaje="";
ResultSet tabla=null;

String numero=request.getParameter("numero");

try{
    Class.forName(driver1);
    g3_conexion=DriverManager.getConnection(url,usuario,clave1);

    Statement stproductos=g3_conexion.createStatement();
    
         
            tabla=stproductos.executeQuery("select dregcotiza.cantidad,productos.codprod,productos.nomcategoria,productos.nomproducto,productos.pcompra,productos.pventa from regcotiza inner join dregcotiza on regcotiza.numreg=dregcotiza.numreg inner join productos on productos.codprod = dregcotiza.copdrod  where regcotiza.numreg=2");
            
            out.println("<TABLE Border=2 CellPadding=2><TR>");
            //Definimos los campos que vamos a mostrar...
            out.println("<TH>CANTIDAD</TH><TH>COD.PRODUCTO</TH><TH>NOM.CATEGORIA</TH><TH>NOM.PRODOCTO</TH><TH>P.COMPRA</TH><TH>P.VENTA</TH>");
            out.println("</TR>");
            //Recien inicia la obtencion de la data
            while(tabla.next())
                    {
                        out.println("<TR>");
                        //Definimos el tipo de dato de cada campo a mostrar...
                        out.println("<TD>"+tabla.getInt(1)+"</TD>");
                        out.println("<TD>"+tabla.getInt(2)+"</TD>");
                        out.println("<TD>"+tabla.getString(3)+"</TD>");
                        out.println("<TD>"+tabla.getString(4)+"</TD>");
                        out.println("<TD>"+tabla.getDouble(5)+"</TD>");
                        out.println("<TD>"+tabla.getDouble(6)+"</TD>");
                        
                        out.println("</TR>");
                    }
            out.println("</TABLE>");
            tabla.close();
            g3_conexion.close();
        }
    catch(SQLException sqlerror){}
    %>