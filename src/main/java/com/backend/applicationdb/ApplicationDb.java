package com.backend.applicationdb;

import java.util.*;
import java.sql.*;

public class ApplicationDb {

	static Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public static void connect() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "12345");
	}

	public int insertData(String f1, String f2, String f3, String f4, String f5, String f6, String f7, String f8,
			String f9, String f10, String f11) throws Exception {
		connect();
		ps = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, f1);
		ps.setString(2, f2);
		ps.setString(3, f3);
		ps.setString(4, f4);
		ps.setString(5, f5);
		ps.setString(6, f6);
		ps.setString(7, f7);
		ps.setString(8, f8);
		ps.setString(9, f9);
		ps.setString(10, f10);
		ps.setString(11, f11);
		int i = ps.executeUpdate();
		con.close();
		return i;
	}
	
	public Vector<String> getDetails(String f1) throws Exception {
		connect();
		Vector<String> v = new Vector<String>();
		ps = con.prepareStatement("Select * from student where mobile=?");
		ps.setString(1, f1);
		rs = ps.executeQuery();
		while (rs.next()) {
			String uid = rs.getString(1);
			String fName = rs.getString(2);
			String lName = rs.getString(3);
			String dept = rs.getString(4);
			String dob = rs.getString(5);
			String gender = rs.getString(6);
			String gName = rs.getString(7);
			String city = rs.getString(8);
			String email = rs.getString(9);
			String session = rs.getString(11);

			v.add(uid);
			v.add(fName);
			v.add(lName);
			v.add(dept);
			v.add(dob);
			v.add(gender);
			v.add(gName);
			v.add(city);
			v.add(email);
			v.add(session);
		}
		con.close();
		return v;
	}
}
