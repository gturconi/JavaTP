<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ServletAutor?accion=modificar" method="post">
				<input class="controlr" type="text" placeholder="Ingrese el id del autor" maxlength="10" name="id"required>
				<input class="controlr" type="text" placeholder="Ingrese el nuevo nombre del autor" maxlength="10" name="nombre"required>
				<input class="controlr" type="text" placeholder="Ingrese el nuevo apellido del autor" maxlength="10" name="apellido"required>
				<button class="button" type="submit">Modificar Autor</button>
			</form>
<%if(null != request.getAttribute("exito")){
	  out.println(request.getAttribute("exito"));  
  }else if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));
  }	  
  %>		
</body>
</html>