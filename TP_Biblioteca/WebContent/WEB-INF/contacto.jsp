<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteca Entre Hojas</title>
    <link rel="stylesheet" href="estilos/contacto.css">
    <link rel="icon" href="inicio.ico">
    <script src="https://kit.fontawesome.com/cbd6eda0d3.js" crossorigin="anonymous"></script>
</head>
<body>
    <header class="hero">
           <nav class="nav__hero">
            <div class="container nav__container">
                <div class="logo">
                    <h2 class="logo__name">Biblioteca<span class="point">  Entre hojas </span></h2>
                </div>
                <div class="links">
                    <a href="index.jsp"><button class="button2" type="button"><i class="fas fa-home"></i></button> </a> 
                </div>
            </div>
        </nav>
    </header>

    <footer>
         <section class="contacto">
            <div class="contenedor">
                <div class="footer-textos">
                    <h2>¡ Contactate con nosotros !</h2>
                        <p class="footer-textos__p1">¡Gracias por su interés! Complete los datos para contactarnos.</p1>
                        <p class="footer-textos__p2">Estamos aquí para lo que necesite.</p2>
                </div>
                <form action="enviarMail.php" class="formulario" method="POST">
                         <input type="text" placeholder="Nombre:" id="nombre" name="nombre" required value="">
                         <input type="text" placeholder="Apellido:" id="apellido" name="apellido" required value="">
                         <input type="email" placeholder="Correo electrónico:" id="correo" name="correo" required value="" class="email">
                         <textarea name="mensaje" id="mensaje" placeholder="Mensaje:"></textarea>
                    <div class="derecha">
                        <input class="boton derecha" type="submit" value="Contactar" name="submmit" id="boton">
                    </div>
                </form>
                </div>
         </section>
    </footer>
</body>
</html>