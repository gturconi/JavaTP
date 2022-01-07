package logic;

import java.util.LinkedList;

import data.DataLocalidad;
import entities.Localidad;

public class LogicLocalidad {
	private DataLocalidad dl;
	
	
	public LogicLocalidad() {
		dl = new DataLocalidad();
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
	
	public void agregarLoc(Localidad l) {
		dl.agregar(l);
	}
		
	public void borrarLoc(int id) {
		dl.borrar(id);
	}
	
	public void modificarLoc(Localidad l) {
		dl.modificar(l);
	}
	
}
