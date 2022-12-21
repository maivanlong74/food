package bean;

public class dangnhapadminbean {
	private String TenDangNhap;
	private String MatKhau;
	private boolean Quyen;

	public dangnhapadminbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public dangnhapadminbean(String TenDangNhap, String MatKhau, boolean Quyen) {
		super();
		this.TenDangNhap = TenDangNhap;
		this.MatKhau = MatKhau;
		this.Quyen = Quyen;
	}
	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public boolean getQuyen() {
		return Quyen;
	}
	public void setQuyen(boolean quyen) {
		Quyen = quyen;
	}
}
