<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/formulario.css">
<title>Insert title here</title>
</head>
<body>

<div class="contenedor">
      <div class="contacto">
        <h3>REGISTRO</h3>
        </br>
        <form class="formulario" action="ServletLogin" method="post">
          <p>
            <label>Nombre</label>
            <input type="text" name="name" required>
          </p>
          <p>
            <label>Apellido</label>
           <input type="text" name="surname" required>
          </p>
          <p>
           <label>Domicilio</label>
            <input type="text" name="address" required>
          </p>
          <p>
           <label>Telefono</label>
            <input type="text" name="tel" required>
          </p>
          <p>
            <label>Email</label>
            <input type="email" name="email" required>
          </p>
           <label>Localidad</label>           
          <select name="city" id="">          
 <option value="Cañada de Gomez">Cañada de Gomez</option>
 <option value="Casilda">Casilda</option>
 <option value="Pujato">Pujato</option>
 <option value="Rosario">Rosario</option>     
</select>
<p>
            <label>Usuario</label>
            <input type="text" name="user" required>           
          </p>
          <p>
            <label>Contraseña</label>
            <input type="password" name="pass" required>
          </p>
   </textarea>
   <br />
          </p>
          <p class="full">
            <button class="boton-enviar" name="send">Enviar</button>
          </p>
        </form>
      </div>
    </div>
  </div>
<%if(null != request.getAttribute("altaMensaje")){
	  out.println(request.getAttribute("altaMensaje"));  
  }     
  %>


</body>
</html>