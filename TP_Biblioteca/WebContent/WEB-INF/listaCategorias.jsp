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
<link rel="stylesheet" href="estilos/busqueda.css">
</head>
<body>
	 	
  <div id="tabla">
        <table id="myTable">
             <thead>
                <tr>
                  <th>Numero</th>
                  <th>Descripcion</th>
                  <% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%>
              </tr>
             </thead>
            <tr>
            <%for(Categoria c : categorias){ %>
                <td data-label="id"> <%=c.getId()%></td>
                <td data-label="descripcion"> <%=c.getDescripcion()%></td>
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

<div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletCategoria?accion=buscar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese id " maxlength="10" name="id" required> 
        <button id= "boton" type="submit">Buscar Categoria</button>
       </form>  
    </div>  
    
    <% if(admin == 1){ %>  
    <div class="card">
      <img src="pictures/añadir.png" alt="">
      <h4> Añadir </h4>
      <form class="formulario" action="ServletMenu?accion=anadirCategoria" method="post">      
         <button id="boton_Añadir" type="submit">Añadir Categoria</button>
      </form>
    </div> 
      <%}%>  
</div>

</body>
</html>