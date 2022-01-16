<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteca Entre Hojas</title>
    <link rel="stylesheet" href="estilos/inicio.css">
    <link rel="icon" href="icons/inicio.ico">
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
                <form action="ServletLogin?accion=irLogin" method="post">
                     <button class="button1" type="submit"> Iniciar sesión</button>
                     <a href="index.jsp"><button class="button2" type="button"><i class="fas fa-home"></i></button> </a> 
                </form>
                     
                </div>
            </div>
        </nav>


        <section class="container hero__main">  
            <div class="hero__textos">
                <h1 class="title">La mejor <span class="title--active">colección de libros</span> para lectores apasionados</h1> 
                <p class="copy">Le brindamos la mejor manera de vivir la vida <span class="copy__active">a través de las palabras</span></p>
            </div>
            <img src="pictures/arbol1.jpg" class="mockup">
        </section>
    </header>

    <main>
        <section class="services">
            <div class="container">
                <h2 class="subtitle">Nuestros<span class="point"> Servicios</span></h2>
                <p class="copy__section">Elíjanos y te sentirás satisfecho. ¿Cerrarías los ojos a tantas historias?</p>

                <article class="container-cards">
                    <div class="card">
                        <img src="pictures/atencionCliente.png" class="card__img">
                        <div class="cards__text">
                            <p class="card__list">Bibliotecarios Expertos</p>
                            <h3 class="card__title">Exelente atencion al cliente<span class="point"> </span></h3>
                            <p class="card__copy">Responsables de la catalogación, clasificación, indexación y exposición de los materiales, capaces de ayudarte y guiarte en lo que necesites</p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="pictures/libros.png" class="card__img">
                        <div class="cards__text">
                            <p class="card__list">Buenos libros, buenos ratos</p>
                            <h3 class="card__title">Numerosa Variedad<span class="point"> </span></h3>
                            <p class="card__copy">La diversidad de libros es tan grande que puede resultar difícil contarlos y clasificarlos, sin embargo, contamos con categorias espesíficas para encontrar lo que buscas</p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="pictures/prestamo.png" class="card__img">
                        <div class="cards__text">
                            <p class="card__list">Sólo hay un bien: el conocimiento</p>
                            <h3 class="card__title">Pedidos las 24 horas<span class="point"> </span></h3>
                            <p class="card__copy">Pedidos de documentos, interbibliotecarios, especiales para entidades y además contamos con un buzón 24 horas de devolución de documentos</p>
                        </div>
                    </div>
                </article>
            </div>
        </section>


        <section class="testimony">
            <div class="container">
                <h2 class="subtitle">Libros <span class="point"> Reconocidos</span></h2>
                <p class="copy__section">Un buen libro  es más que una piedra preciosa</p>

                <div class="slider-frame">
                    <ul>
                        <li>
                            <div class="testimony-container">
                                <div class="testimony__card">
                                    <img src="pictures/cuervo.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">El cuervo</h3>
                                            <p class="testimony__position">Edgar Allan Poe</p>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="testimony__card">
                                    <img src="pictures/sinsajo.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">Sinsajo</h3>
                                            <p class="testimony__position">Suzanne Collins</p>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="testimony__card">
                                    <img src="pictures/parque.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">Parque Jurásico</h3>
                                            <p class="testimony__position">Michael Crichton</p>
                                        </div>
                                    </div>
                                </div>
                        </li>
                        <li>
                            <div class="testimony-container">
                                <div class="testimony__card">
                                    <img src="pictures/ana frank.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">El diario de Ana Frank</h3>
                                            <p class="testimony__position">Ana Frank</p>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="testimony__card">
                                    <img src="pictures/finales.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">Finales</h3>
                                            <p class="testimony__position">Pablo Bernasconi</p>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="testimony__card">
                                    <img src="pictures/El libro de los abrazos.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">El libro de los abrazos</h3>
                                            <p class="testimony__position">Eduardo Galeano</p>
                                        </div>
                                    </div>
                                </div>
                        </li>
                        <li>
                            <div class="testimony-container">
                                <div class="testimony__card">
                                    <img src="pictures/Billy summers.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">Billy summers</h3>
                                            <p class="testimony__position">Stephen King</p>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="testimony__card">
                                    <img src="pictures/La influencer.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">La influencer</h3>
                                            <p class="testimony__position">Ellery Lloyd</p>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="testimony__card">
                                    <img src="pictures/A fuego lento.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">A fuego lento</h3>
                                            <p class="testimony__position">Paula Hawkins</p>
                                        </div>
                                    </div>
                                </div>
                        </li>
                        <li>
                            <div class="testimony-container">
                                <div class="testimony__card">
                                    <img src="pictures/Strange.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">Strange</h3>
                                            <p class="testimony__position">Alex Mirez</p>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="testimony__card">
                                    <img src="pictures/Silence.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">Silence</h3>
                                            <p class="testimony__position">Flor M. Salvador</p>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="testimony__card">
                                    <img src="pictures/Lore.jpg" class="testimony__img">
                                    <div class="testimony__copy">
                                        <i class='bx bxs-book-bookmark testimony__logo'></i>
                                        <div class="testimony__info">
                                            <h3 class="testimony__name">Lore</h3>
                                            <p class="testimony__position">Bracken Alexandra</p>
                                        </div>
                                    </div>
                                </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

    </main>

        <div class="contact">
            <div class="item__contact">
                <i class='bx bx-copyright contact__icon' ></i>
                <h3 class="contact__title">Biblioteca Entre Hojas</h3>
            </div>
            <div class="item__contact">
                <i class='bx bx-mail-send contact__icon' ></i>
                <h3 class="contact__title">bibliotecaentrehojas@gmail.com</h3>
            </div>
            <div class="item__contact">
                <i class='bx bxs-edit-location contact__icon' ></i>
                <h3 class="contact__title">Galeria Stigliano</h3>
            </div>
            <div class="item__contact item__contact--gold">
            <form action="ServletLogin?accion=irContacto" method="post">
                     <button class="button1" type="submit"> Contacto</button>
                </form>
             <!--  <a href="contacto.jsp"><input class="button1" type="button" value="Contacto"></a> -->  
            </div>
        </div>
</body>
</html>