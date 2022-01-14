package Servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Autor;
import entities.Categoria;
import entities.Cliente;
import entities.Editorial;
import entities.Libro;
import entities.Localidad;
import logic.LogicAutor;
import logic.LogicCategoria;
import logic.LogicCliente;
import logic.LogicEditorial;
import logic.LogicLibro;
import logic.LogicLocalidad;

/**
 * Servlet implementation class ServletMenu
 */
@WebServlet("/ServletMenu")
public class ServletMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMenu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
						
		String accion = request.getParameter("accion");		
		LogicCategoria ctrlcat = new LogicCategoria();
		LogicLocalidad ctrlloc = new LogicLocalidad();
		LogicAutor ctrlaut = new LogicAutor();
		LogicCliente ctrlcli = new LogicCliente();
		LogicEditorial ctrled = new LogicEditorial();
		LogicLibro ctrllib = new LogicLibro();
		
		if(accion.equalsIgnoreCase("buscarAutor")) {
			request.getRequestDispatcher("WEB-INF/buscaAutor.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("anadirAutor")) {			
			request.getRequestDispatcher("WEB-INF/añadirAutor.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("modificarAutor")) {
			Autor a = ctrlaut.buscarAut(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("Autor", a);			
			request.getRequestDispatcher("WEB-INF/modificarAutor.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("modificarCuenta")) {
			LinkedList<Localidad> localidades =  ctrlloc.listadoLoc();
			request.setAttribute("Localidades", localidades);
		//	Cliente c = ctrlcli.buscarClientePorId(((Cliente) request.getSession().getAttribute("Cliente")).getId());
		//	request.setAttribute("Cliente", c);
			request.getRequestDispatcher("WEB-INF/modificarCuenta.jsp").forward(request, response);
			
		}else if(accion.equalsIgnoreCase("irMenuCliente")) {
			request.getRequestDispatcher("WEB-INF/menuCliente.jsp").forward(request, response);
			
		}else if(accion.equalsIgnoreCase("irMenuAdmin")) {
			request.getRequestDispatcher("WEB-INF/menuAdmin.jsp").forward(request, response);
			
		}else if(accion.equalsIgnoreCase("buscarLocalidad")) {
			request.getRequestDispatcher("WEB-INF/buscaLocalidad.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("anadirLocalidad")) {
			request.getRequestDispatcher("WEB-INF/añadirLocalidad.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("modificarLocalidad")) {
			Localidad l = ctrlloc.buscarLoc(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("Localidad", l);
			request.getRequestDispatcher("WEB-INF/modificarLocalidad.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("buscarCategoria")) {
			request.getRequestDispatcher("WEB-INF/buscaCategoria.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("modificarCategoria")) {
			Categoria c = ctrlcat.buscarCategoria(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("Categoria", c);			
			request.getRequestDispatcher("WEB-INF/modificarCategoria.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("anadirCategoria")) {
			request.getRequestDispatcher("WEB-INF/añadirCategoria.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("buscarEditorial")) {
			request.getRequestDispatcher("WEB-INF/buscaEditorial.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("modificarEditorial")) {
			Editorial e = ctrled.buscarEditorial(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("Editorial", e);			
			request.getRequestDispatcher("WEB-INF/modificarEditorial.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("anadirEditorial")) {
			request.getRequestDispatcher("WEB-INF/añadirEditorial.jsp").forward(request, response);	
			
		}else if(accion.equalsIgnoreCase("anadirLibro")) {
		    LinkedList<Categoria> categorias = ctrlcat.listadoCategoria();
		    LinkedList<Autor> autores = ctrlaut.listadoAut();
		    LinkedList<Editorial> editoriales = ctrled.listadoEditorial();
		    
		    request.setAttribute("Editoriales", editoriales);
		    request.setAttribute("Categorias", categorias);
		    request.setAttribute("Autores", autores);
			request.getRequestDispatcher("WEB-INF/añadirLibro.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("modificarLibro")) {
			Libro l = ctrllib.buscarLib(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("Libro", l);			
			request.setAttribute("id", request.getParameter("id"));
			LinkedList<Categoria> categorias = ctrlcat.listadoCategoria();
		    LinkedList<Autor> autores = ctrlaut.listadoAut();
		    LinkedList<Editorial> editoriales = ctrled.listadoEditorial();
		    
		    request.setAttribute("Editoriales", editoriales);
		    request.setAttribute("Categorias", categorias);
		    request.setAttribute("Autores", autores);
			request.getRequestDispatcher("WEB-INF/modificarLibro.jsp").forward(request, response);			
		}
		
	}

}
