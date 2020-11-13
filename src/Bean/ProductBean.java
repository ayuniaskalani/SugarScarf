package Bean;

public class ProductBean {

	String proname,proimage,protype,prodesc;
	int proId, proQuantity, cartId;
	double proprice,proamount;
	public boolean valid;
	
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public void setProId(int proId) {this.proId = proId;}
	public void setProname(String proname) {this.proname=proname;}
	public void setProimage(String proimage) {this.proimage=proimage;}
	public void setProtype(String protype) {this.protype=protype;}
	public void setProprice(Double proprice) {this.proprice=proprice;}
	public void setProdesc(String prodesc) {this.prodesc=prodesc;}
	public void setProamount(double proamount) {this.proamount=proamount;}
	public void setProQuantity(int proQuantity) {this.proQuantity = proQuantity;}
	public void setCartId(int cartId) {this.cartId = cartId;}
	
	public int getProId() {return proId;}
	public String getProname() {return proname;}
	public String getProimage() {return proimage;}
	public String getProtype() {return protype;}
	public Double getProprice() {return proprice;}
	public String getProdesc() {return prodesc;}
	public double setProamount() {return proamount;}
	public int getProQuantity() {return proQuantity;}
	public int getCartId() {return cartId;}
}
