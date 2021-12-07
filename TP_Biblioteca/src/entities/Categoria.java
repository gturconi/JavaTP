package entities;

public class Categoria {

	
	private int id;
	private String descripcion;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Override
	public String toString() {
		return "Categoria [id=" + id + ", description=" + descripcion + "]";
	}
	
	public Categoria(int id, String description) {
		this.id = id;
		this.descripcion = description;
	}
	
	public Categoria() {
		
		
	}
	
}
