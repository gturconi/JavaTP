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
<link rel="stylesheet" href="estilos/busqueda.css">
</head>
<body>
    <h1>
        Listado de autores
    </h1>
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Numero</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%>
                </tr>
            </thead>
            <tr>
            <%for(Autor aut : autores){ %>
                <td data-label="id"> <%=aut.getId()%></td>
                <td data-label="nombre"> <%=aut.getNombre()%></td>
                <td data-label="apellido"> <%=aut.getApellido()%></td>
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

<div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletAutor?accion=buscar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese id  " maxlength="10" name="id" required>  
        <button id= "boton" type="submit">Buscar Autor</button>
       </form>  
    </div>  

    <% if(admin == 1){ %> 
    <div class="card">
      <img src="pictures/añadir.png" alt="">
      <h4> Añadir </h4> 
      <form class="formulario" action="ServletMenu?accion=anadirAutor" method="post">       
         <button id="boton_Añadir" type="submit">Añadir Autor</button>
      </form>
    </div>  
    <%}%> 
</div>

</body>
</html>