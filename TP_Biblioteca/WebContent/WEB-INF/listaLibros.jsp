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
   LinkedList<Libro> libros = (LinkedList<Libro>)request.getAttribute("Libros");
   LinkedList<Libro> librosPedidos = (LinkedList<Libro>)request.getAttribute("LibrosPedidos");
   LinkedList<Libro> librosRetirados = (LinkedList<Libro>)request.getAttribute("LibrosRetirados");
   LinkedList<Libro> librosEstado = (LinkedList<Libro>)request.getAttribute("librosEstado");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
         
%>
<meta charset="ISO-8859-1" name="description" content="Bootstrap.">
<link rel="icon" href="icons/libros.ico">
<title>Listado de Libros</title>


<link rel="stylesheet" href="estilos/header.css">

<link rel="stylesheet" href="estilos/tabla.css">
<!--  <link rel="stylesheet" href="estilos/HomePedido.css">   <link rel="stylesheet" href="estilos/header.css"> -->


<link rel="stylesheet" href="estilos/menuFiltrar2.css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">



<link rel="stylesheet" href="estilos/jquery.dataTables.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


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


<% if(admin == 1){ %> 

 <section class="container hero__main">  
            <div class="hero__textos">
                <h2 class="title2"> Filtrar por :</h2> 
            </div>
</section> 

 <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <ul>
            <li>
            	<form action="ServletLibro?accion=listarPorEstado" method="post">
 					 <input type="hidden" value="reservado" name="estado">  </input> 
 					 <button id="button" type="submit">Solo Reservados</button>
				</form>
			</li>
            <li>
            	<form action="ServletLibro?accion=listarPorEstado" method="post">
  					<input type="hidden" value="cancelado" name="estado">  </input> 
  					<button id="button" type="submit">Solo Cancelados</button>
				</form>
            </li>
            <li>
            	<form action="ServletLibro?accion=listarPorEstado" method="post">
  					<input type="hidden" value="en curso" name="estado">  </input> 
  					<button id="button" type="submit">Solo En Curso </button>
				</form>
            </li>
            <li>
            	<form action="ServletLibro?accion=listarPorEstado" method="post">
  					<input type="hidden" value="finalizado" name="estado">  </input> 
  					<button id="button" type="submit">Solo Finalizados</button>
				</form>
            </li>
            <li>
            	<form action="ServletLibro?accion=listar" method="post">
  					<button id="button" type="submit">Listar Todos </button>
				</form>	
            </li>
        </ul>
    </nav>


 <%}%>
 
 <div class="container">

<form class="formularioBusqueda" action="ServletLibro?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id del libro " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Libro</button>
	</form>	
		
   <h1>
        Listado de libros
    </h1>
          

<% LinkedList<Libro> lista = new LinkedList<>();
   lista = (librosEstado == null)?(lista=libros):(lista=librosEstado);%>
   
<!--    
<div class="container__box">
     <%for(Libro l : lista){ %>
            <div class="box">
                <img src="ServletLibro?id=<%=l.getId()%>"/>
                <h5><%=l.getTitulo()%></h5>
                <h4><%=l.getEditorial().getNombre()%></td></h4>
            </div>
        <%}%>
    </div>
-->
          
        <table id="myTable" class="table table-striped">
           <thead>
                <tr>
                    <th>Portada</th> 
                    <th>Id</th><th>Titulo</th><th>Descripcion</th>                    
                    <th>Precio</th><th>Detalles</th>
                  <% if(admin != 1){ %>  <th>Solicitar</th> <%}%>
                    <% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%> 
                    
                                                                                                                    
                </tr>
            </thead>
            <%if(lista.size()>0){%> <!--Esta validacion es necesaria ya que de lo contrario lanza una advertencia -->
            <tr>
            
            
            <%for(Libro l : lista){ %>                
                <td> <img src="ServletLibro?id=<%=l.getId()%>" width="60px" height="60px"/> </td>                                 
                <td><%=l.getId()%></td>
                <td><%=l.getTitulo()%></td>
                <td><%=l.getDescripcion()%></td>                     
                
                <td><%=l.getPrecio()%></td>
               
                <td>
                    <form action="ServletLibro?accion=detalleLibro" method="post">
                       <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>			 
                       <button id="button" type="submit">Ver detalles</button>
                    </form>                
                </td>
                               
              <% if(admin != 1){ %>  
                <td>                   
                 <% if(!librosPedidos.contains(l) && !librosRetirados.contains(l)){ %>
                 <form action="ServletPedido?accion=reservaLibro" method="post">
                 <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>			 
                 <button id="button" type="submit">Reservar Libro</button>
                 </form>
                 <%}else if (librosPedidos.contains(l)){%>
                   <form action="ServletPedido?accion=cancelarReserva" method="post">
                     <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>			 
                    <button id="button" type="submit">Cancelar Reserva</button>
                   </form>
                 <%}else{%>
                    <label>Pendiente de devolución</label> 
                 <%}%>                  
                  </td>
               <%}%>   
                <% if(admin == 1){ %>
                <td>                      
                      <form class="formularioEliminar" action="ServletLibro?accion=borrar" method="post">				
				           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>
				           <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>
			          </form>                                                  
                     </td>
                      
                    <td>
                       <form action="ServletMenu?accion=modificarLibro" method="post">				 
								<input type="image"  id="button" src="icons/pencil.png"/>
								 <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>					
			            </form>			            
                     </td>                     
                      <%}%>
               </tr>
               <%}%>                                                                                                                 					                                                                                                                                                                                                                
            <%}%>                                                                   
          </table>
   </div>                                                                     
   
                                   <% if(admin == 1){ %>
                                    <form action="ServletMenu?accion=anadirLibro" method="post">				 
                                        <button id="button" type="submit">Añadir Libro</button>
                                    </form>
                                     <%}%>  
</body>
<script>
	$(document).ready(function(){
	    $('#myTable').dataTable();
	});
</script>
</html>