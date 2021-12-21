<%@page import="java.util.LinkedList" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Cliente> clientes = (LinkedList<Cliente>)request.getAttribute("Clientes");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<title>Clientes</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
</head>
<body>
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
                    <th>Estado</th>
                    
                    <% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%>
                </tr>
            </thead>
            <tbody>
            <tr>
             <%for(Cliente cli : clientes){ %>
                <td data-label="id"> <%=cli.getId()%></td>
                <td data-label="nombre"> <%=cli.getNombre()%></td>
                <td data-label="apellido"> <%=cli.getApellido()%></td>
                <td data-label="usuario"> <%=cli.getUser()%></td>
             <!--   <td> <%=cli.getPassword()%></td> -->
                <td data-label="domicilio"> <%=cli.getDomicilio()%></td>
                <td data-label="telefono"> <%=cli.getTelefono()%></td>
                <td data-label="email"> <%=cli.getEmail()%></td>
                <td data-label="fechaInscripcion"> <%=cli.getFechaInscripcion()%></td>
                <td data-label="localidad"> <%=cli.getLocalidad().getNombre()%></td>
                <td data-label="estado"> <%=cli.getEstado()%></td>
                <% if(admin == 1){ %>
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
                <%}%>     
            </tr>
            <%}%>
        </tbody>
        </table> 

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



                                  
</body>
</html>