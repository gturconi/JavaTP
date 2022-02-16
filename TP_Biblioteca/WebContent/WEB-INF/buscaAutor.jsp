<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Autor autor = (Autor)request.getAttribute("Autor");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/autor.ico">
<title>Buscar Autor</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/header.css">
<link rel="stylesheet" type="text/css" href="estilos/mensaje.css">
 <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
</head>
<body>   


<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
                   <div>
                <% if(admin != 1){ %>  
                <form action="ServletMenu?accion=irMenuCliente" method="post">
						<button class="botonAtras" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                 <%}%>
                    <% if(admin == 1){ %>
                 <form action="ServletMenu?accion=irMenuAdmin" method="post">
						<button class="botonAtras" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                    <%}%> 
                	
				</div>
            </div>
        </nav> 
</header>





  <h1>Busqueda de Autor</h1>

 <div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletAutor?accion=buscar" method="post">
        <input id="campoTextoAutor" type="text" placeholder="Nombre del autor" maxlength="20" name="nombre" required>
	    <input id="campoTextoAutor" type="text" placeholder="Apellido del autor" maxlength="20" name="apellido" required>               
        <button id= "boton" type="submit">Buscar Autor</button>
       </form>  
    </div>  

<%if(null != request.getAttribute("error")){
	%><p id="mensaje"><%out.println(request.getAttribute("error"));%> </p><%    
  }	  
  %>	
<% if(autor!=null){%>	
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Numero</th>
                    <th>Nombre</th>
                    <th>Apellido</th><% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%> 
                </tr>
            </thead>
            <tr>
                <td data-label="id"> <%=String.valueOf(autor.getId())%></td>
                <td data-label="nombre"> <%=autor.getNombre()%></td>  
                <td data-label="apellido"> <%=autor.getApellido()%></td>
                <% if(admin == 1){ %>
                <td data-label="eliminar">
                      <form class="formularioEliminar" action="ServletAutor?accion=borrar" method="post">				
				           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>
				           <input type="hidden" value=<%=String.valueOf(autor.getId())%> name="id">  </input>
			          </form>                                                  
                     </td>
                      
                     <td data-label="modificar">
                       <form action="ServletMenu?accion=modificarAutor" method="post">				 
								<input type="image"  id="button" src="icons/pencil.png"/>
								 <input type="hidden" value=<%=String.valueOf(autor.getId())%> name="id">  </input>					
			            </form>
                     </td>  
                  <%}%>   
            </tr>
        </table>        
    </div>
<%}%> 
</body>
</html>