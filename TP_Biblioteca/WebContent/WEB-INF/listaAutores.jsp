<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Autor> autores = (LinkedList<Autor>)request.getAttribute("Autores");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>

<meta charset="ISO-8859-1">
<title>Autores</title>
<link rel="stylesheet" href="estilos/tabla.css">
</head>
<body>
     <form class="formularioBusqueda" action="ServletAutor?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id del autor " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Autor</button>
	</form>
    <h1>
        Listado de autores
    </h1>
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Numero</th><th>Nombre</th><th>Apellido</th><% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%>
                </tr>
            </thead>
            <tr>
            <%for(Autor aut : autores){ %>
                <td> <%=aut.getId()%></td><td> <%=aut.getNombre()%></td><td> <%=aut.getApellido()%></td>
                <% if(admin == 1){ %>
                <td>                
                      <form class="formularioEliminar" action="ServletAutor?accion=borrar" method="post">
                           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/> 								           
				           <input type="hidden" value=<%=String.valueOf(aut.getId())%> name="id">  </input>
			          </form>                                                  
                     </td> 
                     <td>
                       <form action="ServletMenu?accion=modificarAutor" method="post">				 
								<input type="image"  id="button" src="icons/pencil.png"/>
								 <input type="hidden" value=<%=String.valueOf(aut.getId())%> name="id">  </input>					
			            </form>
                     </td>  
                <%}%>     
            </tr>
            <%}%>
        </table>
    </div>
                                   <% if(admin == 1){ %> 
                                    <form action="ServletMenu?accion=anadirAutor" method="post">				 
                                        <button id="button" type="submit">Añadir Autor</button>
                                    </form>
                                   <%}%> 
</body>
</html>