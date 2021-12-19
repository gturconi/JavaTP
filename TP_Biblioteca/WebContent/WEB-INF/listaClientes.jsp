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
</head>
<body>
   <form class="formularioBusqueda" action="ServletCliente?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id del cliente " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Cliente</button>
	</form>
    <h1>
        Listado de clientes
    </h1>
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Numero</th><th>Nombre</th><th>Apellido</th>
                    <th>Usuario</th><th>Password</th><th>Domicilio</th>
                    <th>Telefono</th><th>Email</th><th>Fecha Inscripcion</th>
                    <th>Localidad</th><th>Estado</th>
                    
                    <% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%>
                </tr>
            </thead>
            <tr>
            <%for(Cliente cli : clientes){ %>
                <td> <%=cli.getId()%></td><td> <%=cli.getNombre()%></td><td> <%=cli.getApellido()%></td>
                <td> <%=cli.getUser()%></td><td> <%=cli.getPassword()%></td><td> <%=cli.getDomicilio()%></td>
                <td> <%=cli.getTelefono()%></td><td> <%=cli.getEmail()%></td><td> <%=cli.getFechaInscripcion()%></td>
                <td> <%=cli.getLocalidad().getNombre()%></td><td> <%=cli.getEstado()%></td>
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
        </table>
    </div>                               
</body>
</html>