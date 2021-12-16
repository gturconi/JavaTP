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
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>

<meta charset="ISO-8859-1">
<title>Localidades</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="icon" href="icons/localidad.ico">
</head>
<body>
    <form class="formularioBusqueda" action="ServletLocalidad?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id de la localidad " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Localidad</button>
	</form>                           
    <div id="tabla">
        <table>
             <thead>
                <tr>
                  <th>Numero</th><th>Nombre</th><% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%>
              </tr>
             </thead>
            <tr>
            <%for(Localidad loc : localidades){ %>
                <td> <%=loc.getId()%></td><td> <%=loc.getNombre()%></td>
                <% if(admin == 1){ %>
                <td>
                      <form class="formularioEliminar" action="ServletLocalidad?accion=borrar" method="post">
                           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>								           
				           <input type="hidden" value=<%=String.valueOf(loc.getId())%> name="id">  </input>
			          </form>                                                  
                     </td> 
                     <td>
                       <form action="ServletMenu?accion=modificarLocalidad" method="post">
                                <input type="image"  id="button" src="icons/pencil.png"/>				 								
								 <input type="hidden" value=<%=String.valueOf(loc.getId())%> name="id">  </input>					
			            </form>
                     </td> 
                 <%}%>    
            </tr> 
             <%}%>
        </table>
    </div>
                                   <% if(admin == 1){ %>  
                                    <form action="ServletMenu?accion=anadirLocalidad" method="post">				 
								      <button id="button" type="submit">Añadir Localidad</button>
							        </form>
							       <%}%> 
</body>
</html>