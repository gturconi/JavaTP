package Servlet;


import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Localidad;
import logic.Logic;


@WebServlet("/ServletLocalidad")
public class ServletLocalidad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServletLocalidad() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String accion = request.getParameter("accion");
		if(accion.equalsIgnoreCase("listar")) {
			listar(request,response);					
	    }else if(accion.equalsIgnoreCase("buscar")) {
		    buscar(request,response);
	    }else if(accion.equalsIgnoreCase("agregar")) {
		    agregar(request,response);
	    }else if(accion.equalsIgnoreCase("modificar")) {
		    modificar(request,response);
	    }else if(accion.equalsIgnoreCase("borrar")) {
		    borrar(request,response);
	    }
}


	private void borrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logic ctrl = new Logic();
		int id = Integer.parseInt(request.getParameter("id"));
		ctrl.borrarLoc(id);
		listar(request,response);
		
	}


	private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logic ctrl = new Logic();
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		
		Localidad l = new Localidad();
		l.setId(id);
		l.setNombre(nombre);
		ctrl.modificarLoc(l);
		listar(request,response);
		
	}


	private void agregar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Logic ctrl = new Logic(); 
		String nombre = request.getParameter("nombre");		
		Localidad l = new Localidad();
		l.setNombre(nombre);
		
		if(ctrl.buscarLocPorNombre(nombre)!=null) {
        	request.setAttribute("error", "Ya existe una localidad con ese nombre!");
        	request.getRequestDispatcher("WEB-INF/añadirLocalidad.jsp").forward(request, response);
        }else {
        	ctrl.agregarLoc(l);
        	listar(request,response);	
        }						
	}


	private void buscar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Logic ctrl = new Logic();
	    int id = Integer.parseInt(request.getParameter("id"));
	    
	    Localidad l = ctrl.buscarLoc(id);
		
	    if(l != null) {
	    	request.setAttribute("Localidad",l);	
	    }else {
	    	request.setAttribute("error", "El id no corresponde a ninguna localidad!");
	    }
	    request.getRequestDispatcher("WEB-INF/buscaLocalidad.jsp").forward(request, response);
	}


	private void listar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Logic ctrl = new Logic(); 
		
		LinkedList<Localidad> localidades = ctrl.listadoLoc();
                           	
		request.setAttribute("Localidades", localidades);
	    
		request.getRequestDispatcher("WEB-INF/listaLocalidades.jsp").forward(request, response);		
	}
}