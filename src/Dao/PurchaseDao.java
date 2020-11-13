package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Bean.ProductBean;
import Connection.ConnectionManager;

public class PurchaseDao {
	static Connection currentCon=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	static Statement stmnt=null;
	
	public static void addCart(String username, int productID, int productQuantity, String product_imagepath, String productName, String productDetail, double productPrice) {
		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("INSERT INTO cart (cus_username, product_id, cart_amount,product_imagepath, product_Name,product_description,product_Price) VALUES (?,?,?,?,?,?,?)");
			ps.setString(1, username);
			ps.setInt(2, productID);
			ps.setInt(3, productQuantity);
			ps.setString(4, product_imagepath);
			ps.setString(5, productName);
			ps.setString(6, productDetail);
			ps.setDouble(7, productPrice);
			ps.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
	}
	
	public static List<ProductBean> getCart(String username) {
		List<ProductBean> beans = new ArrayList<ProductBean>();
		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("SELECT p.product_id,p.product_name,c.product_id FROM product p FULL OUTER JOIN cart c ON p.product_id=c.product_id");
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setProId(rs.getInt("product_id"));
				bean.setProname(rs.getString("product_name"));
				bean.setProimage(rs.getString("product_imagepath"));
				bean.setProprice(rs.getDouble("product_price"));
				bean.setProtype(rs.getString("product_type"));
				bean.setProdesc(rs.getString("product_description"));		
				beans.add(bean);
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return beans;
	}
	
	public static List<ProductBean> getCart2(String username) {
		List<ProductBean> beans = new ArrayList<ProductBean>();
		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("SELECT * FROM cart where cus_username = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setProId(rs.getInt("product_id"));
				bean.setProQuantity(rs.getInt("cart_amount"));
				bean.setProname(rs.getString("product_name"));
				bean.setProimage(rs.getString("product_imagepath"));
				bean.setProprice(rs.getDouble("product_Price"));
				bean.setCartId(rs.getInt("cart_Id"));
				//bean.setProtype(rs.getString("product_type"));
				bean.setProdesc(rs.getString("product_description"));		
				beans.add(bean);
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return beans;
	}
	
	public static void deleteCart( String username,int proId) {
		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("DELETE * FROM cart WHERE cus_username=? AND product_id =?");
			ps.setString(1, username);
			ps.setInt(2, proId);
			ps.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
	}
	
}
