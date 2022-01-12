package Servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.LinkedList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Cliente;
import entities.Libro;
import entities.Pedido;
import entities.PedidoLibro;
import logic.LogicCliente;
import logic.LogicLibro;
import logic.LogicPedido;

/**
 * Servlet implementation class ServletPedido
 */
@WebServlet("/ServletPedido")
public class ServletPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPedido() {
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
			buscar(request,response);
		}else if(accion.equalsIgnoreCase("reservaLibro")) {
			reservarLibro(request,response);
		}else if(accion.equalsIgnoreCase("cancelarReserva")) {
			cancelarReserva(request,response);
		}else if(accion.equalsIgnoreCase("confirmarPedido")) {
			confirmarPedido(request,response);
		}else if(accion.equalsIgnoreCase("finalizarPedido")) {
			finalizarPedido(request,response);
		}else if(accion.equalsIgnoreCase("anularPedido")) {
			anularPedido(request,response);
		}		
        				
	}

	private void anularPedido(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LogicPedido ctrlped = new LogicPedido();
		int nroPed = Integer.parseInt(request.getParameter("nro"));
		String idCl = request.getParameter("idCl");
		ctrlped.anularPedido(nroPed,idCl);
		request.setAttribute("mensaje", "Pedido anulado");
		request.getRequestDispatcher("WEB-INF/menuAdmin.jsp").forward(request, response);
	}

	private void finalizarPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		LogicPedido ctrlped = new LogicPedido();
		int nroPed = Integer.parseInt(request.getParameter("nro"));
		ctrlped.finalizarPedido(nroPed);
		request.setAttribute("mensaje", "Pedido finalizado");
		request.getRequestDispatcher("WEB-INF/menuAdmin.jsp").forward(request, response);
	}

	private void confirmarPedido(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LogicPedido ctrlped = new LogicPedido();
		int nroPed = Integer.parseInt(request.getParameter("nro"));
		ctrlped.confirmarPedido(nroPed);
		request.setAttribute("mensaje", "Pedido confirmado");
		request.getRequestDispatcher("WEB-INF/menuAdmin.jsp").forward(request, response);
	}

	private void cancelarReserva(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		LogicPedido ctrlped = new LogicPedido();
		int idLibro = Integer.parseInt(request.getParameter("id"));
		Cliente cliente = (Cliente) request.getSession().getAttribute("Cliente");
		int idCliente = cliente.getId();
				
		ctrlped.cancelarReserva(idLibro, idCliente);
		
		request.setAttribute("mensaje", "Reserva cancelada");
		request.getRequestDispatcher("WEB-INF/menuCliente.jsp").forward(request, response);
	}

	private void reservarLibro(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		int idLibro = Integer.parseInt(request.getParameter("id"));	
		Cliente cliente = (Cliente) request.getSession().getAttribute("Cliente");
		int idCliente = cliente.getId();
		
		LogicPedido ctrlped = new LogicPedido();
		LogicLibro ctrllib = new LogicLibro();
		LogicCliente ctrlcli = new LogicCliente();
		Cliente cl = ctrlcli.buscarClientePorId(idCliente);
		Libro lib= ctrllib.buscarLib(idLibro);
		LinkedList<Libro> librosPedidos = ctrlped.listadoLibCliente(idCliente, "reservado");
		
		String mensaje = ctrlped.validarReserva(cl,lib,librosPedidos);
		
		if(!mensaje.equalsIgnoreCase(" ")) {
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("WEB-INF/menuCliente.jsp").forward(request, response);                  	
		}else {
			Pedido ped = ctrlped.buscarReserva(idCliente);
			if(ped!=null) {
				ctrlped.agregarLibroAPedido(ped, lib);
				request.setAttribute("mensaje", "Libro reservado");
				request.getRequestDispatcher("WEB-INF/menuCliente.jsp").forward(request, response);
			}else {
				Pedido pedido = new Pedido();
				pedido.setCliente(cliente);
				LocalDate localDate = LocalDate.now();
		        pedido.setFecha(localDate);
		        pedido.setEstado("reservado");
		        LinkedList<Libro> libros = new LinkedList<Libro>();
		        libros.add(lib);
		        pedido.setLibro(libros);		        
		        ctrlped.agregarPedido(pedido);
		        ctrlped.agregarLibroAPedido(pedido, lib);
		        request.setAttribute("mensaje", "Libro reservado");
				request.getRequestDispatcher("WEB-INF/menuCliente.jsp").forward(request, response);
			} 	
		}
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
		LogicPedido ctrlped = new LogicPedido();
		String estado = request.getParameter("estado");
		
		LinkedList<Pedido> pedidos = ctrlped.listadoPed(estado);
		LinkedList<PedidoLibro> pl = new LinkedList<>();
		
		
		
		for(Pedido p: pedidos) {
			PedidoLibro pedlib = new PedidoLibro();
			pedlib.setPed(p);
			pedlib.setLibros(ctrlped.listadoLibPed(p.getNroPedido()));
			pl.add(pedlib);
		}
		
		request.setAttribute("Pedidos", pl);
						
		request.getRequestDispatcher("WEB-INF/listaPedido.jsp").forward(request, response);		

		
	}

}
