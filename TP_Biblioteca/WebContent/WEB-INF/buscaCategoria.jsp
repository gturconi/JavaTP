<%@page import="entities.Categoria" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Categoria categoria = (Categoria)request.getAttribute("Categoria");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<title>Buscar Categoria</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
</head>
<body>
   <h1>Busqueda de Categoria</h1>

     <div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletCategoria?accion=buscar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese id " maxlength="10" name="id" required> 
        <button id= "boton" type="submit">Buscar Categoria</button>
       </form>  
    </div>  
  </div> 

<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %> 

<% if(categoria!=null){%>	
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Id</th><th>Categoria</th><% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%> 
                </tr>
            </thead>
            <tr>
                <td data-label="id"> <%=String.valueOf(categoria.getId())%></td>
                <td data-label="nombre"> <%=categoria.getDescripcion()%></td>
                <% if(admin == 1){ %>
                <td>                
                <form class="formularioEliminar" action="ServletCategoria?accion=borrar" method="post">				
				           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>
				           <input type="hidden" value=<%=String.valueOf(categoria.getId())%> name="id">  </input>
			          </form>                                                  
                 </td> 
                 <td>
                       <form action="ServletMenu?accion=modificarCategoria" method="post">				 
								<input type="image"  id="button" src="icons/pencil.png"/>
								 <input type="hidden" value=<%=String.valueOf(categoria.getId())%> name="id">  </input>					
			            </form>  
			     </td>  
			      <%}%>                       
            </tr>            
        </table>
    </div>
<%}%>


</body>
</html>