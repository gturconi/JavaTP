<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/login.css">
<link rel="icon" href="icons/libro.ico">
<title>Iniciar Sesion</title>
</head>
<body class="cuerpo">
<br />
<br />

<form class="form-login" action="ServletLogin" method="post">
  <h5>Biblioteca</h5>
  <input class="controls" type="text" name="user" placeholder="Usuario" >
  <input class="controls" type="password" name="pass" placeholder="Contraseña" >  
    
  <%if(null != request.getAttribute("errorMensaje")){
	  out.println(request.getAttribute("errorMensaje"));  
  }else if(null != request.getAttribute("baja")){
	  out.println(request.getAttribute("baja"));  
  }     
  %>
  
 <button name="btn1" class="button">Ingresar</button>
 <button name="btn2" class="button">Registrarse</button>
</form>

</body>
</html>