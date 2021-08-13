package entities;

import java.time.*;
import java.util.Arrays;

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
	private Autor[] autor;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return titulo;
	}
	public void setTitle(String titulo) {
		this.titulo = titulo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescription(String descripcion) {
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
	public int getNroPages() {
		return nroPaginas;
	}
	public void setNroPages(int nroPaginas) {
		this.nroPaginas = nroPaginas;
	}
	public int getExistencia() {
		return existencia;
	}
	public void setExistence(int existencia) {
		this.existencia = existencia;
	}
	public double getPrice() {
		return precio;
	}
	public void setPrice(double precio) {
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
	public Autor[] getAutor() {
		return autor;
	}
	public void setAutor(Autor[] autor) {
		this.autor = autor;
	}
	
	@Override
	public String toString() {
		return "Libro [id=" + id + ", title=" + titulo + ", description=" + descripcion + ", nroEdicion=" + nroEdicion
				+ ", fechaEdicion=" + fechaEdicion + ", dimensiones=" + dimensiones + ", nroPages=" + nroPaginas
				+ ", existence=" + existencia + ", price=" + precio + ", editorial=" + editorial + ", categoria="
				+ categoria + ", autor=" + Arrays.toString(autor) + "]";
	}
	
	public Libro(int id, String title, String description, int nroEdicion, LocalDate fechaEdicion, String dimensiones,
			int nroPages, int existence, double price, Editorial editorial, Categoria categoria, Autor[] autor) {
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
		this.autor = autor;
	}
	
	public Libro() {
		
	}

}
