package Servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Editorial;
import logic.Logic;

/**
 * Servlet implementation class ServletEditorial
 */
@WebServlet("/ServletEditorial")
public class ServletEditorial extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEditorial() {
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
		if(accion.equalsIgnoreCase("listar")) {
			listar(request,response);	
		}else if(accion.equalsIgnoreCase("modificar")) {
			modificar(request,response);		
		}else if(accion.equalsIgnoreCase("borrar")) {
			borrar(request,response);
		}else if(accion.equalsIgnoreCase("buscar")) {
			buscar(request,response);
		}else if(accion.equalsIgnoreCase("agregar")) {
			agregar(request,response);
		}			    				
}

	private void borrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logic ctrl = new Logic();
		int id = Integer.parseInt(request.getParameter("id"));
		ctrl.borrarEditorial(id);
        listar(request,response); 		
	}

	private void agregar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Logic ctrl = new Logic(); 
		String nombre = request.getParameter("nombre");
		Editorial e = new Editorial();		
		e.setNombre(nombre);
		
		if(ctrl.buscarEdPorDescripcion(nombre)==1) {
        	request.setAttribute("error", "Ya existe una editorial con ese nombre!");
        	request.getRequestDispatcher("WEB-INF/añadirEditorial.jsp").forward(request, response);
        }else {
        	ctrl.agregarEditorial(e);
        	listar(request,response);	
        }		
				
		
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logic ctrl = new Logic();
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		
		Editorial e = new Editorial();
		e.setId(id);
		e.setNombre(nombre);
		ctrl.modificarEditorial(e);		
		listar(request,response);		
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Logic ctrl = new Logic();
	    int id = Integer.parseInt(request.getParameter("id"));	    
	    Editorial editorial = ctrl.buscarEditorial(id);
	    if(editorial != null) {
	    	request.setAttribute("Editorial", editorial);	
	    }else {
	    	request.setAttribute("error", "El id no corresponde a ninguna editorial!");
	    }
			    
	    request.getRequestDispatcher("WEB-INF/buscaEditorial.jsp").forward(request, response);		
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        Logic ctrl = new Logic(); 
		
		LinkedList<Editorial> editoriales = ctrl.listadoEditorial();
		request.setAttribute("Editoriales", editoriales);
		request.getRequestDispatcher("WEB-INF/listaEditoriales.jsp").forward(request, response);
		
	}
}