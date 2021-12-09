<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Cliente cliente = (Cliente)session.getAttribute("Cliente");  
%>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilos/menu.css">
<link rel="stylesheet" type="text/css" href="estilos/botonesListar.css">
<link rel="icon" href="icons/libro.ico">
<title>Bienvenido</title>
</head>
<body>

<h1>ï¿½ï¿½ Bienvenido <%=cliente.getNombre()%> <%=cliente.getApellido()%> de <%=cliente.getLocalidad().getNombre()%> !!</h1>

<header>
		<nav class="navegacion">
			<ul class = "menu">
				<li><a href="#">Cuenta</a>
					<ul class = "subMenu">
						<li><a href="#">Modificar Cuenta</a></li>
						<li><a href="#">Eliminar Cuenta</a></li>
						<li>							   					   						   
							<form  action="ServletLogin" method="post">
								<input id="button1" type="submit" name="logout" value="Cerrar Sesion">
							</form>				
						</li>
					</ul>
				</li>
				<li><a href="#">Consultas</a>
					<ul class = "subMenu">
						<li><a href="#">Libros</a></li>
						<li><a href="#">Autores</a></li></li>
						<li><a href="#">Categorias</a></li>
						<li><a href="#">Editoriales</a></li>
					</ul>
				</li>
				<li><a href="#">Pedido</a>
					<ul class = "subMenu">
						<li><a href="#">RealizarPedido</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>


		<section class="form-listado">
			   <form action="ServletLocalidad" method="post">
			   <button class="button" type="submit">Listar Localidades</button>
			   </form>
		</section>
		<section class="form-listado">
			<form action="ServletAutor?accion=listar" method="post">
				<button class="button" type="submit">Listar Autores</button>
			</form>
			<form action="ServletMenu?accion=buscarAutor" method="post">				 
				<button class="button" type="submit">Buscar Autor</button>
			</form>
			<form action="ServletMenu?accion=agregarAutor" method="post">				 
				<button class="button" type="submit">Añadir Autor</button>
			</form>
            <form action="ServletMenu?accion=borrarAutor" method="post">
                   <button class="button" type="submit">Borrar Autor</button>
            </form>						
				<form action="ServletMenu?accion=modificarAutor" method="post">				
				<button class="button" type="submit">Modificar Autor</button>
			</form>	
	   </section>
</body>
</html>