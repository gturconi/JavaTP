package data;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import entities.Autor;
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
						"select id,nombre, apellido, domicilio, telefono, email, fechaInscripcion, idLocalidad, isAdmin from cliente where user=? and password=?");
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
					c.setisAdmin(rs.getInt("isAdmin"));
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
	
	 public void agregarCliente(Cliente c) {
			PreparedStatement stmt= null;
			ResultSet keyResultSet=null;
			try {
				stmt=DbHandler.getInstancia().getConn().
						prepareStatement(
								"insert into cliente(nombre, apellido, user, password, domicilio, telefono, email, fechaInscripcion, idLocalidad, isAdmin) values(?,?,?,?,?,?,?,?,?,?)",
								PreparedStatement.RETURN_GENERATED_KEYS
								);				
				stmt.setString(1, c.getNombre());
				stmt.setString(2, c.getApellido());
				stmt.setString(3, c.getUser());
				stmt.setString(4, c.getPassword());
				stmt.setString(5, c.getDomicilio());
				stmt.setString(6, c.getTelefono());
				stmt.setString(7, c.getEmail());
				stmt.setObject(8, c.getFechaInscripcion());
				stmt.setInt(9, c.getLocalidad().getId());
				stmt.setInt(10, c.getisAdmin());
				
				stmt.executeUpdate();
				
				keyResultSet=stmt.getGeneratedKeys();
		        if(keyResultSet!=null && keyResultSet.next()){
		            c.setId(keyResultSet.getInt(1));
		        }

				
			}  catch (SQLException e) {
		        e.printStackTrace();
			} finally {
		        try {
		            if(keyResultSet!=null)keyResultSet.close();
		            if(stmt!=null)stmt.close();
		            DbHandler.getInstancia().releaseConn();
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        }
			}	
		}
	 
	
}
