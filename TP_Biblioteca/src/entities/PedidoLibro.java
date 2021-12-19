package entities;

import java.util.LinkedList;

public class PedidoLibro {

	private Pedido ped;
	private LinkedList<Libro> libros;
	
	public Pedido getPed() {
		return ped;
	}
	public void setPed(Pedido ped) {
		this.ped = ped;
	}
	public LinkedList<Libro> getLibros() {
		return libros;
	}
	public void setLibros(LinkedList<Libro> libros) {
		this.libros = libros;
	}
	
	
}
