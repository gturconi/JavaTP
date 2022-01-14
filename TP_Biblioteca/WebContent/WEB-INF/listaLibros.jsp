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
<title>Listado Libros</title>



<link rel="stylesheet" href="estilos/header.css">
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
  <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>

<!--  <link rel="stylesheet" href="estilos/HomePedido.css">   <link rel="stylesheet" href="estilos/header.css"> -->


<link rel="stylesheet" href="estilos/menuFiltrar2.css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">



<link rel="stylesheet" href="estilos/jquery.dataTables.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="estilos/slider.css">
</head>
<body>

<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
            </div>
              <div>
                <% if(admin != 1){ %>  
                <form action="ServletMenu?accion=irMenuCliente" method="post">
						<button class="botonAtras" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                 <%}%>
                    <% if(admin == 1){ %>
                 <form action="ServletMenu?accion=irMenuAdmin" method="post">
						<button class="botonAtrasLibro" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                    <%}%> 
                	
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
 

   <h1>
        Listado de libros
    </h1>
          

<% LinkedList<Libro> lista = new LinkedList<>();
   lista = (librosEstado == null)?(lista=libros):(lista=librosEstado);%>
   
 <div class="container-slider">
  <div class="slider" id="slider">
   <%for(Libro l : lista){ %>
		<div class="slider__section">
          <img src="ServletLibro?id=<%=l.getId()%>" class="slider__img">    
    </div>
    <%}%>
  </div>
  <div class="slider__btn slider__btn--right" id="btn-right">&#62;</div>
  <div class="slider__btn slider__btn--left" id="btn-left">&#60;</div>
 </div>


<script src="js/slider.js"></script>

          
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
                <td data-label="portada"> <img src="ServletLibro?id=<%=l.getId()%>" width="60px" height="60px"/> </td>                                 
                <td data-label="id"><%=l.getId()%></td>
                <td data-label="titulo"><%=l.getTitulo()%></td>
                <td data-label="descripcion"><%=l.getDescripcion()%></td>                     
                
                <td data-label="precio"><%=l.getPrecio()%></td>
               
                <td data-label="detalles">
                    <form action="ServletLibro?accion=detalleLibro" method="post">
                       <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>			 
                       <button id="boton" type="submit">Ver detalles</button>
                    </form>                
                </td>
                               
              <% if(admin != 1){ %>  
                <td>                   
                 <% if(!librosPedidos.contains(l) && !librosRetirados.contains(l)){ %>
                 <form action="ServletPedido?accion=reservaLibro" method="post">
                 <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>			 
                 <button id="boton" type="submit">Reservar Libro</button>
                 </form>
                 <%}else if (librosPedidos.contains(l)){%>
                   <form action="ServletPedido?accion=cancelarReserva" method="post">
                     <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>			 
                    <button id="boton" type="submit">Cancelar Reserva</button>
                   </form>
                 <%}else{%>
                    <label>Pendiente de devoluci�n</label> 
                 <%}%>                  
                  </td>
               <%}%>   
                <% if(admin == 1){ %>
                <td data-label="eliminar">                      
                      <form class="formularioEliminar" action="ServletLibro?accion=borrar" method="post">				
				           <input type="image"  id="botonEliminar" src="icons/trash-fill.png"/>
				           <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>
			          </form>                                                  
                     </td>
                      
                    <td data-label="modificar">
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
 

     <div class="container">
		<div class="card">
			<img src="pictures/lupaBusqueda.png" alt="">
				<h4> Buscar </h4>
				<form class="formulario" action="ServletLibro?accion=buscar" method="post">
					<input id="campoTexto" type="text" placeholder="Ingrese id  " maxlength="10" name="id" required> 
					<button id= "boton" type="submit">Buscar Libro</button>
				</form>	
		</div>
    
     <% if(admin == 1){ %>
     <div class="card">
     	 <img src="pictures/a�adir.png" alt="">
     	 <h4> A�adir </h4>
      	<form class="formulario" action="ServletMenu?accion=anadirLibro" method="post">      
        	 <button id="boton_A�adir" type="submit">A�adir Libro</button>
      </form>
    </div>                                     
      <%}%>  
   </div>  
     
</body>
<script>
	$(document).ready(function(){
	    $('#myTable').dataTable();
	});
</script>
</html>