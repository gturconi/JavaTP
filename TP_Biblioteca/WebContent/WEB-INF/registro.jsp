<%@page import="java.util.LinkedList" %>
<%@page import="entities.Localidad" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/registro.css">
<link rel="stylesheet" type="text/css" href="estilos/mensaje.css">
<link rel="stylesheet" href="estilos/header.css">
<link rel="icon" href="icons/libro.ico">
  <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>


<%
   LinkedList<Localidad> localidades = (LinkedList<Localidad>)request.getAttribute("Localidades");   
%>

<title>Registrarse</title>
</head>
<body class="cuerpo">
<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
                   <form action="ServletLogin?accion=irLogin" method="post">
						<button class="botonAtras" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
            </div>
        </nav> 
</header>

<div class="contenedor">
 <section class="form-registrar">
      <div class="contacto">
        <h5> Regístrate</h5>
        </br>
        <form class="formulario" action="ServletLogin" method="post">
        <input class="controlr" type="text" name="name" placeholder="Nombre" required>
        <input class="controlr" type="text" name="surname" placeholder="Apellido" required >
        <input class="controlr" type="text" name="address" placeholder="Domicilio" required >
        <input class="controlr" type="text" name="tel" placeholder="Telefono" required >
        <input class="controlr" type="text" name="email" placeholder="Email" required >                                
          <select name="city" class="controlr" required>
 <option style="display: none;" value="" selected>Localidad</option>  
          <% 
             for(Localidad loc:localidades){
            	 %> <option value='<%=loc.getId()%>'><%=loc.getNombre()%></option>
          <%
             }          
          %>                              
</select>
<input class="controlr" type="text" name="user" placeholder="Usuario" required >
<input class="controlr" type="password" name="pass" placeholder="Contraseña" required >                   
  <input class="button1" type="submit" name="send" value="Registrar">                      
        </form>
      </div>
    </div>
</section>    
  </div>
<%if(null != request.getAttribute("altaMensaje")){
	%><p id="mensaje"><% out.println(request.getAttribute("altaMensaje"));%> </p> <% 
  }else if(null != request.getAttribute("errorMensaje")){
	  %><p id="mensaje"><% out.println(request.getAttribute("errorMensaje"));%> </p><%
  }else if(null != request.getAttribute("errorConexion")){
	  %><p id="mensaje"><%out.println(request.getAttribute("errorConexion"));%> </p><%
  }     
  %>


</body>
</html>