package data;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import entities.Cliente;
import data.DataLocalidad;

public class DataCliente {

	 public Cliente buscarCliente(String user, String pass) {	 
			
		    DataLocalidad dl = new DataLocalidad();;
		    Cliente c=null;
			PreparedStatement stmt=null;
			ResultSet rs=null;
			try {
				stmt=DbHandler.getInstancia().getConn().prepareStatement(
						"select id,nombre, apellido, domicilio, telefono, email, fechaInscripcion, idLocalidad from cliente where user=? and password=?");
				stmt.setString(1, user);
				stmt.setString(2, pass);
				rs=stmt.executeQuery();
				
				if(rs!=null && rs.next()) {
					c=new Cliente();
					c.setId(rs.getInt("id"));
					c.setNombre(rs.getString("nombre"));
					c.setApellido(rs.getString("apellido"));
					c.setDomicilio(rs.getString("domicilio"));
					c.setTelefono(rs.getString("telefono"));
					c.setEmail(rs.getString("email"));
					c.setFechaInscripcion(rs.getObject("fechaInscripcion",LocalDate.class));
					c.setLocalidad(dl.buscarLocalidad(rs.getInt("idLocalidad")));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					DbHandler.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}			
			return c; 	 
	  }
	
	
}
