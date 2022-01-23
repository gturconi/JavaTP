<%@page import="entities.Localidad" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
Localidad l = (Localidad) request.getAttribute("Localidad");  
Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/localidad.ico">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/header.css">
 <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
<title>Editar Localidad</title>

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

<h1>Modificacion de Localidad</h1>

<div class="container">
    <div class="card">
      <img src="pictures/modificar.png" alt="">
      <h4> Modificar </h4>
      <form class="formulario" action="ServletLocalidad?accion=modificar" method="post">
			<input type="hidden" value=<%=l.getId()%> name="id"> 
			<input id="campoTexto" type="text" value='<%=l.getNombre()%>' maxlength="20" name="nombre"required>				
			<button id="boton" type="submit">Modificar Localidad</button>
	  </form>
    </div>  
</div>
</body>
</html>