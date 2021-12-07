package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Autor;

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
			try {
				stmt1=DbHandler.getInstancia().getConn().
						prepareStatement("delete from autor_libro where id=?");
				stmt1.setInt(1, id);
				stmt1.executeUpdate();
				stmt=DbHandler.getInstancia().getConn().
						prepareStatement("delete from autor where id=?");
				stmt.setInt(1, id);
				stmt.executeUpdate();				       
				
			}  catch (SQLException e) {
		        e.printStackTrace();
			} finally {
		        try {           
		            if(stmt!=null && stmt1!=null)stmt.close(); stmt1.close();
		            DbHandler.getInstancia().releaseConn();
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        }
			}			
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

	  

}
