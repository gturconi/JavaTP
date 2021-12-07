package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Categoria;



public class DataCategoria {

	
	public LinkedList<Categoria> listado(){		
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Categoria> list= new LinkedList<>();
		
		try {
			stmt= DbHandler.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select id,descripcion from categoria");			
			if(rs!=null) {
				while(rs.next()) {
					Categoria c=new Categoria();					
					c.setId(rs.getInt("id"));
					c.setDescripcion(rs.getString("descripcion"));					
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
	
	
public Categoria buscar(int id) {	 
		
	    Categoria c=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select id, descripcion from categoria where id=?");
			stmt.setInt(1, id);			
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				c=new Categoria();
				c.setId(rs.getInt("id"));
				c.setDescripcion(rs.getString("descripcion"));																												
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
	
public void agregar(Categoria c) {
	PreparedStatement stmt= null;
	ResultSet keyResultSet=null;
	try {
		stmt=DbHandler.getInstancia().getConn().
				prepareStatement(
						"insert into categoria(descripcion) values(?)",
						PreparedStatement.RETURN_GENERATED_KEYS
						);				
		stmt.setString(1, c.getDescripcion());		
		
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
	
public void borrar(int id) {
	PreparedStatement stmt= null;	
	try {
		stmt=DbHandler.getInstancia().getConn().
				prepareStatement("delete from categoria where id=?");
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

public void modificar(Categoria c) {
	PreparedStatement stmt= null;	
	try {
		stmt=DbHandler.getInstancia().getConn().
				prepareStatement(
						"update categoria set descripcion=? where id=?");
		stmt.setString(1, c.getDescripcion());		
		stmt.setInt(2, c.getId());
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
