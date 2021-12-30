package Servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Pedido;
import entities.PedidoLibro;
import logic.Logic;

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
		}		
        				
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
		Logic ctrl = new Logic();
		
		LinkedList<Pedido> pedidos = ctrl.listadoPed();
		LinkedList<PedidoLibro> pl = new LinkedList<>();
		
		for(Pedido p: pedidos) {
			PedidoLibro pedlib = new PedidoLibro();
			pedlib.setPed(p);
			pedlib.setLibros(ctrl.listadoLibPed(p.getNroPedido()));
			pl.add(pedlib);
		}
		
		request.setAttribute("Pedidos", pl);
						
		request.getRequestDispatcher("WEB-INF/listaPedido.jsp").forward(request, response);		

		
	}

}
