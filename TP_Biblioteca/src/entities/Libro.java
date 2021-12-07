package entities;

import java.time.*;
import java.util.LinkedList;

public class Libro {
	
	private int id;
	private String titulo;
	private String descripcion;
	private int nroEdicion;
	private LocalDate fechaEdicion;
	private String dimensiones;
	private int nroPaginas;
	private int existencia;
	private double precio;
	private Editorial editorial;
	private Categoria categoria;
	private LinkedList<Autor> autores;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getNroEdicion() {
		return nroEdicion;
	}
	public void setNroEdicion(int nroEdicion) {
		this.nroEdicion = nroEdicion;
	}
	public LocalDate getFechaEdicion() {
		return fechaEdicion;
	}
	public void setFechaEdicion(LocalDate fechaEdicion) {
		this.fechaEdicion = fechaEdicion;
	}
	public String getDimensiones() {
		return dimensiones;
	}
	public void setDimensiones(String dimensiones) {
		this.dimensiones = dimensiones;
	}
	public int getNroPaginas() {
		return nroPaginas;
	}
	public void setNroPaginas(int nroPaginas) {
		this.nroPaginas = nroPaginas;
	}
	public int getExistencia() {
		return existencia;
	}
	public void setExistencia(int existencia) {
		this.existencia = existencia;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public Editorial getEditorial() {
		return editorial;
	}
	public void setEditorial(Editorial editorial) {
		this.editorial = editorial;
	}
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	public LinkedList<Autor> getAutores() {
		return autores;
	}
	public void setAutores(LinkedList<Autor> autores) {
		this.autores = autores;
	}
	
	
	
	public Libro(int id, String title, String description, int nroEdicion, LocalDate fechaEdicion, String dimensiones,
			int nroPages, int existence, double price, Editorial editorial, Categoria categoria, LinkedList<Autor> autores) {
		this.id = id;
		this.titulo = title;
		this.descripcion = description;
		this.nroEdicion = nroEdicion;
		this.fechaEdicion = fechaEdicion;
		this.dimensiones = dimensiones;
		this.nroPaginas = nroPages;
		this.existencia = existence;
		this.precio = price;
		this.editorial = editorial;
		this.categoria = categoria;
		this.autores = autores;
	}
	
	public Libro() {
		
	}

}
