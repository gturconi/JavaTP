<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@page import="entities.Libro" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Libro l = (Libro)request.getAttribute("Libro");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/libros.ico">
<title>Buscar Libro</title>

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



<h1>Busqueda de Libro</h1>

<div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletLibro?accion=buscar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese id  " maxlength="10" name="id" required> 
        <button id= "boton" type="submit">Buscar Libro</button>
      </form>
    </div>  
  </div> 
 <!--  
<form class="formularioBusqueda" action="ServletLibro?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id del libro " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Libro</button>
	</form>
	--> 
<%if(null != request.getAttribute("error")){
	%><p id="mensaje"><%out.println(request.getAttribute("error"));%> </p><%    
  }	  
  %>
<%if(l != null){%>  	
<div id="tabla">
       <table>
            <thead>
                <tr>
                    <th>Portada</th>
                    <th>Id</th><th>Titulo</th><th>Descripcion</th>
                    <th>nroEdicion</th><th>fechaEdicion</th><th>Dimensiones</th>
                    <th>Paginas</th><th>Stock</th><th>Precio</th>
                    <th>Paginas</th><th>Editorial</th><th>Categoria</th>
                    <% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%> 
                    <th>Nombre Autor</th><th>Apellido Autor</th>
                                                                                                                    
                </tr>
            </thead>
            <tr>
               <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <img src="ServletLibro?id=<%=l.getId()%>" width="60px" height="60px"/> </td>
               <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getId()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getTitulo()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getDescripcion()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getNroEdicion()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getFechaEdicion()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getDimensiones()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getNroPaginas()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getExistencia()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getPrecio()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getNroPaginas()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getEditorial().getNombre()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getCategoria().getDescripcion()%></td>
                 <% if(admin == 1){ %>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>>
                      <form class="formularioEliminar" action="ServletLibro?accion=borrar" method="post">				
				           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>
				           <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>
			          </form>                                                  
                     </td>
                      
                    <td rowspan=<%=String.valueOf(l.getAutores().size())%>>
                       <form action="ServletMenu?accion=modificarLibro" method="post">				 
								<input type="image"  id="button" src="icons/pencil.png"/>
								 <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>					
			            </form>
                     </td>  
                    <%}%>                                                                           					                                                              
                   <%for(int i=0; i<l.getAutores().size();i++) {%>                             
                        <%if(i>0){%> <tr> <%}%> 
                        <td> <%=l.getAutores().get(i).getNombre()%></td> 
                        <td> <%=l.getAutores().get(i).getApellido()%></td>  
                        </tr>                                                     
                 <%}%>                                                                                                                               
        </table>
       </div>
<%}%>

</body>
</html>