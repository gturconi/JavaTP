package logic;

import java.util.LinkedList;

import data.DataLocalidad;
import entities.Localidad;

public class Logic {
	private DataLocalidad dl;
	
	public Logic() {
		dl = new DataLocalidad();		
		
	}
	
	public LinkedList<Localidad> listado() {
		return dl.listado();		
	} 
			
}
