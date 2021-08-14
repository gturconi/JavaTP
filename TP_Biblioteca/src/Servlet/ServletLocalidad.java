package Servlet;


import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import data.DataLocalidad;
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
		
		Logic ctrl = new Logic(); 
				
		LinkedList<Localidad> localidades = ctrl.listado();
                           	
		request.setAttribute("Localidades", localidades);
	/*	for(Localidad loc : localidades) {
			response.getWriter().append(loc.getNombre());
		}*/
        
		request.getRequestDispatcher("WEB-INF/listaLocalidades.jsp").forward(request, response);
	}

}
