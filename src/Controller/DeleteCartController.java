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
 * Servlet implementation class DeleteCartController
 */
@WebServlet("/DeleteCartController")
public class DeleteCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("currentSessionUser");
		int proId = Integer.parseInt(request.getParameter("proId"));
		PurchaseDao.deleteCart(username, proId);
		response.sendRedirect("/SugarScarf/ViewCartController");
	}

}
