package Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import entities.Autor;
import entities.Cliente;
import entities.Comentario;
import entities.Libro;
import logic.LogicAutor;
import logic.LogicCategoria;
import logic.LogicCliente;
import logic.LogicEditorial;
import logic.LogicLibro;
import logic.LogicPedido;

/**
 * Servlet implementation class ServletLibro
 */
@WebServlet("/ServletLibro")
@MultipartConfig(maxFileSize = 16177216)//1.5mb

public class ServletLibro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLibro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int accion = Integer.parseInt(request.getParameter("id"));
		LogicLibro ctrllib = new LogicLibro();
		ctrllib.listarImgLib(accion, response);
			
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		if(accion.equalsIgnoreCase("listar")) {			
			listar(request,response);				
		}else if(accion.equalsIgnoreCase("buscar")) {
			buscar(request,response);
		}else if(accion.equalsIgnoreCase("agregar")) {
			agregar(request,response);
		}else if(accion.equalsIgnoreCase("borrar")) {
			borrar(request,response);
		}else if(accion.equalsIgnoreCase("modificar")) {
			modificar(request,response);
		}else if(accion.equalsIgnoreCase("detalleLibro")) {
			detalleLibro(request,response);
		}else if(accion.equalsIgnoreCase("listarPorEstado")) {
			listarPorEstado(request,response);
		}else if(accion.equalsIgnoreCase("comentarLibro")) {
			comentarLibro(request,response);
		}
		
		
	}

	private void comentarLibro(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		LogicLibro ctrllib = new LogicLibro();
		LogicCliente ctrlcli = new LogicCliente();
		int id = Integer.parseInt(request.getParameter("id"));
		int rate = Integer.parseInt(request.getParameter("rate"));
		Cliente cliente = (Cliente) request.getSession().getAttribute("Cliente");
		int idCliente = cliente.getId();
		LocalDateTime localDate = LocalDateTime.now();        				
		String comentario = request.getParameter("comentario");
		
		Comentario c = new Comentario();		
		c.setCalificacion(rate);
		c.setReseña(comentario);
		c.setUsuario(ctrlcli.buscarClientePorId(idCliente));
		c.setLibro(ctrllib.buscarLib(id));
		c.setFecha(localDate);
		ctrllib.cargarComentarioLib(c);		
		detalleLibro(request,response);
	}

	private void listarPorEstado(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		LogicLibro ctrllib = new LogicLibro();
		String estado = request.getParameter("estado");
		LinkedList<Libro> librosEstado = ctrllib.listarLibrosPorEstado(estado);
				
		request.setAttribute("librosEstado", librosEstado);				
		request.getRequestDispatcher("WEB-INF/listaLibros.jsp").forward(request, response);
				
	}
	

	private void detalleLibro(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       
		LogicLibro ctrllib = new LogicLibro();
		LogicPedido ctrlped = new LogicPedido();
		int id = Integer.parseInt(request.getParameter("id"));
				
		Libro l  = ctrllib.buscarLib(id);
				
		Cliente cliente = (Cliente) request.getSession().getAttribute("Cliente");
		int idCliente = cliente.getId();
		
		LinkedList<Libro> librosPedidos = ctrlped.listadoLibCliente(idCliente);
		
		request.setAttribute("Libro", l);
		request.setAttribute("LibrosPedidos", librosPedidos);		
		request.getRequestDispatcher("WEB-INF/detalleLibro.jsp").forward(request, response);
		
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		LogicEditorial ctrled = new LogicEditorial();
		LogicAutor ctrlaut = new LogicAutor();
		LogicCategoria ctrlcat = new LogicCategoria();
		LogicLibro ctrllib = new LogicLibro();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String titulo = request.getParameter("titulo");
		String descripcion = request.getParameter("descripcion");
		int edicion = Integer.parseInt(request.getParameter("edicion"));
		LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));

				
		String alto = request.getParameter("alto");
		String ancho = request.getParameter("ancho");
		
		
		
		int paginas = Integer.parseInt(request.getParameter("paginas"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		double precio = Double.parseDouble(request.getParameter("precio"));
		int editorial = Integer.parseInt(request.getParameter("editorial"));
		int categoria = Integer.parseInt(request.getParameter("categoria"));
		
		
		String[] autores = request.getParameterValues("autores");
				
		Libro l = new Libro();
		l.setId(id);
		l.setTitulo(titulo);
		l.setDescripcion(descripcion);
		l.setNroEdicion(edicion);
		l.setFechaEdicion(fecha);
		l.setDimensiones(alto+'x'+ancho);
		l.setNroPaginas(paginas);
		l.setExistencia(stock);
		l.setPrecio(precio);
		l.setEditorial(ctrled.buscarEditorial(editorial));
		l.setCategoria(ctrlcat.buscarCategoria(categoria));
		
		LinkedList<Autor> ats = new LinkedList<Autor>();
		
		for(int i=0; i<autores.length;i++) {
			ats.add(ctrlaut.buscarAut(Integer.parseInt(autores[i])));
		}
		
		
		
		l.setAutores(ats);
		
		ctrllib.modificarLib(l);
						
		listar(request,response);
		
	}

	private void borrar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LogicLibro ctrllib = new LogicLibro();
		int id = Integer.parseInt(request.getParameter("id"));
		
		ctrllib.borrarLib(id);
		listar(request,response);	    			
	}

	private void agregar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		LogicLibro ctrllib = new LogicLibro();
		LogicCategoria ctrlcat = new LogicCategoria();
		LogicAutor ctrlaut = new LogicAutor();
		LogicEditorial ctrled = new LogicEditorial();
				
		String titulo = request.getParameter("titulo");
		String descripcion = request.getParameter("descripcion");
		int edicion = Integer.parseInt(request.getParameter("edicion"));
		LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));

				
		String alto = request.getParameter("alto");
		String ancho = request.getParameter("ancho");
		
		int paginas = Integer.parseInt(request.getParameter("paginas"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		double precio = Double.parseDouble(request.getParameter("precio"));
		int editorial = Integer.parseInt(request.getParameter("editorial"));
		int categoria = Integer.parseInt(request.getParameter("categoria"));
		Part part = request.getPart("imagen");
		
		String[] autores = request.getParameterValues("autores");
						 		
		Libro l = new Libro();
		l.setTitulo(titulo);
		l.setDescripcion(descripcion);
		l.setNroEdicion(edicion);
		l.setFechaEdicion(fecha);
		l.setDimensiones(alto+'x'+ancho);
		l.setNroPaginas(paginas);
		l.setExistencia(stock);
		l.setPrecio(precio);
		l.setEditorial(ctrled.buscarEditorial(editorial));
		l.setCategoria(ctrlcat.buscarCategoria(categoria));
		InputStream is = part.getInputStream();
		l.setImagen(is);
		
		LinkedList<Autor> ats = new LinkedList<Autor>();
				
		for(int i=0; i<autores.length;i++) {			
			ats.add(ctrlaut.buscarAut(Integer.parseInt(autores[i])));
		}
		
		l.setAutores(ats);
		
		ctrllib.agregarLibro(l);
		
		listar(request,response);
		
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LogicLibro ctrllib = new LogicLibro();
	    int id = Integer.parseInt(request.getParameter("id"));	    
	    Libro libro = ctrllib.buscarLib(id);
	    
	    if(libro != null) {
	    	request.setAttribute("Libro", libro);	
	    }else {
	    	request.setAttribute("error", "El id no corresponde a ningun libro!");
	    }
	    request.getRequestDispatcher("WEB-INF/buscaLibro.jsp").forward(request, response);
		
	}

	
	private void listar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
						
		LogicLibro ctrllib = new LogicLibro();
		LinkedList<Libro> libros = ctrllib.listadoLib();
		LogicPedido ctrlped = new LogicPedido();
		
		Cliente cliente = (Cliente) request.getSession().getAttribute("Cliente");
		int idCliente = cliente.getId();
				
		
		LinkedList<Libro> librosPedidos = ctrlped.listadoLibCliente(idCliente);
		
		request.setAttribute("Libros", libros);
		request.setAttribute("LibrosPedidos", librosPedidos);		
		request.getRequestDispatcher("WEB-INF/listaLibros.jsp").forward(request, response);
		
	}
	
	
}
