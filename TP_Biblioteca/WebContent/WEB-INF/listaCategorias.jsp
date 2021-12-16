<%@page import="java.util.LinkedList" %>
<%@page import="entities.Categoria" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Categoria> categorias = (LinkedList<Categoria>)request.getAttribute("Categorias");  
%>
<meta charset="ISO-8859-1">
<title>Categoria</title>
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
                  <th>Numero</th><th>Descripcion</th><th>Eliminar</th><th>Modificar</th>
              </tr>
             </thead>
            <tr>
            <%for(Categoria c : categorias){ %>
                <td> <%=c.getId()%></td><td> <%=c.getDescripcion()%></td>
                     <td>
                      <form class="formularioEliminar" action="ServletCategoria?accion=borrar" method="post">				
				           <button id="botonEliminar" class="button" type="submit">Borrar Categoria</button>
				           <input type="hidden" value=<%=String.valueOf(c.getId())%> name="id">  </input>
			          </form>                                                  
                     </td> 
                     <td>
                       <form action="ServletMenu?accion=modificarCategoria" method="post">				 
								<button id="button" type="submit">Modificar Categoria</button>
								 <input type="hidden" value=<%=String.valueOf(c.getId())%> name="id">  </input>					
			            </form>
                     </td>
            </tr> 
             <%}%>
        </table>
    </div>      
                                    <form action="ServletMenu?accion=anadirCategoria" method="post">				 
                                        <button id="button" type="submit">A�adir Categoria</button>
                                    </form>     
</body>
</html>