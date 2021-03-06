<%@page import="java.util.LinkedList" %>
<%@page import="entities.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
   LinkedList<Cliente> clientes = (LinkedList<Cliente>)request.getAttribute("Clientes");
   LinkedList<Cliente> clientesEstado = (LinkedList<Cliente>)request.getAttribute("ClientesEstado");
   Cliente cl = (Cliente) (request.getSession().getAttribute("Cliente"));
   int admin = cl.getisAdmin();
%>
<meta charset="ISO-8859-1">
<link rel="icon" href="icons/cliente.ico">
<title>Listado Clientes</title>
<link rel="stylesheet" href="estilos/tabla.css">
<link rel="stylesheet" href="estilos/busqueda.css">
<link rel="stylesheet" href="estilos/menuFiltrar2.css">
<link rel="stylesheet" href="estilos/header.css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>


<header>
 <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point"> Entre hojas </span></h2>
                </div>
                 <div>
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
				<form action="ServletCliente?accion=listarPorEstado" method="post">
					<input type="hidden" value="suspendido" name="estado">  </input> 
					<button id="button" type="submit">Solo Suspendidos</button>
 				 </form>
			</li>
			<li>
				<form action="ServletCliente?accion=listarPorEstado" method="post">
					<input type="hidden" value="habilitado" name="estado">  </input> 
					<button id="button" type="submit">Solo Habilitados</button>
  				</form>
			</li>
			<li>
 				<form action="ServletCliente?accion=listar" method="post">
					<button id="button" type="submit">Listar Todos </button>
  				</form>
			</li>
</ul>
</nav>

<h1> Listado de Clientes</h1>

        <table id="myTable">
            <thead>
                <tr>
                    <th>Numero</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <!--<th>Password</th> -->
                    <th>Domicilio</th>
                    <th>Telefono</th>
                    <th>Email</th>
                    <th>Fecha Inscripcion</th>
                    <th>Localidad</th>
                    <th>Estado</th>
                    <th>Accion</th>                    
                </tr>
            </thead>
            <tbody>
            <tr>   
           <% LinkedList<Cliente> lista = new LinkedList<>();
              lista = (clientesEstado == null)?(lista=clientes):(lista=clientesEstado);%>         	 
             <%for(Cliente cli : lista){ %>             
                <td data-label="id"> <%=cli.getId()%></td>
                <td data-label="nombre"> <%=cli.getNombre()%></td>
                <td data-label="apellido"> <%=cli.getApellido()%></td>
                <td data-label="usuario"> <%=cli.getUser()%></td>
             <!--   <td> <%=cli.getPassword()%></td> -->
                <td data-label="domicilio"> <%=cli.getDomicilio()%></td>
                <td data-label="telefono"> <%=cli.getTelefono()%></td>
                <td data-label="email"> <%=cli.getEmail()%></td>
                <td data-label="fechaInscripcion"> <%=cli.getFechaInscripcion()%></td>
                <td data-label="localidad"> <%=cli.getLocalidad().getNombre()%></td>
                <td data-label="estado"> <%=cli.getEstado()%></td>
                <%if(cli.getEstado().equalsIgnoreCase("habilitado")){ %>
                <td data-label="accion">                
                      <form action="ServletCliente?accion=suspender" method="post">
                           <input type="hidden" value=<%=cli.getId()%> name="id">  </input>  
                           <input type="hidden" value=0 name="estado">  </input>                           								           
				           <button id="boton" type="submit">Suspender Cliente</button>
			          </form>                                                  
                </td>
                <%}else{%> 
                     <td data-label="accion">
                       <form action="ServletCliente?accion=habilitar" method="post">
                           <input type="hidden" value=<%=cli.getId()%> name="id">  </input> 
                           <input type="hidden" value=1 name="estado">  </input>                             								           
				           <button id="boton" type="submit">Habilitar Cliente</button>
			          </form>
                     </td>  
                <%}%>   
            </tr>
            <%}%>
        </tbody>
        </table> 

  <div class="container">
    <div class="card">
      <img src="pictures/lupaBusqueda.png" alt="">
      <h4> Buscar </h4>
      <form class="formulario" action="ServletCliente?accion=buscar" method="post">
        <input id="campoTexto" type="text" placeholder="Ingrese id  " maxlength="10" name="id" required> 
        <button id= "boton" type="submit">Buscar Cliente</button>
      </form>
    </div>  

    
  </div> 



                                  
</body>
</html>