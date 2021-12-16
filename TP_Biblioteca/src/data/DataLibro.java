package data;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.LinkedList;

import entities.Autor;
import entities.Libro;


public class DataLibro {

	public Libro buscar(int id) {	 
		
	    DataEditorial de = new DataEditorial();
	    DataCategoria dc = new DataCategoria();
	    
	    Libro l=null;
		PreparedStatement stmt=null;	
		ResultSet rs=null;		
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select id,titulo, descripcion, nroEdicion, fechaEdicion, dimensiones, paginas, stock, precio, idEditorial, idCategoria from libro where id=?");
			stmt.setInt(1, id);			
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				l=new Libro();
				l.setId(rs.getInt("id"));
				l.setTitulo(rs.getString("titulo"));
				l.setDescripcion(rs.getString("descripcion"));
				l.setNroEdicion(rs.getInt("nroEdicion"));
				l.setFechaEdicion(rs.getObject("fechaEdicion",LocalDate.class));				
				l.setDimensiones(rs.getString("dimensiones"));
				l.setNroPaginas(rs.getInt("paginas"));
				l.setExistencia(rs.getInt("sotck"));
				l.setPrecio(rs.getDouble("precio"));
				l.setEditorial(de.buscar(rs.getInt("idEditorial")));
				l.setCategoria(dc.buscar(rs.getInt("idCategoria")));
				//l.setImagen(rs.getBlob("imagen"));
			    l.setAutores(buscaAutores(id));
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
	
	private LinkedList<Autor> buscaAutores(int id) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Autor> list= new LinkedList<>();    
		DataAutor da = new DataAutor();    
		
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select idAutor from autor_libro where idLibro=?");
			stmt.setInt(1, id);			
			rs=stmt.executeQuery();
						
			if(rs!=null) {
				while(rs.next()) {		
					Autor l= da.buscar(rs.getInt("idAutor"));					
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

	public void agregar(Libro l) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=DbHandler.getInstancia().getConn().
					prepareStatement(
							"insert into libro(titulo, descripcion, nroEdicion, fechaEdicion, dimensiones, paginas, stock, precio, idEditorial, idCategoria) values(?,?,?,?,?,?,?,?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);				
			stmt.setString(1, l.getTitulo());
			stmt.setString(2, l.getDescripcion());
			stmt.setInt(3, l.getNroEdicion());
			stmt.setObject(4, l.getFechaEdicion());
			stmt.setString(5, l.getDimensiones());
			stmt.setInt(6, l.getNroPaginas());
			stmt.setInt(7, l.getExistencia());
			stmt.setDouble(8, l.getPrecio());
			stmt.setObject(9, l.getEditorial());
			stmt.setObject(10, l.getCategoria());
			//stmt.setBlob(11,l.getImagen());
			
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
	        if(keyResultSet!=null && keyResultSet.next()){
	            l.setId(keyResultSet.getInt(1));
	            agregarAutores(l.getAutores(), l.getId());
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

	private void agregarAutores(LinkedList<Autor> autores, int idLibro) {
		
		for (Autor autor : autores) {
			PreparedStatement stmt=null;
						
			try {
				stmt= DbHandler.getInstancia().getConn().prepareStatement(
						"insert into autor_libro(idAutor,idLibro) values(?,?)");							
				stmt.setInt(1, autor.getId());
				stmt.setInt(2, idLibro);
								
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
	
	public LinkedList<Libro> listado(){	
	    DataEditorial de = new DataEditorial();
	    DataCategoria dc = new DataCategoria();
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Libro> list= new LinkedList<>();
		
		try {
			stmt= DbHandler.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select id,titulo, descripcion, nroEdicion, fechaEdicion, dimensiones, paginas, stock, precio, idEditorial, idCategoria from libro");			
			if(rs!=null) {
				while(rs.next()) {
					Libro l=new Libro();					
					l.setId(rs.getInt("id"));
					l.setTitulo(rs.getString("titulo"));
					l.setDescripcion(rs.getString("descripcion"));
					l.setNroEdicion(rs.getInt("nroEdicion"));
					l.setFechaEdicion(rs.getObject("fechaEdicion",LocalDate.class));
					l.setDimensiones(rs.getString("dimensiones"));
					l.setNroPaginas(rs.getInt("paginas"));
					l.setExistencia(rs.getInt("stock"));
					l.setPrecio(rs.getDouble("precio"));
					l.setEditorial(de.buscar(rs.getInt("idEditorial")));
					l.setCategoria(dc.buscar(rs.getInt("idCategoria")));
					l.setAutores(buscaAutores(l.getId()));
					//l.setImagen(rs.getBlob("imagen"));
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
	
	
	public void borrar(int id) {
		PreparedStatement stmt= null;	
		try {
			stmt=DbHandler.getInstancia().getConn().
					prepareStatement("delete from libro where id=?");
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
	
	
	 public void modificar(Libro l) {
			PreparedStatement stmt= null;	
			try {
				stmt=DbHandler.getInstancia().getConn().
						prepareStatement(
								"update libro set titulo=?, descripcion=?, nroEdicion=?, fechaEdicion=?, dimensiones=?, paginas=?, stock=?, precio=?, idEditorial=?, idCategoria=? where id=?");
				stmt.setString(1, l.getTitulo());
				stmt.setString(2, l.getDescripcion());
				stmt.setInt(3, l.getNroEdicion());
				stmt.setObject(4, l.getFechaEdicion());				
				stmt.setString(5, l.getDimensiones());
				stmt.setInt(6, l.getNroPaginas());
				stmt.setInt(7, l.getExistencia());
				stmt.setDouble(8, l.getPrecio());
				stmt.setInt(9, l.getEditorial().getId());
				stmt.setInt(10, l.getCategoria().getId());								
				stmt.setInt(11, l.getId());
	//			stmt.setBlob(12,l.getImagen());
				stmt.executeUpdate();
								
				actualizaAutores(l.getAutores(),l.getId());
				
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

	private void actualizaAutores(LinkedList<Autor> autores, int idLibro) {
		
		//ELIMINAMOS LOS AUTORES PARA ESE LIBRO
		PreparedStatement stmt= null;	
		try {
			stmt=DbHandler.getInstancia().getConn().
					prepareStatement("delete from autor_libro where idLibro=?");
			stmt.setInt(1,idLibro);
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
		
		//INSERTAMOS LOS NUEVOS AUTORES PARA ESE LIBRO
		agregarAutores(autores,idLibro);		
		
	}
	
	
		
}
