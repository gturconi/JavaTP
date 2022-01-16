<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/header.css">
<link rel="stylesheet" type="text/css" href="estilos/ventanaEmergente.css">
<title>Insert title here</title>
</head>
<body>
<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
            </div>
        </nav> 
</header>

	<div class="modal">
		<div class="contenido">
			<h2> ¿Esta seguro que desea eliminar la cuenta ? </h2>
			<div  class="contieneFormulario">
				<form action="ServletCliente?accion=eliminarCuenta" method="post">
					<button id="button" type="submit">Aceptar</button>
				</form>	
			</div>
			<% if(admin != 1){ %>  
                <div class="contieneFormulario">
					<form action="ServletMenu?accion=irMenuCliente" method="post">	
						<button id="button" type="submit">Rechazar</button>
               		</form>
            	</div>
                 <%}%>
            <% if(admin == 1){ %>
                <div class="contieneFormulario">
					<form action="ServletMenu?accion=irMenuAdmin" method="post">
						<button id="button" type="submit">Rechazar</button>
              	 	</form>
            	</div>
             <%}%> 
		</div>
	</div>
</body>
</html>