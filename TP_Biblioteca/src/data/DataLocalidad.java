package data;

import java.sql.PreparedStatement;
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

public Localidad buscarLocalidadPorNombre(String nombre) {	 
		
	    Localidad l=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select id, nombre from localidad where nombre=?");
			stmt.setString(1, nombre);			
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
	
public void agregar(Localidad l) {
	PreparedStatement stmt= null;
	ResultSet keyResultSet=null;
	try {
		stmt=DbHandler.getInstancia().getConn().
				prepareStatement(
						"insert into localidad(nombre) values(?)",
						PreparedStatement.RETURN_GENERATED_KEYS
						);				
		stmt.setString(1, l.getNombre());		
		
		stmt.executeUpdate();
		
		keyResultSet=stmt.getGeneratedKeys();
        if(keyResultSet!=null && keyResultSet.next()){
            l.setId(keyResultSet.getInt(1));
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
	try {
		stmt=DbHandler.getInstancia().getConn().
				prepareStatement("delete from localidad where id=?");
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

public void modificar(Localidad l) {
	PreparedStatement stmt= null;	
	try {
		stmt=DbHandler.getInstancia().getConn().
				prepareStatement(
						"update localidad set nombre=? where id=?");
		stmt.setString(1, l.getNombre());		
		stmt.setInt(2, l.getId());
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
