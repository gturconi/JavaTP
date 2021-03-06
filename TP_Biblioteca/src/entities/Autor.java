package entities;

public class Autor implements Comparable<Autor>{
	
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
	
	@Override
	  public boolean equals(Object obj) {
		  if(this == obj) {
			  return true;
		  }
		  if(obj == null) {
			  return false;
		  }
		  if(!(obj instanceof Autor)) {
			  return false;
		  }
		  Autor other = (Autor) obj;
		  if(id != other.id) {
			  return false;
		  }
		  return true;
	  }
	@Override
	public int compareTo(Autor o) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
