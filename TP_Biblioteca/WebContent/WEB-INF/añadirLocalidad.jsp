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

<title>Añadir Localidad</title>
<link rel="stylesheet" href="estilos/tabla.css">
</head>
<body>
<form action="ServletLocalidad?accion=agregar" method="post">
				<input class="controlr" type="text" placeholder="Ingrese el nombre de la localidad" maxlength="20" name="nombre"required>		
				<button class="button" type="submit">Añadir Localidad</button>
			</form>
<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>
<% if(localidad!=null){%>
    <div id="tabla">
        <p>Se añadio exitosamente la localidad:</p>
        <table>
            <thead>
                <tr>
                    <th>Numero</th><th>Localidad</th> 
                </tr>
            </thead>
            <tr>
                <td> <%=localidad.getId()%></td>
                <td> <%=localidad.getNombre()%></td>                    
            </tr>
        </table>
    </div>
<%}%>    

</body>
</html>