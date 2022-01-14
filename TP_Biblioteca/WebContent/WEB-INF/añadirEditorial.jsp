<%@page import="entities.Editorial" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/editorial.ico">
<title>Añadir Editorial</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/header.css">
<link rel="stylesheet" type="text/css" href="estilos/mensaje.css">
 <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
</head>
<body>

<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
                <div>
                <% if(admin != 1){ %>  
                <form action="ServletMenu?accion=irMenuCliente" method="post">
						<button class="botonAtras" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                 <%}%>
                    <% if(admin == 1){ %>
                 <form action="ServletMenu?accion=irMenuAdmin" method="post">
						<button class="botonAtras" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                    <%}%> 
                	
				</div>	
            </div>
        </nav> 
</header>


<h1>Añadir Editorial</h1>

<div class="container">
    <div class="card">
      <img src="pictures/añadir.png" alt="">
      <h4> Añadir </h4>
      <form class="formulario" action="ServletEditorial?accion=agregar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese el nombre " maxlength="20" name="nombre" required> 
        <button id="boton" type="submit">Añadir Editorial</button>
       </form>  
    </div>  
</div>


<%if(null != request.getAttribute("error")){
	%><p id="mensaje"><%out.println(request.getAttribute("error"));%> </p><%    
  }	  
  %>
</body>
</html>