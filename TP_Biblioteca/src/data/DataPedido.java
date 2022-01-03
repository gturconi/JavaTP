package data;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.LinkedList;

import entities.Libro;
import entities.Pedido;

public class DataPedido {

	public LinkedList<Pedido> listado(){
		DataCliente dc = new DataCliente();;		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Pedido> list= new LinkedList<>();
		
		try{ stmt=DbHandler.getInstancia().getConn().
				prepareStatement("select nroPedido,fecha, estado, idCliente from pedido where estado=?");
		    stmt.setString(1, "reservado");
		    rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Pedido p=new Pedido();					
					p.setNroPedido(rs.getInt("nroPedido"));
					p.setFecha(rs.getObject("fecha",LocalDate.class));
					p.setEstado(rs.getString("estado"));
					p.setCliente(dc.buscarClientePorId(rs.getInt("idCliente")));				
					list.add(p);									
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

	public LinkedList<Libro> librosPedido(int id) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Libro> list= new LinkedList<>();    
		DataLibro dlib = new DataLibro();    
		
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select idLibro from pedido_libro where nroPedido=?");
			stmt.setInt(1, id);			
			rs=stmt.executeQuery();
						
			if(rs!=null) {
				while(rs.next()) {
					Libro l = dlib.buscar(rs.getInt("idLibro"));									
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
	
	public Pedido buscaReserva(int idCl) {
		
		Pedido p = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		DataCliente dc = new DataCliente();
		
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select nroPedido, fecha, estado, idCliente from pedido where idCliente=? and fecha=? and estado=?");
			stmt.setInt(1, idCl);	
						
			stmt.setDate(2, java.sql.Date.valueOf(LocalDate.now())); //convertimos LocalDate en Date
			stmt.setString(3, "reservado");
			rs=stmt.executeQuery();
						
			if(rs!=null && rs.next()) {
				p=new Pedido();
				p.setNroPedido(rs.getInt("nroPedido"));
				p.setFecha(rs.getObject("fecha",LocalDate.class));
				p.setEstado(rs.getString("estado"));
				p.setCliente(dc.buscarClientePorId(idCl));		
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
		return p;
	}
	
	public void agregarLibro(Pedido p, Libro l) {
		
		DataLibro dlib = new DataLibro(); 
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=DbHandler.getInstancia().getConn().
					prepareStatement(
							"insert into pedido_libro(nroPedido, idLibro) values(?,?)");				
			stmt.setInt(1, p.getNroPedido());
			stmt.setInt(2, l.getId());
			stmt.executeUpdate();
			dlib.actualizaExistencia(l.getId(), l.getExistencia()-1); //actualizamos la existencia del libro			
									
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
	
	
	public void agregarPedido(Pedido p) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=DbHandler.getInstancia().getConn().
					prepareStatement(
							"insert into pedido(fecha, estado, idCliente) values(?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			
			stmt.setDate(1, java.sql.Date.valueOf(p.getFecha()));			
			stmt.setString(2,p.getEstado());
			stmt.setInt(3, p.getCliente().getId());			
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
	        if(keyResultSet!=null && keyResultSet.next()){
	            p.setNroPedido(keyResultSet.getInt(1));
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
	
	
	//DEVUELVE LOS LIBROS RESERVADOS PARA UN CLIENTE EN PARTICULAR
	public LinkedList<Libro> librosReservados(int idCliente) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Libro> list= new LinkedList<>();    
		    
		
		try {
			stmt=DbHandler.getInstancia().getConn().prepareStatement(
					"select nroPedido from pedido where idCliente=? and estado=?");
			stmt.setInt(1, idCliente);
			stmt.setString(2, "reservado");
			rs=stmt.executeQuery();
						
			if(rs!=null) {
				while(rs.next()) {					 									
					list.addAll(librosPedido(rs.getInt("nroPedido")));
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
	
	public int buscarNroPedido(int idLibro, int idCliente) {
		PreparedStatement stmt= null;	
		ResultSet rs=null;
		
		try {
			stmt=DbHandler.getInstancia().getConn().
					prepareStatement(
							"select p.nroPedido from pedido p inner join pedido_libro pl on pl.nroPedido=p.nroPedido where idCliente=? and idLibro=? and p.estado=?");
			stmt.setInt(1, idCliente);		
			stmt.setInt(2, idLibro);
			stmt.setString(3, "reservado");
			rs= stmt.executeQuery();
			if(rs!=null && rs.next()) {
				return rs.getInt("nroPedido");																												
			}
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
		return 0;
	}
	
	public void cancelarReserva(int idLibro, int idCliente) {
		
		int nroPedido = buscarNroPedido(idLibro,idCliente);
		LinkedList<Libro> libros = new LinkedList<Libro>();
		libros = librosPedido(nroPedido);
		
		quitarLibro(nroPedido,idLibro);
		
		if (libros.size() == 1) {
			actualizarEstado(nroPedido,idLibro ,"cancelado");
		}		
	}

	private void actualizarEstado(int nroPedido,int idLibro ,String estado) {
		
		DataLibro dlib = new DataLibro();
		PreparedStatement stmt= null;	
		try {
			stmt=DbHandler.getInstancia().getConn().
					prepareStatement(
							"update pedido set estado=? where nroPedido=?");
			stmt.setString(1, estado);		
			stmt.setInt(2, nroPedido);
			stmt.executeUpdate();
        if(estado.equals("cancelado") || estado.equals("reservado")) {
        	Libro l = dlib.buscar(idLibro);
        	dlib.actualizaExistencia(l.getId(), l.getExistencia()+1);
        }
			
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

	private void quitarLibro(int nroPedido, int idLibro) {
		PreparedStatement stmt= null;	
		try {
			stmt=DbHandler.getInstancia().getConn().
					prepareStatement("delete from pedido_libro where nroPedido=? and idLibro=?");
			stmt.setInt(1, nroPedido);
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
