<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@page import="entities.Libro" %>
<%@page import="entities.Comentario" %>
<%@page import="entities.Cliente" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Libro l = (Libro)request.getAttribute("Libro");
   LinkedList<Libro> librosPedidos = (LinkedList<Libro>)request.getAttribute("LibrosPedidos");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
   
   String DATE_FORMATTER= "yyyy-MM-dd HH:mm:ss";
   DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DATE_FORMATTER);         
%>
<link rel="stylesheet" href="estilos/header.css">
<link rel="stylesheet" href="estilos/tabla.css">

<link rel="stylesheet" href="estilos/comentarios.css">

<link rel="stylesheet" href="estilos/starRating.css">
<meta charset="UTF-8">
<link rel="icon" href="icons/libros.ico">
 <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>

 <link rel="stylesheet" href="estilos/imagenTexto.css">
<title>Detalle del libro</title>
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
						<button class="botonAtrasDetalleLibro" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                 <%}%>
                    <% if(admin == 1){ %>
                 <form action="ServletMenu?accion=irMenuAdmin" method="post">
						<button class="botonAtrasDetalleLibro" type="submit"><i class="fas fa-arrow-left"></i></button> 
               	</form>
                    <%}%> 
                	
				</div>	
            </div>
        </nav> 
</header>


    
    <div class="principal">
     <section class="container__fototexto">  
            <div class="textos">
                <h1 class="title">Titulo: <span class="title--active"><%=l.getTitulo()%></span></h1> 
                <p class="copy"> Id: <span class="copy__active"><%=l.getId()%></span><p>
                <p class="copy"> Descripcion: <span class="copy__active"><%=l.getDescripcion()%></span><p>
                <p class="copy"> Nro Edicion: <span class="copy__active"><%=l.getNroEdicion()%></span><p>
                <p class="copy"> Fecha Edicion: <span class="copy__active"><%=l.getFechaEdicion()%></span><p>
                <p class="copy"> Dimensiones: <span class="copy__active"><%=l.getDimensiones()%></span><p>
                <p class="copy"> Nro paginas: <span class="copy__active"><%=l.getExistencia()%></span><p>
                <p class="copy"> Stock: <span class="copy__active"><%=l.getNroPaginas()%></span><p>
                <p class="copy"> Precio: <span class="copy__active"><%=l.getPrecio()%></span><p>
                <p class="copy"> Editorial: <span class="copy__active"><%=l.getEditorial().getNombre()%></span><p>
                <p class="copy"> Categoria: <span class="copy__active"><%=l.getCategoria().getDescripcion()%></span><p>
                <%for(int i=0; i<l.getAutores().size();i++) {%> 
                 	<p class="copy"> Nombre Autor: <span class="copy__active"><%=l.getAutores().get(i).getNombre()%></span><p>    
                 	<p class="copy"> Apellido Autor: <span class="copy__active"><%=l.getAutores().get(i).getApellido()%></span><p>                                           
        		<%}%> 
            </div>
            <div class="slider2">
				<div class="slider__section2">
 	  				<img src="ServletLibro?id=<%=l.getId()%>" class="slider__img2">  	    
    			</div>
            </div>
        </section>
    </div>
 
      
               <form action="ServletLibro?accion=comentarLibro" method="post">
               <div class="estrellas">
               <div class="footer-textos">
                    <h2>¡ Califica el libro !</h2>
                        <p class="footer-textos__p1">Obtendremos su puntuacion.</p1>
                </div>
                <div class="estrellas__centro">
               <div class="rate">
                     <input type="radio" id="star5" name="rate" value="5" required />
                     <label for="star5" title="text">&#9733</label>
                     <input type="radio" id="star4" name="rate" value="4" required/>
                     <label for="star4" title="text">&#9733</label>
                     <input type="radio" id="star3" name="rate" value="3" required/>
                     <label for="star3" title="text">&#9733</label>
                     <input type="radio" id="star2" name="rate" value="2" required/>
                     <label for="star2" title="text">&#9733</label>
                     <input type="radio" id="star1" name="rate" value="1" required/>
                     <label for="star1" title="text">&#9733</label> 
                </div>  
                </div>
                </div>
                
                
      <section class="contacto">
            <div class="contenedor">
                <div class="footer-textos">
                    <h2>¡ Realiza un comentario !</h2>
                    <p class="footer-textos__p1">Escribenos tu opinion acerca de este libro.</p1>
                </div>
                <div class="formulario">
                    <textarea name="comentario" id="comentario" rows="6" cols="60" required></textarea>
                    <div class="derecha">
                    	<input type="hidden" value=<%=String.valueOf(l.getId())%> name="id"> 
                    	<button id="button" type="submit">Enviar</button>
                    </div>
                <div>
            </div>
      </section>
             
               <table>
                 <thead>
                 	<th>Usuario</th>  
                 	<th>Fecha y hora</th> 
                 	<th>Calificacion</th>    
                 	<th>Comentario</th>                   
                 </thead>
                <tbody> 
                 <tr>
                 <%for(Comentario c : l.getComentarios()){ %>
                   <td data-label="Usuario"> <%=c.getUsuario().getUser()%></td>
                   <td data-label="Fecha y hora"> <%=c.getFecha().format(formatter)%></td>                   
                  <td data-label="calificacion">  
                   <%for(int i = 1; i<=c.getCalificacion();i++){ %>
                       <label title="text">&#9733</label>
                   <%}%>                  
                  </td> 
                   <td data-label="comentario"> <%=c.getReseña()%></td>                                                            
                 </tr>
                  <%}%>
                </tbody> 
               </table>
                
</body>
</html>