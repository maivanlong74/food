package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.sachbean;
import bo.sachbo;



/**
 * Servlet implementation class xacnhanController
 */
@WebServlet("/quanlysachController")
public class quanlysachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanlysachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session= request.getSession();
//        if(session.getAttribute("admin")==null)
//      	  response.sendRedirect("dangnhapadminController");
//        else {
//      	  xacnhanbo xnbo= new xacnhanbo();
//      	  request.setAttribute("ds", xnbo.getdanhsach());
//      	  RequestDispatcher rd= request.getRequestDispatcher("xacnhan.jsp");
//      	  rd.forward(request, response);
//        }
		request.setCharacterEncoding("utf-8");
	     response.setCharacterEncoding("utf-8");
	     String ml=request.getParameter("ml");
	     
	     sachbo sbo = new sachbo();
	     ArrayList<sachbean> dssach=sbo.getsach();
	     if(ml!=null)
	    	 dssach=sbo.TimMa(ml);
        request.setAttribute("dssach", dssach);
		RequestDispatcher rd=request.getRequestDispatcher("qlsach.jsp");
		rd.forward(request, response);
//	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
