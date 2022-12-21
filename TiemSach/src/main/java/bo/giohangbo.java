package bo;

import java.util.ArrayList;

import bean.giohangbean;

public class giohangbo {
   public ArrayList<giohangbean> ds=
		   new ArrayList<giohangbean>();
   public void Them(String masach, String tensach, long gia, long soluong) {
	   for(giohangbean h: ds)
		   if(h.getMasach().equals(masach)) {
			   h.setSoluong(h.getSoluong()+ soluong);
			   return;
		   }
	   ds.add(new giohangbean(masach, tensach, gia, soluong));
   }
   
   public void Up(String masach, long soluong ) {
   	if (masach!=null) 
   	{		for(giohangbean g: ds)
   			if(g.getMasach().equals(masach)) {
   				g.setSoluong(soluong);
   				return;
   			}
   	}
   }
   
   public long Tongtien() {
	   long s=0;
	   for(giohangbean h: ds)
		   s=s+h.getThanhtien();
	   return s;
   }
   
   public void remove(String masach ) {
	  	if (masach!=null) 
	  	{		for(giohangbean g: ds)
	  			if(g.getMasach().equals(masach)) {
	  				ds.remove(g);
	  				return;
	  			}
	  	}
		}
}
