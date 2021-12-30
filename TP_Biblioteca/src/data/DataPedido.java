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
	
	
}
