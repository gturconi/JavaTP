<%@page import="java.util.LinkedList" %>
<%@page import="entities.Editorial" %>
<%@page import="entities.Categoria" %>
<%@page import="entities.Autor" %>
<%@page import="entities.Libro" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Editorial> editoriales = (LinkedList<Editorial>)request.getAttribute("Editoriales");
   LinkedList<Categoria> categorias = (LinkedList<Categoria>)request.getAttribute("Categorias");
   LinkedList<Autor> autores = (LinkedList<Autor>)request.getAttribute("Autores");
%>
<meta charset="ISO-8859-1">
<title>Libro Nuevo</title>
<link rel="stylesheet" href="estilos/tabla.css">
</head>
<body>
<form action="ServletLibro?accion=agregar" method="post">
				<input class="controlr" type="text" placeholder="Ingrese el titulo" maxlength="20" name="titulo"required>
				<input class="controlr" type="text" placeholder="Ingrese la descripcion" maxlength="20" name="descripcion" required>
				<input class="controlr" type="text" placeholder="Ingrese el numero de la edicion" maxlength="20" name="edicion" required>
				
				 <label for="start">Fecha de edicion:</label>

                 <input class="controlr" type="date" id="start" value="2018-07-22" min="1900-01-01" max="2021-12-31" name="fecha" required>
								 
				<input class="controlr" type="text" placeholder="Dimensiones" maxlength="20" name="dimensiones" required>
				<input class="controlr" type="text" placeholder="Paginas" maxlength="20" name="paginas" required>
				<input class="controlr" type="text" placeholder="Stock" maxlength="20" name="stock" required>
				<input class="controlr" type="text" placeholder="Precio" maxlength="20" name="precio" required>
				<select name="editorial" class="controlr" required>
				      <option style="display: none;" value="" selected>Editorial</option>
				      <% 
                             for(Editorial ed:editoriales){
            	                %> <option value='<%=ed.getNombre()%>'><%=ed.getNombre()%></option>
                      <%
                            }          
                      %>				                                                                                     
                </select>
                <select name="categoria" class="controlr" required>
                   <option style="display: none;" value="" selected>Categoria</option>
                      <% 
                             for(Categoria cat:categorias){
            	                %> <option value='<%=cat.getDescripcion()%>'><%=cat.getDescripcion()%></option>
                      <%
                            }          
                      %>                                                                                                                
                </select>
                
                  <label>    
                     <span>Seleccione el/los autores</span>
                     <option style="display: none;" value="" selected>Categoria</option>
                      <% 
                             for(Autor aut:autores){
            	                %> <input type="checkbox" name="autores" value='<%=aut.getNombre() + "/" + aut.getApellido()%>'><%=aut.getNombre() + " " + aut.getApellido()%>
                      <%
                            }          
                      %>                                                                
                  </label>
                                
				<button class="button" type="submit">Añadir Autor</button>
			</form>
<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>			
</body>
</html>