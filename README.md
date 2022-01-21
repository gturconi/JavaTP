# JavaTP
Trabajo Práctico Final de Java

## Alumnos:  
	Nombre y Apellido                                                        Legajo          
	 1- Franco Giangiordano                                                   46802
	 2- Gonzalo Turconi                                                       46730
   
## Enunciado general:

El sistema consiste en un aplicación web para gestión de pedidos de libros y de clientes.
Existen dos usuarios: administrador y cliente, ambos registrados.

##### Regularidad

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC simple|1 x integ|1 x integ|ABMC de Categoria, Autor, Editorial 
|ABMC dependiente|1|2|ABMC de Libro y de Cliente
|CU NO-ABMC|1|2|Préstamo de Libro, Devolución de Libro
|Listado simple|1|3(*)|Listado de libros, Listado de Clientes, Listado de Reservas 
|Listado complejo|0|1(*)| -----

##### Aprobación Directa

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC|todos|todos|Categoría, Autor, Editorial, Localidad, Libro, Pedido, Cliente
|CU "Complejo"(nivel resumen)|1|2|Reserva, prestamo y devolucion de Libro, Calificación/Reseña de libros
|Listado complejo|1|2|Listado de libros por estado de clientes por estado
|Nivel de acceso|2|2| Administrador-Cliente
|Manejo de errores|obligatorio|obligatorio|no requiere detalle|
|requerimiento extra obligatorio|0|1|Manejo de archivos, Envio de emails
|publicar el sitio|olbigatorio|obligatorio|no requiere detalle|

