package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO533 {
public static Connection con;

	public DAO533() {
		if(con == null) {
			String dbUrl = "jdbc:mysql://localhost:3306/qli_gara_oto?autoReconnect=true&useSSL=false";
			String dbClass = "com.mysql.cj.jdbc.Driver";
			
			try {
				Class.forName(dbClass);
				con = DriverManager.getConnection(dbUrl, "root", "123456");
			} catch (Exception e) {
				System.out.print("Ket noi db that bai");
				e.printStackTrace();
			}
			
		}
	}
}
