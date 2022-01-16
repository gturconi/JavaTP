<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/login.css">
<link rel="stylesheet" href="estilos/header.css">
<link rel="icon" href="icons/libro.ico">
  <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
<title>Iniciar Sesion</title>
</head>
<body class="cuerpo">
<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
                  <form action="ServletLogin?accion=irIndex" method="post">
						<button class="botonAtras" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
            </div>
              
        </nav> 
</header>

<form class="form-login" action="ServletLogin" method="post">
  <h5>Biblioteca</h5>
  <input class="controls" type="text" name="user" placeholder="Usuario" >
  <input class="controls" type="password" name="pass" placeholder="Contraseña" >  
    
  <%if(null != request.getAttribute("mensaje")){
	  out.println(request.getAttribute("mensaje"));  
  }else if(null != request.getAttribute("baja")){
	  out.println(request.getAttribute("baja"));  
  }     
  %>
  
 <button name="btn1" class="button">Ingresar</button>
 <button name="btn2" class="button">Registrarse</button>
</form>

</body>
</html>