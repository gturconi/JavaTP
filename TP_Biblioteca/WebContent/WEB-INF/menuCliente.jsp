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
<title>Bienvenido Cliente</title>
</head>
<body>

<h1>Bienvenido Cliente <%=cliente.getNombre()%> <%=cliente.getApellido()%> de <%=cliente.getLocalidad().getNombre()%></h1>

<header>
		<nav class="navegacion">
			<ul class = "nav">
				<li><a href="#">Mi Cuenta</a>
					<ul class = "subMenu">
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
							<form action="ServletAutor?accion=listar" method="post">
								<button id="button" type="submit">Autores</button>
							</form>
						</li></li>
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
</html>