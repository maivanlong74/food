package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import bean.dangnhapadminbean;


public class KetNoi {
	public Connection cn;
	ArrayList<dangnhapadminbean> userList = new ArrayList<>();
	public void KetNoi() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("xongb1");
			String url="jdbc:sqlserver://DESKTOP-FF1278R\\SQLEXPRESS01:1433;databaseName=QlSach;user=sa; password=1234";
			//String url = "jdbc:sqlserver://DESKTOP-FF1278R\\SQLEXPRESS:1433;databaseName=QlSach;integratedSecurity=true";
			cn = DriverManager.getConnection(url);
			System.out.println("xongb2");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	private void dbClose() {
//		try {
//			cn.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//	}
//        

//	public static void main(String[] args) /* throws SQLException */{
//		// TODO Auto-generated method stub
//		KetNoi kn = new KetNoi();
//		kn.KetNoi();
//	}

}
