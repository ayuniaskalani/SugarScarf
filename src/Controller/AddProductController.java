package Controller;

import Bean.ProductBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.ProductDao;

@WebServlet("/AddProductController")
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AddProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductBean product= new ProductBean();
		product.setProname(request.getParameter("Add_name"));
		product.setProprice(Double.parseDouble(request.getParameter("Add_price")));
		product.setProtype(request.getParameter("Add_type"));
		product.setProdesc(request.getParameter("Add_descrip"));
		product.setProimage("");
		
		//send userBean to dao for query (insert)
		ProductDao dao= new ProductDao();
		dao.add(product);
		response.sendRedirect("/SugarScarf/ManageProductController");
	}

}
