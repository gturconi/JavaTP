<%@page import="java.util.LinkedList" %>
<%@page import="entities.Autor" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="entities.Libro" %>
<%@page import="entities.Editorial" %>
<%@page import="entities.Categoria" %>

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
%>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/libros.ico">
<title>Editar libro</title>
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/header.css">
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


<h1>Modificacion de  Libro</h1>





<div class="containerLibro">
    <div class="cardLibro">
      <img src="pictures/modificar.png" alt="">
      <h4> Modificar </h4>
            <form class="formularioLibro" action="ServletLibro?accion=modificar" method="post">
                <input type="hidden" value=<%=l.getId()%> name="id">  </input>
				<input id="campoTextoLibro" type="text" value='<%=l.getTitulo()%>' maxlength="20" name="titulo"required>
				<input id="campoTextoLibro" type="text" value='<%=l.getDescripcion()%>' maxlength="20" name="descripcion" required>
				<input id="campoTextoLibro" type="number" value=<%=l.getNroEdicion()%> maxlength="20" name="edicion" required>
				
				 <h3 for="start">Fecha de edicion:</h3>

                 <input id="campoTextoLibro" type="date" id="start" value=<%=l.getFechaEdicion().format(formatter)%> min="1900-01-01" max="2021-12-31" name="fecha" required>
								 
                <h3 >Dimensiones</h3>
                  								 
				<input id="campoTextoLibro" type="number" value=<%=dimensiones[0]%> maxlength="20" name="alto" size=4  required>
				<h3 id="h3_2" >x</h3>
				<input id="campoTextoLibro" type="number" value=<%=dimensiones[1]%> name="ancho" size=4 required>
				<input id="campoTextoLibro" type="number" value=<%=l.getNroPaginas()%> maxlength="20" name="paginas" required>
				<input id="campoTextoLibro" type="number" value=<%=l.getExistencia()%> maxlength="20" name="stock" required>
				<input id="campoTextoLibro" type="number" value=<%=l.getPrecio()%> maxlength="20" name="precio" required>
				
				<select name="editorial" id="campoTextoEditorial"required>
				      <option style="display: none;" value='<%=l.getEditorial().getNombre()%>' selected><%=l.getEditorial().getNombre()%></option>
				      <% 
                             for(Editorial ed:editoriales){
                            	 if(!(l.getEditorial().getNombre().equals(ed.getNombre()))){ 
            	                %> <option value='<%=ed.getId()%>'><%=ed.getNombre()%></option>
                      <%}
                            }          
                      %>				                                                                                     
                </select>
                <select name="categoria" id="campoTextoCategoria" required>
                   <option style="display: none;" value='<%=l.getCategoria().getDescripcion()%>' selected><%=l.getCategoria().getDescripcion()%></option>
                      <%    
                             for(Categoria cat:categorias){
                            	 if(!(l.getCategoria().getDescripcion().equals(cat.getDescripcion()))){ 
            	                %> <option value='<%=cat.getId()%>'><%=cat.getDescripcion()%></option>
                      <%}
                            }          
                      %>                                                                                                                
                </select>
                
                  <label>    
                     <h3>Seleccione el/los autores</h3> 
                     <option style="display: none;" value="" selected>Categoria</option>
                      <% 
                             for(Autor aut:autores){                            	 
                            	 if(l.getAutores().contains(aut)){                             		 		
            	                %> <label class="contieneAutores"> 
            	                 <input class="checkbox-inline"  checked="true" type="checkbox" name="autores" value='<%=aut.getNombre() + "/" + aut.getApellido()%>'><%=aut.getNombre() + " " + aut.getApellido()%>
            	                </label> 
            	    
                      <%}else{ %>
                      <label class="contieneAutores"> 
                    	   <input   class="checkbox-inline"  type="checkbox" name="autores" value='<%=aut.getId()%>'><%=aut.getNombre() + " " + aut.getApellido()%>
                    	   </label> 
                     <% }
                            }          
                      %>                                                                
                  </label>
                 
                  
                                
				<button id="botonLibro" type="submit">Modificar Libro</button>
			</form>
    </div>  
</div>
</body>
</html>