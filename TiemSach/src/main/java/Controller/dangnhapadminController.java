package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import bean.dangnhapadminbean;
import bean.khachhangbean;
import bo.dangnhapadminbo;
import bo.khachhangbo;
import dao.KetNoi;
import dao.khachhangdao;

/**
 * Servlet implementation class ktdnController
 */
@WebServlet("/dangnhapadminController")
public class dangnhapadminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<dangnhapadminbean> userList = new ArrayList<>();
	HttpSession session;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapadminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String un=request.getParameter("txtun");
		  String pass=request.getParameter("txtpass");
		  RequestDispatcher rd;
		  if(un!=null&&pass!=null){
			  dangnhapadminbo dnbo= new dangnhapadminbo();
			  dangnhapadminbean  dn= dnbo.ktdn(un, pass);
		  if(dn!=null){
			  //Tao ra doi tuong session
			  HttpSession session=request.getSession();
			  session.setAttribute("admin", dn);
			   rd= request.getRequestDispatcher("adminController");
			}else //Dang nhap sai
			rd= request.getRequestDispatcher("dangnhapadmin.jsp?kt=1");
		  } else//Chay lan dau
			  rd= request.getRequestDispatcher("dangnhapadmin.jsp");
		  
		  rd.forward(request, response);  
	}	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		doGet(request, response);
	}

}
