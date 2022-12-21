package dao;

import java.sql.PreparedStatement;
import bean.dangkybean;


public class dangkydao {
	dangkybean dk=new dangkybean();
	public int Them(String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception{
		KetNoi kn=new KetNoi();
		kn.KetNoi();
		//b1: tao cau lenh sql
		String sql="insert into KhachHang(hoten, diachi, sodt, email, tendn, pass) values (?,?,?,?,?,?)";
		
		 //B2: Tao ra cau lenh: Preparestatement de thuc thi cau lenh sql
	   	  PreparedStatement cmd= kn.cn.prepareStatement(sql);
	   	  //theo thứ tự
		  cmd.setString(1, hoten);
		  cmd.setString(2, diachi);
		  cmd.setString(3, sodt);
		  cmd.setString(4, email);
		  cmd.setString(5, tendn);
		  cmd.setString(6, pass);
	   	  return cmd.executeUpdate();
	}
}
