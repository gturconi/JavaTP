<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>AutorNuevo</title>
<link rel="stylesheet" href="estilos/tabla.css">

<body>
<form action="ServletAutor?accion=agregar" method="post">
				<input class="controlr" type="text" placeholder="Ingrese nombre del autor" maxlength="20" name="nombre"required>
				<input class="controlr" type="text" placeholder="Ingrese apellido del autor" maxlength="20" name="apellido" required> 
				<button class="button" type="submit">Añadir Autor</button>
			</form>
<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>			
</body>
</html>