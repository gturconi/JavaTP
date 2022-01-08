package logic;

import java.util.LinkedList;

import data.DataPedido;
import entities.Cliente;
import entities.Libro;
import entities.Pedido;

public class LogicPedido {

	private DataPedido dp;
	
	public LogicPedido() {
		dp = new DataPedido();
	}
	
	public LinkedList<Pedido> listadoPed(String estado) {
		return dp.listado(estado);		
	}
	
	public LinkedList<Libro> listadoLibPed(int id) {
		return dp.librosPedido(id);		
	}
	
	public void agregarPedido(Pedido p) {
		dp.agregarPedido(p);
	}
	
	public void agregarLibroAPedido(Pedido p, Libro l) {
		dp.agregarLibro(p, l);
	}
	
	public Pedido buscarReserva(int idCl) {
		return dp.buscaReserva(idCl);
	}
	
	public LinkedList<Libro> listadoLibCliente(int idCliente, String estado) {
		return dp.librosPorEstado(idCliente, estado);		
	}
	
	public void cancelarReserva(int idLibro, int idCliente) {
		dp.cancelarReserva(idLibro, idCliente);
	}
	
	public void confirmarPedido(int nroPed) {
		dp.confirmarPedido(nroPed);
	}

	public String validarReserva(Cliente cl, Libro lib, LinkedList<Libro> libros) {
		if(cl.getEstado().equalsIgnoreCase("suspendido")) {
		   return "El usuario se encuentra actualmente suspendido";
		}else if(lib.getExistencia()==0){
			return "El libro no tiene stock";
		}else if(libros.size() == 5){
			return "Ya ha alcanzado el limite de reservas";
		}else {
			return " ";
		} 	
		
	}
}
