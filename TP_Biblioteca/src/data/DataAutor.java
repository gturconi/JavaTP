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
	
	
	
}
