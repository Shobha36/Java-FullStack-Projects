package com.dcl.jdbc.cms;

import java.sql.SQLException;
import java.util.Scanner;

import com.dcl.jdbc.cms.dao.CarDao;

public class App {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		CarDao dao = new CarDao();
		dao.addCar();
		dao.findCarById();
		dao.findAllCars();
		dao.updatePriceByCarId();
		dao.deleteCarById();
		dao.deleteCarByBrand();
	}

}
