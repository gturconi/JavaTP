<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<!DOCTYPE html>
<html>
<head>
<%
   String id = (String) request.getAttribute("id");      
%>
<meta charset="ISO-8859-1">
<title>Editar Categoria</title>
<link rel="stylesheet" href="estilos/busqueda.css">
</head>
<body>
<h1>Modificacion de Categoria</h1>

<div class="container">
    <div class="card">
      <img src="pictures/modificar.png" alt="">
      <h4> Modificar </h4>
      <form class="formulario" action="ServletCategoria?accion=modificar" method="post">
			<input type="hidden" value=<%=id%> name="id"> 
			<input id="campoTexto" type="text" placeholder="Ingrese la nueva descripcion" maxlength="20" name="descripcion"required>				
			<button id="boton" type="submit">Modificar Categoria</button>
	  </form>
    </div>  
</div>
</body>
</html>