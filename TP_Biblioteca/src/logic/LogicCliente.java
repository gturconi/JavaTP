package logic;

import java.util.LinkedList;

import data.DataCliente;
import entities.Cliente;

public class LogicCliente {

	private DataCliente dc;
	
	public LogicCliente() {
		dc = new DataCliente();
	}
	
	public LinkedList<Cliente> listadoCliente() {
		return dc.listado();		
	}
	
	public LinkedList<Cliente> listadoPorEstado(String estado) {
		return dc.listadoPorEstado(estado);		
	}
	
	public Cliente buscarCliente(String user, String pass) {
		return dc.buscarCliente(user,pass);		
	}
	
	public Cliente buscarClientePorId(int id) {
		return dc.buscarClientePorId(id);		
	}
	
	public int validarCliente(String user) {
		return dc.validaCliente(user);		
	}
	
	
	public int agregarCliente(Cliente c) {
		return dc.agregarCliente(c);
	}
	
	public void borrarCliente(int id) {
		dc.borrar(id);
	}
	
	public void modificarCliente(Cliente c) {
		dc.modificar(c);
	}
}
