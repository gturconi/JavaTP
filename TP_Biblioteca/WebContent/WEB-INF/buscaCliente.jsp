<%@page import="java.util.LinkedList" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Cliente cli = (Cliente)request.getAttribute("Cliente");
   Cliente user = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = user.getisAdmin();
%>
<meta charset="ISO-8859-1">
<title>Buscar cliente</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/header.css">
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



   <h1>Busqueda de Cliente</h1>
   
<div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletCliente?accion=buscar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese id  " maxlength="10" name="id" required> 
        <button id= "boton" type="submit">Buscar Cliente</button>
      </form>
    </div>  
  </div> 


<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>	

<% if(cli!=null){%>
      <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Numero</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <!--<th>Password</th> -->
                    <th>Domicilio</th>
                    <th>Telefono</th>
                    <th>Email</th>
                    <th>Fecha Inscripcion</th>
                    <th>Localidad</th>
                    <th>Administrador</th>
                    <th>Estado</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>                                        
                </tr>
            </thead>
            <tr>            
                <td data-label="id"> <%=cli.getId()%></td>
                <td data-label="nombre"> <%=cli.getNombre()%></td>
                <td data-label="apellido"> <%=cli.getApellido()%></td>
                <td data-label="usuario"> <%=cli.getUser()%></td>
              <!--<td> <%=cli.getPassword()%></td> -->
                <td data-label="domicilio"> <%=cli.getDomicilio()%></td>
                <td data-label="telefono"> <%=cli.getTelefono()%></td>
                <td data-label="email"> <%=cli.getEmail()%></td>
                <td data-label="fechaInscripcion"> <%=cli.getFechaInscripcion()%></td>
                <td data-label="localidadNombre"> <%=cli.getLocalidad().getNombre()%></td>
                <td data-label="admin"> <%=cli.getisAdmin()%></td>
                <td data-label="estado"> <%=cli.getEstado()%></td>                
                <td>                
                      <form class="formularioEliminar" action="ServletCliente?accion=eliminarCuenta" method="post">
                           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/> 								           
				           <input type="hidden" value=<%=String.valueOf(cli.getId())%> name="id">  </input>
			          </form>                                                  
                     </td> 
                     <td>
                       <form action="ServletMenu?accion=modificarCliente" method="post">				 
								<input type="image"  id="button" src="icons/pencil.png"/>
								 <input type="hidden" value=<%=String.valueOf(cli.getId())%> name="id">  </input>					
			            </form>
                     </td>                      
            </tr>            
        </table>
    </div>
<%}%> 

</body>
</html>