package entities;

public class Localidad {
	
	private int id;
	private String nombre;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setName(String nombre) {
		this.nombre = nombre;
	}
	
	
	@Override
	public String toString() {
		return "Localidad [id=" + id + ", name=" + nombre + "]";
	}
	
	public Localidad(int id, String name) {
		this.id = id;
		this.nombre = name;
	}
	
	public Localidad() {
		
	}
	
	

}
