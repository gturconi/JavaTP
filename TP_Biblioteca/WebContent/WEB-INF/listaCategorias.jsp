<%@page import="java.util.LinkedList" %>
<%@page import="entities.Categoria" %>
<%@page import="entities.Cliente" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Categoria> categorias = (LinkedList<Categoria>)request.getAttribute("Categorias");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<title>Categoria</title>
<link rel="stylesheet" href="estilos/tabla.css">
</head>
<body>
    <form class="formularioBusqueda" action="ServletCategoria?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id de la categoria " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Categoria</button>
	</form>
	 	
  <div id="tabla">
        <table>
             <thead>
                <tr>
                  <th>Numero</th><th>Descripcion</th><% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%>
              </tr>
             </thead>
            <tr>
            <%for(Categoria c : categorias){ %>
                <td> <%=c.getId()%></td><td> <%=c.getDescripcion()%></td>
                <% if(admin == 1){ %>
                     <td>
                      <form class="formularioEliminar" action="ServletCategoria?accion=borrar" method="post">				
				         
				           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>				           				           
				           <input type="hidden" value=<%=String.valueOf(c.getId())%> name="id">  </input>
			          </form>                                                  
                     </td> 
                     <td>
                       <form action="ServletMenu?accion=modificarCategoria" method="post">
                                <input type="image"  id="button" src="icons/pencil.png"/>				 							
								 <input type="hidden" value=<%=String.valueOf(c.getId())%> name="id">  </input>					
			            </form>
                     </td>
                     <%}%>
            </tr> 
             <%}%>
        </table>
    </div>                        
                                    <% if(admin == 1){ %> 
                                    <form action="ServletMenu?accion=anadirCategoria" method="post">				 
                                        <button id="button" type="submit">Añadir Categoria</button>
                                    </form> 
                                    <%}%>    
</body>
</html>