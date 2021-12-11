<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Localidad</title>
</head>
<body>
<h1>Modificacion de localidad</h1>
<form class="formularioModificar" action="ServletLocalidad?accion=modificar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese el id de la localidad" maxlength="10" name="id"required>
				<input id="campoTexto" type="text" placeholder="Ingrese el nuevo nombre de la localidad" maxlength="20" name="nombre"required>				
				<button id="botonModificar" type="submit">Modificar Localidad</button>
			</form>
<%if(null != request.getAttribute("exito")){
	  out.println(request.getAttribute("exito"));  
  }else if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));
  }	  
  %>	
</body>
</html>