<%@page import="entities.Localidad" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/localidad.ico">
<title>Añadir Localidad</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/header.css">
</head>
<body>

<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
            </div>
        </nav> 
</header>

<h1>Añadir Localidad</h1>

<div class="container">
    <div class="card">
      	<img src="pictures/añadir.png" alt="">
     	 <h4> Añadir </h4>
      		<form class="formulario" action="ServletLocalidad?accion=agregar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese el nombre" maxlength="20" name="nombre"required>		
				<button id="boton" type="submit">Añadir Localidad</button>
			</form>
    </div>  
</div>


<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>
</body>
</html>