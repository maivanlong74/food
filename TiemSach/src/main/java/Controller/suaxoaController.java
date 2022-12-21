package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class suaxoaController
 */
@WebServlet("/suaxoaController")
public class suaxoaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaxoaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		giohangbo gh = (giohangbo)session.getAttribute("gio");
		String[] check = request.getParameterValues("check");
				if (check != null)
					for (String ms : check)
						try {
							gh.remove(ms);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
				
			   if(request.getParameter("butsua") !=null){ 
				   String ms=request.getParameter("butsua"); 
				   long sl=Long.parseLong(request.getParameter (ms)); 
				   gh.Them(ms, "", 0, sl);
					    } 
			   if (request.getParameter("butxoa") !=null){	
				   String ms=request.getParameter("butxoa"); 
				   gh.remove(ms);
	               }
			   if(request.getParameter("ALL") != null) {
				   session.removeAttribute("gio");
			   }
			   
		   if(gh.ds.size()==0)
        	   response.sendRedirect("htsachController");
           else     {
        	   response.sendRedirect("htgioController");
           }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
