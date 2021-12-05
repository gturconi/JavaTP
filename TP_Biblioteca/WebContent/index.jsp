<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/login.css">

<title>Bienvenido</title>
</head>
<body>
<br />
<br />
<form class="form" action="ServletLogin" method="post">
  <h2>Biblioteca</h2>
  <p type="Usuario:"><input placeholder=" " name="user"></input></p>
  <p type="Contraseña:"><input placeholder=" " name="pass" type="password"></input></p>
  <%if(null != request.getAttribute("errorMensaje")){
	  out.println(request.getAttribute("errorMensaje"));  
  }     
  %>
  
  <table>
 <tr><th><button name="btn1">Ingresar</button></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
<th><button name="btn2">Registrarse</button></th></tr>
</table>
  <div>    
  </div>
</form>

</body>
</html>