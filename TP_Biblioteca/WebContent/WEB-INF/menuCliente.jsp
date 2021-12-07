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
<link rel="icon" href="icons/libro.ico">
<title>Bienvenido</title>
</head>
<body>

<h1>Bienvenido <%=cliente.getNombre()%> de <%=cliente.getLocalidad().getNombre()%></h1>

<header>
		<nav class="navegacion">
			<ul class = "menu">
				<li><a href="#">Cuenta</a>
					<ul class = "subMenu">
						<li><a href="#">Modificar Cuenta</a></li>
						<li><a href="#">Eliminar Cuenta</a></li>
						<li>							   					   						   
						   <a href="#">Cerar Sesi�n</a>
						   						
						  </li>
					</ul>
				</li>
				<li><a href="#">Consultas</a>
					<ul class = "subMenu">
						<li><a href="#">Libros</a></li>
						<li><a href="#">Autores</a></li>
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



<form action="ServletLocalidad" method="post">
<button type="submit">Listar Localidades</button>
</form>

<form action="ServletAutor?accion=listar" method="post">
<button type="submit">Listar Autores</button>
</form>

<form action="ServletAutor?accion=buscar" method="post">
<input type="text" placeholder="escribe el id del autor" maxlength="10" name="id"> 
<button type="submit">Buscar Autor</button>
</form>

<form action="ServletAutor?accion=agregar" method="post">
<input type="text" placeholder="nombre" maxlength="20" name="nombre">
<input type="text" placeholder="apellido" maxlength="20" name="apellido"> 
<button type="submit">A�adir Autor</button>
</form>

<form action="ServletAutor?accion=borrar" method="post">
<input type="text" placeholder="escribe el id del autor" maxlength="10" name="id">
<button type="submit">Borrar Autor</button>
</form>

<form action="ServletAutor?accion=modificar" method="post">
<input type="text" placeholder="escribe el id del autor" maxlength="10" name="id">
<input type="text" placeholder="escribe el nombre nuevo" maxlength="10" name="nombre">
<input type="text" placeholder="escribe el apellido nuevo" maxlength="10" name="apellido">
<button type="submit">Modificar Autor</button>
</form>
<form class="formulario" action="ServletLogin" method="post">
                               <input type="submit" name="logout" value="Cerrar Sesion">
                            </form>


</body>
</html>