<%@page import="java.util.LinkedList" %>
<%@page import="entities.PedidoLibro" %>
<%@page import="entities.Libro" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<PedidoLibro> pedidos = (LinkedList<PedidoLibro>)request.getAttribute("Pedidos");  
Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/pedido.ico">
<title>Listado de Pedidos </title>
<link rel="stylesheet" href="estilos/header.css">
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/menuFiltrar2.css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
 <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
</head>
<body>

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

<section class="filtro">  
            <div class="hero__textos">
                <h2 class="title2"> Filtrar por :</h2> 
            </div>
</section> 


<nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <ul>
            <li>
            	<form action="ServletPedido?accion=listar" method="post">
  					<input type="hidden" value="reservado" name="estado">  </input> 
  					<button id="button" type="submit">Solo Reservados</button>
				</form>
			</li>
            <li>
            	<form action="ServletPedido?accion=listar" method="post">
  					<input type="hidden" value="cancelado" name="estado">  </input> 
 					 <button id="button" type="submit">Solo Cancelados</button>
				</form>
            </li>
            <li>
            	<form action="ServletPedido?accion=listar" method="post">
  					<input type="hidden" value="en curso" name="estado">  </input> 
  						<button id="button" type="submit">Solo En Curso </button>
				</form>
            </li>
            <li>
            	<form action="ServletPedido?accion=listar" method="post">
  					<input type="hidden" value="finalizado" name="estado">  </input> 
  					<button id="button" type="submit">Solo Finalizados</button>
				</form>
            </li>
        </ul>
    </nav>


   <h1>
        Listado de pedidos
    </h1>            
    <div id="tabla">
        <table id="myTable">
            <thead>
                <tr>
                    <th>Numero</th><th>Fecha</th><th>Estado</th>
                    <th>Anular Pedido</th>                    
                    <th>IdCliente</th><th>Nombre</th><th>Apellido</th>   
                    <th>IdLibro</th><th>Titulo</th>                                                                                                                                     
                </tr>
            </thead>
            <tr>
              <%for(PedidoLibro pl : pedidos){
            	String c = String.valueOf(pl.getLibros().size());
            	%>                
                <td data-label="Numero" rowspan=<%=c%>> <%=pl.getPed().getNroPedido()%></td>
                <td data-label="Fecha"rowspan=<%=c%>> <%=pl.getPed().getFecha()%></td>                
                <td data-label="Estado"rowspan=<%=c%>> <%=pl.getPed().getEstado()%>
                 <%if(pl.getPed().getEstado().equalsIgnoreCase("reservado")){%>
                     <form action="ServletPedido?accion=confirmarPedido" method="post">
                       <input type="hidden" value=<%=pl.getPed().getNroPedido()%> name="nro">  </input>			 
                       <button id="boton" type="submit">Confirmar Pedido</button>
                     </form>
                 <%}%>
                 <%if(pl.getPed().getEstado().equalsIgnoreCase("en curso")){%>
                     <form action="ServletPedido?accion=finalizarPedido" method="post">
                       <input type="hidden" value=<%=pl.getPed().getNroPedido()%> name="nro">  </input>			 
                       <button id="boton" type="submit">Finalizar Pedido</button>
                     </form>
                 <%}%>                 
                </td>
                <td data-label="Anular pedido"rowspan=<%=c%>>
                <%if(pl.getPed().getEstado().equalsIgnoreCase("reservado")){%> 
                    <form action="ServletPedido?accion=anularPedido" method="post">
                       <input type="hidden" value=<%=pl.getPed().getNroPedido()%> name="nro">  </input>
                       <input type="hidden" value=<%=pl.getPed().getCliente().getId()%> name="idCl">  </input>
                       <button class="anular" id="boton" type="submit">Anular Pedido</button>
                    </form>
                <%}%>    
                </td>
                
                <td data-label="Id Cliente"rowspan=<%=c%>> <%=pl.getPed().getCliente().getId()%>
                <td data-label="Nombre Cliente"rowspan=<%=c%>> <%=pl.getPed().getCliente().getNombre()%>
                <td data-label="Apellido Cliente"rowspan=<%=c%>> <%=pl.getPed().getCliente().getApellido()%>             
             <%for(int i=0; i<pl.getLibros().size();i++) {%>
                   <%if(i>0){%> <tr> <%}%> 
                   <td data-label="Id libro"> <%=pl.getLibros().get(i).getId()%></td> 
                   <td data-label="Titulo"> <%=pl.getLibros().get(i).getTitulo()%></td> </tr>  
             <%}%>           
           <%}%>  
          </table>                   
    </div>     
</body>
</html>