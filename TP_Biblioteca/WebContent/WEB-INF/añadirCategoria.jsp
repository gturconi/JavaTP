<%@page import="entities.Categoria" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>A�adir Categoria</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
</head>
<body>

<h1>A�adir Categoria</h1>

<div class="container">
    <div class="card">
      <img src="pictures/a�adir.png" alt="">
      <h4> A�adir </h4>
      <form class="formulario" action="ServletCategoria?accion=agregar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese la descripcion " maxlength="20" name="descripcion" required> 
        <button id="boton" type="submit">A�adir Localidad</button>
       </form>  
    </div>  
</div>


<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>
</body>
</html>