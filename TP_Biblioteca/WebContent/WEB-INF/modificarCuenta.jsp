<%@page import="java.util.LinkedList" %>
<%@page import="entities.Localidad" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
    LinkedList<Localidad> localidades = (LinkedList<Localidad>)request.getAttribute("Localidades");
	Cliente c = (Cliente) (request.getSession().getAttribute("Cliente"));     
    int admin = c.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/registro.css">
 <link rel="stylesheet" href="estilos/header.css">
 <link rel="stylesheet" type="text/css" href="estilos/mensaje.css">
<link rel="icon" href="icons/libro.ico">
<script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
<title>Modificar Cuenta</title>
</head>
<body style="background-color: #E9DAD7;" >

<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
                <div>
                <% if(admin != 1){ %>  
                <form action="ServletMenu?accion=irMenuCliente" method="post">
						<button class="botonAtras" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                 <%}%>
                    <% if(admin == 1){ %>
                 <form action="ServletMenu?accion=irMenuAdmin" method="post">
						<button class="botonAtras" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                    <%}%> 
                	
				</div>	
            </div>
        </nav> 
</header>

<div class="contenedor">
 <section class="form-registrar">
      <div class="contacto">
        <h5> Ingrese los nuevos datos de su cuenta</h5>
        </br>
        <form class="formulario" action="ServletCliente?accion=actualizar" method="post">
        <input class="controlr" type="text" name="name" value='<%=c.getNombre()%>' required>
        <input class="controlr" type="text" name="surname" value='<%=c.getApellido()%>' required >
        <input class="controlr" type="text" name="address" value='<%=c.getDomicilio()%>' required >
        <input class="controlr" type="text" name="tel" value='<%=c.getTelefono()%>' required >
        <input class="controlr" type="text" name="email" value='<%=c.getEmail()%>' required >
                  <select name="city" class="controlr" required>
            <option value='<%=c.getLocalidad().getId()%>' selected><%=c.getLocalidad().getNombre()%></option>  
            <% for(Localidad loc:localidades){            	 
               %> <option value='<%=loc.getId()%>'><%=loc.getNombre()%></option><%           
             }%>                                                  
                  </select>
           <input class="controlr" type="text" name="user" value='<%=c.getUser()%>' required >
           <input class="controlr" type="password" name="pass" value='<%=c.getPassword()%>' required >                   
           <input class="button1" type="submit" name="send" value="Actualizar datos">                      
        </form>
      </div>
      </section>
    </div>                            
              
<%if(null != request.getAttribute("exito")){
	%><p id="mensaje"><%out.println(request.getAttribute("exito"));%></p><%  
  }else if(null != request.getAttribute("errorMensaje")){
	  %><p id="mensaje"><% out.println(request.getAttribute("errorMensaje"));%></p><%
  }	  
  %>

</body>
</html>