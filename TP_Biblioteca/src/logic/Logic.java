package logic;

import java.util.LinkedList;

import data.DataAutor;
import data.DataLocalidad;
import entities.Autor;
import entities.Localidad;

public class Logic {
	private DataLocalidad dl;
	private DataAutor da;

	public Logic() {
		dl = new DataLocalidad();		
		da = new DataAutor();
	}
	
	public LinkedList<Localidad> listadoLoc() {
		return dl.listado();		
	} 
		
	public LinkedList<Autor> listadoAut() {
		return da.listado();		
	}
	
	public Autor buscarAut(int id) {
		return da.buscar(id);		
	}
	
	
}
