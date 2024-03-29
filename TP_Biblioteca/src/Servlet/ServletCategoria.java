package Servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Categoria;
import logic.LogicCategoria;

/**
 * Servlet implementation class ServletCategoria
 */
@WebServlet("/ServletCategoria")
public class ServletCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCategoria() {
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
		LogicCategoria ctrlcat = new LogicCategoria();
		int id = Integer.parseInt(request.getParameter("id"));
		ctrlcat.borrarCategoria(id);
        listar(request,response); 		
	}

	private void agregar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LogicCategoria ctrlcat = new LogicCategoria(); 
		String descripcion = request.getParameter("descripcion");
		Categoria c = new Categoria();		
		c.setDescripcion(descripcion);
		
		if(ctrlcat.buscarCatPorNombre(descripcion)!=null) {
        	request.setAttribute("error", "Ya existe una categoria con esa descripcion!");
        	request.getRequestDispatcher("WEB-INF/aņadirCategoria.jsp").forward(request, response);
        }else {
        	ctrlcat.agregarCategoria(c);
        	listar(request,response);	
        }		
				
		
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LogicCategoria ctrlcat = new LogicCategoria();
		int id = Integer.parseInt(request.getParameter("id"));
		String descripcion = request.getParameter("descripcion");
		
		Categoria c = new Categoria();
		c.setId(id);
		c.setDescripcion(descripcion);
		ctrlcat.modificarCategoria(c);		
		listar(request,response);		
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LogicCategoria ctrlcat = new LogicCategoria();
	    String nombre = request.getParameter("nombre");	    
	    Categoria categoria = ctrlcat.buscarCatPorNombre(nombre);
	    if(categoria != null) {
	    	request.setAttribute("Categoria", categoria);	
	    }else {
	    	request.setAttribute("error", "El nombre no corresponde a ninguna categoria!");
	    }
			    
	    request.getRequestDispatcher("WEB-INF/buscaCategoria.jsp").forward(request, response);		
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		LogicCategoria ctrlcat = new LogicCategoria(); 
		
		LinkedList<Categoria> categorias = ctrlcat.listadoCategoria();
		request.setAttribute("Categorias", categorias);
		request.getRequestDispatcher("WEB-INF/listaCategorias.jsp").forward(request, response);
		
	}
}