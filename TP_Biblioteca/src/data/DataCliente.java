package data;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.LinkedList;


import entities.Cliente;

public class DataCliente {

	 public Cliente buscarCliente(String user, String pass) {	 
			
		    DataLocalidad dl = new DataLocalidad();;
		    Cliente c=null;
			PreparedStatement stmt=null;
			ResultSet rs=null;
			try {
				stmt=DbHandler.getInstancia().getConn().prepareStatement(
						"select id,nombre, apellido, domicilio, telefono, email, fechaInscripcion, idLocalidad, isAdmin, estado from cliente where user=? and password=?");
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
					c.setEstado(rs.getString("estado"));
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
	
	 public Cliente buscarClientePorId(int id) {	 
			
		    DataLocalidad dl = new DataLocalidad();;
		    Cliente c=null;
			PreparedStatement stmt=null;
			ResultSet rs=null;
			try {
				stmt=DbHandler.getInstancia().getConn().prepareStatement(
						"select id,nombre, apellido, domicilio, telefono, email, fechaInscripcion, idLocalidad, isAdmin, estado from cliente where id=?");
				stmt.setInt(1, id);				
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
					c.setEstado(rs.getString("estado"));
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
	 
	 
	 
	 public int agregarCliente(Cliente c) {
			PreparedStatement stmt= null;
			ResultSet keyResultSet=null;
			try {
				stmt=DbHandler.getInstancia().getConn().
						prepareStatement(
								"insert into cliente(nombre, apellido, user, password, domicilio, telefono, email, fechaInscripcion, idLocalidad, isAdmin, estado) values(?,?,?,?,?,?,?,?,?,?,?)",
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
				stmt.setString(11, c.getEstado());
				
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
		        	return 1;
		        }
			}
			return 0;
		}
	 
	 
	 public LinkedList<Cliente> listado(){	
		    DataLocalidad dl = new DataLocalidad();;
		    PreparedStatement stmt=null;
			ResultSet rs=null;
			LinkedList<Cliente> list= new LinkedList<>();
			
			try {
				stmt=DbHandler.getInstancia().getConn().prepareStatement(
				   "select id,nombre, apellido, user, password, domicilio, telefono, email, fechaInscripcion, idLocalidad, isAdmin, estado from cliente where isAdmin=?");
				stmt.setInt(1, 0);
				rs=stmt.executeQuery();
				if(rs!=null) {
					while(rs.next()) {
						Cliente c=new Cliente();					
						c.setId(rs.getInt("id"));
						c.setNombre(rs.getString("nombre"));
						c.setApellido(rs.getString("apellido"));
						c.setUser(rs.getString("user"));
						c.setPassword(rs.getString("password"));
						c.setDomicilio(rs.getString("domicilio"));
						c.setTelefono(rs.getString("telefono"));
						c.setEmail(rs.getString("email"));
						c.setFechaInscripcion(rs.getObject("fechaInscripcion",LocalDate.class));
						c.setLocalidad(dl.buscarLocalidad(rs.getInt("idLocalidad")));
						c.setisAdmin(rs.getInt("isAdmin"));
						c.setEstado(rs.getString("estado"));
						list.add(c);
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			} finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					DbHandler.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}		
			
			return list;		
		}
	
	 public void borrar(int id) {
			PreparedStatement stmt= null;	
			try {
				stmt=DbHandler.getInstancia().getConn().
						prepareStatement("delete from cliente where id=?");
				stmt.setInt(1, id);
				stmt.executeUpdate();				       
				
			}  catch (SQLException e) {
		        e.printStackTrace();
			} finally {
		        try {           
		            if(stmt!=null)stmt.close();
		            DbHandler.getInstancia().releaseConn();
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        }
			}			
		}
	 
	 public void modificar(Cliente c) {
			PreparedStatement stmt= null;	
			try {
				stmt=DbHandler.getInstancia().getConn().
						prepareStatement(
								"update cliente set nombre=?, apellido=?, user=?, password=?, domicilio=?, telefono=?, email=?, idLocalidad=?, estado=? where id=?");
				stmt.setString(1, c.getNombre());
				stmt.setString(2, c.getApellido());				
				stmt.setString(3, c.getUser());
				stmt.setString(4, c.getPassword());
				stmt.setString(5, c.getDomicilio());
				stmt.setString(6, c.getTelefono());
				stmt.setString(7, c.getEmail());				
				stmt.setInt(8, c.getLocalidad().getId());
				stmt.setString(9, c.getEstado());
				stmt.setInt(10, c.getId());
				
				stmt.executeUpdate();
								
			}  catch (SQLException e) {
		        e.printStackTrace();
			} finally {
		        try {            
		            if(stmt!=null)stmt.close();
		            DbHandler.getInstancia().releaseConn();
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        }
			}	
		}
	 
	 
	 public int validaCliente(String user) {	 					    
			PreparedStatement stmt=null;
			ResultSet rs=null;
			try {
				stmt=DbHandler.getInstancia().getConn().prepareStatement(
						"select id,nombre, apellido, domicilio, telefono, email, fechaInscripcion, idLocalidad, isAdmin, estado from cliente where user=?");
				stmt.setString(1, user);				
				rs=stmt.executeQuery();
				
				if(rs!=null && rs.next()) {
					return 1;
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
			return 0; 	 
	  }
	 
}


