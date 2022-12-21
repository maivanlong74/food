package bean;

import java.util.Date;

public class xacnhanbean {
    private long MaChiTietHD;
    private String hoten;
    private String tensach;
    private Date NgayMua;
    private long SoLuongMua;
    private long gia;
    private long ThanhTien;
    private boolean damua;
	public xacnhanbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public xacnhanbean(long maChiTietHD, String hoten, String tensach, Date ngayMua, long soLuongMua, long gia,
			long thanhTien, boolean damua) {
		super();
		MaChiTietHD = maChiTietHD;
		this.hoten = hoten;
		this.tensach = tensach;
		NgayMua = ngayMua;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		ThanhTien = thanhTien;
		this.damua = damua;
	}
	public long getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(long maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
    
}

