<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   String id = (String) request.getAttribute("id");      
%>
<meta charset="ISO-8859-1">
<title>Editar Localidad</title>
</head>
<body>
<h1>Modificacion de localidad</h1>
<form class="formularioModificar" action="ServletLocalidad?accion=modificar" method="post">
				<input type="hidden" value=<%=id%> name="id">  </input>
				<input id="campoTexto" type="text" placeholder="Ingrese el nuevo nombre de la localidad" maxlength="20" name="nombre"required>				
				<button id="botonModificar" type="submit">Modificar Localidad</button>
			</form>
</body>
</html>