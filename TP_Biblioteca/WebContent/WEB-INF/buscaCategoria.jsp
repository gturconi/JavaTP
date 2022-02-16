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
<link rel="icon" href="icons/categoria.ico">
<title>Buscar Categoria</title>
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





   <h1>Busqueda de Categoria</h1>

<div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletCategoria?accion=buscar" method="post">
        <input id="campoTexto" type="text" placeholder="Nombre de la categoria " maxlength="10" name="nombre" required> 
        <button id= "boton" type="submit">Buscar Categoria</button>
       </form>  
    </div>  

<%if(null != request.getAttribute("error")){
	%><p id="mensaje"><%out.println(request.getAttribute("error"));%> </p><%    
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
                <td data-label="eliminar">                
                <form class="formularioEliminar" action="ServletCategoria?accion=borrar" method="post">				
				           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>
				           <input type="hidden" value=<%=String.valueOf(categoria.getId())%> name="id">  </input>
			          </form>                                                  
                 </td> 
                 <td data-label="modificar">
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