package logic;

import java.util.LinkedList;

import javax.servlet.http.HttpServletResponse;

import data.DataAutor;
import data.DataCategoria;
import data.DataCliente;
import data.DataEditorial;
import data.DataLibro;
import data.DataLocalidad;
import data.DataPedido;
import entities.Autor;
import entities.Categoria;
import entities.Cliente;
import entities.Editorial;
import entities.Libro;
import entities.Localidad;
import entities.Pedido;


public class Logic {
	private DataLocalidad dl;
	private DataAutor da;
	private DataCliente dc;
	private DataCategoria dcat;
	private DataEditorial de;
	private DataLibro dlib;
	private DataPedido dp;
	
	public Logic() {
		dl = new DataLocalidad();		
		da = new DataAutor();
		dc = new DataCliente();
		dcat = new DataCategoria();
		de = new DataEditorial();
		dlib = new DataLibro();
		dp = new DataPedido();
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
		
	public LinkedList<Autor> listadoAut() {
		return da.listado();		
	}
	
	public Autor buscarAut(int id) {
		return da.buscar(id);		
	}
	
	public int buscarAutPorNombre(String nombre, String apellido) {
		return da.buscarAutor(nombre, apellido);		
	}
	
	public Autor buscarAutPorNombre2(String nombre, String apellido) {
		return da.buscarAutor2(nombre, apellido);		
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
	
	public LinkedList<Cliente> listadoCliente() {
		return dc.listado();		
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
	
	public LinkedList<Categoria> listadoCategoria() {
		return dcat.listado();		
	}
 	
	public Categoria buscarCategoria(int id) {
		return dcat.buscar(id);		
	}	
	
	public int buscarCatPorDescripcion(String desc) {
		return dcat.buscarCategoriaPorDescripcion(desc);		
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
	
	
	public void agregarLibro(Libro l) {
		dlib.agregar(l);
	}
	
	public LinkedList<Libro> listadoLib() {
		return dlib.listado();
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
	
	public LinkedList<Pedido> listadoPed() {
		return dp.listado();		
	}
	
	public LinkedList<Libro> listadoLibPed(int id) {
		return dp.librosPedido(id);		
	}
	
}

