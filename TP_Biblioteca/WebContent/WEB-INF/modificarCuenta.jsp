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
<link rel="icon" href="icons/libro.ico">
<title>Modificar Cuenta</title>
</head>
<body style="background-color: #FFDEAD" >

<div class="contenedor">
 <section class="form-registrar">
      <div class="contacto">
        <h5> Ingrese los nuevos datos de su cuenta</h5>
        </br>
        <form class="formulario" action="ServletCliente?accion=actualizar" method="post">
        <input class="controlr" type="text" name="name" value=<%=c.getNombre()%> required>
        <input class="controlr" type="text" name="surname" value=<%=c.getApellido()%> required >
        <input class="controlr" type="text" name="address" value=<%=c.getDomicilio()%> required >
        <input class="controlr" type="text" name="tel" value=<%=c.getTelefono()%> required >
        <input class="controlr" type="text" name="email" value=<%=c.getEmail()%> required >                                
          <select name="city" class="controlr" required>
 <option style="display: none;" <%=c.getLocalidad().getNombre()%> selected><%=c.getLocalidad().getNombre()%></option>  
          <% 
             for(Localidad loc:localidades){
            	 if(!(c.getLocalidad().getNombre().equals(loc.getNombre()))){
            	   %> <option value='<%=loc.getNombre()%>'><%=loc.getNombre()%></option>
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