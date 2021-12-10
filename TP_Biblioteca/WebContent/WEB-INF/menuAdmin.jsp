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
	<h1>Bienvenido Aministrador <%=cliente.getNombre()%> <%=cliente.getApellido()%></h1>
	
		<nav class="navegacion">
			<ul class="nav">
				<li><a href="#">Cuenta</a>
					<ul >
						<li>
							<form> <!-- llamar servlet para modificar/editar cuenta-->
								<button id="button" type="submit">Editar</button>
							</form>
						</li>
						<li>
							<form> <!-- llamar servlet para mostrar eliminar cuenta-->
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
							<form action="ServletLocalidad" method="post">
                                <button id="button" type="submit">Localidades</button>
                            </form>
						</li>
						<li>
							<form action="ServletAutor?accion=listar" method="post">
                                <button id="button" type="submit">Autores</button>
                            </form>
						</li>
						<li>
							<form> <!-- llamar servlet para mostrar listado de categorias-->
								<button id="button" type="submit">Categorias</button>
							</form>
						</li>
						<li>
							<form> <!-- llamar servlet para mostrar listado de editoriales-->
								<button id="button" type="submit">Editoriales</button>
							</form>
						</li>
						<li>
							<form> <!-- llamar servlet para mostrar listado de libros-->
								<button id="button" type="submit">Libros</button>
							</form>
						</li>
						<li>
							<form> <!-- llamar servlet para mostrar listado de pedidos-->
								<button id="button" type="submit">Pedidos</button>
							</form>
						</li>
					</ul>
				</li>
				<li><a href="#">Busquedas</a>
					<ul>
						<li>
							<form> <!-- llamar servlet para buscar localidades-->
								<button id="button" type="submit">Localidad</button>
							</form>
						</li>
						<li>
							<form action="ServletMenu?accion=buscarAutor" method="post">				 
								<button id="button" type="submit">Autor</button>
							</form>
						</li>
						<li>
							<form> <!-- llamar servlet para buscar categoria-->
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
				<li><a href="#">Modificaciones</a>
					<ul>
						<li><a href="#">Autor</a>
							<ul>
								<li>
									<form action="ServletMenu?accion=a�adirAutor" method="post">				 
                                        <button id="button" type="submit">A�adir Autor</button>
                                    </form>
								</li>
								<li>
									<form action="ServletMenu?accion=modificarAutor" method="post">				 
                                        <button id="button" type="submit">Modificar Autor</button>
                                    </form>
								</li>
								<li>
									<form action="ServletMenu?accion=borrarAutor" method="post">				 
                                        <button id="button" type="submit">Eliminar Autor</button>
                                    </form>
								</li>
							</ul>
						</li>
						<li><a href="#">Categoria</a>
							<ul>
								<li>
									<form> <!-- llamar servlet para a�adir categoria -->				 
                                        <button id="button" type="submit">A�adir Categoria</button>
                                    </form>
								</li>
								<li>
									<form> <!-- llamar servlet para modificar categoria -->				 
                                        <button id="button" type="submit">Modificar Categoria</button>
                                    </form>
								</li>
								<li>
									<form> <!-- llamar servlet para borrar categoria -->				 
                                        <button id="button" type="submit">Eliminar Categoria</button>
                                    </form>
								</li>
							</ul>
						</li>
						<li><a href="#">Editorial</a>
							<ul>
								<li>
									<form> <!-- llamar servlet para a�adir editorial -->				 
                                        <button id="button" type="submit">A�adir Editorial</button>
                                    </form>
								</li>
								<li>
									<form> <!-- llamar servlet para modificar editorial -->				 
                                        <button id="button" type="submit">Modificar Editorial</button>
                                    </form>
								</li>
								<li>
									<form> <!-- llamar servlet para borrar editorial -->				 
                                        <button id="button" type="submit">Eliminar Editorial</button>
                                    </form>
								</li>
							</ul>
						</li>
						<li><a href="#">Libro</a>
							<ul>
								<li>
									<form> <!-- llamar servlet para a�adir libro -->				 
                                        <button id="button" type="submit">A�adir Libro</button>
                                    </form>
								</li>
								<li>
									<form> <!-- llamar servlet para modificar libro -->				 
                                        <button id="button" type="submit">Modificar Libro</button>
                                    </form>
								</li>
								<li>
									<form> <!-- llamar servlet para borrar libro -->				 
                                        <button id="button" type="submit">Eliminar Libro</button>
                                    </form>
								</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</nav>
	</body>
