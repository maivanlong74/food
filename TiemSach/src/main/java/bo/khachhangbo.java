package bo;

import java.util.ArrayList;

import bean.khachhangbean;
import dao.hoadondao;
import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao=new khachhangdao();
	ArrayList<khachhangbean> ds;
	public khachhangbean getkhachhang(String tendn, String pass){
  		return khdao.getkhachhang(tendn, pass);
    }
}
