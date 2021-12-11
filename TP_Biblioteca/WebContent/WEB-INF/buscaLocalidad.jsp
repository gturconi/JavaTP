<%@page import="entities.Localidad" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Localidad localidad = (Localidad)request.getAttribute("Localidad");  
%>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/buscar.css">
<title>Buscar Localidad</title>
</head>
<body>
   <h1>Busqueda de Localidad</h1>
    <form class="formularioBusqueda" action="ServletLocalidad?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id de la localidad " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Localidad</button>
	</form>
<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %> 

<% if(localidad!=null){%>	
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Id</th><th>Localidad</th> 
                </tr>
            </thead>
            <tr>
                <td> <%=String.valueOf(localidad.getId())%></td>
                <td> <%=localidad.getNombre()%></td>                    
            </tr>
        </table>
    </div>
<%}%>


</body>
</html>