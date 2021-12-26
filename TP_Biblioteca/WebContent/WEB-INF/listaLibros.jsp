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
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1" name="description" content="Bootstrap.">
<title>Listado de Libros</title>

<link rel="stylesheet" href="estilos/tabla.css">
     
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


</head>
<body style="margin:20px auto">
 <div class="container">

<form class="formularioBusqueda" action="ServletLibro?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id del libro " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Libro</button>
	</form>	
		
   <h1>
        Listado de libros
    </h1>        
        <table id="myTable" class="table table-striped">
            <thead>
                <tr>
                    <th>Portada</th> 
                    <th>Id</th><th>Titulo</th><th>Descripcion</th>                    
                    <th>nroEdicion</th><th>fechaEdicion</th><th>Dimensiones</th>
                    <th>Paginas</th><th>Stock</th><th>Precio</th>
                    <th>Paginas</th><th>Editorial</th><th>Categoria</th>
                    <th>Solicitar</th>
                    <% if(admin == 1){ %><th>Eliminar</th><th>Modificar</th><%}%> 
                    <th>Nombre Autor</th><th>Apellido Autor</th>
                                                                                                                    
                </tr>
            </thead>
            <tr>
            
            <!-- ACA HICE UN QUILOMBO PARA PODER MOSTRAR MAS DE UN AUTOR PARA UN MISMO LIBRO 
            PORQUE TUVE QUE FUSIONAR FILAS, DE TODAS FORMAS ESTA INTERFAZ ES TEMPORAL JAJA -->
            <%for(Libro l : libros){ %>
                 
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <img src="ServletLibro?id=<%=l.getId()%>" width="60px" height="60px"/> </td>                                 
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getId()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getTitulo()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getDescripcion()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getNroEdicion()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getFechaEdicion()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getDimensiones()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getNroPaginas()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getExistencia()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getPrecio()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getNroPaginas()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getEditorial().getNombre()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>> <%=l.getCategoria().getDescripcion()%></td>
                <td rowspan=<%=String.valueOf(l.getAutores().size())%>>                   
                 <% if(!librosPedidos.contains(l)){ %>
                 <form action="ServletPedido?accion=reservaLibro" method="post">
                 <input type="hidden" value=<%=String.valueOf(l.getId())%> name="id">  </input>			 
                 <button id="button" type="submit">Reservar Libro</button>
                 </form>
                 <%}else{%>
                   <label>Reservado</label>
                 <%}%>                  
                  </td>
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
             <%}%>                                                         
          </table>
   </div>                                                                     
    
                                   <% if(admin == 1){ %>
                                    <form action="ServletMenu?accion=anadirLibro" method="post">				 
                                        <button id="button" type="submit">A�adir Libro</button>
                                    </form>
                                     <%}%>  
</body>
<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
</html>