package bean;

import java.sql.Date;

public class lichsubean{
	private long makh;
	private long MaHoaDon;
	private String tensach;
	private int SoLuongMua;
	private Date NgayMua;
	private long ThanhToan;
	private boolean damua;
	public lichsubean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsubean(long makh, long maHoaDon, String tensach, int soLuongMua, Date ngayMua, long thanhToan,
			boolean damua) {
		super();
		this.makh = makh;
		this.MaHoaDon = maHoaDon;
		this.tensach = tensach;
		this.SoLuongMua = soLuongMua;
		this.NgayMua = ngayMua;
		this.ThanhToan = thanhToan;
		this.damua = damua;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		this.MaHoaDon = maHoaDon;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		this.SoLuongMua = soLuongMua;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		this.NgayMua = ngayMua;
	}
	public long getThanhToan() {
		return ThanhToan;
	}
	public void setThanhToan(long thanhToan) {
		this.ThanhToan = thanhToan;
	}
	public boolean getDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
}
