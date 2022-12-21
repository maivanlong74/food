package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai(){
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		try {
			//kết nối vào csdl
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			//Lấy dữ liệu về
			String sql = "select * from loai";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//lưu ALL dữ liệu vào mạng ds
			while (rs.next()) {
				String maloai = rs.getString("maloai");
				String tenloai = rs.getString("tenloai");
				ds.add(new loaibean(maloai, tenloai));
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
	

}
