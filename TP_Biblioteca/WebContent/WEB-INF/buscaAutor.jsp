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
<title>Buscar Autor</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/buscar.css">
</head>
<body>     
    <h1>Busqueda de Autor</h1>
    <form class="formularioBusqueda" action="ServletAutor?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id del autor " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Autor</button>
	</form>
<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>	
<% if(autor!=null){%>	
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
<%}%> 
</body>
</html>