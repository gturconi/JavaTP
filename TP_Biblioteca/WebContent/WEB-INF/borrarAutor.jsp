<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/borrar.css">
<title>Eliminar Autor</title>
</head>
<body>
	<h1>Eliminacion de autor</h1>
<form class="formularioEliminar" action="ServletAutor?accion=borrar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id del autor" maxlength="10" name="id"required>
				<button id="botonEliminar" class="button" type="submit">Borrar Autor</button>
			</form>
<%if(null != request.getAttribute("exito")){
	  out.println(request.getAttribute("exito"));  
  }else if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));
  }	  
  %>		
</body>
</html>