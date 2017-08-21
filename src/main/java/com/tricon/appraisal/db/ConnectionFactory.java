package com.tricon.appraisal.db;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

	public class ConnectionFactory {
/*		private static String driverClassName = "com.mysql.jdbc.Driver";
		private static String connectionUrl = "jdbc:mysql://localhost:3306/appraisal";
		private static String dbUser = "root";
		private static String dbPwd = "rootuser";*/
		//private static InputStream inputStream;
		
		public static Connection getConnection() throws SQLException, ClassNotFoundException{
			
			
			Properties properties = new Properties();
	    	InputStream input = null;

	    	try {

	    		String filename = "application.properties";
	    		input = ConnectionFactory.class.getClassLoader().getResourceAsStream(filename);
	    		if(input==null){
	    	            System.out.println("Sorry, unable to find " + filename);
	    		}
	    		//load a properties file from class path, inside static method
	    		properties.load(input);
	    		System.out.println(properties.getProperty("DB_URL"));
	    		Class.forName(properties.getProperty("DB_DRIVER_CLASS"));
	    	}
	    		 catch (IOException ex) {
	    	    		ex.printStackTrace();
	    	        } 
	    	
			return DriverManager.getConnection(properties.getProperty("DB_URL"),
					properties.getProperty("DB_USERNAME"),
					properties.getProperty("DB_PASSWORD"));
			

		

	}
		}

	


