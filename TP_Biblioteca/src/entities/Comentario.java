package entities;


import java.time.LocalDateTime;

public class Comentario {

	private LocalDateTime fecha;
	private Cliente usuario;
	private Libro libro;
	private String rese�a;
	private int calificacion;
	
	
	
	public LocalDateTime getFecha() {
		return fecha;
	}
	public void setFecha(LocalDateTime localDateTime) {
		this.fecha = localDateTime;
	}
	public Cliente getUsuario() {
		return usuario;
	}
	public void setUsuario(Cliente usuario) {
		this.usuario = usuario;
	}
	public Libro getLibro() {
		return libro;
	}
	public void setLibro(Libro libro) {
		this.libro = libro;
	}
	public String getRese�a() {
		return rese�a;
	}
	public void setRese�a(String rese�a) {
		this.rese�a = rese�a;
	}
	public int getCalificacion() {
		return calificacion;
	}
	public void setCalificacion(int calificacion) {
		this.calificacion = calificacion;
	}
	
	public Comentario(LocalDateTime fecha, Cliente usuario, Libro libro, String rese�a, int calificacion) {
		super();
		this.fecha = fecha;
		this.usuario = usuario;
		this.libro = libro;
		this.rese�a = rese�a;
		this.calificacion = calificacion;
	}
	
	public Comentario() {
		
	}
}
