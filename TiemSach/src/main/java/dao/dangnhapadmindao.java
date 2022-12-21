package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import bean.dangnhapadminbean;
import bean.khachhangbean;
import bean.loaibean;

public class dangnhapadmindao {
	
	public dangnhapadminbean ktdn(String tendn, String pass) {

		try {
				//kết nối vào csdl
				KetNoi kn = new KetNoi();
				kn.KetNoi();
				String sql = "select * from DangNhap where TenDangNhap=? and MatKhau=?";
				PreparedStatement cmd = kn.cn.prepareStatement(sql);
				cmd.setString(1, tendn);
				cmd.setString(2, pass);
				ResultSet rs = cmd.executeQuery();
				dangnhapadminbean dn=null;
	            if(rs.next()){
	              String TenDangNhap=rs.getString("TenDangNhap");
				  String MatKhau=rs.getString("MatKhau");
				  boolean Quyen=rs.getBoolean("Quyen");
				  dn=new dangnhapadminbean(TenDangNhap, MatKhau, Quyen);
	            }
	            rs.close();
				kn.cn.close();
				return dn;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
        }
	}
	
	public static void main(String[] args) {
		dangnhapadmindao dn=new  dangnhapadmindao();
//		khachhangbean kh=khdao.getkhachhang("nkchung", "123");
		System.out.println(dn.ktdn("nkchung", "123"));
	}
	
}
