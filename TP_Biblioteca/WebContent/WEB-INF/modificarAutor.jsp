<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/modificar.css">
<title>Editar Autor</title>
</head>
<body>
	<h1>Modificacion de autor</h1>
<form class="formularioModificar" action="ServletAutor?accion=modificar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese el id del autor" maxlength="10" name="id"required>
				<input id="campoTexto" type="text" placeholder="Ingrese el nuevo nombre del autor" maxlength="20" name="nombre"required>
				<input id="campoTexto" type="text" placeholder="Ingrese el nuevo apellido del autor" maxlength="20" name="apellido"required>
				<button id="botonModificar" type="submit">Modificar Autor</button>
			</form>
<%if(null != request.getAttribute("exito")){
	  out.println(request.getAttribute("exito"));  
  }else if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));
  }	  
  %>		
</body>
</html>