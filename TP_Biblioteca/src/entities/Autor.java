package entities;

public class Autor {
	
	private int id;
	private String nombre;
	private String apellido;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	
	@Override
	public String toString() {
		return "Autor [id=" + id + ", name=" + nombre + ", apellido=" + apellido + "]";
	}
	
	public Autor(int id, String name, String apellido) {
		this.id = id;
		this.nombre = name;
		this.apellido = apellido;
	}
	
	public Autor() {
		
		
	}
	
	
	

}
