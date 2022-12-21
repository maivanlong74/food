package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class chitiethoadondao {
	public int Them(String MaSach,long soluongmua,long MaHoaDon) {
		try {
			KetNoi kn=new KetNoi();
			kn.KetNoi();
			String sql="insert into ChiTietHoaDon(MaSach,SoLuongMua,MaHoaDon,damua) values(?,?,?,?)";
			PreparedStatement cmd=kn.cn.prepareStatement(sql);
			cmd.setString(1, MaSach);
			cmd.setLong(2, soluongmua);
			cmd.setLong(3, MaHoaDon);
			cmd.setBoolean(4, false);
			int kq=cmd.executeUpdate();
			kn.cn.close();
			return kq;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
