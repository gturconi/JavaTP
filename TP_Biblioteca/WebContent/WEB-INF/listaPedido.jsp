<%@page import="java.util.LinkedList" %>
<%@page import="entities.PedidoLibro" %>

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
            <%for(PedidoLibro pl : pedidos){ %>                
                <td> <%=pl.getPed().getNroPedido()%></td><td> <%=pl.getPed().getFecha()%></td><td> <%=pl.getPed().getEstado()%></td>
                <td> <%=pl.getPed().getCliente().getId()%>
             <%}%>           
          </table>
    </div>
</body>
</html>