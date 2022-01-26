<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   Cliente cliente = (Cliente)session.getAttribute("Cliente");  
%>
<link rel="stylesheet" type="text/css" href="estilos/pruebaMenu.css">
<link rel="stylesheet" type="text/css" href="estilos/botonesListar.css">
<link rel="stylesheet" type="text/css" href="estilos/mensaje.css">
<link rel="icon" href="icons/libro.ico">
<script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
<title>Bienvenido Cliente</title>
</head>
<body>

<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
                </div>
            </div>
        </nav>


 <section class="container hero__main">  
            <div class="hero__textos">
                <h1 class="title"> ¡ Bienvenido Cliente <span class="title--active"><%=cliente.getNombre()%> <%=cliente.getApellido()%></span> de <%=cliente.getLocalidad().getNombre()%> !</h1> 
            </div>
        </section> 
        
</header>


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
						<form action="ServletMenu?accion=irVentanaEmergente" method="post">
							<button id="button" type="submit">Eliminar</button> 
               			</form>
						
					<!--  	<form action="ServletCliente?accion=eliminarCuenta" method="post">
							<button id="button" type="submit">Eliminar</button>
						</form>		-->											
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
</html>