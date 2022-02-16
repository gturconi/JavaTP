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
<link rel="icon" href="icons/categoria.ico">
<title>Listado Categorias</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
 <link rel="stylesheet" href="estilos/header.css">
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

<h1> Listado de Categorias</h1>
	 	
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
                     <td data-label="eliminar">
                      <form class="formularioEliminar" action="ServletCategoria?accion=borrar" method="post">				
				         
				           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>				           				           
				           <input type="hidden" value=<%=String.valueOf(c.getId())%> name="id">  </input>
			          </form>                                                  
                     </td> 
                     <td data-label="modificar">
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
        <input id="campoTexto" type="text" placeholder="Nombre de la categoria " maxlength="10" name="nombre" required> 
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