<%@page import="java.util.LinkedList" %>
<%@page import="entities.Localidad" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Localidad> localidades = (LinkedList<Localidad>)request.getAttribute("Localidades");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>

<meta charset="ISO-8859-1">
<title>Listado Localidades</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
 <link rel="stylesheet" href="estilos/header.css">
<link rel="icon" href="icons/localidad.ico">
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



<h1> Listado de Localidades</h1>
              
        <table id="myTable">
             <thead>
                <tr>
                  <th>Numero</th>
                  <th>Nombre</th>
                  <% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%>
              </tr>
             </thead>
            <tr>
            <%for(Localidad loc : localidades){ %>
                <td data-label="id"> <%=loc.getId()%></td>
                <td data-label="nombre"> <%=loc.getNombre()%></td>
                <% if(admin == 1){ %>
                <td data-label="eliminar">
                      <form action="ServletLocalidad?accion=borrar" method="post">
                           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>								           
				           <input type="hidden" value=<%=String.valueOf(loc.getId())%> name="id">  </input>
			          </form>                                                  
                     </td> 
                     <td data-label="modificar">
                       <form action="ServletMenu?accion=modificarLocalidad" method="post">
                                <input type="image"  id="button" src="icons/pencil.png"/>				 								
								 <input type="hidden" value=<%=String.valueOf(loc.getId())%> name="id">  </input>					
			            </form>
                     </td> 
                 <%}%>    
            </tr> 
             <%}%>
        </table>



<div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletLocalidad?accion=buscar" method="post">
         <input id="campoTexto" type="text" placeholder="Nombre de la localidad " maxlength="10" name="nombre" required>
        <button id= "boton" type="submit">Buscar Localidad</button>
       </form>  
    </div>  
    <% if(admin == 1){ %>
    <div class="card">
      <img src="pictures/a?adir.png" alt="">
      <h4> A?adir </h4>  
      <form class="formulario" action="ServletMenu?accion=anadirLocalidad" method="post">       
         <button id="boton_A?adir" type="submit">A?adir Localidad</button>
      </form>
      <%}%> 
    </div>  
</div>


</body>
</html>