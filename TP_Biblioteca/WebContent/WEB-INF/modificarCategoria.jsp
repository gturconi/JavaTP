<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Categoria</title>
</head>
<body>
<h1>Modificacion de autor</h1>
<form class="formularioModificar" action="ServletCategoria?accion=modificar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese el id de la categoria" maxlength="10" name="id"required>
				<input id="campoTexto" type="text" placeholder="Ingrese la nueva descripcion de la categoria" maxlength="20" name="descripcion"required>				
				<button id="botonModificar" type="submit">Modificar Categoria</button>
			</form>
<%if(null != request.getAttribute("exito")){
	  out.println(request.getAttribute("exito"));  
  }else if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));
  }	  
  %>
</body>
</html>