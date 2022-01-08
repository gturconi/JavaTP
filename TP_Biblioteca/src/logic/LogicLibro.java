package logic;

import java.util.LinkedList;

import javax.servlet.http.HttpServletResponse;

import data.DataLibro;
import entities.Comentario;
import entities.Libro;

public class LogicLibro {

	private DataLibro dlib;
	
	public LogicLibro() {
		dlib = new DataLibro();
	}
	
	public void agregarLibro(Libro l) {
		dlib.agregar(l);
	}
	
	public LinkedList<Libro> listadoLib() {
		return dlib.listado();
	}	
	
	public LinkedList<Libro> listarLibrosPorEstado(String estado) {
		return dlib.listadoPorEstado(estado);
	}
	
	
	public void listarImgLib(int id, HttpServletResponse response) {
		dlib.listarImg(id, response);
	}
	
	
	public Libro buscarLib(int id) {
		return dlib.buscar(id);		
	}

	public void borrarLib(int id) {
		dlib.borrar(id);
	}
	
	public void modificarLib(Libro l) {
		dlib.modificar(l);
	}
	
	public void cargarComentarioLib(Comentario c) {
		dlib.cargarComentario(c);
	}

	
}
