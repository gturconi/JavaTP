package Servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Cliente;
import entities.Localidad;
import logic.LogicCliente;
import logic.LogicLocalidad;

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
		
		String accion = request.getParameter("accion");
		
		if (request.getParameter("btn1") != null){
			ingresar(request,response);
		 }else if(request.getParameter("btn2") != null) {
			registrar(request,response);
		 }else if(request.getParameter("send") != null) {
				altaCliente(request,response);
	     }else if(request.getParameter("logout") != null) {
				cerrarSesion(request,response);
	     }	
		
		if(accion.equalsIgnoreCase("irLogin")) {
			request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("irContacto")) {
			request.getRequestDispatcher("WEB-INF/contacto.jsp").forward(request, response);
		}else if(accion.equalsIgnoreCase("irIndex")) {
		request.getRequestDispatcher("index.jsp").forward(request, response);
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
		LogicCliente ctrlcli = new LogicCliente();
		LogicLocalidad ctrlloc = new LogicLocalidad();
		
		String name = request.getParameter("name");				
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String tel = request.getParameter("tel");				
        String email = request.getParameter("email");
        int city = Integer.parseInt(request.getParameter("city"));		
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
        c.setEstado("habilitado");        
        
        LocalDate localDate = LocalDate.now();
        c.setFechaInscripcion(localDate);
        
        c.setLocalidad(ctrlloc.buscarLoc(city));
        
        
        
		LinkedList<Localidad> localidades =  ctrlloc.listadoLoc();
		
		request.setAttribute("Localidades", localidades);
        
        /*VERIFICAR QUE EL USUARIO NO EXISTA*/        
        if(ctrlcli.validarCliente(user) ==1) {
        	
        	request.setAttribute("errorMensaje", "Ya existe un usuario con ese nombre!");
        	request.getRequestDispatcher("WEB-INF/registro.jsp").forward(request, response);
        }        
        else if(ctrlcli.agregarCliente(c)== 1) {
        	request.setAttribute("errorConexion", "No se pudo conectar con la base de datos");
        	request.getRequestDispatcher("WEB-INF/registro.jsp").forward(request, response);
        }else {
        	request.setAttribute("mensaje", "Usuario registrado con exito!");
        	request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);	
        }                
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		LogicLocalidad ctrlloc = new LogicLocalidad();
		LinkedList<Localidad> localidades =  ctrlloc.listadoLoc();
		
		request.setAttribute("Localidades", localidades);
		request.getRequestDispatcher("WEB-INF/registro.jsp").forward(request, response);
	}

	private void ingresar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
		LogicCliente ctrlcli = new LogicCliente();
								
        String user = request.getParameter("user");				
        String pass = request.getParameter("pass");
		                
        
        Cliente cliente = ctrlcli.buscarCliente(user, pass);
        if(cliente != null) {
        	if(cliente.getisAdmin()==0) {
        		request.getSession().setAttribute("Cliente", cliente);
            	request.getRequestDispatcher("WEB-INF/menuCliente.jsp").forward(request, response);	
        	}else {
        		request.getSession().setAttribute("Cliente", cliente);
            	request.getRequestDispatcher("WEB-INF/menuAdmin.jsp").forward(request, response);
        	}        	
        }else{
        	request.setAttribute("mensaje", "Usuario y/o contraseña incorrectos");
        	request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);             	
        } 		
	}

}
