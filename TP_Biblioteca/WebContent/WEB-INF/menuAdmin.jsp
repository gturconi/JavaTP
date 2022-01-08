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
<title>Bienvenido Admin</title>
</head>
	<body>
	<h1>Bienvenido Administrador <%=cliente.getNombre()%> <%=cliente.getApellido()%></h1>
	
	<header>
		<input type="checkbox" id="btn_menu">
			<label for="btn_menu"><img src="pictures/menu.png" alt=""></label>

		<nav class="navegacion">
			<ul class="nav">
				<li><a href="#">Cuenta</a>
					<ul >
						<li>
							<form action="ServletMenu?accion=modificarCuenta" method="post">
							<button id="button" type="submit">Editar</button>
						    </form>
						</li>
						<li>
						<form action="ServletCliente?accion=eliminarCuenta" method="post">
							<button id="button" type="submit">Eliminar</button>
						</form>
						</li>
						<li>
							<form  action="ServletLogin" method="post">
								<input id="button" type="submit" name="logout" value="Cerrar Sesion">
							</form>
						</li>
					</ul>
				</li>
				<li><a href="#">Listados</a>
					<ul>
					    <li>
							<form action="ServletCliente?accion=listar" method="post">
                                <button id="button" type="submit">Clientes</button>
                            </form>
						</li>
						<li>
							<form action="ServletLocalidad?accion=listar" method="post">
                                <button id="button" type="submit">Localidades</button>
                            </form>
						</li>
						<li>
							<form action="ServletAutor?accion=listar" method="post">
                                <button id="button" type="submit">Autores</button>
                            </form>
						</li>
						<li>
							<form action="ServletCategoria?accion=listar" method="post">
								<button id="button" type="submit">Categorias</button>
							</form>
						</li>
						<li>
							<form action="ServletEditorial?accion=listar" method="post">
								<button id="button" type="submit">Editoriales</button>
							</form>
						</li>
						<li>
							<form action="ServletLibro?accion=listar" method="post">
                                <button id="button" type="submit">Libros</button>
                            </form>
						</li>
						<li>
							<form action="ServletPedido?accion=listar" method="post">
							    <input type="hidden" value="reservado" name="estado">  </input>
								<button id="button" type="submit">Pedidos</button>
							</form>
						</li>
					</ul>
				</li>
				<li><a href="#">Busquedas</a>
					<ul>
						<li>
						    <form action="ServletMenu?accion=buscarLocalidad" method="post">
                                <button id="button" type="submit">Localidad</button>
                            </form>																			
						</li>
						<li>
							<form action="ServletMenu?accion=buscarAutor" method="post">				 
								<button id="button" type="submit">Autor</button>
							</form>
						</li>
						<li>
							<form action="ServletMenu?accion=buscarCategoria" method="post">				 
								<button id="button" type="submit">Categoria</button>
							</form>
						</li>
						<li>
							<form> <!-- llamar servlet para buscar editorial-->
								<button id="button" type="submit">Editorial</button>
							</form>
						</li>
						<li>
							<form> <!-- llamar servlet para buscar libro-->
								<button id="button" type="submit">Libro</button>
							</form>
						</li>
						<li>
							<form> <!-- llamar servlet para buscar pedido-->
								<button id="button" type="submit">Pedido</button>
							</form>
						</li>
					</ul>
				</li>				
			</ul>
		</nav>		
	</header>
<%if(null != request.getAttribute("mensaje")){
	  out.println(request.getAttribute("mensaje"));    
  }	  
  %>	
	</body>
