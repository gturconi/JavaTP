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
<title>Autor</title>
<link rel="stylesheet" href="estilos/tabla.css">
</head>
<body>
    <!--<%=autor.toString()%> ¿Para que sive? lo comente porque quizas no es necesario--> 
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Numero</th><th>Nombre</th><th>Apellido</th> 
                </tr>
            </thead>
            <tr>
                <td> <%=String.valueOf(autor.getId())%></td>
                <td> <%=autor.getNombre()%></td>  
                <td> <%=autor.getApellido()%></td>  
            </tr>
        </table>
    </div>
</body>
</html>