package logic;

import java.util.LinkedList;

import data.DataPedido;
import entities.Libro;
import entities.Pedido;

public class LogicPedido {

	private DataPedido dp;
	
	public LogicPedido() {
		dp = new DataPedido();
	}
	
	public LinkedList<Pedido> listadoPed() {
		return dp.listado();		
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
	
	public LinkedList<Libro> listadoLibCliente(int idCliente) {
		return dp.librosReservados(idCliente);		
	}
	
	public void cancelarReserva(int idLibro, int idCliente) {
		dp.cancelarReserva(idLibro, idCliente);
	}
}
