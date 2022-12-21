package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class taifileController
 */
@WebServlet("/taifileController")
public class taifileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public taifileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**t
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String masach=request.getParameter("masach");
			String tensach=request.getParameter("tensach");
			String tacgia=request.getParameter("tacgia");
			long soluong=Long.parseLong(request.getParameter("soluong"));
			long gia=Long.parseLong(request.getParameter("gia"));
			String anh=request.getParameter("anh");
			String maloai=request.getParameter("maloai");
		} catch (Exception e) {
			e.printStackTrace();
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		 DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		 String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "image_sach";
		 response.getWriter().println(dirUrl1);
		 
		try {
			List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
			//duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
			 if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
				// xử lý file
				String nameimg = fileItem.getName();
				if (!nameimg.equals("")) {
			           //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
					String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "image_sach";
					File dir = new File(dirUrl);
					if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
						dir.mkdir();
					}
				           String fileImg = dirUrl + File.separator + nameimg;
				           File file = new File(fileImg);//tạo file
				            try {
				               fileItem.write(file);//lưu file
				               
				              System.out.println("UPLOAD THÀNH CÔNG...!");
				              System.out.println("Đường dẫn lưu file là: "+dirUrl);
				      		
				 } catch (Exception e) {
				    e.printStackTrace();
				}
			}
		 }
			else//Neu la control
			{
				
				String tentk=fileItem.getFieldName();
				if(tentk.equals("txtsach"))
					response.getWriter().println(fileItem.getString());
				if(tentk.equals("txtsl"))
					response.getWriter().println(fileItem.getString());

			}
			}
		
		} catch (FileUploadException e) {
			e.printStackTrace();
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
