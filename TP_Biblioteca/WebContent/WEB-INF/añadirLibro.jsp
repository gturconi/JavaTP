<%@page import="java.util.LinkedList" %>
<%@page import="entities.Editorial" %>
<%@page import="entities.Categoria" %>
<%@page import="entities.Autor" %>
<%@page import="entities.Libro" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Editorial> editoriales = (LinkedList<Editorial>)request.getAttribute("Editoriales");
   LinkedList<Categoria> categorias = (LinkedList<Categoria>)request.getAttribute("Categorias");
   LinkedList<Autor> autores = (LinkedList<Autor>)request.getAttribute("Autores");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/libros.ico">
<title>Añadir Libro</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/header.css">
<link rel="stylesheet" type="text/css" href="estilos/mensaje.css">
 <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
</head>
<body>

<!--  
<form class="formularioBusqueda" action="ServletLibro?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id del libro " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Libro</button>
	</form>

-->
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


<h1>Añadir Libro</h1>

<div class="containerLibro">
    <div class="cardLibro">
      <img src="pictures/añadir.png" alt="">
      <h4> Añadir </h4>
      <form class="formularioLibro" action="ServletLibro?accion=agregar" method="post" enctype="multipart/form-data">
        <input id="campoTextoLibro" type="text" placeholder="Ingrese el titulo" maxlength="200" name="titulo"required> 
        <input id="campoTextoLibro" type="text" placeholder="Ingrese la descripcion" maxlength="1000" name="descripcion" required>
        <input id="campoTextoLibro" type="number" placeholder="Ingrese el numero de la edicion" maxlength="20" name="edicion" required>
        
        <h3 for="start">Fecha de edicion:</h3>
        
         <input id="campoTextoLibro" type="date" id="start" value="2018-07-22" min="1900-01-01" max="2021-12-31" name="fecha" required>
        
        <h3 >Dimensiones</h3> 
        
        <input id="campoTextoLibro" type="number" placeholder="alto (cm)" maxlength="20" name="alto" size=4  required>
        <h3 id="h3_2" >x</h3>
        <input id="campoTextoLibro" type="number" placeholder="ancho (cm)" maxlength="20" name="ancho" size=4 required>
         <input id="campoTextoLibro" type="number" placeholder="Paginas" maxlength="20" name="paginas" required>
         <input id="campoTextoLibro" type="number" placeholder="Stock" maxlength="20" name="stock" required>
           <input id="campoTextoLibro" type="number" placeholder="Precio" maxlength="20" name="precio" required>
        
        <select name="editorial" id="campoTextoEditorial"  required>
				      <option style="display: none;" value="" selected>Editorial</option>
				      <% 
                             for(Editorial ed:editoriales){
            	                %> <option value='<%=ed.getId()%>'><%=ed.getNombre()%></option>
                      <%
                            }          
                      %>				                                                                                     
                </select>
                <select name="categoria" id="campoTextoCategoria" required>
                   <option style="display: none;" value="" selected>Categoria</option>
                      <% 
                             for(Categoria cat:categorias){
            	                %> <option value='<%=cat.getId()%>'><%=cat.getDescripcion()%></option>
                      <%
                            }          
                      %>                                                                                                                
                </select>
                
                  <label>    
                     <h3>Seleccione el/los autores</h3>                     
                   <option style="display: none;" value="" selected>Categoria</option>
                      <% 
                             for(Autor aut:autores){%>
                            	 <label class="contieneAutores"> 
            	                 <input class="checkbox-inline" type="checkbox" name="autores" value='<%=aut.getId()%>'> <%=aut.getNombre() + " " + aut.getApellido()%>
            	                </label> 
                      <%
                            }          
                      %>                                                               
                  </label> 
        
         <h3>Subir portada </h3><br/><br/>                  
                     <input type="file" name="imagen" required="required"/><br/><br/>                   
                                                                                                                                                          
        
        <button id="botonLibro" type="submit">Añadir Libro</button>
       </form>  
    </div>  
</div>


<%if(null != request.getAttribute("error")){
	%><p id="mensaje"><%out.println(request.getAttribute("error"));%> </p><%    
  }	  
  %>			
</body>
</html>