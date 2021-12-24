<%@page import="entities.Localidad" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
</body>
</html>