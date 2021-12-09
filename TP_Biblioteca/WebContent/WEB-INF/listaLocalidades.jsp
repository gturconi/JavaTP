<%@page import="java.util.LinkedList" %>
<%@page import="entities.Localidad" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Localidad> localidades = (LinkedList<Localidad>)request.getAttribute("Localidades");  
%>

<meta charset="ISO-8859-1">
<title>Localidades</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="icon" href="icons/localidad.ico">
</head>
<body>
    <div id="tabla">
        <table>
             <thead>
                <tr>
                  <th>Numero</th><th>Nombre</th>
              </tr>
             </thead>
            <tr>
            <%for(Localidad loc : localidades){ %>
                <td> <%=loc.getId()%></td><td> <%=loc.getNombre()%></td> 
            </tr> 
             <%}%>
        </table>
    </div>
</body>
</html>