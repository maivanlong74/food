package bo;

import java.util.ArrayList;

import dao.chitiethoadondao;


public class chitiethoadonbo {
	chitiethoadondao ctdao=new chitiethoadondao();
	public int Them(String MaSach,long soluongmua,long MaHoaDon){
		return ctdao.Them(MaSach, soluongmua, MaHoaDon);
	}
}
