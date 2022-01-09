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
    Cliente c = (Cliente) request.getAttribute("Cliente");        
%>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/registro.css">
<link rel="stylesheet" type="text/css" href="estilos/header.css">
<link rel="icon" href="icons/libro.ico">
<title>Modificar Cuenta</title>
</head>
<body>

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
        <input class="controlr" type="text" name="name" placeholder="Nombre" value=<%=c.getNombre()%> required>
        <input class="controlr" type="text" name="surname"   placeholder="Apellido" value=<%=c.getApellido()%> required >
        <input class="controlr" type="text" name="address" placeholder="Domicilio" value=<%=c.getDomicilio()%> required >
        <input class="controlr" type="text" name="tel" placeholder="Telefono" value=<%=c.getTelefono()%> required >
        <input class="controlr" type="text" name="email" placeholder="Email" value=<%=c.getEmail()%> required >                                
          <select name="city" class="controlr" required>
 <option style="display: none;" <%=c.getLocalidad().getNombre()%> selected><%=c.getLocalidad().getNombre()%></option>  
          <% 
             for(Localidad loc:localidades){
            	 if(!(c.getLocalidad().getNombre().equals(loc.getNombre()))){
            	   %> <option value='<%=loc.getId()%>'><%=loc.getNombre()%></option>
          <%}
             }          
          %>                              
</select>
<input class="controlr" type="text" name="user" placeholder="Usuario" required >
<input class="controlr" type="password" name="pass" placeholder="Contraseña" required >                   
  <input class="button1" type="submit" name="send" value="Actualizar datos">                      
        </form>
      </div>
    </div>
</section>    

<%if(null != request.getAttribute("exito")){
	  out.println(request.getAttribute("exito"));  
  }else if(null != request.getAttribute("errorMensaje")){
	  out.println(request.getAttribute("errorMensaje"));
  }	  
  %>

</body>
</html>