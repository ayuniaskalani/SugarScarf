package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.PurchaseDao;

/**
 * Servlet implementation class AddCartController
 */
@WebServlet("/AddCartController")
public class AddCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AddCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("currentSessionUser");
		int productID = Integer.parseInt(request.getParameter("productID"));
		int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
		String product_imagepath = (String) request.getParameter("productImg");
		String productName = (String) request.getParameter("productName");
		String productDetail = (String) request.getParameter("productDetail");
		double productPrice = Double.parseDouble(request.getParameter("productPrice"));

		
		
		PurchaseDao.addCart(username, productID, productQuantity, product_imagepath,productName,productDetail,productPrice);
		response.sendRedirect("/SugarScarf/ViewCartController");
	}

}
