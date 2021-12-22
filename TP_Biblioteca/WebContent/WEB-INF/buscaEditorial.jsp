<%@page import="entities.Editorial" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Editorial editorial = (Editorial)request.getAttribute("Editorial");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<title>Buscar Editorial</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
</head>
<body>
   <h1>Busqueda de Editorial</h1>

     <div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletEditorial?accion=buscar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese id " maxlength="10" name="id" required> 
        <button id= "boton" type="submit">Buscar Editorial</button>
       </form>  
    </div>  
  </div> 

<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %> 

<% if(editorial!=null){%>	
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Id</th><th>Editorial</th><% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%> 
                </tr>
            </thead>
            <tr>
                <td data-label="id"> <%=String.valueOf(editorial.getId())%></td>
                <td data-label="nombre"> <%=editorial.getNombre()%></td>
                <% if(admin == 1){ %>
                <td>                
                <form class="formularioEliminar" action="ServletEditorial?accion=borrar" method="post">				
				           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>
				           <input type="hidden" value=<%=String.valueOf(editorial.getId())%> name="id">  </input>
			          </form>                                                  
                 </td> 
                 <td>
                       <form action="ServletMenu?accion=modificarEditorial" method="post">				 
								<input type="image"  id="button" src="icons/pencil.png"/>
								 <input type="hidden" value=<%=String.valueOf(editorial.getId())%> name="id">  </input>					
			            </form>  
			     </td>  
			      <%}%>                       
            </tr>            
        </table>
    </div>
<%}%>


</body>
</html>