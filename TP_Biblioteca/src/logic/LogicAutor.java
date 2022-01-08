package logic;

import java.util.LinkedList;

import data.DataAutor;
import entities.Autor;

public class LogicAutor {
  
	private DataAutor da;
	
	public LogicAutor() {
	    
		da = new DataAutor();
	}
	
	public LinkedList<Autor> listadoAut() {
		return da.listado();		
	}
	
	public Autor buscarAut(int id) {
		return da.buscar(id);		
	}
		
	public Autor buscarAutPorNombre(String nombre, String apellido) {
		return da.buscarAutor(nombre, apellido);		
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
	
}
