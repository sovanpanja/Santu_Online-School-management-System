package com.backend.course;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Course {
	static Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public static void connect() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "12345");
	}

	public int insertData(String f1, String f2, String f3) throws Exception {
		connect();
		ps = con.prepareStatement("insert into course(c_name,duration,fees) values(?,?,?)");
		ps.setString(1, f1);
		ps.setString(2, f2);
		ps.setString(3, f3);
		int i = ps.executeUpdate();
		con.close();
		return i;
	}
}
