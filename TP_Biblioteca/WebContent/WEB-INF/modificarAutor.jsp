<%@page import="entities.Autor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Autor a = (Autor) request.getAttribute("Autor");        
%>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="icon" href="icons/autor.ico">
<title>Editar Autor</title>
</head>
<body>
	<h1>Modificacion de Autor</h1>

<div class="containerAutor">
    <div class="cardAutor">
      <img src="pictures/modificar.png" alt="">
      <h4> Modificar </h4>
      <form class="formularioAutor" action="ServletAutor?accion=modificar" method="post">
			<input type="hidden" value=<%=a.getId()%> name="id"> 
			<input id="campoTextoAutor" type="text" value=<%=a.getNombre()%> maxlength="20" name="nombre"required>
			<input id="campoTextoAutor" type="text" value=<%=a.getApellido()%> maxlength="20" name="apellido"required>				
			<button id="botonAutor" type="submit">Modificar Autor</button>
	  </form>
    </div>  
</div>

</body>
</html>