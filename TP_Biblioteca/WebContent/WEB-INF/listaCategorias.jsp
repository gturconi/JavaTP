<%@page import="java.util.LinkedList" %>
<%@page import="entities.Categoria" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Categoria> categorias = (LinkedList<Categoria>)request.getAttribute("Categorias");  
%>
<meta charset="ISO-8859-1">
<title>Categoria</title>
</head>
<body>
  <div id="tabla">
        <table>
             <thead>
                <tr>
                  <th>Numero</th><th>Descripcion</th>
              </tr>
             </thead>
            <tr>
            <%for(Categoria c : categorias){ %>
                <td> <%=c.getId()%></td><td> <%=c.getDescripcion()%></td> 
            </tr> 
             <%}%>
        </table>
    </div>
</body>
</html>