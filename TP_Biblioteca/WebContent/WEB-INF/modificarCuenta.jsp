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
    Cliente c = (Cliente)session.getAttribute("Cliente");        
%>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/registro.css">
 <link rel="stylesheet" href="estilos/header.css">
 <link rel="stylesheet" type="text/css" href="estilos/mensaje.css">
<link rel="icon" href="icons/libro.ico">
<title>Modificar Cuenta</title>
</head>
<body style="background-color: #E9DAD7;" >

<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
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
 <option style="display: none;" <%=c.getLocalidad().getNombre()%> selected><%=c.getLocalidad().getNombre()%></option>             
            <% for(Localidad loc:localidades){            	 
               %> <option value='<%=loc.getId()%>'><%=loc.getNombre()%></option><%           
             }%>                                                  
                  </select>
           <input class="controlr" type="text" name="user" placeholder="Usuario" required >
           <input class="controlr" type="password" name="pass" placeholder="Contraseña" required >                   
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