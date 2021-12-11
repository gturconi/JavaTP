<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Localidad</title>
</head>
<body>
<h1>Eliminacion de localidad</h1>
<form class="formularioEliminar" action="ServletLocalidad?accion=borrar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id de la localidad" maxlength="10" name="id"required>
				<button id="botonEliminar" class="button" type="submit">Borrar Localidad</button>
			</form>
<%if(null != request.getAttribute("exito")){
	  out.println(request.getAttribute("exito"));  
  }else if(request.getAttribute("error") != null){
	  out.println(request.getAttribute("error"));
  }	  
  %>
</body>
</html>