package entities;

import java.time.*;
import java.util.LinkedList;

public class Pedido {
	
	private int nroPedido;
	private LocalDate fecha;
	private String estado;
	private Cliente cliente;
	private LinkedList<Libro> libros;
	
	public int getNroPedido() {
		return nroPedido;
	}
	public void setNroPedido(int nroPedido) {
		this.nroPedido = nroPedido;
	}
	public LocalDate getFecha() {
		return fecha;
	}
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public LinkedList<Libro> getLibro() {
		return libros;
	}
	public void setLibro(LinkedList<Libro> libros) {
		 this.libros = libros;
	}
	
	@Override
	public String toString() {
		return "Pedido [nroPedido=" + nroPedido + ", fecha=" + fecha + ", estado=" + estado + ", cliente=" + cliente
				+ ", libro=" + " " + "]";
	}
	
	public Pedido(int nroPedido, LocalDate fecha, String estado, Cliente cliente, LinkedList<Libro> libro) {
		this.nroPedido = nroPedido;
		this.fecha = fecha;
		this.estado = estado;
		this.cliente = cliente;
		this.libros = libro;
	}
	
	public Pedido(){
		
		
	}
}
