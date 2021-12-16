<%@page import="entities.Categoria" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Categoria categoria = (Categoria)request.getAttribute("Categoria");  
%>
<meta charset="ISO-8859-1">
<title>Buscar Categoria</title>
</head>
<body>
   <h1>Busqueda de Categoria</h1>
    <form class="formularioBusqueda" action="ServletCategoria?accion=buscar" method="post">
				<input id="campoTexto" type="text" placeholder="Ingrese id de la categoria " maxlength="10" name="id" required> 
				<button id= "botonBuscar" type="submit">Buscar Categoria</button>
	</form>
<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %> 

<% if(categoria!=null){%>	
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Id</th><th>Categoria</th><th>Eliminar</th><th>Modificar</th> 
                </tr>
            </thead>
            <tr>
                <td> <%=String.valueOf(categoria.getId())%></td>
                <td> <%=categoria.getDescripcion()%></td>
                <td>
                <form class="formularioEliminar" action="ServletCategoria?accion=borrar" method="post">				
				           <button id="botonEliminar" class="button" type="submit">Borrar Categoria</button>
				           <input type="hidden" value=<%=String.valueOf(categoria.getId())%> name="id">  </input>
			          </form>                                                  
                 </td> 
                 <td>
                       <form action="ServletMenu?accion=modificarCategoria" method="post">				 
								<button id="button" type="submit">Modificar Categoria</button>
								 <input type="hidden" value=<%=String.valueOf(categoria.getId())%> name="id">  </input>					
			            </form>  
			     </td>                         
            </tr>
        </table>
    </div>
<%}%>


</body>
</html>