package Servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Autor;
import logic.LogicAutor;

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
		}else if(accion.equalsIgnoreCase("agregar")) {
			agregar(request,response);
		}else if(accion.equalsIgnoreCase("borrar")) {
			borrar(request,response);
		}else if(accion.equalsIgnoreCase("modificar")) {
			modificar(request,response);
		}
		
	}
		
	private void modificar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LogicAutor ctrlaut = new LogicAutor();
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		
		Autor a = new Autor();
		a.setId(id);
		a.setNombre(nombre);
		a.setApellido(apellido);
		ctrlaut.modificarAut(a);
		listar(request,response);
		
	}

	private void borrar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LogicAutor ctrlaut = new LogicAutor();
		int id = Integer.parseInt(request.getParameter("id"));
		ctrlaut.borrarAut(id);
		listar(request,response);
	}

	private void agregar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LogicAutor ctrlaut = new LogicAutor(); 
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		Autor a = new Autor();
		a.setNombre(nombre);
		a.setApellido(apellido);
		if(ctrlaut.buscarAutPorNombre(nombre, apellido)!=null) {
        	request.setAttribute("error", "Ya existe un autor con ese nombre y apellido!");
        	request.getRequestDispatcher("WEB-INF/aņadirAutor.jsp").forward(request, response);
        }else {
        	ctrlaut.agregarAut(a);
        	listar(request,response);	
        }		
		
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LogicAutor ctrlaut = new LogicAutor();
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		
		Autor autor = ctrlaut.buscarAutPorNombre(nombre, apellido);
		if(autor != null) {
	    	request.setAttribute("Autor", autor);	
	    }else {
	    	request.setAttribute("error", "El nombre y apellido ingresado no corresponde a ningun autor!");
	    }
		request.getRequestDispatcher("WEB-INF/buscaAutor.jsp").forward(request, response);		
	}

	protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		LogicAutor ctrlaut = new LogicAutor(); 
		
		LinkedList<Autor> autores = ctrlaut.listadoAut();
		request.setAttribute("Autores", autores);
		request.getRequestDispatcher("WEB-INF/listaAutores.jsp").forward(request, response);
	}
	
}
