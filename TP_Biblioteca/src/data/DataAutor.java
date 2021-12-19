package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Autor;
import entities.Libro;

public class DataAutor {

	
	public LinkedList<Autor> listado(){		
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Autor> list= new LinkedList<>();
		
		try {
			stmt= DbHandler.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select id,nombre, apellido from autor");			
			if(rs!=null) {
				while(rs.next()) {
					Autor l=new Autor();					
					l.setId(rs.getInt("id"));
					l.setNombre(rs.getString("nombre"));
					l.setApellido(rs.getString("apellido"));
					list.add(l);
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
	
	  public Autor buscar(int id) {	 
			
		    Autor a=null;
			PreparedStatement stmt=null;
			ResultSet rs=null;
			try {
				stmt=DbHandler.getInstancia().getConn().prepareStatement(
						"select id,nombre, apellido from autor where id=?");
				stmt.setInt(1, id);			
				rs=stmt.executeQuery();
				
				if(rs!=null && rs.next()) {
					a=new Autor();
					a.setId(rs.getInt("id"));
					a.setNombre(rs.getString("nombre"));
					a.setApellido(rs.getString("apellido"));																								
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
			return a; 	 
	  }
	
	  public void agregar(Autor a) {
			PreparedStatement stmt= null;
			ResultSet keyResultSet=null;
			try {
				stmt=DbHandler.getInstancia().getConn().
						prepareStatement(
								"insert into autor(nombre, apellido) values(?,?)",
								PreparedStatement.RETURN_GENERATED_KEYS
								);				
				stmt.setString(1, a.getNombre());
				stmt.setString(2, a.getApellido());
				
				stmt.executeUpdate();
				
				keyResultSet=stmt.getGeneratedKeys();
		        if(keyResultSet!=null && keyResultSet.next()){
		            a.setId(keyResultSet.getInt(1));
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
	
	  public void borrar(int id) {
			PreparedStatement stmt= null;
			PreparedStatement stmt1= null;
			PreparedStatement stmt2= null;
			try {
				//PRIMERO BUSCAMOS LOS LIBROS DEL AUTOR
				LinkedList<Libro> libros = buscaLibros(id);
				
				//BORRAMOS LOS LIBROS DE LA TABLA AUTOR_LIBRO
				stmt1=DbHandler.getInstancia().getConn().
						prepareStatement("delete from autor_libro where idAutor=?");
				stmt1.setInt(1, id);
				stmt1.executeUpdate();
				
				//BORRAMOS LOS LIBROS DE LA TABLA LIBRO
				if(!libros.isEmpty()) {
					for (Libro libro : libros) {
						stmt2=DbHandler.getInstancia().getConn().
								prepareStatement("delete from libro where id=?");
						stmt2.setInt(1,libro.getId());
						stmt2.executeUpdate();
					}
				}															
				stmt=DbHandler.getInstancia().getConn().
						prepareStatement("delete from autor where id=?");
				stmt.setInt(1, id);
				stmt.executeUpdate();				       
				
			}  catch (SQLException e) {
		        e.printStackTrace();
			} finally {
		        try {           
		            if(stmt!=null && stmt1!=null && stmt2!=null) {
		            	stmt.close(); stmt1.close(); stmt2.close();
			            DbHandler.getInstancia().releaseConn();	
		            }		            
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        	
		        }
			}
			
		}
	  
	  private LinkedList<Libro> buscaLibros(int id) {
		  
		  LinkedList<Libro> list= new LinkedList<>();
		  PreparedStatement stmt= null;
		  ResultSet rs=null;
		  try{ stmt=DbHandler.getInstancia().getConn().
					prepareStatement("select idLibro from autor_libro where idAutor=?");
			stmt.setInt(1, id);
			rs= stmt.executeQuery();;
			if(rs!=null) {
				while(rs.next()) {
					Libro l=new Libro ();					
					l.setId(rs.getInt("idLibro"));					
					list.add(l);
				}
			}	
	     } catch (SQLException e) {
	        e.printStackTrace();
		} finally {
	        try {           
	            if(stmt!=null)stmt.close();
	            DbHandler.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
		}
		return list;
	}

	public void modificar(Autor a) {
			PreparedStatement stmt= null;	
			try {
				stmt=DbHandler.getInstancia().getConn().
						prepareStatement(
								"update autor set nombre=?, apellido=?"
								+ " where id=?");
				stmt.setString(1, a.getNombre());
				stmt.setString(2, a.getApellido());
				stmt.setInt(3, a.getId());
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

	public int buscarAutor(String nombre, String apellido) {	 			  	  
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select id,nombre, apellido from autor where nombre=? and apellido=?");
			stmt.setString(1, nombre);
			stmt.setString(2, apellido);
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

	public Autor buscarAutor2(String nombre, String apellido) {
		Autor a=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select id,nombre, apellido from autor where nombre=? and apellido=?");
			stmt.setString(1, nombre);
			stmt.setString(2, apellido);
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				a=new Autor();
				a.setId(rs.getInt("id"));
				a.setNombre(rs.getString("nombre"));
				a.setApellido(rs.getString("apellido"));																										
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
		return a;	 
  }	
	

}
