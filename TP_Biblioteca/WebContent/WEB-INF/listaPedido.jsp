<%@page import="java.util.LinkedList" %>
<%@page import="entities.PedidoLibro" %>
<%@page import="entities.Libro" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<PedidoLibro> pedidos = (LinkedList<PedidoLibro>)request.getAttribute("Pedidos");   
%>
<meta charset="ISO-8859-1">
<title>Listado de Pedidos Reservados</title>
<link rel="stylesheet" href="estilos/tabla.css">
</head>
<body>
   <h1>
        Listado de pedidos
    </h1>            
    <div id="tabla">
        <table>
            <thead>
                <tr>
                    <th>Numero</th><th>Fecha</th><th>Estado</th>
                    <th>IdCliente</th>   
                    <th>IdLibro</th><th>Titulo</th>                                                                                               
                </tr>
            </thead>
            <tr>
              <%for(PedidoLibro pl : pedidos){
            	String c = String.valueOf(pl.getLibros().size());
            	%>                
                <td rowspan=<%=c%>> <%=pl.getPed().getNroPedido()%></td>
                <td rowspan=<%=c%>> <%=pl.getPed().getFecha()%></td>
                <td rowspan=<%=c%>> <%=pl.getPed().getEstado()%></td>
                <td rowspan=<%=c%>> <%=pl.getPed().getCliente().getId()%>             
             <%for(int i=0; i<pl.getLibros().size();i++) {%>
                   <%if(i>0){%> <tr> <%}%> 
                   <td> <%=pl.getLibros().get(i).getId()%></td> 
                   <td> <%=pl.getLibros().get(i).getTitulo()%></td> </tr>  
             <%}%>           
           <%}%>  
          </table>                   
    </div>     
</body>
</html>