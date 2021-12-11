package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Cliente;
import logic.Logic;

/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCliente() {
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
		if(accion.equalsIgnoreCase("actualizar")) {
			actualizar(request,response);				
		}
		
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
        Logic ctrl = new Logic();
		
		String name = request.getParameter("name");				
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String tel = request.getParameter("tel");				
        String email = request.getParameter("email");
        String city = request.getParameter("city");		
		String user = request.getParameter("user");				
        String pass = request.getParameter("pass");
		
        Cliente c = new Cliente();
        c.setNombre(name);
        c.setApellido(surname);
        c.setDomicilio(address);
        c.setTelefono(tel);
        c.setEmail(email);
        c.setUser(user);
        c.setPassword(pass);
        c.setLocalidad(ctrl.buscarLocPorNombre(city));
        c.setId(((Cliente) request.getSession().getAttribute("Cliente")).getId());
		
        /*VERIFICAR QUE EL USUARIO NO EXISTA*/        
        if(ctrl.validarCliente(user) ==1) {
        	request.setAttribute("errorMensaje", "Ya existe un usuario con ese nombre!");
        	request.getRequestDispatcher("WEB-INF/modificarCuenta.jsp").forward(request, response);
        }
        
        ctrl.modificarCliente(c);
        
        request.setAttribute("exito", "Los datos de la cuenta se han actualizado con exito!");
    	request.getRequestDispatcher("WEB-INF/modificarCuenta.jsp").forward(request, response);
	}

}
