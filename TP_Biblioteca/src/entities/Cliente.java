package entities;

import java.time.*;

public class Cliente {
	
	private int id;
	private String nombre;
	private String apellido;
	private String user;
	private String password;
	private String domicilio;
	private String telefono;
	private String email;
	private LocalDate fechaInscripcion;
	private Localidad localidad;
	private int isAdmin;
	private String estado;
	
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
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDomicilio() {
		return domicilio;
	}
	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDate getFechaInscripcion() {
		return fechaInscripcion;
	}
	public void setFechaInscripcion(LocalDate fechaInscripcion) {
		this.fechaInscripcion = fechaInscripcion;
	}
	
	
	public Localidad getLocalidad() {
		return localidad;
	}
	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}
	
	
	@Override
	public String toString() {
		return "Cliente [id=" + id + ", name=" + nombre + ", apellido=" + apellido + ", user=" + user + ", password="
				+ password + ", domicilio=" + domicilio + ", telefono=" + telefono + ", email=" + email
				+ ", fechaInscripcion=" + fechaInscripcion + ", localidad=" + localidad + "]";
	}
	
	public Cliente(int id, String name, String apellido, String user, String password, String domicilio,
			String telefono, String email, LocalDate fechaInscripcion, Localidad localidad) {
		this.id = id;
		this.nombre = name;
		this.apellido = apellido;
		this.user = user;
		this.password = password;
		this.domicilio = domicilio;
		this.telefono = telefono;
		this.email = email;
		this.fechaInscripcion = fechaInscripcion;
		this.localidad = localidad;
	}
	
	
	public Cliente() {
		
	}
	
	public int getisAdmin() {
		return isAdmin;
	}
	public void setisAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}

}
