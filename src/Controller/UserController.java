package Controller;

import Bean.UserBean;
import Dao.UserDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserController() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String studID = (String) session.getAttribute("currentSessionUser");
		request.setAttribute("userDetail", UserDao.getUserDetail(studID));
		request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// get data from form register.jsp
		UserBean user= new UserBean();
		user.setName(request.getParameter("realname"));
		user.setAddress(request.getParameter("address"));
		user.setUser(request.getParameter("username"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password1"));
		user.setPhone(request.getParameter("phone"));
		user.setBirthdate(request.getParameter("birthdate"));
		user.setGender(request.getParameter("gender"));
		
		//send userBean to dao for query (insert)
		UserDao dao= new UserDao();
		dao.add(user);
		
		// then redirect to login page
		response.sendRedirect("/SugarScarf/Register.jsp");
		
		
		
	}

}
