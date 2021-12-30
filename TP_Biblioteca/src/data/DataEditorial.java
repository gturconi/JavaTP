package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Editorial;

public class DataEditorial {

	
	public LinkedList<Editorial> listado(){		
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Editorial> list= new LinkedList<>();
		
		try {
			stmt= DbHandler.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select id,nombre from editorial");			
			if(rs!=null) {
				while(rs.next()) {
					Editorial e=new Editorial();					
					e.setId(rs.getInt("id"));
					e.setNombre(rs.getString("nombre"));					
					list.add(e);
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
	
public Editorial buscar(int id) {	 
		
	    Editorial ed=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select id, nombre from editorial where id=?");
			stmt.setInt(1, id);			
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				ed=new Editorial();
				ed.setId(rs.getInt("id"));
				ed.setNombre(rs.getString("nombre"));																												
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
		return ed; 	 
  }	
	
public void agregar(Editorial ed) {
	PreparedStatement stmt= null;
	ResultSet keyResultSet=null;
	try {
		stmt=DbHandler.getInstancia().getConn().
				prepareStatement(
						"insert into editorial(nombre) values(?)",
						PreparedStatement.RETURN_GENERATED_KEYS
						);				
		stmt.setString(1, ed.getNombre());		
		
		stmt.executeUpdate();
		
		keyResultSet=stmt.getGeneratedKeys();
        if(keyResultSet!=null && keyResultSet.next()){
            ed.setId(keyResultSet.getInt(1));
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
				prepareStatement("delete from editorial where id=?");
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

public void modificar(Editorial ed) {
	PreparedStatement stmt= null;	
	try {
		stmt=DbHandler.getInstancia().getConn().
				prepareStatement(
						"update editorial set nombre=? where id=?");
		stmt.setString(1, ed.getNombre());		
		stmt.setInt(2, ed.getId());
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

public Editorial buscarEditorialPorNombre(String nombre) {	 
	
	Editorial ed=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	try {
		stmt=DbHandler.getInstancia().getConn().prepareStatement(
				"select id, nombre from editorial where nombre=?");
		stmt.setString(1, nombre);			
		rs=stmt.executeQuery();
		
		if(rs!=null && rs.next()) {
			ed=new Editorial();
			ed.setId(rs.getInt("id"));
			ed.setNombre(rs.getString("nombre"));																												
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
	return ed; 	 
}


}
