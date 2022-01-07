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
<title>Editar libro</title>
</head>
<body>

            <form action="ServletLibro?accion=modificar" method="post">
                <input type="hidden" value=<%=l.getId()%> name="id">  </input>
				<input class="controlr" type="text" value='<%=l.getTitulo()%>' maxlength="20" name="titulo"required>
				<input class="controlr" type="text" value='<%=l.getDescripcion()%>' maxlength="20" name="descripcion" required>
				<input class="controlr" type="number" value=<%=l.getNroEdicion()%> maxlength="20" name="edicion" required>
				
				 <label for="start">Fecha de edicion:</label>

                 <input class="controlr" type="date" id="start" value=<%=l.getFechaEdicion().format(formatter)%> min="1900-01-01" max="2021-12-31" name="fecha" required>
								 
                <label >Dimensiones</label>   								 
				<input class="controlr" type="number" value=<%=dimensiones[0]%> maxlength="20" name="alto" size=4  required>
				<label >x</label>
				<input class="controlr" type="number" value=<%=dimensiones[1]%> name="ancho" size=4 required>
				<input class="controlr" type="number" value=<%=l.getNroPaginas()%> maxlength="20" name="paginas" required>
				<input class="controlr" type="number" value=<%=l.getExistencia()%> maxlength="20" name="stock" required>
				<input class="controlr" type="number" value=<%=l.getPrecio()%> maxlength="20" name="precio" required>
				<select name="editorial" class="controlr" required>
				      <option style="display: none;" value='<%=l.getEditorial().getNombre()%>' selected><%=l.getEditorial().getNombre()%></option>
				      <% 
                             for(Editorial ed:editoriales){
                            	 if(!(l.getEditorial().getNombre().equals(ed.getNombre()))){ 
            	                %> <option value='<%=ed.getId()%>'><%=ed.getNombre()%></option>
                      <%}
                            }          
                      %>				                                                                                     
                </select>
                <select name="categoria" class="controlr" required>
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
                     <span>Seleccione el/los autores</span>
                     <option style="display: none;" value="" selected>Categoria</option>
                      <% 
                             for(Autor aut:autores){                            	 
                            	 if(l.getAutores().contains(aut)){                             		 		
            	                %> <input  checked="true" type="checkbox" name="autores" value='<%=aut.getNombre() + "/" + aut.getApellido()%>'><%=aut.getNombre() + " " + aut.getApellido()%>
                      <%}else{ %>
                    	   <input   type="checkbox" name="autores" value='<%=aut.getId()%>'><%=aut.getNombre() + " " + aut.getApellido()%>
                     <% }
                            }          
                      %>                                                                
                  </label>
                                
				<button class="button" type="submit">Modificar Libro</button>
			</form>

</body>
</html>