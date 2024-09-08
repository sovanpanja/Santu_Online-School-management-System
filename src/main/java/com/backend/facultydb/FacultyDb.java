package com.backend.facultydb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class FacultyDb {
	static Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public static void connect() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "12345");
	}

	public int insertData(String f1, String f2, String f3, String f4, String f5, String f6, String f7, String f8,
			String f9, String f10, String f11,String f12) throws Exception {
		connect();
		ps = con.prepareStatement("insert into teacher(mobile,fname,lname,dept,dob,gender,gname,addr,email,pwd,doj,category) values(?,?,?,?,?,?,?,?,?,?,?,?)");
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
		ps.setString(12,f12);
		int i = ps.executeUpdate();
		con.close();
		return i;
	}

	public boolean checkLogin(String f1, String f2) throws Exception {
		connect();
		boolean b = false;
		ps = con.prepareStatement("Select * from teacher where mobile=? and pwd=?");
		ps.setString(1, f1);
		ps.setString(2, f2);
		rs = ps.executeQuery();
		while (rs.next()) {
			b = true;
		}
		con.close();
		return b;
	}

	public Vector<String> getDetails(String f1) throws Exception {
		connect();
		Vector<String> v = new Vector<String>();
		ps = con.prepareStatement("Select * from teacher where mobile=?");
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
			String cat = rs.getString(12);
			String reg=String.valueOf(rs.getInt(13));

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
			v.add(cat);
			v.add(reg);
		}
		con.close();
		return v;
	}

	public String getOldPassword(String f1) throws Exception {
		String pass = null;
		connect();
		ps = con.prepareStatement("select pwd from teacher where mobile=?");
		ps.setString(1, f1);
		rs = ps.executeQuery();
		while (rs.next()) {
			pass = rs.getString(1);
		}
		con.close();
		return pass;
	}
	public int changePassword(String f1,String f2) throws Exception
	{
	connect();
	ps = con.prepareStatement("update teacher set pwd=? where pwd=?");
	ps.setString(1,f2);
	ps.setString(2,f1);
	int i = ps.executeUpdate();
	con.close();
	return i;
	}

}
