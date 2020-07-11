<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabla Libro</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs; 
        %>
    </head>
    <body>
        <table border="1" cellspacing="0" cellpadding="" align = "center">
            <thead>
                <th>Autor</th>
                <th>Título</th>
                <th>Cantidad</th>
                <th>Año</th>
                <th>Editorial</th>
                <th>País</th>
                <th>Precio</th>
                <th>Estado</th>
            </thead>
        <%
            try {
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                consulta = "SELECT autor.NOMBRE,libro.TITULO,libro.cantidad,libro.ANIO,editorial.NOMBRE,pais.NOMBRE,libro.PRECIO,libro.ESTADO FROM autor,editorial,libro,pais where libro.IDAUTOR=autor.idautor and libro.IDEDITORIAL=editorial.IDEDITORIAL and libro.IDPAIS=pais.IDPAIS ORDER BY autor.NOMBRE,pais.NOMBRE,editorial.NOMBRE";
                
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%out.print(rs.getString(1));%></td> 
            <td><%out.print(rs.getString(2));%></td> 
            <td><%out.print(rs.getInt(3));%></td> 
            <td><%out.print(rs.getInt(4));%></td> 
            <td><%out.print(rs.getString(5));%></td> 
            <td><%out.print(rs.getString(6));%></td> 
            <td><%out.print(rs.getInt(7));%></td> 
            <td><%out.print(rs.getString(8));%></td> 
        </tr>                    
        <%
                }
            } catch (Exception e) {
                out.print("Error SQL");
            }
        %>
    </table>
</body>
</html>