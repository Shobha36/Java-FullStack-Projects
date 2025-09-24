package com.dcl.jdbc.cms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class CarDao {
	Scanner sc = new Scanner(System.in);

	public void addCar() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_car_db", "root", "root");
		PreparedStatement pst = con.prepareStatement("Insert into car values(?,?,?,?)");

		System.out.println("Enter Car Id: ");
		pst.setInt(1, sc.nextInt());
		System.out.println("enter the car brand");
		pst.setString(2, sc.next());
		System.out.println("enter the car model");
		pst.setString(3, sc.next());
		System.out.println("enter the car price");
		pst.setInt(4, sc.nextInt());

		int rowInserted = pst.executeUpdate();
		if (rowInserted > 0)
			System.out.println(rowInserted + " Data inserted");
		else
			System.out.println("Data not inserted");
		pst.close();
		con.close();
	}

	public void findCarById() throws ClassNotFoundException, SQLException {
		System.out.println("Enter car Id to find : ");
		int idCar = sc.nextInt();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_car_db", "root", "root");
		PreparedStatement pst = con.prepareStatement("Select * from car where idcar=?"); // columun name idCar in tabel
																							// and here should match
																							// else where clause unknown
																							// some exception comes
		pst.setInt(1, idCar);
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			System.out.println(rs.getInt("idCar") + " " + rs.getString("model") + " " + rs.getString("brand") + " "
					+ rs.getInt("price"));
		}
		pst.close();
		con.close();
	}

	public void findAllCars() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_car_db", "root", "root");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select * from car");
		while (rs.next()) {
			System.out.println(rs.getInt("idCar") + " " + rs.getString("model") + " " + rs.getString("brand") + " "
					+ rs.getInt("price"));
		}
		st.close();
		con.close();
	}

	public void updatePriceByCarId() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_car_db", "root", "root");
		PreparedStatement pst = con.prepareStatement("Update car set price=? where idcar=?");
		System.out.println("Enter price: ");
		pst.setInt(1, sc.nextInt()); // 2nd is price
		System.out.println("enter the car id to update price: ");
		pst.setInt(2, sc.nextInt()); // 1st is id
		int rowInserted = pst.executeUpdate();
		if (rowInserted > 0)
			System.out.println(rowInserted + " Data updated successfully");
		else
			System.out.println("data not updated");
		pst.close();
		con.close();
	}

	public void deleteCarById() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_car_db", "root", "root");
		PreparedStatement pst = con.prepareStatement("delete from car where idcar=?");
		System.out.println("Enter car id to delete: ");
		pst.setInt(1, sc.nextInt());
		int rs = pst.executeUpdate();
		if (rs > 0)
			System.out.println(rs + " data deleted");
		else
			System.out.println("data not deleted");
		pst.close();
		con.close();
	}

	public void deleteCarByBrand() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_car_db", "root", "root");
		PreparedStatement pst = con.prepareStatement("delete from car where brand=?");
		System.out.println("Enter the brand to delete : ");
		pst.setString(1, sc.next());
		int rs = pst.executeUpdate();
		if (rs > 0)
			System.out.println(rs + " data deleted");
		else
			System.out.println("data not deleted");
		pst.close();
		con.close();

	}
}
