package Controller;

import Bean.ProductBean;
import Dao.ProductDao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String action = request.getParameter("action");
		if(action.equals("filter")) {
			List<ProductBean> products = new ArrayList<ProductBean>();
			
			// receive product type from url
			String prodType = request.getParameter("type");
			
			//find the products related in database
			ProductDao dao = new ProductDao();
			products = dao.getProductByType(prodType);
			
			//put the products list into session
			session.setAttribute("productList", products);
			//redirect to shop.jsp
			response.sendRedirect("/SugarScarf/Shop.jsp");
		} else if(action.equals("viewDetail")) {
			int proId = Integer.parseInt(request.getParameter("proId"));
			ProductBean productBean = ProductDao.findProductByID(proId);
			request.setAttribute("productDetail", productBean);
			request.getRequestDispatcher("/Product.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
