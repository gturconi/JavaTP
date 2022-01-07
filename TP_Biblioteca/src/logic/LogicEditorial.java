package logic;

import java.util.LinkedList;

import data.DataEditorial;
import entities.Editorial;

public class LogicEditorial {

	private DataEditorial de;
	
	public LogicEditorial() {		
		de = new DataEditorial();
	}
	
	public LinkedList<Editorial> listadoEditorial() {
		return de.listado();		
	}
	public Editorial buscarEditorial(int id) {
		return de.buscar(id);		
	}
	public void agregarEditorial(Editorial e) {
		de.agregar(e);
	}
	public void borrarEditorial(int id) {
		de.borrar(id);
	}
	public void modificarEditorial(Editorial e) {
		de.modificar(e);
	}
	
	public Editorial buscarEdPorNombre(String nombre) {
		return de.buscarEditorialPorNombre(nombre);		
	}
	
	public int buscarEdPorDescripcion(String nombre) {
		return de.buscarEditorialPorDescripcion(nombre);		
	}
	
	
}
