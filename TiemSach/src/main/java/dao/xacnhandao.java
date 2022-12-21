package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.xacnhanbean;

public class xacnhandao {
    public ArrayList<xacnhanbean> getdanhsach(){
    	ArrayList<xacnhanbean> ds= new ArrayList<xacnhanbean>();
    	try {
    		
			KetNoi kn= new KetNoi();
			kn.KetNoi();
    		String sql="select * from XacNhan";
    		PreparedStatement cmd=kn.cn.prepareStatement(sql);
    		ResultSet rs= cmd.executeQuery();
    		//B3: Duyet rs de luu vao ds
    		while(rs.next()) {
    			  long MaChiTietHD=rs.getLong("MaChiTietHD");
    			   String hoten=rs.getString("hoten");
    			   String tensach=rs.getString("tensach");;
    			    Date NgayMua=rs.getDate("NgayMua");
    			    long SoLuongMua=rs.getLong("SoLuongMua");;
    			    long gia=rs.getLong("gia");;
    			    long ThanhTien=rs.getLong("ThanhTien");;
    			    boolean damua=rs.getBoolean("damua");
    			    ds.add(new xacnhanbean(MaChiTietHD, hoten, tensach, NgayMua, SoLuongMua, gia, ThanhTien, damua));
    		}
    		//b4: Dong cac doi tuong
    		rs.close();kn.cn.close();
    		return ds;
		} catch (Exception e) {
			e.printStackTrace();return null;
		}
 }
    
    
    public static void main(String[] args) {
		xacnhandao xndao=new  xacnhandao();
//		khachhangbean kh=khdao.getkhachhang("nkchung", "123");
		System.out.println(xndao.getdanhsach());
	}
}
