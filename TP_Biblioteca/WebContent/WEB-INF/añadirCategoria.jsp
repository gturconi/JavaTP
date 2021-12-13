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
<title>Añadir Categoria</title>
</head>
<body>
<form action="ServletCategoria?accion=agregar" method="post">
				<input class="controlr" type="text" placeholder="Ingrese la descripcion de la categoria" maxlength="20" name="descripcion"required>		
				<button class="button" type="submit">Añadir Categoria</button>
			</form>
<%if(null != request.getAttribute("error")){
	  out.println(request.getAttribute("error"));    
  }	  
  %>
<% if(categoria!=null){%>
    <div id="tabla">
        <p>Se añadio exitosamente la categoria:</p>
        <table>
            <thead>
                <tr>
                    <th>Numero</th><th>Categoria</th> 
                </tr>
            </thead>
            <tr>
                <td> <%=categoria.getId()%></td>
                <td> <%=categoria.getDescripcion()%></td>                    
            </tr>
        </table>
    </div>
<%}%>


</body>
</html>