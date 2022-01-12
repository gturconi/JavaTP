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

<h2>Filtrar</h2>

<form action="ServletPedido?accion=listar" method="post">
  <input type="hidden" value="reservado" name="estado">  </input> 
  <button id="button" type="submit">Solo Reservados</button>
</form>

<form action="ServletPedido?accion=listar" method="post">
  <input type="hidden" value="cancelado" name="estado">  </input> 
  <button id="button" type="submit">Solo Cancelados</button>
</form>

<form action="ServletPedido?accion=listar" method="post">
  <input type="hidden" value="en curso" name="estado">  </input> 
  <button id="button" type="submit">Solo En Curso </button>
</form>

<form action="ServletPedido?accion=listar" method="post">
  <input type="hidden" value="finalizado" name="estado">  </input> 
  <button id="button" type="submit">Solo Finalizados</button>
</form>

   <h1>
        Listado de pedidos
    </h1>            
    <div id="tabla">
        <table id="myTable">
            <thead>
                <tr>
                    <th>Numero</th><th>Fecha</th><th>Estado</th>
                    <th>Anular Pedido</th>                    
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
                <td rowspan=<%=c%>> <%=pl.getPed().getEstado()%>
                 <%if(pl.getPed().getEstado().equalsIgnoreCase("reservado")){%>
                     <form action="ServletPedido?accion=confirmarPedido" method="post">
                       <input type="hidden" value=<%=pl.getPed().getNroPedido()%> name="nro">  </input>			 
                       <button id="button" type="submit">Confirmar Pedido</button>
                     </form>
                 <%}%>
                 <%if(pl.getPed().getEstado().equalsIgnoreCase("en curso")){%>
                     <form action="ServletPedido?accion=finalizarPedido" method="post">
                       <input type="hidden" value=<%=pl.getPed().getNroPedido()%> name="nro">  </input>			 
                       <button id="button" type="submit">Finalizar Pedido</button>
                     </form>
                 <%}%>                 
                </td>
                <td rowspan=<%=c%>>
                <%if(pl.getPed().getEstado().equalsIgnoreCase("reservado")){%> 
                    <form action="ServletPedido?accion=anularPedido" method="post">
                       <input type="hidden" value=<%=pl.getPed().getNroPedido()%> name="nro">  </input>
                       <input type="hidden" value=<%=pl.getPed().getCliente().getId()%> name="idCl">  </input>
                       <button id="button" type="submit">Anular Pedido</button>
                    </form>
                <%}%>    
                </td>
                
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