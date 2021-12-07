package entities;

public class Editorial {
	
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
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Override
	public String toString() {
		return "Editorial [id=" + id + ", name=" + nombre + "]";
	}
	
	public Editorial(int id, String name) {
		this.id = id;
		this.nombre = name;
	}
	
	public Editorial() {
		
	}
	

}
