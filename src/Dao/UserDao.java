package Dao;

import java.sql.*;
import Connection.ConnectionManager;
import Bean.UserBean;

public class UserDao {
	static Connection currentCon=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	static Statement stmnt=null;
	

	
	public static UserBean login(UserBean Bean) {
		try {
		currentCon=ConnectionManager.getConnection();
		String username=Bean.getUser();
		String password=Bean.getPassword();
		ps = currentCon.prepareStatement("SELECT * from customer where cus_username =? and cus_password=?");
		ps.setString(1, username);
		ps.setString(2, password);
		
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
	
	// get student data
	public static UserBean getUserDetail(String username) {
		UserBean bean = new UserBean();
		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("SELECT * FROM customer WHERE cus_username = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				bean.setName(rs.getString("cus_realname"));
				bean.setAddress(rs.getString("cus_add"));
				bean.setEmail(rs.getString("cus_email"));
				bean.setPhone(rs.getString("cus_phone"));
				bean.setBirthdate(rs.getDate("cus_birthday"));
				bean.setGender(rs.getString("cus_gender"));
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return bean;
	}
	
	//insert data
	public void add(UserBean Bean) {
		try {
			currentCon=ConnectionManager.getConnection();
			String name=Bean.getName();
			String username=Bean.getUser();
			String email=Bean.getEmail();
			String password=Bean.getPassword();
			String address=Bean.getAddress();			
			String phone=Bean.getPhone();
			String gender=Bean.getGender();
			String birthdate=Bean.getBirthdate();			
			ps = currentCon.prepareStatement("INSERT INTO customer (cus_username,cus_realname,cus_add,cus_password,cus_email,cus_phone,cus_birthday,cus_gender) VALUES (?,?,?,?,?,?,TO_DATE(?,'yyyy/MM/dd'),?)");
			ps.setString(1, username);
			ps.setString(2, name);
			ps.setString(3, address);
			ps.setString(4, password);
			ps.setString(5, email);
			ps.setString(6, phone);
			ps.setString(7, birthdate);
			ps.setString(8, gender);
			ps.executeUpdate();
		}catch (SQLException ex) {
			System.out.println(ex);
		}	
	}

	public void update(UserBean Bean) {
		try {
			currentCon=ConnectionManager.getConnection();
			String user = Bean.getUser();
			String name=Bean.getName();			
			String email=Bean.getEmail();			
			String address=Bean.getAddress();			
			String phone=Bean.getPhone();
			String gender=Bean.getGender();
			String birthdate=Bean.getBirthdate();			
			ps = currentCon.prepareStatement("update customer set cus_realname=?,cus_add=?,cus_email=?,cus_phone=?,cus_birthday=TO_DATE(?,'YYYY-MM-DD'),cus_gender=? where cus_username=?");			
			ps.setString(1, name);
			ps.setString(2, address);			
			ps.setString(3, email);
			ps.setString(4, phone);
			ps.setString(5, birthdate);
			ps.setString(6, gender);
			ps.setString(7, user);
			ps.executeUpdate();
		}catch (SQLException ex) {
			System.out.println(ex);
		}
	}

	
	
}
