package Servlet;

import java.io.IOException;

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
		}else if(accion.equalsIgnoreCase("eliminarCuenta")) {
			borrar(request,response);			
		} else if(accion.equalsIgnoreCase("listar")) {
			listar(request,response);				
		}else if(accion.equalsIgnoreCase("buscar")) {
			buscar(request,response);
		}else if(accion.equalsIgnoreCase("listarPorEstado")) {
			listarPorEstado(request,response);
		}else if(accion.equalsIgnoreCase("suspender") || accion.equalsIgnoreCase("habilitar")) {
			actualizarEstadoCliente(request,response);
		}
		
		
	}

	private void actualizarEstadoCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		LogicCliente ctrlcli = new LogicCliente();  		
		int n = Integer.parseInt(request.getParameter("estado"));
		int id = Integer.parseInt(request.getParameter("id"));
		
		if(n==0) {
			ctrlcli.actualizarEstadoCliente(id,"suspendido");
		}else {
			ctrlcli.actualizarEstadoCliente(id,"habilitado");
		}
		listar(request,response);
	}

	private void listarPorEstado(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        LogicCliente ctrlcli = new LogicCliente();        
        String estado = request.getParameter("estado");
                
		LinkedList<Cliente> clientesEstado = ctrlcli.listadoPorEstado(estado);
		request.setAttribute("ClientesEstado", clientesEstado);
		request.getRequestDispatcher("WEB-INF/listaClientes.jsp").forward(request, response);
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LogicCliente ctrlcli = new LogicCliente();
		
		LinkedList<Cliente> clientes = ctrlcli.listadoCliente();
		request.setAttribute("Clientes", clientes);
		request.getRequestDispatcher("WEB-INF/listaClientes.jsp").forward(request, response);		
				
	}

	private void borrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LogicCliente ctrlcli = new LogicCliente();
		
		//Eliminamos al cliente
		ctrlcli.borrarCliente(((Cliente) request.getSession().getAttribute("Cliente")).getId());
		
		//Cerramos la sesion
		HttpSession session=request.getSession(false);
		if (session != null) {
            session.removeAttribute("Cliente");
		}
		
		request.setAttribute("exito", "Cuenta eliminada exitosamente");				
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		LogicCliente ctrlcli = new LogicCliente();
        LogicLocalidad ctrlloc = new LogicLocalidad();
        
        Cliente oldUser = ((Cliente) request.getSession().getAttribute("Cliente"));
        String oldUserName = ((Cliente) request.getSession().getAttribute("Cliente")).getUser();
        
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
        c.setLocalidad(ctrlloc.buscarLoc(city));
        c.setId(((Cliente) request.getSession().getAttribute("Cliente")).getId());
        c.setEstado(oldUser.getEstado());
        c.setisAdmin(oldUser.getisAdmin());
        
        
        LinkedList<Localidad> localidades =  ctrlloc.listadoLoc();
		
		request.setAttribute("Localidades", localidades);
		
        
        /*VERIFICAR QUE EL USUARIO NO EXISTA*/        
        if(ctrlcli.validarCliente(user) ==1 && (!oldUserName.equalsIgnoreCase(user))) {
        	request.setAttribute("errorMensaje", "Ya existe un usuario con ese nombre!");
        	request.getRequestDispatcher("WEB-INF/modificarCuenta.jsp").forward(request, response);
        }else {
        	        	        	
        	ctrlcli.modificarCliente(c);
        	
        	//ACTUALIZAMOS EL CLIENTE EN LA SESION
        	HttpSession session=request.getSession(false);
        	session.removeAttribute("Cliente");
        	request.getSession().setAttribute("Cliente", c);
        	
            request.setAttribute("exito", "Los datos de la cuenta se han actualizado con exito!");
        	request.getRequestDispatcher("WEB-INF/modificarCuenta.jsp").forward(request, response);	
        }        
        
	}
	
	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LogicCliente ctrlcli = new LogicCliente();
	    int id = Integer.parseInt(request.getParameter("id"));	    
	    Cliente cliente = ctrlcli.buscarClientePorId(id);
	    if(cliente != null) {
	    	request.setAttribute("Cliente", cliente);	
	    }else {
	    	request.setAttribute("error", "El id no corresponde a ningun cliente!");
	    }
		//response.getWriter().append(String.valueOf(autor.getId()));
	    
	    request.getRequestDispatcher("WEB-INF/buscaCliente.jsp").forward(request, response);
	}


}
