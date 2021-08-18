package Servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Autor;
import logic.Logic;

/**
 * Servlet implementation class ServletAutor
 */
@WebServlet("/ServletAutor")
public class ServletAutor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAutor() {
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
		// TODO Auto-generated method stub
		
		String accion = request.getParameter("accion");
		if(accion.equalsIgnoreCase("listar")) {
			listar(request,response);				
		}else if(accion.equalsIgnoreCase("buscar")) {
			buscar(request,response);
		}
		
	}
		
	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logic ctrl = new Logic();
	    int id = Integer.parseInt(request.getParameter("id"));
	    Autor autor = ctrl.buscarAut(id);	    
		//response.getWriter().append(String.valueOf(autor.getId()));
	    request.setAttribute("Autor", autor);
	    request.getRequestDispatcher("WEB-INF/buscaAutor.jsp").forward(request, response);
	}

	protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Logic ctrl = new Logic(); 
		
		LinkedList<Autor> autores = ctrl.listadoAut();
		request.setAttribute("Autores", autores);
		request.getRequestDispatcher("WEB-INF/listaAutores.jsp").forward(request, response);
	}
	
}
