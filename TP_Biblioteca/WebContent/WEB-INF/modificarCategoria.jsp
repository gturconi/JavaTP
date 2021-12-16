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
</head>
<body>
<h1>Modificacion de autor</h1>
            <form class="formularioModificar" action="ServletCategoria?accion=modificar" method="post">
                <input type="hidden" value=<%=id%> name="id">  </input>				
				<input id="campoTexto" type="text" placeholder="Ingrese la nueva descripcion de la categoria" maxlength="20" name="descripcion"required>				
				<button id="botonModificar" type="submit">Modificar Categoria</button>
			</form>
</body>
</html>