package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import bean.sachbean;

public class sachdao {
	public ArrayList<sachbean> getsach(){
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		try {
			//kết nối vào csdl
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			//Lấy dữ liệu về
			String sql = "select * from sach";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//lưu ALL dữ liệu vào mạng ds
			while (rs.next()) {
				String masach = rs.getString("masach");
				String tensach = rs.getString("tensach");
				String tacgia = rs.getString("tacgia");
				int soluong = rs.getInt("soluong");
				int gia = rs.getInt("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				ds.add(new sachbean(masach,tensach,tacgia,soluong,gia,anh,maloai));
			}
			//đóng kết nối
			rs.close();
			kn.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static void main(String[] args) {
		sachdao khdao=new  sachdao();
//		khachhangbean kh=khdao.getkhachhang("nkchung", "123");
		System.out.println(khdao.getsach());
	}
}
