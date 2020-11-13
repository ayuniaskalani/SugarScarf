package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.UserBean;
import Dao.UserDao;

@WebServlet("/UpdateUserController")
public class UpdateUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		
		String username = (String) session.getAttribute("currentSessionUser");
		
		//get the data from form update
		UserBean bean = new UserBean();
		bean.setUser(username);
		bean.setName(request.getParameter("realname"));
		bean.setAddress(request.getParameter("address"));
		bean.setEmail(request.getParameter("email"));
		bean.setPhone(request.getParameter("phone"));
		bean.setBirthdate(request.getParameter("birthdate"));
		bean.setGender(request.getParameter("gender"));
		
		//send bean to userDao
		UserDao dao= new UserDao();
		dao.update(bean);
	
		//redirect to shop.jsp
		response.sendRedirect("/SugarScarf/UserController");
	}
}
