package data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Localidad;

public class DataLocalidad {

	public LinkedList<Localidad> listado(){		
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Localidad> list= new LinkedList<>();
		
		try {
			stmt= DbHandler.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select id,nombre from Localidad");			
			if(rs!=null) {
				while(rs.next()) {
					Localidad l=new Localidad();					
					l.setId(rs.getInt("id"));
					l.setNombre(rs.getString("name"));															
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
	
	
	
}
