package dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


public class hoadondao {
	public long maxhoadon() {
		try {
			KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="select max(MaHoaDon) as maxhd from hoadon";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			ResultSet rs= cmd.executeQuery();
			long kq=0;
			if(rs.next()) {
				kq=rs.getLong("maxhd");
			}
			rs.close(); kn.cn.close();
			return kq;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		
		}
	}
	public int Them(long makh) {
		try {
			KetNoi kn=new KetNoi();
			kn.KetNoi();
			String sql="insert into hoadon(makh,NgayMua,damua) values(?,?,?)";
			PreparedStatement cmd=kn.cn.prepareStatement(sql);
			System.out.print("makh:"+ makh);
			cmd.setLong(1, makh);
			cmd.setDate(2, new java.sql.Date(new Date().getTime()));
			cmd.setBoolean(3, false);
			int kq=cmd.executeUpdate();
			kn.cn.close();
			return kq;
		} catch (Exception e) {
		 e.printStackTrace();
		 return 0;
		}
	}
	
	public static void main(String[] args) {
		hoadondao lsdao=new  hoadondao();
//		khachhangbean kh=khdao.getkhachhang("nkchung", "123");
		System.out.println(lsdao.maxhoadon());
	}
	

}
