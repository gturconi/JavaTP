<%@page import="entities.Editorial" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>A�adir Editorial</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
</head>
<body>

<h1>A�adir Editorial</h1>

<div class="container">
    <div class="card">
      <img src="pictures/a�adir.png" alt="">
      <h4> A�adir </h4>
      <form class="formulario" action="ServletEditorial?accion=agregar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese el nombre " maxlength="20" name="nombre" required> 
        <button id="boton" type="submit">A�adir Editorial</button>
       </form>  
    </div>  
</div>


<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>
</body>
</html>