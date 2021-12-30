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
import entities.Editorial;
import logic.Logic;

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
		Logic ctrl = new Logic();
		
		if(accion.equalsIgnoreCase("buscarAutor")) {
			request.getRequestDispatcher("WEB-INF/buscaAutor.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("anadirAutor")) {			
			request.getRequestDispatcher("WEB-INF/añadirAutor.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("modificarAutor")) {
			request.setAttribute("id", request.getParameter("id"));
			request.getRequestDispatcher("WEB-INF/modificarAutor.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("modificarCuenta")) {
			request.getRequestDispatcher("WEB-INF/modificarCuenta.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("buscarLocalidad")) {
			request.getRequestDispatcher("WEB-INF/buscaLocalidad.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("anadirLocalidad")) {
			request.getRequestDispatcher("WEB-INF/añadirLocalidad.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("modificarLocalidad")) {
			request.setAttribute("id", request.getParameter("id"));
			request.getRequestDispatcher("WEB-INF/modificarLocalidad.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("buscarCategoria")) {
			request.getRequestDispatcher("WEB-INF/buscaCategoria.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("modificarCategoria")) {
			request.setAttribute("id", request.getParameter("id"));
			request.getRequestDispatcher("WEB-INF/modificarCategoria.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("anadirCategoria")) {
			request.getRequestDispatcher("WEB-INF/añadirCategoria.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("anadirLibro")) {
		    LinkedList<Categoria> categorias = ctrl.listadoCategoria();
		    LinkedList<Autor> autores = ctrl.listadoAut();
		    LinkedList<Editorial> editoriales = ctrl.listadoEditorial();
		    
		    request.setAttribute("Editoriales", editoriales);
		    request.setAttribute("Categorias", categorias);
		    request.setAttribute("Autores", autores);
			request.getRequestDispatcher("WEB-INF/añadirLibro.jsp").forward(request, response);			
		}else if(accion.equalsIgnoreCase("modificarLibro")) {
			request.setAttribute("id", request.getParameter("id"));
			LinkedList<Categoria> categorias = ctrl.listadoCategoria();
		    LinkedList<Autor> autores = ctrl.listadoAut();
		    LinkedList<Editorial> editoriales = ctrl.listadoEditorial();
		    
		    request.setAttribute("Editoriales", editoriales);
		    request.setAttribute("Categorias", categorias);
		    request.setAttribute("Autores", autores);
			request.getRequestDispatcher("WEB-INF/modificarLibro.jsp").forward(request, response);			
		}						
	}

}
