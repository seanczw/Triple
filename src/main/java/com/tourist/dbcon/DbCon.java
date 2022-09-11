package com.tourist.dbcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {

	private static DbCon instance;
	private static Connection connection = null;

	private DbCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourist", "root", "1234");
			System.out.print("connected");
		} catch (Exception e) {
			 throw new IllegalStateException("DB Errors: ", e);
		}
	}

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (instance == null) {
			instance = new DbCon();
		}
		return DbCon.connection;
	}

}
