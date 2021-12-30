package Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import entities.Autor;
import entities.Libro;
import logic.Logic;

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
		Logic ctrl = new Logic();
		ctrl.listarImgLib(accion, response);
			
		
		
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
		}
		
		
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		Logic ctrl = new Logic();
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
		String editorial = request.getParameter("editorial");
		String categoria = request.getParameter("categoria");
		
		
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
		l.setEditorial(ctrl.buscarEdPorNombre(editorial));
		l.setCategoria(ctrl.buscarCatPorNombre(categoria));
		
		LinkedList<Autor> ats = new LinkedList<Autor>();
		
		for(int i=0; i<autores.length;i++) {
			String[] nomyApe = autores[i].split("/");			
			ats.add(ctrl.buscarAutPorNombre(nomyApe[0], nomyApe[1]));
		}
		
		
		
		l.setAutores(ats);
		
		ctrl.modificarLib(l);
						
		listar(request,response);
		
	}

	private void borrar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Logic ctrl = new Logic();
		int id = Integer.parseInt(request.getParameter("id"));
		
		ctrl.borrarLib(id);
		listar(request,response);	    			
	}

	private void agregar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		Logic ctrl = new Logic();
				
		String titulo = request.getParameter("titulo");
		String descripcion = request.getParameter("descripcion");
		int edicion = Integer.parseInt(request.getParameter("edicion"));
		LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));

				
		String alto = request.getParameter("alto");
		String ancho = request.getParameter("ancho");
		
		int paginas = Integer.parseInt(request.getParameter("paginas"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		double precio = Double.parseDouble(request.getParameter("precio"));
		String editorial = request.getParameter("editorial");
		String categoria = request.getParameter("categoria");
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
		l.setEditorial(ctrl.buscarEdPorNombre(editorial));
		l.setCategoria(ctrl.buscarCatPorNombre(categoria));
		InputStream is = part.getInputStream();
		l.setImagen(is);
		
		LinkedList<Autor> ats = new LinkedList<Autor>();
				
		for(int i=0; i<autores.length;i++) {
			String[] nomyApe = autores[i].split("/");			
			ats.add(ctrl.buscarAutPorNombre(nomyApe[0], nomyApe[1]));
		}
		
		
		
		l.setAutores(ats);
		
		ctrl.agregarLibro(l);
		
		listar(request,response);
		
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Logic ctrl = new Logic();
	    int id = Integer.parseInt(request.getParameter("id"));	    
	    Libro libro = ctrl.buscarLib(id);
	    
	    if(libro != null) {
	    	request.setAttribute("Libro", libro);	
	    }else {
	    	request.setAttribute("error", "El id no corresponde a ningun libro!");
	    }
	    request.getRequestDispatcher("WEB-INF/buscaLibro.jsp").forward(request, response);
		
	}

	
	private void listar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		Logic ctrl = new Logic();
		LinkedList<Libro> libros = ctrl.listadoLib();
		
		
		request.setAttribute("Libros", libros);
		
		request.getRequestDispatcher("WEB-INF/listaLibros.jsp").forward(request, response);
		
	}
	
	
}
