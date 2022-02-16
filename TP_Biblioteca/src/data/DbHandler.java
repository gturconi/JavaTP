package data;


import java.sql.*;

public class DbHandler {

private static DbHandler instancia;
	
	private String driver="com.mysql.cj.jdbc.Driver";
	private String host="localhost"; //localhost //node7295-env-0440537.sp.skdrive.net
	private String port="3306";
	private String user="admin";//admin //root
	private String password="123";//123 //uBZrG4F4Wr
	private String db="biblioteca";
	private int conectados=0;
	private Connection conn=null;
	private String options ="";
	private DbHandler() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static DbHandler getInstancia() {
		if (instancia == null) {
			instancia = new DbHandler();
		}
		return instancia;
	}
	
	public Connection getConn() {
		try {
			if(conn==null || conn.isClosed()) {
				conn=DriverManager.getConnection("jdbc:mysql://"+host+":"+port+"/"+db+options, user, password);
				conectados=0;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conectados++;
		return conn;
	}
	
	public void releaseConn() {
		conectados--;
		try {
			if (conectados<=0) {				
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
}

