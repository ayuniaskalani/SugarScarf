package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.ProductBean;
import Dao.ProductDao;

/**
 * Servlet implementation class EditProductController
 */
@WebServlet("/EditProductController")
public class EditProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productID = request.getParameter("id");
		ProductBean bean = new ProductBean();
		
		bean = ProductDao.findProductByID(Integer.parseInt(productID));
		request.setAttribute("product", bean);
		request.getRequestDispatcher("/Edit.jsp").forward(request, response);
	}
}
