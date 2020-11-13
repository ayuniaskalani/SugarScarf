package Dao;

import java.sql.*;

import Bean.StaffBean;
import Connection.ConnectionManager;

public class StaffDao {
	static Connection currentCon=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	static Statement stmnt=null;
	
	
	public static StaffBean login(StaffBean Bean) {
		try {
		currentCon=ConnectionManager.getConnection();
		String username=Bean.getUser();
		String password=Bean.getPassword();
		ps = currentCon.prepareStatement("SELECT * from staff where staff_id =? and staff_password=?");
		ps.setString(1, username);
		ps.setString(2, password);
		System.out.println(username);
		System.out.println(password);
		
		rs = ps.executeQuery();
		boolean more = rs.next();

        // if user exists set the isValid variable to true
        if (more) {   
       
       		System.out.println("Welcome " + username);
            Bean.setUser(username);
            Bean.setValid(true);
       	}
       
        // if user does not exist set the isValid variable to false
        else if (!more) {
        	System.out.println("Sorry, you are not a registered user! Please sign up first");
        	Bean.setValid(false);
        }

		}catch (SQLException ex) {
			System.out.println(ex);
		}	
		return Bean;

	}
}
