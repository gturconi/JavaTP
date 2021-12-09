<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Autor autor = (Autor)request.getAttribute("Autor");  
%>
<meta charset="ISO-8859-1">
<title>AutorNuevo</title>
<link rel="stylesheet" href="estilos/tabla.css">

<body>
    <div id="tabla">
        <p>Se añadio exitosamente el autor:</p>
        <table>
            <thead>
                <tr>
                    <th>Numero</th><th>Nombre</th><th>Apellido</th> 
                </tr>
            </thead>
            <tr>
                <td> <%=autor.getId()%></td>
                <td> <%=autor.getNombre()%></td>  
                <td> <%=autor.getApellido()%></td>  
            </tr>
        </table>
    </div>
</body>
</html>