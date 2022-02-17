<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="entities.Libro" %>
<%@page import="entities.Editorial" %>
<%@page import="entities.Categoria" %>
<%@page import="entities.Cliente" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Libro l = (Libro) request.getAttribute("Libro");
   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
   String[] dimensiones = l.getDimensiones().split("x");
   
   LinkedList<Editorial> editoriales = (LinkedList<Editorial>)request.getAttribute("Editoriales");
   LinkedList<Categoria> categorias = (LinkedList<Categoria>)request.getAttribute("Categorias");
   LinkedList<Autor> autores = (LinkedList<Autor>)request.getAttribute("Autores");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/libros.ico">
<title>Editar libro</title>
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/header.css">
 <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
 
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 
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

<h1>Modificacion de  Libro</h1>





<div class="containerLibro">
    <div class="cardLibro">
      <img src="pictures/modificar.png" alt="">
      <h4> Modificar </h4>
            <form class="formularioLibro" action="ServletLibro?accion=modificar" method="post" enctype="multipart/form-data">
                <input type="hidden" value=<%=l.getId()%> name="id">  </input>
				<input id="campoTextoLibro" type="text" value='<%=l.getTitulo()%>' maxlength="200" name="titulo"required>
				<input id="campoTextoLibro" type="text" value='<%=l.getDescripcion()%>' maxlength="1000" name="descripcion" required>
				<input id="campoTextoLibro" type="number" value=<%=l.getNroEdicion()%> maxlength="20" name="edicion" required>
				
				 <h3 for="start">Fecha de edicion:</h3>

                 <input id="campoTextoLibro" type="date" id="start" value=<%=l.getFechaEdicion().format(formatter)%> min="1900-01-01" max="2021-12-31" name="fecha" required>
								 
                <h3 >Dimensiones</h3>
                  								 
				<input id="campoTextoLibro" type="number" value=<%=dimensiones[0]%> maxlength="20" name="ancho" size=4  required>
				<h3 id="h3_2" >x</h3>
				<input id="campoTextoLibro" type="number" value=<%=dimensiones[1]%> name="alto" size=4 required>
				<input id="campoTextoLibro" type="number" value=<%=l.getNroPaginas()%> maxlength="20" name="paginas" required>
				<input id="campoTextoLibro" type="number" value=<%=l.getExistencia()%> maxlength="20" name="stock" required>
				<input id="campoTextoLibro" type="number" value=<%=l.getPrecio()%> maxlength="20" name="precio" required>
				
				<select name="editorial" id="campoTextoEditorial"required>
				      <option style="display: none;" value='<%=l.getEditorial().getId()%>' selected><%=l.getEditorial().getNombre()%></option>
				      <% 
                             for(Editorial ed:editoriales){
                            	 if(!(l.getEditorial().getNombre().equals(ed.getNombre()))){ 
            	                %> <option value='<%=ed.getId()%>'><%=ed.getNombre()%></option>
                      <%}
                            }          
                      %>				                                                                                     
                </select>
                <select name="categoria" id="campoTextoCategoria" required>
                   <option style="display: none;" value='<%=l.getCategoria().getId()%>' selected><%=l.getCategoria().getDescripcion()%></option>
                      <%    
                             for(Categoria cat:categorias){
                            	 if(!(l.getCategoria().getDescripcion().equals(cat.getDescripcion()))){ 
            	                %> <option value='<%=cat.getId()%>'><%=cat.getDescripcion()%></option>
                      <%}
                            }          
                      %>                                                                                                                
                </select>
                
                  <div class="container-fluid h-100 text-dark">
                    <div class="row justify-content-center align-items-center">
                      <h3>Seleccione el/los autores</h3>    
                   </div>
                   <br>
                   <div class="row justify-content-center align-items-center h-100">
                      <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                         <div class="form-group">
                            <select name="autores" class="mul-select" multiple="true">
                             <% 
                             for(Autor aut:autores){
                            	 if(l.getAutores().contains(aut)){ %>
            	                 <option  value='<%=aut.getId()%>' selected><%=aut.getNombre() + " " + aut.getApellido()%></option>
            	             <%}else{ %> 
            	                <option  value='<%=aut.getId()%>'><%=aut.getNombre() + " " + aut.getApellido()%></option>
            	            <% }
                              }          
                           %>                                 
                             </select>
                         </div> 
                      </div>
                  </div>
                 </div>
                  
                  
                 
                     <h3>Subir portada (opcional) </h3><br/><br/>                  
                     <input type="file" name="imagen"/><br/><br/> 
                                
				<button id="botonLibro" type="submit">Modificar Libro</button>
			</form>
    </div>  
</div>
</body>
<script>
        $(document).ready(function(){
            $(".mul-select").select2({
                    placeholder: "Seleccionar Autor", //placeholder
                    tags: true,
                    tokenSeparators: ['/',',',';'," "] 
                });
            })
    </script>
</html>