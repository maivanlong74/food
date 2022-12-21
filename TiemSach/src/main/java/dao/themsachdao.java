package dao;

import java.sql.PreparedStatement;
import bean.sachbean;

public class themsachdao {
	sachbean dk=new sachbean();
	public int Themsach(String masach, String tensach, String tacgia, int soluong, int gia, String anh, String maloai) throws Exception{
		KetNoi kn=new KetNoi();
		kn.KetNoi();
		//b1: tao cau lenh sql
		String sql="insert into sach(masach, tensach, tacgia, soluong, gia, anh, maloai) values (?,?,?,?,?,?,?)";
		
		 //B2: Tao ra cau lenh: Preparestatement de thuc thi cau lenh sql
	   	  PreparedStatement cmd= kn.cn.prepareStatement(sql);
	   	  //theo thứ tự
		  cmd.setString(1, masach);
		  cmd.setString(2, tensach);
		  cmd.setString(3, tacgia);
		  cmd.setLong(4, soluong);
		  cmd.setLong(5, gia);
		  cmd.setString(6, anh);
		  cmd.setString(7, maloai);
	   	  return cmd.executeUpdate();
	}
}
