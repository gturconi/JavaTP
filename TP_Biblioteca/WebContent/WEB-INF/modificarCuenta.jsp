<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/registro.css">
<link rel="icon" href="icons/libro.ico">
<title>Modificar Cuenta</title>
</head>
<body>

<div class="contenedor">
 <section class="form-registrar">
      <div class="contacto">
        <h5> Ingrese los nuevos datos de su cuenta</h5>
        </br>
        <form class="formulario" action="ServletCliente?accion=actualizar" method="post">
        <input class="controlr" type="text" name="name" placeholder="Nombre" required>
        <input class="controlr" type="text" name="surname" placeholder="Apellido" required >
        <input class="controlr" type="text" name="address" placeholder="Domicilio" required >
        <input class="controlr" type="text" name="tel" placeholder="Telefono" required >
        <input class="controlr" type="text" name="email" placeholder="Email" required >                                
          <select name="city" class="controlr" required>
 <option style="display: none;" value="" selected>Localidad</option>                              
 <option value="Cañada de Gomez">Cañada de Gomez</option>
 <option value="Casilda">Casilda</option>
 <option value="Pujato">Pujato</option>
 <option value="Rosario">Rosario</option>     
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