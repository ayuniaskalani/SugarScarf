package Controller;

import Bean.ProductBean;
import Dao.ProductDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProductController
 */
@WebServlet("/UpdateProductController")
public class UpdateProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductBean bean= new ProductBean();
		bean.setProId(Integer.parseInt(request.getParameter("productID")));
		bean.setProname(request.getParameter("Edit_name"));
		bean.setProprice(Double.parseDouble(request.getParameter("Edit_price")));
		bean.setProtype(request.getParameter("Edit_type"));
		bean.setProdesc(request.getParameter("Edit_descrip"));
		ProductDao dao= new ProductDao();	
		dao.update(bean);
		
		response.sendRedirect("/SugarScarf/ManageProductController");
	}

}
