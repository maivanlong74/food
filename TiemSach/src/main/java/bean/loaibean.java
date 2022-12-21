package bean;

public class loaibean {
	private String maloai;
	private String tenloai;
	// Phát sinh2  hàm tạo:  1 ko tham số, 2 dãy đủ tham số
	// phát sinh ham get và set
	public loaibean(String maloai, String tenloai) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
	}
	public loaibean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
	
	
}
