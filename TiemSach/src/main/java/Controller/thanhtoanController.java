package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.giohangbean;
import bean.khachhangbean;
import bo.chitiethoadonbo;
import bo.giohangbo;
import bo.hoadonbo;
import dao.KetNoi;


/**
 * Servlet implementation class thanhtoanController
 */
@WebServlet("/thanhtoanController")
public class thanhtoanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thanhtoanController() {
    	
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		hoadonbo hd=new hoadonbo();
		chitiethoadonbo ct=new chitiethoadonbo();
		
		HttpSession session=request.getSession();
		khachhangbean kh=(khachhangbean)session.getAttribute("kh");
		if(kh!=null) {
			giohangbo gh=(giohangbo)session.getAttribute("gio");
			hd.Them(kh.getMakh());//them vao 1 hoa don
			long mahd=hd.maxhoadon();
			for(giohangbean g: gh.ds) {
				ct.Them(g.getMasach(),g.getSoluong(),mahd);
			}
			response.sendRedirect("htsachController");
		    session.removeAttribute("gio");
		    session.setAttribute("i", 0);
		}else
		{
			RequestDispatcher rd=request.getRequestDispatcher("ktdn");
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
		
	}

}
