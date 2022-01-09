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
<title>Localidades</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
 <link rel="stylesheet" href="estilos/header.css">
<link rel="icon" href="icons/localidad.ico">
</head>
<body>      


<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
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
                <td>
                      <form action="ServletLocalidad?accion=borrar" method="post">
                           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>								           
				           <input type="hidden" value=<%=String.valueOf(loc.getId())%> name="id">  </input>
			          </form>                                                  
                     </td> 
                     <td>
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
        <input id="campoTexto" type="text" placeholder="Ingrese id " maxlength="10" name="id" required> 
        <button id= "boton" type="submit">Buscar Localidad</button>
       </form>  
    </div>  
    <% if(admin == 1){ %>
    <div class="card">
      <img src="pictures/añadir.png" alt="">
      <h4> Añadir </h4>  
      <form class="formulario" action="ServletMenu?accion=anadirLocalidad" method="post">       
         <button id="boton_Añadir" type="submit">Añadir Localidad</button>
      </form>
      <%}%> 
    </div>  
</div>


</body>
</html>