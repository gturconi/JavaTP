package logic;

import java.util.LinkedList;

import data.DataAutor;
import data.DataCliente;
import data.DataLocalidad;
import entities.Autor;
import entities.Cliente;
import entities.Localidad;


public class Logic {
	private DataLocalidad dl;
	private DataAutor da;
	private DataCliente dc;
	
	public Logic() {
		dl = new DataLocalidad();		
		da = new DataAutor();
		dc = new DataCliente();
	}
	
	public LinkedList<Localidad> listadoLoc() {
		return dl.listado();		
	} 
	
	public Localidad buscarLoc(int id) {
		return dl.buscarLocalidad(id);		
	}
	
	public Localidad buscarLocPorNombre(String loc) {
		return dl.buscarLocalidadPorNombre(loc);		
	}
	
	public LinkedList<Autor> listadoAut() {
		return da.listado();		
	}
	
	public Autor buscarAut(int id) {
		return da.buscar(id);		
	}
	
	public void agregarAut(Autor a) {
		da.agregar(a);
	}
	
	public void borrarAut(int id) {
		da.borrar(id);
	}
	public void modificarAut(Autor a) {
		da.modificar(a);
	}
	
	public Cliente buscarCliente(String user, String pass) {
		return dc.buscarCliente(user,pass);		
	}
	
	public void agregarCliente(Cliente c) {
		dc.agregarCliente(c);
	}
	
}
