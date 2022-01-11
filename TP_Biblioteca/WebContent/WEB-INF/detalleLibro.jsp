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
<link rel="stylesheet" href="estilos/tabla.css">

<link rel="stylesheet" href="estilos/comentarios.css">

<link rel="stylesheet" href="estilos/starRating.css">
<meta charset="UTF-8">
<link rel="icon" href="icons/libros.ico">
<title>Detalle del libro</title>
</head>
<body>

  <table class="table table-striped">
           <thead>
                <tr>
                    <th>Portada</th> 
                    <th>Id</th><th>Titulo</th><th>Descripcion</th>                    
                    <th>nroEdicion</th><th>fechaEdicion</th><th>Dimensiones</th>
                    <th>Paginas</th><th>Stock</th><th>Precio</th>
                    <th>Editorial</th><th>Categoria</th>
                  <% if(admin != 1){ %>  <th>Solicitar</th> <%}%>
                    <% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%> 
                    <th>Nombre Autor</th><th>Apellido Autor</th>                    
                                                                                                                    
                </tr>
            </thead>
            <tr>                          
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <img src="ServletLibro?id=<%=l.getId()%>" width="60px" height="60px"/> </td>                                 
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>><%=l.getId()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>><%=l.getTitulo()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>><%=l.getDescripcion()%></td>                     
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>><%=l.getNroEdicion()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>><%=l.getFechaEdicion()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>><%=l.getDimensiones()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>><%=l.getNroPaginas()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>><%=l.getExistencia()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>><%=l.getPrecio()%></td>
               
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getEditorial().getNombre()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getCategoria().getDescripcion()%></td>
              <% if(admin != 1){ %>  
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>>                   
                 <% if(!librosPedidos.contains(l)){ %>
                 <form action="ServletPedido?accion=reservaLibro" method="post">
                 <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>			 
                 <button id="button" type="submit">Reservar Libro</button>
                 </form>
                 <%}else{%>
                   <form action="ServletPedido?accion=cancelarReserva" method="post">
                     <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>			 
                    <button id="button" type="submit">Cancelar Reserva</button>
                   </form>
                 <%}%>                  
                  </td>
               <%}%>   
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
                <form action="enviarMail.php" class="formulario" method="POST">
                         <textarea name="comentario" id="comentario" rows="6" cols="60" required></textarea>
                    <div class="derecha">
                    	<input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>
                    	<button id="button" type="submit">Enviar</button>

                    </div>
                </form>
                </div>
         </section>
                
                
                <!--  
                             
                <p><label for="descripcion">Comentarios</label>
                    <textarea name="comentario" id="comentario" rows="6" cols="60" required></textarea>
                    <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>
                    <button id="button" type="submit">Enviar</button> 
                </p>  -->
                
                
               </form>
                
               <table>
                 <thead>                    
                 </thead>
                <tbody> 
                 <tr>
                 <%for(Comentario c : l.getComentarios()){ %>
                   <td>Usuario: <%=c.getUsuario().getUser()%></td>
                   <td>Fecha y Hora: <%=c.getFecha().format(formatter)%></td>                   
                  <td> 
                   Calificacion:  
                   <%for(int i = 1; i<=c.getCalificacion();i++){ %>
                       <label title="text">&#9733</label>
                   <%}%>                  
                  </td> 
                   <td>Comentario: <%=c.getReseña()%></td>                                                            
                 </tr>
                  <%}%>
                </tbody> 
               </table>
                
</body>
</html>