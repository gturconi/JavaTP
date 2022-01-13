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
<link rel="stylesheet" type="text/css" href="estilos/menu2.css">
<link rel="stylesheet" type="text/css" href="estilos/mensaje.css">
<link rel="icon" href="icons/libro.ico">
<title>Bienvenido Admin</title>
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


 <section class="container hero__main">  
            <div class="hero__textos">
                <h1 class="title"> ¡ Bienvenido Admin <span class="title--active"><%=cliente.getNombre()%> <%=cliente.getApellido()%></span> !</h1> 
            </div>
        </section> 
        
</header>
	

<nav class="navegacion">
	<!--  <input type="checkbox" id="btn_menu">
			<label for="btn_menu"><img src="pictures/menu.png" alt=""></label> -->
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
			</ul>
		</nav>		
	</header>
<%if(null != request.getAttribute("mensaje")){
	%><p id="mensaje"><%out.println(request.getAttribute("mensaje"));%> </p>    
  <%}%> 
  
  <div class="slider">
	<ul>
		<li>
  			<img src="pictures/banner1.png" alt="">
 		</li>
		<li>
  			<img src="pictures/banner2.png" alt="">
		</li>
		<li>
  			<img src="pictures/banner3.png" alt="">
		</li>
		<li>
  			<img src="pictures/banner4.png" alt="">
		</li>
	</ul>
</div>
		
<footer>	
		<div class="contact">
            <div class="item__contact">
                <h3 class="contact__title">Biblioteca Entre Hojas</h3>
            </div>
            <div class="item__contact">
                <h3 class="contact__title">bibliotecaentrehojas@gmail.com</h3>
            </div>
            <div class="item__contact">
                <h3 class="contact__title">Galeria Stigliano</h3>
            </div>
             <div class="item__contact">
                <h3 class="contact__title">Derechos Reservados</h3>
            </div>
        </div>
</footer>				
	</body>
