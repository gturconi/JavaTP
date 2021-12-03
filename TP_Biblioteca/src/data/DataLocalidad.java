package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Autor;
import entities.Localidad;

public class DataLocalidad {

	public LinkedList<Localidad> listado(){		
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Localidad> list= new LinkedList<>();
		
		try {
			stmt= DbHandler.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select id,nombre from localidad");			
			if(rs!=null) {
				while(rs.next()) {
					Localidad l=new Localidad();					
					l.setId(rs.getInt("id"));
					l.setNombre(rs.getString("nombre"));															
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
	
	
	public Localidad buscarLocalidad(int id) {	 
		
	    Localidad l=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select id, nombre from localidad where id=?");
			stmt.setInt(1, id);			
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				l=new Localidad();
				l.setId(rs.getInt("id"));
				l.setNombre(rs.getString("nombre"));																												
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
		return l; 	 
  }

	
	
}
