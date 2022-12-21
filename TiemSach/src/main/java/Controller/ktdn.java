package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bo.khachhangbo;

/**
 * Servlet implementation class ktdn
 */
@WebServlet("/ktdn")
public class ktdn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ktdn() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String un=request.getParameter("txtun");
			   String pass=request.getParameter("txtpass");
			   khachhangbo khbo= new khachhangbo();
			   khachhangbean kh=null;
			   RequestDispatcher rd;
			   if(un!=null && pass!=null) {
					//Tao doi tuong session
				  HttpSession session=request.getSession();
				   //Neu chua tao session
				  if(session.getAttribute("kh")==null) {
					  kh=new khachhangbean();
				//	session.setAttribute("kh", kh);//Tao bien session dn
				  }
				  kh=khbo.getkhachhang(un, pass);
				  if(kh==null) 
					   rd= request.getRequestDispatcher("dangnhap.jsp?kt=1");
				else {
					  System.out.println(kh.getMakh());
					  session.setAttribute("kh", kh);
					  rd= request.getRequestDispatcher("htsachController");
				  }
			   }else 
				   rd= request.getRequestDispatcher("dangnhap.jsp");
			   rd.forward(request, response);
			   
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
