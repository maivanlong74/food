package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.lichsubean;



public class lichsudao {
	
	 public ArrayList<lichsubean> getlichsu(long makh){
		    
	        ArrayList<lichsubean> list = new ArrayList<lichsubean>();
	        try {
	        	KetNoi kn=new KetNoi();
			    kn.KetNoi();
	            String query = "select DISTINCT * from lich_su where makh = ?";
	            PreparedStatement pst = kn.cn.prepareStatement(query);
	            pst.setLong(1, makh);
	            ResultSet rs = pst.executeQuery();
	            while (rs.next()) {
	            	long MaHoaDon = rs.getLong("MaHoaDon");
	            	String tensach = rs.getString("tensach");
	            	int SoLuongMua = rs.getInt("SoLuongMua");
	            	Date NgayMua = rs.getDate("NgayMua");
	            	long ThanhToan = rs.getLong("ThanhToan");
	            	Boolean damua = rs.getBoolean("damua");
	            	list.add(new lichsubean(makh, MaHoaDon, tensach, SoLuongMua, NgayMua, ThanhToan, damua));
	            }
	            rs.close();
				kn.cn.close();
				return list;
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	            return null;
	        }
	        
	    }
	 
}
