package Servlet;

import java.io.IOException;
import java.time.LocalDate;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Cliente;
import logic.Logic;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
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
		
		
		if (request.getParameter("btn1") != null){
			ingresar(request,response);
		 }else if(request.getParameter("btn2") != null) {
			registrar(request,response);
		 }else if(request.getParameter("send") != null) {
				altaCliente(request,response);
	     }else if(request.getParameter("logout") != null) {
				cerrarSesion(request,response);
	     }						                                                
	}

	private void cerrarSesion(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
				if (session != null) {
		            session.removeAttribute("Cliente");
				}		             	  
        //session.invalidate();
        request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	private void altaCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
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
                
        LocalDate localDate = LocalDate.now();
        c.setFechaInscripcion(localDate);
        
        c.setLocalidad(ctrl.buscarLocPorNombre(city));
        
        
        /*VERIFICAR QUE EL USUARIO NO EXISTA*/
        if(ctrl.buscarCliente(user, pass)!=null) {
        	request.setAttribute("errorMensaje", "Ya existe un usuario con ese nombre!");
        	request.getRequestDispatcher("WEB-INF/registro.jsp").forward(request, response);
        }
        
        if(ctrl.agregarCliente(c)== 0) {
        	request.setAttribute("errorConexion", "No se pudo conectar con la base de datos");
        	request.getRequestDispatcher("WEB-INF/registro.jsp").forward(request, response);
        };
        
        request.setAttribute("altaMensaje", "Usuario registrado con exito!");
    	request.getRequestDispatcher("WEB-INF/registro.jsp").forward(request, response);
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		request.getRequestDispatcher("WEB-INF/registro.jsp").forward(request, response);
	}

	private void ingresar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
		Logic ctrl = new Logic();
								
        String user = request.getParameter("user");				
        String pass = request.getParameter("pass");
		                
        
        Cliente cliente = ctrl.buscarCliente(user, pass);
        if(cliente != null) {
        	if(cliente.getisAdmin()==0) {
        		request.getSession().setAttribute("Cliente", cliente);
            	request.getRequestDispatcher("WEB-INF/menuCliente.jsp").forward(request, response);	
        	}else {
        		request.getSession().setAttribute("Cliente", cliente);
            	request.getRequestDispatcher("WEB-INF/menuAdmin.jsp").forward(request, response);
        	}        	
        }else{
        	request.setAttribute("errorMensaje", "Usuario y/o contraseña incorrectos");
        	request.getRequestDispatcher("index.jsp").forward(request, response);             	
        } 		
	}

}
