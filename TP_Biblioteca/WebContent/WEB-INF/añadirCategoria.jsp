<%@page import="entities.Categoria" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Añadir Categoria</title>
</head>
<body>
<form action="ServletCategoria?accion=agregar" method="post">
				<input class="controlr" type="text" placeholder="Ingrese la descripcion de la categoria" maxlength="20" name="descripcion"required>		
				<button class="button" type="submit">Añadir Categoria</button>
			</form>
<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>
</body>
</html>