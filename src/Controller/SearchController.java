package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProductDao;
import Bean.ProductBean;
/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String  Search="/search.jsp";
	private ProductDao pDao;
	String forward="";
	String action="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        pDao= new ProductDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		forward = Search;
		String productname = request.getParameter("productname");
		ProductBean p = pDao.findProductByID2(productname);
		request.setAttribute("p", p);
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductBean p = new ProductBean();
		String productname = request.getParameter("productname");
		p.setProname(productname);
		
		pDao.getProductSearch(p);
		
		forward = Search;
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}

}
