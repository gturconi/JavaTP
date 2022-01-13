<%@page import="entities.Categoria" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/categoria.ico">
<title>Añadir Categoria</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/header.css">
<link rel="stylesheet" type="text/css" href="estilos/mensaje.css">
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

<h1>Añadir Categoria</h1>


<div class="container">
    <div class="card">
      	<img src="pictures/añadir.png" alt="">
     	 <h4> Añadir </h4>
      		<form class="formulario" action="ServletCategoria?accion=agregar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese la descripcion" maxlength="20" name="descripcion"required>		
				<button id="boton" type="submit">Añadir Categoria</button>
			</form>
    </div>  
</div>

<%if(null != request.getAttribute("error")){
	%><p id="mensaje"><%out.println(request.getAttribute("error"));%> </p><%    
  }	  
  %>
</body>
</html>