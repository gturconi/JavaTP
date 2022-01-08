package logic;

import java.util.LinkedList;

import data.DataCategoria;
import entities.Categoria;

public class LogicCategoria {

	private DataCategoria dcat;
	
	public LogicCategoria() {
		dcat = new DataCategoria();		
	}
	
	public LinkedList<Categoria> listadoCategoria() {
		return dcat.listado();		
	}
 	
	public Categoria buscarCategoria(int id) {
		return dcat.buscar(id);		
	}	
		
	public Categoria buscarCatPorNombre(String desc) {
		return dcat.buscarCategoriaPorNombre(desc);		
	}
	
	
	public void agregarCategoria(Categoria c) {
		dcat.agregar(c);
	}
	
	public void borrarCategoria(int id) {
		dcat.borrar(id);
	}
	
	public void modificarCategoria(Categoria c) {
		dcat.modificar(c);
	}
	
}
