package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Bean.ProductBean;
import Bean.ReportBean;
import Connection.ConnectionManager;
import java.util.*;

public class ProductDao {
	static Connection currentCon=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	static Statement stmnt=null;
	
	public static ProductBean findProductByID(int proId)
	{
		ProductBean bean=new ProductBean();
		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("SELECT * FROM product WHERE product_id=?");
			ps.setInt(1, proId);
			rs = ps.executeQuery();
			while(rs.next()) {				
				bean.setProId(rs.getInt("product_id"));
				bean.setProname(rs.getString("product_name"));
				bean.setProimage(rs.getString("product_imagepath"));
				bean.setProprice(rs.getDouble("product_price"));
				bean.setProtype(rs.getString("product_type"));
				bean.setProdesc(rs.getString("product_description"));		
			}
		}catch (SQLException ex) {
			System.out.println(ex);
		}
		return bean;
	}
	
	//search product by Id
	public static ProductBean findProductByID2(String productname)
	{
		ProductBean bean=new ProductBean();
		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("SELECT * FROM product WHERE product_name LIKE= '%"+productname+"%'");
			ps.setString(1, productname);
			rs = ps.executeQuery();
			while(rs.next()) {				
				bean.setProId(rs.getInt("product_id"));
				bean.setProname(rs.getString("product_name"));
				bean.setProimage(rs.getString("product_imagepath"));
				bean.setProprice(rs.getDouble("product_price"));
				bean.setProtype(rs.getString("product_type"));
				bean.setProdesc(rs.getString("product_description"));		
			}
		}catch (SQLException ex) {
			System.out.println(ex);
		}
		return bean;
	}
	
	// get list of product based on the type and return to controller
	public List<ProductBean> getProductByType(String type) {
		List<ProductBean> beans = new ArrayList<ProductBean>();
		
		//do query?
		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("SELECT * FROM product WHERE product_type=?");
			ps.setString(1, type);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setProId(rs.getInt("product_id"));
				bean.setProname(rs.getString("product_name"));
				bean.setProimage(rs.getString("product_imagepath"));
				bean.setProprice(rs.getDouble("product_price"));
				bean.setProtype(rs.getString("product_type"));
				bean.setProdesc(rs.getString("product_description"));
			//	bean.setProamount(rs.getDouble("product_amount"));
				beans.add(bean);
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return beans;
	}
	
	public static List<ProductBean> getAllProduct() {
		List<ProductBean> beans = new ArrayList<ProductBean>();
		
		//do query?
		try {
			currentCon = ConnectionManager.getConnection();
			stmnt = currentCon.createStatement();
			rs = stmnt.executeQuery("SELECT * FROM product");
			
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


	public void delete(int proId){
		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("delete FROM product WHERE product_id=?");
			ps.setInt(1, proId);
			ps.executeUpdate();
		}catch (SQLException ex) {
			System.out.println(ex);
		}
	}
	
	public void update(ProductBean product) {
		try {
			currentCon=ConnectionManager.getConnection();
			int id = product.getProId();
			String name=product.getProname();
			Double price=product.getProprice();
			String type=product.getProtype();
			String description=product.getProdesc();
			
			ps = currentCon.prepareStatement("update product set product_name=?,product_price=?,product_type=?,product_description=? WHERE product_id=?");
			ps.setString(1, name);
			ps.setDouble(2, price);
			ps.setString(3,type);
			ps.setString(4, description);
			ps.setInt(5, id);
			ps.executeUpdate();
		}catch (SQLException ex) {
			System.out.println(ex);
		}
	}

	public void add(ProductBean product) {
		try {
			currentCon=ConnectionManager.getConnection();
			String name=product.getProname();
			Double price=product.getProprice();
			String type=product.getProtype();
			String description=product.getProdesc();
			String image=product.getProimage();			
					
			ps = currentCon.prepareStatement("INSERT INTO product(product_name,product_price,product_type,product_description,product_imagepath) VALUES (?,?,?,?,?)");
			ps.setString(1, name);
			ps.setDouble(2, price);
			ps.setString(3, type);
			ps.setString(4, description);
			ps.setString(5, image);
			ps.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
	}
	
	public static List<ReportBean> getAllProduct2() {
		List<ReportBean> beans = new ArrayList<ReportBean>();
		
		//do query?
		try {
			currentCon = ConnectionManager.getConnection();
			stmnt = currentCon.createStatement();
			rs = stmnt.executeQuery("SELECT product_id,COUNT(product_id) FROM cart ORDER BY product_name ");
			
			while(rs.next()) {
				ReportBean bean = new ReportBean();
				bean.setProId(rs.getInt("product_id"));
				bean.setProname(rs.getString("product_name"));
				bean.setProimage(rs.getString("product_imagepath"));
				bean.setProprice(rs.getDouble("product_price"));
				beans.add(bean);
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return beans;
	}
	
	//get matric register
		public static ProductBean getProductSearch(ProductBean p) {
			String productname = p.getProname() ;
			String searchQuery = "SELECT * FROM PRODUCT WHERE PRODUCT_NAME='%" + productname + "%'";
			try {
				currentCon = ConnectionManager.getConnection();
				stmnt = currentCon.createStatement();
				rs = stmnt.executeQuery(searchQuery);
				boolean more = rs.next();

				if (more) {
					productname = rs.getString("Product_Name");
					p.setProname(productname);
					p.setValid(true);
				}
				else if (!more) {
					System.out.println("Sorry");
					p.setValid(false);
				}
			}
			catch (Exception ex) {
				System.out.println("Log In failed: An Exception has occurred! " + ex);
			}
			finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (Exception e) {
					}
					rs = null;
				}
				if (stmnt != null) {
					try {
						stmnt.close();
					} catch (Exception e) {
					}
					stmnt = null;
				}
				if (currentCon != null) {
					try {
						currentCon.close();
					} catch (Exception e) {
					}
					currentCon = null;
				}
			}
			return p;
		}
}

