<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Autor> autores = (LinkedList<Autor>)request.getAttribute("Autores");  
%>

<meta charset="ISO-8859-1">
<title>Autores</title>
<link rel="stylesheet" href="estilos/tabla.css">
</head>
<body>
    <h1>
        Listado de autores
    </h1>
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Numero</th><th>Nombre</th><th>Apellido</th><th>Eliminar</th><th>Modificar</th>
                </tr>
            </thead>
            <tr>
            <%for(Autor aut : autores){ %>
                <td> <%=aut.getId()%></td><td> <%=aut.getNombre()%></td><td> <%=aut.getApellido()%></td>
                <td>
                      <form class="formularioEliminar" action="ServletAutor?accion=borrar" method="post">				
				           <button id="botonEliminar" class="button" type="submit">Borrar Autor</button>
				           <input type="hidden" value=<%=String.valueOf(aut.getId())%> name="id">  </input>
			          </form>                                                  
                     </td> 
                     <td>
                       <form action="ServletMenu?accion=modificarAutor" method="post">				 
								<button id="button" type="submit">Modificar Autor</button>
								 <input type="hidden" value=<%=String.valueOf(aut.getId())%> name="id">  </input>					
			            </form>
                     </td>  
            </tr>
            <%}%>
        </table>
    </div>
</body>
</html>