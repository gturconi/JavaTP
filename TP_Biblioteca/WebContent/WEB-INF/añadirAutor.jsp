<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Añadir Autor</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">

<body>

<h1>Añadir Autor</h1>


<div class="containerAutor">
    <div class="cardAutor">
      <img src="pictures/añadir.png" alt="">
      <h4> Añadir </h4>
      <form class="formulariAutor" action="ServletAutor?accion=agregar" method="post">
        <input id="campoTextoAutor" type="text" placeholder="Ingrese el nombre " maxlength="20" name="nombre" required> 
        <input id="campoTextoAutor" type="text" placeholder="Ingrese el apellido " maxlength="20" name="apellido" required> 
        <button id="botonAutor" type="submit">Añadir Autor</button>
       </form>  
    </div>  
</div>

<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>			
</body>
</html>