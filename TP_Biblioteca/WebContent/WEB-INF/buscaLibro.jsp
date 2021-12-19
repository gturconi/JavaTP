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
<title>Buscar Libro</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/buscar.css">
</head>
<body>
<h1>Busqueda de Libro</h1>
<form class="formularioBusqueda" action="ServletLibro?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id del libro " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Libro</button>
	</form>
<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>	
<div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Id</th><th>Ttitulo</th><th>Descripcion</th>
                    <th>nroEdicion</th><th>fechaEdicion</th><th>Dimensiones</th>
                    <th>Paginas</th><th>Stock</th><th>Precio</th>
                    <th>Paginas</th><th>Editorial</th><th>Categoria</th> 
                    <th>Eliminar</th><th>Modificar</th> 
                </tr>
            </thead>
            <tr>
                <td> <%=l.getId()%></td><td> <%=l.getTitulo()%></td><td> <%=l.getDescripcion()%></td>
                <td> <%=l.getNroEdicion()%></td><td> <%=l.getFechaEdicion()%></td><td> <%=l.getDimensiones()%></td>
                <td> <%=l.getNroPaginas()%></td><td> <%=l.getExistencia()%></td><td> <%=l.getPrecio()%></td>
                <td> <%=l.getNroPaginas()%></td><td> <%=l.getEditorial().getNombre()%></td><td> <%=l.getCategoria().getDescripcion()%></td>
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
                   
            </tr>
        </table>
        <table>       
            <thead>
                <tr>            
                  <th>Nombre Autor</th><th>Apellido Autor</th>
                </tr>
            </thead>  
              <tr>                
                <%for(Autor a : l.getAutores()){ %>                             
                   <td> <%=a.getNombre()%></td> <td> <%=a.getApellido()%></td><tr></tr>                                 
                 <%}%>                   
         </table>
    </div>


</body>
</html>